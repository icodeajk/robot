package com.tz.robot.sysmanage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
;


/**
 * 聊天请求类
 * @author 11816
 *
 */
@WebServlet("/chart")    //url
public class ChartAction extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String text = req.getParameter("text");
		//System.out.println(text);
		String answer;
		answer=machine(text);
		resp.getWriter().print(answer);   //将answer传给前台
	}
//和前端页面交互拿到前端页面的值
	

private static String machine(String quesiton) throws IOException {
    //接入机器人，输入问题
    String APIKEY = "a70bbf38d5994fd48dbc79f33c0aeda9";
    String INFO = URLEncoder.encode(quesiton, "utf-8");//这里可以输入问题
    String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO;
    URL getUrl = new URL(getURL);
    HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection();
    connection.connect();

    // 取得输入流，并使用Reader读取
    BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8"));
    StringBuffer sb = new StringBuffer();
    String line = "";
    while ((line = reader.readLine()) != null) {
        sb.append(line);
    }
    reader.close();
    // 断开连接
    connection.disconnect();
    String[] ss = new String[10];
    String s = sb.toString();
    String answer;
    ss = s.split(":");
    answer = ss[ss.length-1];
    answer = answer.substring(1,answer.length()-2);
    return answer;
}
}
