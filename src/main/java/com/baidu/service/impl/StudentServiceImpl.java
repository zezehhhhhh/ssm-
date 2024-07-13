package com.baidu.service.impl;

import com.baidu.dao.StudentMapper;
import com.baidu.pojo.Student;
import com.baidu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public Student login(Student student) {
        return studentMapper.login(student);
    }

    @Override
    public List<Student> getAllStudent() {
        return studentMapper.getAllStudent();
    }

    @Override
    public int addStudent(Student student) {
        return studentMapper.addStudent(student);

    }

    @Override
    public int delStudent(int id) {
        return studentMapper.delStudent(id);
    }

    @Override
    public Student getStudentById(int id) {
        return studentMapper.getStudentById(id);
    }

    @Override
    public int updateStudent(Student student, int oid) {
        return studentMapper.updateStudent(student,oid);
    }

    @Override
    public Student getStudentByName(String name) {
        return studentMapper.getStudentByName(name);
    }

    @Override
    public List<Student> getAllStudentByType(int type) {
        return studentMapper.getAllStudentByType(type);
    }

    @Override
    public void updateStudentWechat(Student student) {
        studentMapper.updateStudentWechat(student);

    }
}
