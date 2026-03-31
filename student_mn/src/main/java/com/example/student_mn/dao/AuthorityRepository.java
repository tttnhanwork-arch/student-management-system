package com.example.student_mn.dao;

import com.example.student_mn.entity.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;
@Repository
public interface AuthorityRepository extends JpaRepository<Authority,String> {
    public Authority findByName(String name);
}
