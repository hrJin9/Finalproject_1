package com.spring.hyerin.model;

import java.util.List;
import java.util.Map;

public interface InterMessageDAO {

	List<Map<String,String>> getmvoList(Map<String, String> paraMap);

	List<Map<String, String>> unread_mvoList(String receiver);

}
