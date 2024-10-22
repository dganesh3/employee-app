package com.jsp.employee_app_prc.dao;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.employee_app_prc.entity.Employee;

@Repository
public class EmployeeDao {

	@Autowired
	private EntityManager enitiyManager;
	
	@Transactional
	public Employee saveEmployeeDao(Employee employee)
	{
		EntityTransaction transaction=enitiyManager.getTransaction();
		transaction.begin();
		employee.setAge(Period.between(employee.getDob(), LocalDate.now()).getYears());
		enitiyManager.persist(employee);
		transaction.commit();
		return employee;
	}
	
	public Employee findEmployeeDao(int id)
	{
		Employee emp=enitiyManager.find(Employee.class, id);
		if(emp!=null)
		{
		return emp;
		}
		return null;
	}
	
	@Transactional
	public Employee updateEmployeeDao(Employee employee)
	{ EntityTransaction transaction=enitiyManager.getTransaction();
		transaction.begin();
		employee.setAge(Period.between(employee.getDob(), LocalDate.now()).getYears());
		enitiyManager.merge(employee);
		transaction.commit();
		return employee;
	}
	
	
	public List<Employee> getAllEmployeeDao()
	{
		Query query=enitiyManager.createQuery("select e from Employee e");
		return query.getResultList();
	}
	
	@Transactional
	public boolean removeEmployeeDto(int id)
	{
		Employee emp=findEmployeeDao(id);
		if(emp!=null)
		{ EntityTransaction transaction=enitiyManager.getTransaction();
			transaction.begin();
			enitiyManager.remove(emp);
			transaction.commit();
			return true;
		}
		return false;
	}

	
}
