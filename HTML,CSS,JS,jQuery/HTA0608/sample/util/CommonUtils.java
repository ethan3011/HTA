package com.sample.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {
	private static String DATE_TYPE_PATTERN = "yyyy-MM-dd";
	private static String NUMBER_FORMAT_PATTERN = "##,###";
	
	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(DATE_TYPE_PATTERN);
	private static DecimalFormat NUMBER_FORMAT = new DecimalFormat(NUMBER_FORMAT_PATTERN);
	
	public static int stringToint(String str) {
		return stringToint(str, 0);
	}
	
	public static int stringToint(String str, int defaultValue) {
		if(str == null) {
			return defaultValue;
		}
		try {
			return Integer.parseInt(str);
		}catch(NumberFormatException e) {
			return defaultValue;
		}
	}
	
	public static String dateTostring(Date date) {
		if(date == null) {
			return "";
		}
		return DATE_FORMAT.format(date);
	}
	
	public static String numberToString(int no) {
		return NUMBER_FORMAT.format(no);
	}
	
	public static String numberToString(double no) {
		return NUMBER_FORMAT.format(no);
	}
}
