package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BoardDao {

	@Select("""
			SELECT `name`
				FROM board
				WHERE id = #{boardId} 
			""")
	String getBoardName(int boardId);
}
