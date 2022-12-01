package com.spring.jieun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jieun.model.InterApprovalDAO;

@Service
public class ApprovalService implements InterApprovalService {

	// 의존객체 
	@Autowired
	private InterApprovalDAO dao;

}
