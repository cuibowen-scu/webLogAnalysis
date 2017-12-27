package preprocess;

import beans.WebLogBean;
import utils.TimeUtil;

public class WebLogParser {

	public static WebLogBean parser(String line) {
		WebLogBean webLogBean = new WebLogBean();
		String[] arr = line.split(" ");
		if(arr.length>11) {
			webLogBean.setRemote_addr(arr[0]);
			webLogBean.setRemote_user(arr[1]);
			String time_local = TimeUtil.formateDate(arr[3].substring(1));
			if(time_local == null) {
				time_local = "-invalid_time-";
			}
			webLogBean.setTime_local(time_local);
			webLogBean.setRequest(arr[6]);
			webLogBean.setStatus(arr[8]);
			webLogBean.setBody_bytes_sent(arr[9]);
			webLogBean.setHttp_referer(arr[10]);
			
			//如果元素较多，拼接useragent
			if(arr.length>12) {
				StringBuilder sb = new StringBuilder();
				for(int i=11;i<arr.length;i++){
					sb.append(arr[i]);
				}
				webLogBean.setHttp_user_agent(sb.toString());
			}else {
				webLogBean.setHttp_user_agent(arr[11]);
			}
			if(Integer.parseInt(webLogBean.getStatus()) >= 400) {
				webLogBean.setValid(false);
			}
			if("-invalid_time-".equals(webLogBean.getTime_local())){
				webLogBean.setValid(false);
			}
		}
		else {
			webLogBean.setValid(false);
		}
		return webLogBean;
	}
	
}
