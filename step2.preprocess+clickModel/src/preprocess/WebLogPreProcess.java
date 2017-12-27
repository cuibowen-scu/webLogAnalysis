package preprocess;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.Job;


import beans.WebLogBean;
import utils.FilterUtils;

public class WebLogPreProcess {
	
	static class WebLogPreProcessMapper extends Mapper<LongWritable, Text, Text, NullWritable>{
		
		Set<String> pages = new HashSet<String>();
		NullWritable v  =NullWritable.get();
		Text k = new Text();
		
		@Override
		protected void setup(Context context) throws IOException, InterruptedException {
			pages.add("/about");
			pages.add("/black-ip-list/");
			pages.add("/cassandra-clustor/");
			pages.add("/finance-rhive-repurchase/");
			pages.add("/hadoop-family-roadmap/");
			pages.add("/hadoop-hive-intro/");
			pages.add("/hadoop-zookeeper-intro/");
			pages.add("/hadoop-mahout-roadmap/");
		}
		
		@Override
		protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
			String line = value.toString();
			WebLogBean webLogBean = WebLogParser.parser(line);
			FilterUtils.filtStaticResource(webLogBean,pages);
			/*Text k = new Text(webLogBean.toString());*/
			k.set(webLogBean.toString());
			context.write(k, v);
		}
	}
	
	
	public static void main(String[] args) throws Exception{
		Configuration conf = new Configuration();
		Job job = Job.getInstance();
		job.setJarByClass(WebLogPreProcess.class);
		job.setMapperClass(WebLogPreProcessMapper.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(NullWritable.class);
		/*FileInputFormat.setInputPaths(job, new Path(args[0]));
		 FileOutputFormat.setOutputPath(job, new Path(args[1]));*/
		FileInputFormat.setInputPaths(job, new Path("E:/weblogs/input"));
		FileOutputFormat.setOutputPath(job, new Path("E:/weblogs/output"));
		job.setNumReduceTasks(0);
		job.waitForCompletion(true);
	}
}









