package com.bit.sadasae;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDao {
 @Autowired
 SqlSessionTemplate sqlSessionTemplate;
 
 public int insert(Map<String, Object> map) {
	  return this.sqlSessionTemplate.insert("book.insert", map); // 책 데이터 입력 쿼리를 실행하는 DAO메소드를 만든다.
	  
	}
}
