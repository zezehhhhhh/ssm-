package com.baidu.controller;

import com.baidu.pojo.Student;
import com.baidu.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private StudentService studentService;
    @RequestMapping("/login")
    public String login(Student user, HttpServletRequest request, HttpSession session){
        System.out.println("Login");
        System.out.println(user);
        Student user2 = studentService.login(user);
        if (user2!=null){
            System.out.println(user2);
            session.setAttribute("user2",user2);
            return "main";
        }else {
            request.setAttribute("msg","登录失败");
            System.out.println("登录失败");
            return "forward:/login.jsp";
        }
    }

    @RequestMapping(value = "/loginWechat", produces = "text/html; charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public String login(Student user){
        System.out.println("Login");
        System.out.println(user);
        Student user2 = studentService.login(user);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            if (user2!=null){
                String s = objectMapper.writeValueAsString(user2);  //返回一个json字符串
                System.out.println(user2);
                System.out.println(s);
                return s;
            }else {
                user2=new Student(1, "1", "1", "1", "1", "1", 6);
                System.out.println(user2);
                String s = objectMapper.writeValueAsString(user2);  //返回一个json字符串
                System.out.println("登录失败");
                return s;
            }
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        System.out.println("logout");
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @RequestMapping("/getAllStudent")
    public String getAllStudent(HttpServletRequest request,HttpSession session){
        System.out.println("getAllStudent");
//        List<User> list = userService.getAllUser();
//        request.setAttribute("myList",list);
        Student user = (Student)session.getAttribute("user2");
        List<Student> list = new ArrayList<Student>();
        if(user.getType()==0) {
            list=studentService.getAllStudent();
            request.setAttribute("myList",list);
        }
        else if(user.getType()==1){
            list=studentService.getAllStudentByType(1);
            list.addAll(studentService.getAllStudentByType(2));
            request.setAttribute("myList",list);
        }
        else {
            list=studentService.getAllStudentByType(2);
            request.setAttribute("myList",list);
        }
        return "userList";
    }
    @RequestMapping("/getAllStudentWechat")
    @ResponseBody
    public List<Student> getAllStudentWechat(HttpServletRequest request,HttpSession session){
        System.out.println("getAllStudent");
//        List<User> list = userService.getAllUser();
//        request.setAttribute("myList",list);
        List<Student> list = new ArrayList<Student>();
            list=studentService.getAllStudent();
        return list;
    }
    @RequestMapping("/addStudent")
    public String addStudent(Student student){
        System.out.println("addStudent");
        System.out.println(student);
        studentService.addStudent(student);
        return "forward:/user/getAllStudent";
    }

    @RequestMapping(value = "/addStudentWechat", method = RequestMethod.POST)
    @ResponseBody
    public boolean addStudentWechat(Student student){
        System.out.println("addStudent");
        System.out.println(student);
        studentService.addStudent(student);
        return true;
    }

    @RequestMapping("/getStudentById")
    public Student getStudentById(Integer id){
        Student student=studentService.getStudentById(id);
        return student;
    }

    @RequestMapping("/delStudent")
    public String delStudent(int id){
        System.out.println("delStudent");
        studentService.delStudent(id);
        return "forward:/user/getAllStudent";
    }
    @RequestMapping("/delStudentWechat")
    @ResponseBody
    public boolean delStudentWechat(int id){
        System.out.println("delStudent");
        studentService.delStudent(id);
        return true;
    }

    @RequestMapping("/toEditStudent")
    public String toEditStudent(int id,HttpServletRequest request){
        System.out.println("editStudent");
        Student student = studentService.getStudentById(id);
        request.setAttribute("student",student);
        return "updateUser";
    }

    @RequestMapping("/updateStudent")
    public String updateStudent(Student student,int oid,HttpServletRequest request){
        studentService.updateStudent(student,oid);
        return "forward:/user/getAllStudent";
    }

    @RequestMapping("/updateStudentWechat")
    public boolean updateStudentWechat(Student student, HttpServletRequest request){
        studentService.updateStudentWechat(student);
        return true;
    }


    @RequestMapping("/checkName")
    @ResponseBody
    public boolean checkName(String name,HttpServletRequest request){
        Student user =  studentService.getStudentByName(name);
        if (user!=null){
            return true;}
        else {return false;}
    }

    @RequestMapping("/checkId")
    @ResponseBody
    public boolean checkId(Integer id,HttpServletRequest request){
        Student user =  studentService.getStudentById(id);
        if (user!=null){
            return true;}
        else {return false;}
    }
}
