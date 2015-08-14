package com.diyshirt.util;

public class SqlUtil {
	public static String toSql(String sql,String s,String sign,String pro,String and){
		String[] ss = s.split(sign);
		if (ss.length == 1) {
			sql +=and+" "+pro+" = '" + ss[0] + "'";
		} else {

			for (int i = 0; i < ss.length; i++) {
				if (i == 0)
					sql += and+"("+pro+" = '" + ss[i] + "'";
				if (i == ss.length - 1)
					sql += " or  "+pro+" = '" + ss[i] + "')";
				if (i < ss.length - 1 && i > 0)
					sql += " or  "+pro+" = '" + ss[i] + "'";

			}
		}
		return sql;
	}

}
