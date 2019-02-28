package com.immuking.springboot;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface SubjectsRepo extends JpaRepository<Subjects, Long>{

}//List<Alien> findByemail(String email);
