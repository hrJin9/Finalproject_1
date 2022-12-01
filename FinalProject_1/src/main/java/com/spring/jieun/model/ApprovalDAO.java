package com.spring.jieun.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDAO implements InterApprovalDAO{

	@Resource
	private SqlSessionTemplate sqlsession;
	
}
