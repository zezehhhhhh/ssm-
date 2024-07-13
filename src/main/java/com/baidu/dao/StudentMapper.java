package com.baidu.dao;

import com.baidu.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    public Student login(Student student);
    List<Student> getAllStudent();
    int addStudent(Student student);

    Student getStudentById(int id);
    int updateStudent(@Param("student") Student student, @Param("oid") int oid);
    int delStudent(int id);

    Student getStudentByName(String name);
    List<Student> getAllStudentByType(int type);

    void updateStudentWechat(Student student);
}
