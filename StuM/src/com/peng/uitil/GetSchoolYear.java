package com.peng.uitil;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class GetSchoolYear {

	private static String param;
	static {
		Properties prop = new Properties();
		InputStream in =GetSchoolYear.class.getResourceAsStream("/configure.properties");
		try {
			prop.load(in);
			param = prop.getProperty("schoolYear").trim();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ˽�й��췽��������Ҫ��������
	 */
	private GetSchoolYear() {
	}

	public static String getParam() {
		return param;
	}

}
