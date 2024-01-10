package com.demo.pizza.persistence.repository;

import com.demo.pizza.persistence.entity.CustomerEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.ListCrudRepository;

public interface CustomerRepository extends ListCrudRepository<CustomerEntity, String> {

    @Query(value = "SELECT c FROM CustomerEntity c WHERE c.phoneNumber = :phone")
    CustomerEntity findByPhone(String phone);
}
