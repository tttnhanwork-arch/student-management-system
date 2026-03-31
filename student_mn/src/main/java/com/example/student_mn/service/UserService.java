package com.example.student_mn.service;

import com.example.student_mn.entity.User;

import java.util.List;

public interface UserService {
    public User findByUsername(String username);
    public void saveUser(User user);

}
