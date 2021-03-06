package com.gr.farming.cash.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashDAO {
	public int insert(CashVO vo);
	public int plusBal(int memberNo);
	public CashVO selectByMemNo(int memberNo);
	public int totalRecord(int memberNo);
}
