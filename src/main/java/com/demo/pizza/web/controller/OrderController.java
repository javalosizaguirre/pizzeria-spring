package com.demo.pizza.web.controller;

import com.demo.pizza.persistence.entity.OrderEntity;
import com.demo.pizza.persistence.projection.OrderSummary;
import com.demo.pizza.service.OrderService;
import org.hibernate.query.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService){
        this.orderService = orderService;
    }

    @GetMapping
    public ResponseEntity<List<OrderEntity>> getAll(){
        return ResponseEntity.ok(this.orderService.getAll());
    }

    @GetMapping("/customer/{id}")
    public ResponseEntity<List<OrderEntity>> getOutsideOrders(@PathVariable String id){
        return ResponseEntity.ok(this.orderService.getCustomerOrders(id));
    }

    @GetMapping("/summary/{id}")
    public ResponseEntity<OrderSummary> getOutsideOrders(@PathVariable int id){
        return ResponseEntity.ok(this.orderService.getSummary(id));
    }
}
