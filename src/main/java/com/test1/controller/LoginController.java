package com.test1.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test1.dao.TestDao;
import com.test1.service.TestService;
import com.test1.vo.UserVo;

@Controller
public class LoginController {

	String sns = null;

	@Autowired
	TestDao testdao;
	
	@Autowired TestService testService;

	@RequestMapping(value = "/join.ajax", produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkId(HttpServletRequest req) throws UnsupportedEncodingException {

		System.out.println(req.getParameter("id"));
		System.out.println(testdao.infoSelect(req.getParameter("id")));

		return testdao.infoSelect(req.getParameter("id")) > 0 ? "중복되어 사용불가능한 아이디입니다":"사용가능";
	}

	@RequestMapping(value = "/join_req", method = RequestMethod.POST)
	public ModelAndView join_proc(HttpServletRequest req, UserVo userVo) {
		return testService.join_proc(req, userVo, "/joinsuc");
	}

	@RequestMapping("/updateUser")
	public ModelAndView updateUser(HttpServletRequest req) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView("/joinsuc");

		String likeArray[] = req.getParameterValues("like");
		String like = "";

		for (int i = 0; i < likeArray.length; i++) {
			like = like + likeArray[i] + ",";
		}
		like = like.substring(0, like.length() - 1);
		UserVo vo = new UserVo(req.getParameter("id"), req.getParameter("pw"), req.getParameter("nm"),
				req.getParameter("gender"), like, req.getParameter("joinfrom"), sns);
		System.out.println(vo.toString());
		testdao.updateUser(vo);
		
		return mv;
	}

	@RequestMapping("/snsSend")
	public void snsSend(HttpServletRequest req) {
		sns = req.getParameter("Json");

		JSONObject ob = new JSONObject(sns);
		
		System.out.println(sns);
	}

}
