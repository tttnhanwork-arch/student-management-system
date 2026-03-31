package com.example.student_mn.entity;

import jakarta.persistence.*;

@Entity
public class Authority {
    @Id
    private String name;

    public Authority(String name) {
        this.name = name;

    }

    public Authority() {
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Authority{" +
                "name='" + name + '\'' +
                '}';
    }
}
