package com.ys.sbbs.db;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ys.sbbs.entity.Board;

@Mapper
public interface BoardDaoMySQL {

	@Select("select count(bid) from board where isDeleted=0 AND ${field} LIKE #{query}")
	int getBoardCount(String field, String query);
	
	
	@Select("SELECT b.bid, b.uid, b.title, b.content, b.modTime, b.viewCount,"
				+ "	b.replyCount, b.files, u.uname "
				+ "	FROM board AS b JOIN users u ON b.uid = u.uid"
				+ "	WHERE b.bid=#{bid}")
	Board getBoard(int bid);
	
	
	@Select("SELECT b.bid, b.uid, b.title, b.modTime, b.viewCount, b.replyCount, u.uname"
			+ "	FROM board AS b JOIN users AS u"
			+ "	ON b.uid=u.uid "
			+ "	WHERE b.isDeleted=0 " 
			+ " AND ${field} LIKE #{query}"
			+ "	ORDER BY b.modTime DESC, b.bid DESC LIMIT 10 OFFSET #{offset}")
	List<Board> listBoard(String field, String query, int offset);

	
	
	@Insert("insert into board values(default, #{uid}, #{title}, #{content}, default, default, default, default, #{files})")
	void insertBoard(Board board);
	
	
	@Update("update board set viewCount=viewCount+1 where bid=#{bid}")
	void increaseViewCount(int bid);
	
	
	@Update("update board set replyCount=replyCount+1 where bid=#{bid}")
	void increaseReplyCount(int bid);
	
	
	@Update("update board set title=#{title}, content=#{content}, modTime=now(), files=#{files} where bid=#{bid}")
	void updateBoard(Board board);
	
	
	@Update("update board set isDeleted=1 where bid=#{bid}")
	void deleteBoard(int bid);
}
