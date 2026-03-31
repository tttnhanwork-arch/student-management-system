# Student Management System

A web-based student management system built with Spring MVC.  
The application supports authentication and role-based authorization using Spring Security.

## 📁 Project Structure

- entity/ - JPA entities mapping to database tables
- dao/ - Data access layer (repositories)
- service/ - Business logic layer
- controller/ - Handle HTTP requests
- security/ - Spring Security configuration
- handle/ - Handle error respone
- webEntity/ - DTOs for frontend communication
- 
## Features
- Authentication & Authorizatuon
  + User Authentication (Login/Register)
  + Password encryption using BCrypt
  + Role-based authorization (USER, ADMIN, PARENT, TEACHER, STUDENT, NURSE)
- Data management
  + CRUD operations for multiple entities
  + Repository pattern (extends JpaRepository)
- Responsive UI using Bootstrap & Thymeleaf
- Role Permissions
  + ADMIN: Full access (CRUD all entities)
  + TEACHER: Manage student data
  + Other roles: View-only access
## Tech Stack
- Java
- Spring Boot
- Spring MVC
- Spring Data JPA
- Spring Security
- MySQL
- Bootstrap
- Thymeleaf

## Security

- BCrypt password encoding
- JDBC UserDetailsManager
- Custom SecurityFilterChain
- Role-based authorization for different endpoints

## Database Setup

1. Create database:
CREATE DATABASE student_management;

2. Import file:
database/student_management.sql

## Run Project

Git clone https://github.com/tttnhanwork-arch/student-management-system.git
Access at : http://localhost:8080
## Screenshots
1. Guest page
<img width="1724" height="372" alt="image" src="https://github.com/user-attachments/assets/0d46b0d4-4ccd-4946-bd70-5eb3d8792356" />
2. Register form
<img width="1724" height="929" alt="image" src="https://github.com/user-attachments/assets/bb0040fe-9d99-47ff-86ac-38781a2ffa5a" />
<img width="1699" height="697" alt="image" src="https://github.com/user-attachments/assets/f46b45e0-353e-45b3-89f1-3f0fad0de62e" />
3. Register success
<img width="1708" height="303" alt="image" src="https://github.com/user-attachments/assets/ff87d3fc-537b-4381-942d-92039de669ce" />
4. Login page
<img width="1685" height="863" alt="image" src="https://github.com/user-attachments/assets/9d998fb9-ac8f-43b7-ad3f-518f6f5ef5b2" />
<img width="1632" height="762" alt="image" src="https://github.com/user-attachments/assets/bc4c53df-a205-469c-bdf8-edc9cdcda3b9" />
5. Home page
<img width="1700" height="562" alt="image" src="https://github.com/user-attachments/assets/0ba050a3-d6c2-4471-9bc8-addfda45d01e" />
6. Authority
<img width="1717" height="386" alt="image" src="https://github.com/user-attachments/assets/23bbb213-f3e3-4452-a121-6b24f00bc321" />
[ROLE_ADMIN]
<img width="1895" height="474" alt="image" src="https://github.com/user-attachments/assets/36379733-3231-44fb-a589-07a9214c2594" />
[ROLE_STUDENT]
<img width="1919" height="481" alt="image" src="https://github.com/user-attachments/assets/f01f8efc-5eae-40bf-b2ed-fad38f167f9c" />

## Author
Trần Thị Thanh Nhàn
Github: https://github.com/tttnhanwork-arch
Email: tttnhan.work@gmail.com
