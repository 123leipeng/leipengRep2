package com.peng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peng.entity.QueryVo;
import com.peng.entity.Score;

public interface ScoreMapper {
	public List<Score> findAllScoreByStuid(Long id);

	public List<Score> selectStuInClass(String id);

	public Score editScore(String id);

	public void updateScore(Score score);
	
	public void insertScoreWithAddCourse(@Param("list")List<QueryVo> list);

	public void insertItemInScoreStuSelect(QueryVo queryVo);
	
	public void dropScore(QueryVo queryVo);
}
