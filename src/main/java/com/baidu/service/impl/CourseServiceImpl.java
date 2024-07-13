package com.baidu.service.impl;

import com.baidu.dao.CourseMapper;
import com.baidu.pojo.Course;
import com.baidu.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Override
    public List<Course> getAllCourse() {
        return courseMapper.getAllCourse();
    }

    @Override
    public int addCourse(Course course) {
        return courseMapper.addCourse(course);

    }

    @Override
    public int delCourse(int id) {
        return courseMapper.delCourse(id);
    }

    @Override
    public Course check(Integer id) {
        return courseMapper.check(id);
    }

    @Override
    public Course getCourseById(int id) {
        return courseMapper.getCourseById(id);
    }

    @Override
    public int updateCourse(Course course,Integer oid) {
        return courseMapper.updateCourse(course,oid);
    }
    @Override
    public int updateCourseWechat(Course course) {
        return courseMapper.updateCourseWechat(course);
    }

}
