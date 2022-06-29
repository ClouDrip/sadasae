package com.bit.sadasae;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService { //인터페이스 따로 생성 해줘야함 

	@Autowired
	BookDao bookDao;
	
	@Override 
	public String create(Map<String, Object> map) { // BookDao.insert 메소드를 실행시키는 서비스 메소드를 작성한다
	    int affectRowCount = this.bookDao.insert(map);
	    if (affectRowCount ==  1) {
	        return map.get("book_id").toString();
	    }
	    return null;
	}
}
//자바에 기본으로 내장된 어노테이션으로 상위 인터페이스에 정의된 것을 재정의(Override)한다는 뜻이다.
//이클립스에서는 상위 인터페이스에 메소드 시그니쳐가 없을 경우 오류를 표시해 주면서 자동으로 인터페이스 시그니쳐를 만들어주는 기능이 있다