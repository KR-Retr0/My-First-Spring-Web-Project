package com.test1.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.test1.vo.UserVo;

@Mapper
public interface TestDao {
//	TestService
	public UserVo selectUser(String id);
	public int infoSelect(String id);
	public int insertUser(UserVo vo);
	public int updateUser(UserVo vo);
}
