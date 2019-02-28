package com.immuking.springboot;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

@Component
public interface AlienRepo extends JpaRepository<Alien, Long> {// CrudRepository<Alien, Integer> {
	List<Alien> findByemail(String email);

	List<Alien> findBypassword(String password);
	//@Query("SELECT p FROM registration p WHERE LOWER(p.email) = LOWER(:email)")
   // public List<Person> find(@Param("lastName") String lastName);
	//List<Alien> findByCategory(String category);
	
	
	
}
