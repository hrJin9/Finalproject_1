package com.spring.finalproject.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FinalprojectDAO implements InterFinalprojectDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
}
