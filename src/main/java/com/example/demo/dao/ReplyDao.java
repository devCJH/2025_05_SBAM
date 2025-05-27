package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.Reply;

@Mapper
public interface ReplyDao {

	@Insert("""
			INSERT INTO reply
			    SET regDate = NOW()
			        , updateDate = NOW()
			        , memberId = #{memberId}
			        , relTypeCode = #{relTypeCode}
			        , relId = #{relId}
			        , content = #{content}
			""")
	void writeReply(int memberId, String relTypeCode, int relId, String content);

	@Select("""
			SELECT *
				FROM reply
				WHERE relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	List<Reply> getReplies(String relTypeCode, int relId);

}
