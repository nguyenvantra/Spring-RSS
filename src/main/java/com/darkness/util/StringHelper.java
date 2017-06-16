package com.darkness.util;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

public class StringHelper {
	private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
	private static final Pattern WHITESPACE = Pattern.compile("[\\s]");

	public static String convertFromUTF8(String input) {
		String out = null;
		try {
			out = new String(input.getBytes("ISO-8859-1"), "UTF-8");
		} catch (java.io.UnsupportedEncodingException e) {
			return null;
		}
		return out;
	}

	public static String slugify(String input) {
		String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
		String normalized = Normalizer.normalize(nowhitespace, Form.NFD);
		String slug = NONLATIN.matcher(normalized).replaceAll("");
		return slug.toLowerCase(Locale.ENGLISH);
	}

	public static String getUnsigned(String input) {
		String temp = Normalizer.normalize(input, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replace("đ", "d").toLowerCase(Locale.ENGLISH);
	}

	public static String getSubDes(String input) {
		if (input.length() > 150)
			input = input.substring(0, 150) + "...";
		return input;
	}
}
