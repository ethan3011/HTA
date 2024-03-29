package com.review.hr.vo;

public class Location {
	private int id;
	private String streetAddress;
	private String postalCode;
	private String city;
	private String state;
	private String conutryId;
	
	public Location() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getConutryId() {
		return conutryId;
	}

	public void setConutryId(String conutryId) {
		this.conutryId = conutryId;
	}
}
