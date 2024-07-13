package com.baidu.service.impl;

import com.baidu.dao.ScoreMapper;
import com.baidu.pojo.Score;
import com.baidu.service.ScoreService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {
    @Autowired
    private ScoreMapper scoreMapper;
    @Override
    public List<Score> getAllScore() {
        return scoreMapper.getAllScore();
    }

    @Override
    public int addScore(Score score) {
        return scoreMapper.addScore(score);

    }

    @Override
    public int delScore(int sid, int cid) {
        return scoreMapper.delScore(sid,cid);
    }

    @Override
    public Score check(Integer sid, Integer cid) {
        return scoreMapper.check(sid,cid);
    }

    @Override
    public Score getScore(int sid, int cid) {
        return scoreMapper.getScore(sid,cid);
    }

    @Override
    public int updateScore(Score score, @Param("osid") int osid, @Param("ocid") int ocid) {
        return scoreMapper.updateScore(score, osid, ocid);
    }

}
