package com.baidu.service;

import com.baidu.pojo.Student;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StudentService {
    public Student login(Student student);
    List<Student> getAllStudent();
    int addStudent(Student student);

    Student getStudentById(int id);
    int updateStudent(Student student, int oid);
    int delStudent(int id);

    Student getStudentByName(String name);
    List<Student> getAllStudentByType(int type);

    void updateStudentWechat(Student student);
}
