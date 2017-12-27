package utils;

import java.util.Set;

import beans.WebLogBean;

public class FilterUtils {

	public static void filtStaticResource(WebLogBean webLogBean, Set<String> pages) {
		if(!pages.contains(webLogBean.getRequest())) {
			webLogBean.setValid(false);
		}
	}
	
}
