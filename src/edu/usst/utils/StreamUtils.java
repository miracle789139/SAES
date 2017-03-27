package edu.usst.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

public class StreamUtils {
	public static JSONObject getString(HttpServletRequest request){
		ServletInputStream InputStream;//从输入流读取
		StringBuffer buffer = new StringBuffer();//逐行读入buffer
		try {
			request.setCharacterEncoding("UTF-8");
			InputStream = request.getInputStream();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					InputStream, "UTF-8"));

			String line = "";
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}

		} catch (IOException e) {

			e.printStackTrace();
		}

		//System.out.println("收到buffer:" + buffer.toString());
		JSONObject data =new JSONObject();
		if(buffer.toString().startsWith("{")){
			 data = JSONObject.fromObject(buffer.toString());
		}
		
		return data;
	}
}
