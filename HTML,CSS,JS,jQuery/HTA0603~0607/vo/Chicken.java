package com.sample.vo;

import java.util.Date;

public class Chicken {
		private String name;
		private int price;
		private Date date;
		private String brand;
		private int deliveryFee;
		private int stock;
		
		public Chicken(String name, int price, Date date, String brand, int deliveryFee, int stock) {
			super();
			this.name = name;
			this.price = price;
			this.date = date;
			this.brand = brand;
			this.deliveryFee = deliveryFee;
			this.stock = stock;
		}
		
		public Chicken() {}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public String getBrand() {
			return brand;
		}

		public void setBrand(String brand) {
			this.brand = brand;
		}

		public int getDeliveryFee() {
			return deliveryFee;
		}

		public void setDeliveryFee(int deliveryFee) {
			this.deliveryFee = deliveryFee;
		}

		public int getStock() {
			return stock;
		}

		public void setStock(int stock) {
			this.stock = stock;
		}

	}