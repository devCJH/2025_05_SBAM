package com.example.demo.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	@Insert("""
			INSERT INTO `member`
			    SET regDate = NOW()
			        , updateDate = NOW()
			        , loginId = #{loginId}
			        , loginPw = #{loginPw}
			        , `name` = #{name}
			""")
	void joinMember(String loginId, String loginPw, String name);
	
}
