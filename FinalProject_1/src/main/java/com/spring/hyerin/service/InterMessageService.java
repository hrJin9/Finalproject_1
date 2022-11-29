package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;


public interface InterMessageService {

	List<Map<String,String>> getmvoList(String receiver);

	List<Map<String, String>> unread_mvoList(String receiver);

}
