package com.baidu.service;

import com.baidu.pojo.Score;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ScoreService {
    List<Score> getAllScore();
    int addScore(Score score);
    int updateScore(Score score, @Param("osid") int osid, @Param("ocid") int ocid);
    int delScore(int id, int cid);

    Score check(Integer sid,Integer cid);

    Score getScore(int sid, int cid);
}
