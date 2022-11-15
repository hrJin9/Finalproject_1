package com.spring.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.AES256;
import com.spring.finalproject.model.InterFinalprojectDAO;

@Service
public class FinalprojectService implements InterFinalprojectService {
	
	@Autowired
	private InterFinalprojectDAO dao;
	
	@Autowired
	private AES256 aes;
	@Autowired
	private FileManager fileManager;
}
