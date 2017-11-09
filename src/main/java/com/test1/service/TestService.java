package com.test1.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test1.controller.TestController;
import com.test1.dao.TestDao;
import com.test1.vo.UserVo;

@Service
public class TestService {
	
	//TestController
	
	@Autowired TestDao testDao;
	
	
	public ModelAndView join_proc(HttpServletRequest req, UserVo userVo, String viewName){
		
		String likeArray[] = req.getParameterValues("like");
		String like = "";
		ModelAndView mv = new ModelAndView(viewName);

		for (int i = 0; i < likeArray.length; i++) {
			like = like + likeArray[i] + ",";
		}
		like = like.substring(0, like.length() - 1);
		testDao.insertUser(userVo);

		System.out.println("user " + req.getParameter("id") + "(aka " + req.getParameter("nm") + ")is successfully registered");

		UserVo vo2 = testDao.selectUser(userVo.getId());
		System.out.println(vo2.toString());

		mv.addObject("vo", userVo);
		
		return mv;
	}
	
	
}