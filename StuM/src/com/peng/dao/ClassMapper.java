package com.peng.dao;

import java.util.List;

import com.peng.entity.Classes;

public interface ClassMapper {

	public Classes findClassByid(String id); 
	
	public List<Classes> findClassAlive();
	
}
