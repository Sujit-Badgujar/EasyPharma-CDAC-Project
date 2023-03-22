package com.easypharma.dtos;

import com.easypharma.entities.Address;
import com.easypharma.entities.Order;
import com.easypharma.entities.User;

public class PlaceOrderDTO {
	private Integer placeOrderId;
	private User user;
	private Address address;
	private Double totalPrice;

	public PlaceOrderDTO() {
	}

	public PlaceOrderDTO(Order order) {
		this.setPlaceOrderId(order.getOrderId());
		this.setUser(order.getUser());
		this.setTotalPrice(order.getOrderAmount());
		this.setAddress(order.getAddress());
	}

	public Integer getPlaceOrderId() {
		return placeOrderId;
	}

	public void setPlaceOrderId(Integer placeOrderId) {
		this.placeOrderId = placeOrderId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
