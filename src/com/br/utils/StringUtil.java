package com.br.utils;

public class StringUtil {
	/**
	 * 문자열 값이 null이면 지정된 defaultValue값을 반환한다.
	 * @param str null인지 체크할 문자
	 * @param defaultValue null일때 반환할 기본
	 * @return
	 */
	public static String nullToValue(String str, String defaultValue) {
		if(str == null) {
			return defaultValue;
		}
		return str;
	}
	/**
	 * 문자열값이 null이면 ""을 반환한
	 * @param str null인지 체크할 문자
	 * @return
	 */
	public static String nullToBlank(String str) {
		return nullToValue(str, "");
	}
	/** 문자열의 줄바꿈문자를 &lt;br&gt 로 변환해서 반환한다.
	 * 
	 * @param str 텍스
	 * @return &lt;br&gt태그가 포함된 텍스
	 */
	public static String strWithBr(String str) {
		if(str!=null) {
			return str.replace(System.lineSeparator(), "<br/>");
		}
		
		return "";
	}
}
