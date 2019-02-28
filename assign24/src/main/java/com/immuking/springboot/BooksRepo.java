package com.immuking.springboot;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface BooksRepo extends JpaRepository<Books, Long> {

}
