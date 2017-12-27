package beans;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Writable;

/**
 * PageViews表是以每一个页面为主体的
 * @author cbw
 *
 */
public class PageViewsBean implements Writable {

	
	/*v.set(session + "\001"+key.toString()+"\001"+beans.get(i - 1).getRemote_user()
	 *  + "\001" + beans.get(i - 1).getTime_local() + "\001" + beans.get(i - 1).getRequest()
	 *   + "\001" + step + "\001" + (timeDiff / 1000) + "\001" + 
	 *   beans.get(i - 1).getHttp_referer() + "\001"
			+ beans.get(i - 1).getHttp_user_agent() + "\001" + 
			beans.get(i - 1).getBody_bytes_sent() +  "\001" + beans.get(i - 1).getStatus());
*/	
	private String session;			//session
	private String remote_addr;     //ip
	private String remote_user;     //用户名
	private String timestr;         //访问时间
	private String request;         //访问页面
	private int step;               //第几步
	private String staylong;        //停留时长
	private String referal;         //来访url
	private String useragent;       //浏览器类型
	private String bytes_send;      //请求资源大小
	private String status;          //状态码

	public void set(String session, String remote_addr, String useragent, String timestr, String request, int step, String staylong, String referal, String bytes_send, String status,String remote_user) {
		this.session = session;
		this.remote_addr = remote_addr;
		this.useragent = useragent;
		this.timestr = timestr;
		this.request = request;
		this.step = step;
		this.staylong = staylong;
		this.referal = referal;
		this.bytes_send = bytes_send;
		this.status = status;
		this.remote_user = remote_user;
	}

	
	
	public String getRemote_user() {
		return remote_user;
	}



	public void setRemote_user(String remote_user) {
		this.remote_user = remote_user;
	}



	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public String getRemote_addr() {
		return remote_addr;
	}

	public void setRemote_addr(String remote_addr) {
		this.remote_addr = remote_addr;
	}

	public String getTimestr() {
		return timestr;
	}

	public void setTimestr(String timestr) {
		this.timestr = timestr;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getStaylong() {
		return staylong;
	}

	public void setStaylong(String staylong) {
		this.staylong = staylong;
	}

	public String getReferal() {
		return referal;
	}

	public void setReferal(String referal) {
		this.referal = referal;
	}

	public String getUseragent() {
		return useragent;
	}

	public void setUseragent(String useragent) {
		this.useragent = useragent;
	}

	public String getBytes_send() {
		return bytes_send;
	}

	public void setBytes_send(String bytes_send) {
		this.bytes_send = bytes_send;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		this.session = in.readUTF();
		this.remote_addr = in.readUTF();
		this.remote_user = in.readUTF();
		this.timestr = in.readUTF();
		this.request = in.readUTF();
		this.step = in.readInt();
		this.staylong = in.readUTF();
		this.referal = in.readUTF();
		this.useragent = in.readUTF();
		this.bytes_send = in.readUTF();
		this.status = in.readUTF();
		
	}

	@Override
	public void write(DataOutput out) throws IOException {
		out.writeUTF(session);
		out.writeUTF(remote_addr);
		out.writeUTF(remote_user);
		out.writeUTF(timestr);
		out.writeUTF(request);
		out.writeInt(step);
		out.writeUTF(staylong);
		out.writeUTF(referal);
		out.writeUTF(useragent);
		out.writeUTF(bytes_send);
		out.writeUTF(status);
		
	}

}
