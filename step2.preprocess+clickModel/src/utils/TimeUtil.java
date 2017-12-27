package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TimeUtil {

	public static SimpleDateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss", Locale.US);
	public static SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
	
	public static String formateDate(String timeOrial) {
		try {
			Date df1Date = df1.parse(timeOrial);
			String time_local = df2.format(df1Date);
			return time_local;
		}catch (ParseException e) {
			return null;
		}
		
	}

	public static Date toDate(String time_local) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
		Date date = df.parse(time_local);
		return date;
	}

	public static long timeDiff(Date date1, Date date2) {
		return date1.getTime() - date2.getTime();
	}

}
















