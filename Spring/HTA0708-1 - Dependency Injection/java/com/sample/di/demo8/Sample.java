package com.sample.di.demo8;

import java.util.List;
import java.util.Map;

public class Sample {
	
	Map<String, Sns> snsMap;
	List<String> categories;
	List<Sns> snsList;
	
	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	
	public void setSnsMap(Map<String, Sns> snsMap) {
		this.snsMap = snsMap;
	}
	
	public void setSnsList(List<Sns> snsList) {
		this.snsList = snsList;
	}
	
	public void printCategories() {
		for(String category : categories) {
			System.out.println("카테고리 : " + category );
		}
		System.out.println();
	}
	
	public void printSnsList() {
		for(Sns sns : snsList) {
			sns.post("SNS연습하기", "매일 연습을 해야합니다.");
		}
	}
	
	public void printMapSns(String key) {
		Sns sns = snsMap.get(key);
		sns.post("MAP으로 연습하기", "매개변수에 Key를 주어서 받는Key값을 get으로 받아 post로 ~");
	}
}
