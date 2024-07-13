package com.baidu.controller;

import com.baidu.pojo.Course;
import com.baidu.pojo.Score;
import com.baidu.pojo.Student;
import com.baidu.service.CourseService;
import com.baidu.service.ScoreService;
import com.baidu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/score")
@Controller
public class ScoreController {
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseService courseService;
    @RequestMapping("/getAllScore")
    public String getAllScore(HttpServletRequest request,HttpSession session){
        System.out.println("getAllScore");
        List<Score> list = new ArrayList<Score>();
        list=scoreService.getAllScore();
        for (Score score:list){
            Student student = studentService.getStudentById(score.getSid());
            score.setStudent(student);
        }
        for (Score score:list){
            Course course = courseService.getCourseById(score.getCid());
            System.out.println(course);
            score.setCourse(course);
        }
        request.setAttribute("scoreList",list);
        return "scoreList";
    }

    @RequestMapping("/addScore")
    public String addScore(Score score){
        System.out.println("addScore");
        scoreService.addScore(score);
        return "forward:/score/getAllScore";
    }

    @RequestMapping("/delScore")
    public String delScore(int sid,int cid){
        System.out.println("delScore");
        scoreService.delScore(sid,cid);
        return "forward:/score/getAllScore";
    }

    @RequestMapping("/toEditScore")
    public String toEditScore(int sid,int cid,HttpServletRequest request){
        System.out.println("editScore");
        Score score = scoreService.getScore(sid,cid);
        request.setAttribute("score",score);
        return "updateScore";
    }

    @RequestMapping("/updateScore")
    public String updateScore(Score score,int osid,int ocid,HttpServletRequest request){
        System.out.println(score);
        scoreService.updateScore(score,osid,ocid);
        return "forward:/score/getAllScore";
    }
    @RequestMapping("/check")
    @ResponseBody
    public boolean check(Integer sid,Integer cid,HttpServletRequest request){

        System.out.println("check1");
        Score user =  scoreService.check(sid,cid);
        if (user!=null){
            System.out.println("666");
            return true;
        }
        else {
            System.out.println("gg");
            return false;
        }
    }

    @RequestMapping(value = "/checkSid", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String checkSid(Integer sid){
        System.out.println("check");
        String user =  studentService.getStudentById(sid).getName();
        System.out.println(user);
        return user;
    }

    @RequestMapping(value = "/checkCid",produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String checkCid(Integer cid){
        System.out.println("check");
        String user =  courseService.getCourseById(cid).getName();
        System.out.println(user);
        return user;
    }
}
