package com.baidu.dao;

import com.baidu.pojo.Score;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ScoreMapper {
    List<Score> getAllScore();
    int addScore(Score score);
    int updateScore(@Param("score") Score score, @Param("osid") int osid, @Param("ocid") int ocid);
    int delScore(@Param("sid") int sid, @Param("cid") int cid);
    Score check(@Param("sid") int sid, @Param("cid") int cid);
    Score getScore(@Param("sid") int sid, @Param("cid") int cid);
}
