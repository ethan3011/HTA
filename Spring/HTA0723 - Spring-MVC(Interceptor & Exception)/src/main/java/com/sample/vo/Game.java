package com.sample.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Game {
	private int no;
	private String name;
	private int price;
	private int discountPrice;
	private String describe;
	private int stock;
	private String brand;
	private Date createdDate;
	
}
