package com.baidu.dao;

import com.baidu.pojo.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface CourseMapper {
    List<Course> getAllCourse();
    int addCourse(Course course);
    Course getCourseById(int id);
    int updateCourse(@Param("course") Course course, @Param("oid") int oid);
    int updateCourseWechat(Course course);
    int delCourse(int id);
    Course check(Integer id);
}
