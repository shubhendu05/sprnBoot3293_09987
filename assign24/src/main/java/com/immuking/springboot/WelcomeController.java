package com.immuking.springboot;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@Autowired
	AlienRepo alienrepo;

	@Autowired
	BooksRepo booksrepo;

	@Autowired
	SubjectsRepo subsRepo;
	
	@Autowired
	private EntityManager entityManager;
	
	public static String role;
	

	@RequestMapping("logininitsql")
	public ModelAndView loginPreSql() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginSql");
		mv.addObject("obj", "Welcome To LogIn");
		return mv;
	}

	@RequestMapping("registerinitsql")
	public ModelAndView registerPreSql(@RequestParam("name") String name, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", name);
		mv.setViewName("registerSql");
		System.out.println("I am here in register " + name);
		return mv;
	}

	@RequestMapping("welcomeByLoginSql")
	public ModelAndView loginPostHdb() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("welcomeByLoginSql");
		return mv;
	}

	@RequestMapping("allbooks")
	@ResponseBody
	public ModelAndView allBooks(@RequestParam("uname") String uname, @RequestParam("psw") String password) {
		System.out.println("The username and password is " + uname + " password " + password);

		role = "";
		List<Alien> userList = alienrepo.findByemail(uname);
		System.out.println("The list of users: " + userList);
		List<Alien> passwordList = alienrepo.findBypassword(password);
		System.out.println("The list of password: " + passwordList);
		List<Alien> category = entityManager.createQuery("select A from Alien A WHERE A.email = ?1 AND A.password=?2")
                .setParameter(1, uname)
                .setParameter(2, password)
                .getResultList();
		System.out.println("The category is "+category);
		role = category.get(0).category;
		System.out.println("The value of category is "+role);
		/*String SELECT_QUERY = "select p from Alien p";
		Query query = entityManager.createQuery(SELECT_QUERY);
	    List<Alien> persons = (List<Alien>) query.getResultList();*/
		ModelAndView mv = new ModelAndView();
		if (userList.size() > 0 && passwordList.size() > 0) {
			mv.setViewName("allbooks");
			mv.addObject("obj", booksrepo.findAll());
			System.out.println("The all books are " + booksrepo.findAll());
		} else {
			mv.setViewName("loginSql");
			mv.addObject("obj", "User Name Or Password Invalid");
		}

		return mv;
	}

	@RequestMapping("addbook")
	@ResponseBody
	public ModelAndView addBooks(Books books) {
		
		if(!role.equals("Librarian")) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("notauthorized");
			return mv;
		}
		System.out.println("The date is " + books.publishDate);
		booksrepo.save(books);
		ModelAndView mv = new ModelAndView("allbooks");
		mv.addObject("obj", booksrepo.findAll());
		mv.setViewName("allbooks");
		return mv;
	}

	@RequestMapping("addedsubjects")
	@ResponseBody
	public ModelAndView addedSubjects(Subjects subjects) {
	
		if(role.equals("Librarian")) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("notauthorized");
			return mv;
		}
		subsRepo.save(subjects);
		ModelAndView mv = new ModelAndView("allsubjects");
		mv.addObject("obj", subsRepo.findAll());
		mv.addObject("obj1", booksrepo.findAll());
		mv.setViewName("allsubjects");
		System.out.println("The all subjects are : " + subsRepo.findAll());
		return mv;
	}

	@RequestMapping("allsubjects")
	@ResponseBody
	public ModelAndView allSubjects() {
		ModelAndView mv = new ModelAndView("allsubjects");
		mv.addObject("obj", subsRepo.findAll());
		mv.addObject("obj1", booksrepo.findAll());
		mv.setViewName("allsubjects");
		System.out.println("The all subjects are : " + subsRepo.findAll());
		return mv;
	}

	@RequestMapping("addSubject")
	@ResponseBody
	public ModelAndView addSubjects() {
		ModelAndView mv = new ModelAndView("addSubject");
		mv.addObject("obj", booksrepo.findAll());
		mv.setViewName("addSubject");
		return mv;
	}

	@RequestMapping("welcomeByRegisterSql")
	@ResponseBody
	public ModelAndView registerPostSql(Alien alien) {
		System.out.println("The alien object is " + alien);
		alienrepo.save(alien);
		ModelAndView mv = new ModelAndView();
		mv.addObject("obj1", alienrepo.findAll());
		mv.addObject("obj", alien);
		mv.setViewName("registeredSuccessfully");
		return mv;

	}

	@RequestMapping(value = "deletebook/{id}")
	@ResponseBody
	public ModelAndView deleteBook(@PathVariable("id") Long id) {
		System.out.println("The alien object is " + id);
		booksrepo.deleteById(id);
		ModelAndView mv = new ModelAndView("allbooks");
		mv.addObject("obj", booksrepo.findAll());
		mv.setViewName("allbooks");
		return mv;

	}

	@RequestMapping(value = "deletesubject/{id}")
	@ResponseBody
	public ModelAndView deleteSubject(@PathVariable("id") Long id) {
		System.out.println("The alien object is " + id);
		subsRepo.deleteById(id);
		ModelAndView mv = new ModelAndView("allsubjects");
		mv.addObject("obj", subsRepo.findAll());
		mv.setViewName("allsubjects");
		return mv;

	}

	@RequestMapping("backtobooks")
	@ResponseBody
	public ModelAndView backToBooks() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allbooks");
		mv.addObject("obj", booksrepo.findAll());
		return mv;
	}
}