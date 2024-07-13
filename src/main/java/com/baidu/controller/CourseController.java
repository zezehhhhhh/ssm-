package com.baidu.controller;

import com.baidu.pojo.Course;
import com.baidu.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/course")
@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping("/getAllCourse")
    public String getAllCourse(HttpServletRequest request,HttpSession session){
        System.out.println("getAllCourse");
        List<Course> list = new ArrayList<Course>();
        list=courseService.getAllCourse();
        request.setAttribute("courseList",list);
        return "courseList";
    }

    @RequestMapping("/getAllCourseWechat")
    @ResponseBody
    public List<Course> getAllCourseWechat(HttpServletRequest request,HttpSession session){
        System.out.println("getAllCourse");
        List<Course> list = new ArrayList<Course>();
        list=courseService.getAllCourse();
        request.setAttribute("courseList",list);
        return list;
    }

    @RequestMapping("/addCourse")
    public String addCourse(Course course){
        System.out.println("addCourse");
        courseService.addCourse(course);
        return "forward:/course/getAllCourse";
    }
    @RequestMapping("/addCourseWechat")
    @ResponseBody
    public boolean addCourseWechat(Course course){
        System.out.println("addCourse");
        courseService.addCourse(course);
        return true;
    }

    @RequestMapping("/delCourse")
    public String delCourse(int id){
        System.out.println("delCourse");
        courseService.delCourse(id);
        return "forward:/course/getAllCourse";
    }

    @RequestMapping("/delCourseWechat")
    @ResponseBody
    public boolean delCourseWechat(int id){
        System.out.println("delCourse");
        courseService.delCourse(id);
        return true;
    }

    @RequestMapping("/toEditCourse")
    public String toEditCourse(int id,HttpServletRequest request){
        System.out.println("editCourse");
        Course course = courseService.getCourseById(id);
        request.setAttribute("course",course);
        return "updateCourse";
    }

    @RequestMapping("/updateCourse")
    public String updateCourse(Course course,Integer oid,HttpServletRequest request){
        System.out.println(course);
        courseService.updateCourse(course,oid);
        return "forward:/course/getAllCourse";
    }

    @RequestMapping("/updateCourseWechat")
    @ResponseBody
    public boolean updateCourseWechat(Course course,HttpServletRequest request){
        System.out.println(course);
        courseService.updateCourseWechat(course);
        return true ;
    }

    @RequestMapping("/check")
    @ResponseBody
    public boolean check(Integer id,HttpServletRequest request){
        System.out.println("check");
        Course user =  courseService.check(id);
        if (user!=null){
            return true;}
        else {return false;}
    }
    @RequestMapping("/getCourseById")
    public Course getCourseById(Integer id){
        Course student=courseService.getCourseById(id);
        return student;
    }

    @RequestMapping("/getCourseByIdWechat")
    @ResponseBody
    public List<Course> getCourseByIdWechat(Integer id){
        List<Course> student= new ArrayList<>();
        student.add(courseService.getCourseById(id));
        return student;
    }

}
