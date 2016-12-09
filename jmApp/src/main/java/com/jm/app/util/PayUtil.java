package com.jm.app.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 支付工具类
 * @author songwp 20161208
 *
 */
public class PayUtil {
	
	/**
	 * 通讯编码
	 */
	private static final String CHARSET = "GBK";
	/**
	 * 请求地址
	 */
	//protected static String BASE_URL = "http://112.74.230.8:8081/posp-api/";

	/**
	 * 构造请求的地址信息
	 * 
	 * @param transType
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public static String buildUrl(String base_url ,String transType, Map<String, String> param)
			throws Exception {
		StringBuffer url = new StringBuffer();
		url.append(base_url);
		url.append(transType + "?");
		Set<String> set = param.keySet();
		Iterator<String> it = set.iterator();
		boolean isFirst = true;
		while (it.hasNext()) {
			String key = it.next();
			String value = URLEncoder.encode(param.get(key), CHARSET);
			if (isFirst) {
				isFirst = false;
			} else {
				url.append("&");
			}
			url.append(key + "=" + value);
		}
		return url.toString();
	}

	/**
	 * 发送请求到服务器，并接收返回信息
	 * 
	 * @param urlStr
	 * @return
	 * @throws Exception
	 */
	public static String receiveBySend(String urlStr, String encoding)
			throws Exception {
		System.out.println("请求:" + urlStr);
		InputStream is = null;
		BufferedReader br = null;
		InputStreamReader isr = null;
		HttpURLConnection conn = null;
		try {
			StringBuffer sb = new StringBuffer();
			URL url = new URL(urlStr);
			conn = (HttpURLConnection) url.openConnection();
			is = conn.getInputStream();
			isr = new InputStreamReader(is, encoding);
			br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
			String xml = sb.toString();
			return xml;
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				br.close();
				isr.close();
				is.close();
				conn.disconnect();
			} catch (Exception e) {
			}
		}
	}

	/**
	 * 构造一个空的请求数据
	 * 
	 * @return
	 */
	public static Map<String, String> buildRequestParam(boolean account) {
		Map<String, String> param = new HashMap<String, String>();
		return param;
	}

	/**
	 * 数据签名
	 * 
	 * @param param
	 * @param keyValue
	 * @return
	 * @throws Exception
	 */
	public static String signature(Map<String, String> param, String keyValue)
			throws Exception {
		Set<String> set = param.keySet();
		List<String> keys = new ArrayList<String>(set);
		Collections.sort(keys);
		boolean start = true;
		StringBuffer sb = new StringBuffer();
		for (String key : keys) {
			String value = param.get(key);
			if (value != null && !value.trim().equals("")
					&& !"signature".equalsIgnoreCase(key)) {
				if (!start) {
					sb.append("&");
				}
				sb.append(key + "=" + value);
				start = false;
			}
		}
		sb.append("&" + keyValue);
		String src = sb.toString();
		System.out.println("签名数据:" + src);
		String result = DigestUtils.md5Hex(src.getBytes(CHARSET)).toUpperCase();
		System.out.println("签名结果:" + result);
		return result;
	}

	/**
	 * 自动产生流水号
	 * 
	 * @return
	 */
	public static String generateTraceno(String projectId,String userId) {
		
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		
		return format.format(new Date())+"_"+projectId+"_"+userId;
	}	 

}
