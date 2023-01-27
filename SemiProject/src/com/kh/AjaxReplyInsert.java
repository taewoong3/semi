package com.kh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/poll/insert.do")
public class AjaxReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String name = request.getParameter("name");
		
		ReplyBean bean = new ReplyBean();
		bean.setContent(replyContent);
		bean.setName(name);
		bean.setRef(pnum);
		
		int result = new ReplyMgr().insertReply(bean);
		
		response.getWriter().print(result);
		
		
	}

}
