package com.spring.jieun.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.hyerin.model.EmployeeVO;

public interface InterSearchDAO {

	List<EmployeeVO> getEmpList(Map<String, String> paraMap);

	List<Map<String, String>> getMsgList(Map<String, String> paraMap);

	List<Map<String, String>> getAppList(Map<String, String> paraMap);

}
