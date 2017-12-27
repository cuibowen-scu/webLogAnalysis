package beans;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Writable;

public class WebLogBean implements Writable{
	
	private boolean valid = true; //判断数据是否合法
	private String remote_addr; //客户端ip
	private String remote_user; //客户端昵称，没有则为"-"
	private String time_local; //访问时间
	private String request; //访问的url(+http)
	private String status; //请求状态(成功为200)
	private String body_bytes_sent; //发给客户端的内容大小
	private String http_referer; //来访url
	private String http_user_agent; //浏览器信息
	
	
	public void set(boolean valid,String remote_addr, String remote_user, String time_local, String request, String status, String body_bytes_sent, String http_referer, String http_user_agent) {
		this.valid = valid;
		this.remote_addr = remote_addr;
		this.remote_user = remote_user;
		this.time_local = time_local;
		this.request = request;
		this.status = status;
		this.body_bytes_sent = body_bytes_sent;
		this.http_referer = http_referer;
		this.http_user_agent = http_user_agent;
	}
	
	public boolean isValid() {
		return valid;
	}
	public String getRemote_addr() {
		return remote_addr;
	}
	public String getRemote_user() {
		return remote_user;
	}
	public String getTime_local() {
		return time_local;
	}
	public String getRequest() {
		return request;
	}
	public String getStatus() {
		return status;
	}
	public String getBody_bytes_sent() {
		return body_bytes_sent;
	}
	public String getHttp_referer() {
		return http_referer;
	}
	public String getHttp_user_agent() {
		return http_user_agent;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	
	public void setRemote_addr(String remote_addr) {
		this.remote_addr = remote_addr;
	}
	public void setRemote_user(String remote_user) {
		this.remote_user = remote_user;
	}
	public void setTime_local(String time_local) {
		this.time_local = time_local;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setBody_bytes_sent(String body_bytes_sent) {
		this.body_bytes_sent = body_bytes_sent;
	}
	public void setHttp_referer(String http_referer) {
		this.http_referer = http_referer;
	}
	public void setHttp_user_agent(String http_user_agent) {
		this.http_user_agent = http_user_agent;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(this.valid);
		sb.append("\001").append(this.getRemote_addr());
		sb.append("\001").append(this.getRemote_user());
		sb.append("\001").append(this.getTime_local());
		sb.append("\001").append(this.getRequest());
		sb.append("\001").append(this.getStatus());
		sb.append("\001").append(this.getBody_bytes_sent());
		sb.append("\001").append(this.getHttp_referer());
		sb.append("\001").append(this.getHttp_user_agent());
		return sb.toString();
	}
	
	@Override
	public void readFields(DataInput in) throws IOException {
		this.valid = in.readBoolean();
		this.remote_addr = in.readUTF();
		this.remote_user = in.readUTF();
		this.time_local = in.readUTF();
		this.request = in.readUTF();
		this.status = in.readUTF();
		this.body_bytes_sent = in.readUTF();
		this.http_referer = in.readUTF();
		this.http_user_agent = in.readUTF();
	}
	
	@Override
	public void write(DataOutput out) throws IOException {
		out.writeBoolean(this.valid);
		out.writeUTF(null==remote_addr?"":remote_addr);
		out.writeUTF(null==remote_user?"":remote_user);
		out.writeUTF(null==time_local?"":time_local);
		out.writeUTF(null==request?"":request);
		out.writeUTF(null==status?"":status);
		out.writeUTF(null==body_bytes_sent?"":body_bytes_sent);
		out.writeUTF(null==http_referer?"":http_referer);
		out.writeUTF(null==http_user_agent?"":http_user_agent);
	}
	
}















