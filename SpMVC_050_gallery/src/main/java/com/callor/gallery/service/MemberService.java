package com.callor.gallery.service;

import org.springframework.ui.Model;

import com.callor.gallery.model.MemberVO;

public interface MemberService {

	public MemberVO join(MemberVO memberVO);
	public MemberVO update(MemberVO memberVO);
	public MemberVO findfById(String m_userid);
	public MemberVO login(MemberVO memberVO, Model model);
}
