package com.sample.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartItem {
	
	private int no;
	private String id;
	private int productNo;
	private int amount;
	private Date createdDate;

}
