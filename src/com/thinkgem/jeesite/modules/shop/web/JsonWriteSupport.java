package com.thinkgem.jeesite.modules.shop.web;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletResponse;

/**
 * 支持json格式回写
 * @author lxhu
 *
 */
public class JsonWriteSupport {

	public JsonWriteSupport() {
		super();
	}

	/**
	 * 通过PrintWriter将响应数据写入response，ajax可以接受到这个数据
	 * 
	 * @param response
	 * @param data
	 */
	protected void renderData(HttpServletResponse response, String data) {
		PrintWriter printWriter = null;
		try {
			printWriter = response.getWriter();
			printWriter.print(data);
		} catch (IOException ex) {
		} finally {
			if (null != printWriter) {
				printWriter.flush();
				printWriter.close();
			}
		}
	}

}