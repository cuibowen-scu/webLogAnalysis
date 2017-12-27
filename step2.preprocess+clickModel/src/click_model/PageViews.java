package click_model;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import beans.WebLogBean;
import utils.TimeUtil;

/**
 * 梳理pageViews表
 * @author cbw
 *
 */
public class PageViews {
	
	static class PageViewsMapper extends Mapper<LongWritable, Text, Text, WebLogBean>{
		Text k = new Text();
		WebLogBean webLogBean = new WebLogBean();
		@Override
		protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
			String line = value.toString();
			String[] fields = line.split("\001");
			if(fields.length<9) {
				return;
			}
			webLogBean.set(fields[0].equals("true")?true:false,fields[1], fields[2], fields[3], fields[4], fields[5], fields[6], fields[7], fields[8]);
			if(webLogBean.isValid()) {
				k.set(webLogBean.getRemote_addr());
				context.write(k, webLogBean);
			}
		}
	}
	
	static class PageViewsReducer extends Reducer<Text, WebLogBean, NullWritable, Text>{
		Text v = new Text();
		@Override
		protected void reduce(Text key, Iterable<WebLogBean> values,Context context) throws IOException, InterruptedException {
			ArrayList<WebLogBean> beans = new ArrayList<WebLogBean>();
			//key是用户ip，values是该用户的各次访问记录,将一个用户的所有访问记录中的时间拿出来排序
			try {
				for(WebLogBean bean:values) {
					WebLogBean webLogBean = new WebLogBean(); 
					try {
						BeanUtils.copyProperties(webLogBean, bean);
					}catch(Exception e) {
						e.printStackTrace();
					}
					beans.add(webLogBean);
				}
				
				//将这些beans按照时间排序
				Collections.sort(beans, new Comparator<WebLogBean>() {
					@Override
					public int compare(WebLogBean o1, WebLogBean o2) {
						try {
							Date d1 = TimeUtil.toDate(o1.getTime_local());
							Date d2 = TimeUtil.toDate(o2.getTime_local());
							if(d1==null || d2==null) {
								return 0;
							}
							return d1.compareTo(d2);
						}catch(Exception e) {
							e.printStackTrace();
							return 0;
						}
					}
				});
				
				//从有序bean中分辨出各次visit，并对一次visit中所访问的page按顺序标号step
				int step = 1;
				String session = UUID.randomUUID().toString();
				for(int i=0;i<beans.size();i++) {
					WebLogBean bean = beans.get(i);
					//该session只访问了一个页面的话
					if(beans.size()==1) {
						//设置默认停留60s
						v.set(session+"\001"+key.toString()+"\001"+bean.getRemote_user() + 
								"\001" + bean.getTime_local() + "\001" + bean.getRequest() +
								"\001" + step + "\001" + (60) + "\001" + bean.getHttp_referer() + 
								"\001" + bean.getHttp_user_agent() + "\001" + bean.getBody_bytes_sent() + 
								"\001"+ bean.getStatus());
						context.write(NullWritable.get(), v);
						session = UUID.randomUUID().toString();
						break;
					}
					//第一条记录不能做差，跳过
					if(i==0) {
						continue;
					}
					//求这次和上一次的时间差，来决定上一次输出的结果
					long timeDiff = TimeUtil.timeDiff(TimeUtil.toDate(bean.getTime_local()),TimeUtil.toDate(beans.get(i-1).getTime_local()));
					// 如果本次-上次时间差<30分钟，则输出前一次的页面访问信息
					if(timeDiff<30*60*1000) {
						v.set(session+"\001"+key.toString()+"\001"+beans.get(i - 1).getRemote_user() + "\001" + beans.get(i - 1).getTime_local() + "\001" + beans.get(i - 1).getRequest() + "\001" + step + "\001" + (timeDiff / 1000) + "\001" + beans.get(i - 1).getHttp_referer() + "\001"
								+ beans.get(i - 1).getHttp_user_agent() + "\001" + beans.get(i - 1).getBody_bytes_sent() + "\001" + beans.get(i - 1).getStatus());
						context.write(NullWritable.get(), v);
						step++;
					}else {
						// 如果本次-上次时间差>30分钟，则输出前一次的页面访问信息且将step重置，以分隔为新的visit
						v.set(session+"\001"+key.toString()+"\001"+beans.get(i - 1).getRemote_user() + "\001" + beans.get(i - 1).getTime_local() + "\001" + beans.get(i - 1).getRequest() + "\001" + (step) + "\001" + (60) + "\001" + beans.get(i - 1).getHttp_referer() + "\001"
								+ beans.get(i - 1).getHttp_user_agent() + "\001" + beans.get(i - 1).getBody_bytes_sent() + "\001" + beans.get(i - 1).getStatus());
						context.write(NullWritable.get(), v);
						// 输出完上一条之后，重置step编号
						step = 1;
						session = UUID.randomUUID().toString();
					}
					// 如果此次遍历的是最后一条，则将本条直接输出
					if (i == beans.size() - 1) {
						// 设置默认停留市场为60s
						v.set(session+"\001"+key.toString()+"\001"+bean.getRemote_user() + "\001" + bean.getTime_local() + "\001" + bean.getRequest() + "\001" + step + "\001" + (60) + "\001" + bean.getHttp_referer() + "\001" + bean.getHttp_user_agent() + "\001" + bean.getBody_bytes_sent() + "\001" + bean.getStatus());
						context.write(NullWritable.get(), v);
					}
				}
			}catch(ParseException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) throws Exception {
		
		Configuration conf = new Configuration();
		Job job = Job.getInstance();
		
		job.setJarByClass(PageViews.class);
		
		job.setMapperClass(PageViewsMapper.class);
		job.setReducerClass(PageViewsReducer.class);
		
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(WebLogBean.class);

		job.setOutputKeyClass(NullWritable.class);
		job.setOutputValueClass(Text.class);
		
		/*FileInputFormat.setInputPaths(job, new Path(args[0]));
		 FileOutputFormat.setOutputPath(job, new Path(args[1]));*/

		FileInputFormat.setInputPaths(job, new Path("E:/weblogs/output"));
		FileOutputFormat.setOutputPath(job, new Path("E:/weblogs/pageviews"));
		
		job.waitForCompletion(true);
	}
}












