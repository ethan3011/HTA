package com.sample.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Product {
	private int no;
	private String name;
	private String maker;
	private String category;
	private int price;
	private int discountPrice;
	private int stock;
	private String soldOut;
	private Date createdDate;
	private int reviewCnt;
	
	
}
