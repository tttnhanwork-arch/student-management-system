package com.example.student_mn.dao;

import com.example.student_mn.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityRepository extends JpaRepository<Role,String> {
    public Role findByName(String name);
}
