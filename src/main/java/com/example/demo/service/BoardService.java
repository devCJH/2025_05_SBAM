package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;

@Service
public class BoardService {

	private BoardDao boardDao;
	
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public String getBoardName(int boardId) {
		return this.boardDao.getBoardName(boardId);
	}

}
