package com.peng.dao;

import java.util.List;

import com.peng.entity.Question;

public interface QuestionMapper {

	public List<Question> selectQuestionById(String id);
}
