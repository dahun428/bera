package com.br.utils;

import java.text.DecimalFormat;

public class NumberUtil {
	private static DecimalFormat currencyFomat = new DecimalFormat("#,###");

	public static String numberWithComma(long number) {
		return currencyFomat.format(number);
	}

	/**
	 * 문자열을 수로 변환해 반환한다.
	 * 
	 * @param str           문자열
	 * @param defaultNumber 기본값
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static int stringToInt(String str, int defaultNumber) {
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}

	/**
	 * 문자열을 수로 변환해 반환한다.
	 * 
	 * @param str 문자
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static int stringToInt(String str) {
		return stringToInt(str, 0);
	}

	/**
	 * 문자열을 수로 변환해 반환한다.
	 * 
	 * @param str           문자열
	 * @param defaultNumber 기본값
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static long stringToLong(String str, long defaultNumber) {
		try {
			return Long.parseLong(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}

	public static long stringToLong(String str) {
		return stringToLong(str, 0L);
	}

	/**
	 * 문자열을 수로 변환해 반환한다.
	 * 
	 * @param str           문자열
	 * @param defaultNumber 기본값
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static double stringToDouble(String str, double defaultNumber) {
		try {
			return Double.parseDouble(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}

	public static double stringToDouble(String str) {
		return stringToDouble(str, 0);
	}
}
