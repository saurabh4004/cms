package org.nlt.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Persons;
@Controller
public class MainController {
	private Connection con;
	
 public MainController() {
	 	try {
	Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csm","root","");
	
	 	} catch (Exception e) {
	 		System.out.println();
		}
	}
 
 
 
 	@RequestMapping(value="/",method=RequestMethod.GET)
 	public ModelAndView home() {
 		HashMap m = new HashMap();
 		m.put("Title", "NLT INFOTECH PVT LTD");
 		m.put("ActionName","SubmitRecord");
 		
 	
 		return new ModelAndView("admin/index1",m);
 	}
 	
 	
 	
 	
 	@RequestMapping(value="/SubmitRecord",method=RequestMethod.POST)
 	
 	public ModelAndView submitData(HttpServletRequest req,HttpServletResponse res) {
 		HashMap m = new HashMap();
 		String name = req.getParameter("name");
 		String age = req.getParameter("age");
 		String phone = req.getParameter("phone");
 		
 		m.put("NameValue", name);
 		m.put("AgeValue", age);
 		m.put("PhoneValue", phone);
 		if (name.equals("")) {
			m.put("NameError", "Please Enter Name");
		} else if (age.equals("")) {
			m.put("AgeError", "Please Enter Age");
		} else if (phone.equals("")) {
			m.put("PhoneError", "Please Enter phone");
		}
		else {
 		
 		
 			try {
				Statement smt = con.createStatement();
				smt.execute("insert into Persons(name,age,phone,status) values('"+name+"',"+age+",'"+phone+"',1)");
				m.put("Message", "Record Submit Successfully");
				ResultSet rs = smt.executeQuery("select * from Persons where status=1");
				ArrayList<Persons> personList = new ArrayList<Persons>();
				while(rs.next()) {
					Persons person = new Persons();
					person.setId(rs.getInt("id"));
					person.setName(rs.getString("name"));
					person.setAge(rs.getInt("age"));
					person.setPhone(rs.getString("phone"));
					personList.add(person);
				}
				rs.close();
				smt.close();
				
				m.put("PersonList",personList);
				
			} catch (Exception e) {
				m.put("Message", e);
 		}
		}
 			
 			
 		return new ModelAndView("admin/index1",m);
 	}
 
	
	
	@RequestMapping(value="Menues",method=RequestMethod.GET)
	public ModelAndView show1(HttpServletRequest req,HttpServletResponse res) 
	{		
		HashMap m = new HashMap();
		m.put("msg","HEllo");
		return new ModelAndView("admin/menues",m);
	}
	
}

