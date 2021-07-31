package com.nagarro.service;

import java.io.IOException;
import java.net.http.HttpHeaders;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.nagarro.model.Employee;

@Service
public class EmpService {

	@Autowired
	private RestTemplate restTemplate;

	public static final String PORT = "8825";
	public static final String GET_ALL_EMPLOYEE_DATA_URL = "http://localhost:" + PORT + "/employees/getAll";
	public static final String POST_EMPLOYEE_DATA_URL = "http://localhost:" + PORT + "/employees/add";
	public static final String UPDATE_EMPLOYEE_DATA_URL = "http://localhost:" + PORT + "/employees/update/";

	public Employee[] getAllEmployeeApi() {
		
		RestTemplate restTemplate1 = new RestTemplate();
		System.out.println("inside service " + GET_ALL_EMPLOYEE_DATA_URL);
		
		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
		// Add the Jackson Message converter
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();

		// Note: here we are making this converter to process any kind of response,
		// not only application/*json, which is the default behaviour
		converter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
		messageConverters.add(converter);
		restTemplate1.setMessageConverters(messageConverters);

		return restTemplate1.getForObject(GET_ALL_EMPLOYEE_DATA_URL, Employee[].class);
	}

	public void postEmployeeApi(Employee employee) {
		
		System.out.println("inside service " + POST_EMPLOYEE_DATA_URL);
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		// converting book object to json string
		String jsonOb = getJsonString(employee);
		System.out.println(jsonOb);

		HttpEntity<String> entity = new HttpEntity<String>(jsonOb, headers);

		restTemplate.exchange(POST_EMPLOYEE_DATA_URL, HttpMethod.POST, entity, Employee.class);
	}
	
	public void updateEmployeeApi(Employee employee,int empCode) {
		System.out.println("inside service " + UPDATE_EMPLOYEE_DATA_URL);
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

		// converting book object to json string
		String jsonOb = getJsonString(employee);
		System.out.println(jsonOb);

		HttpEntity<String> entity = new HttpEntity<String>(jsonOb, headers);

		restTemplate.exchange(UPDATE_EMPLOYEE_DATA_URL+empCode, HttpMethod.PUT, entity, Employee.class);
	}
	
	public static String getJsonString(Employee employee) {
		String jsonStr = null;
        // Creating Object of ObjectMapper define in Jackson API  
        ObjectMapper Obj = new ObjectMapper();  
        try {  
            // Converting the Java object into a JSON string  
            jsonStr = Obj.writeValueAsString(employee);  
            // Displaying Java object into a JSON string  
            System.out.println(jsonStr);        
        }  
        catch (IOException e) {  
            e.printStackTrace();  
        }
		return jsonStr;  
	}

}
