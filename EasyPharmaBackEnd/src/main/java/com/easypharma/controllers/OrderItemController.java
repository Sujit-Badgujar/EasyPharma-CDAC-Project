package com.easypharma.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import com.easypharma.services.OrderItemService;

@CrossOrigin
@RestController
public class OrderItemController {
	
	@Autowired
	private OrderItemService orderItemService;
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//	@GetMapping("/orderitems")
//	public ResponseEntity<?> getQuantityByOrderId(@RequestParam("orderId") String orderId) {
//		int orderid = Integer.parseInt(orderId);
//		int quantity = orderItemService.getQuantityByOrderId(orderid);
//		System.out.println(quantity);
//		if (quantity != 0) {
//			
//			return Response.success(quantity);
//		}
//		return Response.error(null);
//}
}
