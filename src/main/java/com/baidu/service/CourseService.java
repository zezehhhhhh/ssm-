package com.baidu.service;

import com.baidu.pojo.Course;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CourseService {
    List<Course> getAllCourse();
    int addCourse(Course course);
    Course getCourseById(int id);
    int updateCourse(Course course,Integer oid);
    int delCourse(int id);
    Course check(Integer id);
    int updateCourseWechat(Course course);
}
