SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS unisystem;
CREATE SCHEMA unisystem;
USE unisystem;

--
-- Table structure for table `student`
--

CREATE TABLE student (
  student_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dateofbirth DATE NOT NULL,
  gender ENUM('M', 'F') NOT NULL, 
  enrollmentdate DATE NOT NULL,
  PRIMARY KEY  (student_id),
  KEY idx_student_last_name (last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `teacher`
--

CREATE TABLE teacher (
  teacher_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dateofbirth DATE NOT NULL,
  gender ENUM('M', 'F') NOT NULL, 
  hiredate DATE NOT NULL,
  PRIMARY KEY  (teacher_id),
  KEY idx_teacher_last_name (last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `department`
--

CREATE TABLE department (
  department_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `courses`
--

CREATE TABLE courses (
  course_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  course_name VARCHAR(100) NOT NULL,
  teacher_id SMALLINT UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (course_id),
  KEY idx_teacher_id (teacher_id),
  KEY idx_department_id (department_id),
  CONSTRAINT fk_courses_teacher FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_courses_department FOREIGN KEY (department_id) REFERENCES department (department_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `course_teacher`
--

CREATE TABLE course_teacher (
  teacher_id SMALLINT UNSIGNED NOT NULL,
  course_id SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (course_id, teacher_id),
  KEY idx_fk_course_id (course_id),
  CONSTRAINT fk_course_teacher_teacher FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_course_teacher_course FOREIGN KEY (course_id) REFERENCES courses (course_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE canteen (
  item_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(255) NOT NULL,
  price DECIMAL(5,2) NOT NULL,
  category VARCHAR(50),
  PRIMARY KEY (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE library (
  item_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(255) NOT NULL,
  author VARCHAR(100) NOT NULL,
  date_of_publication DATE NOT NULL,
  price DECIMAL(5,2) NOT NULL,
  category VARCHAR(50),
  PRIMARY KEY (item_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE glasshouse (
event_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
event_name VARCHAR(255) NOT NULL,
price DECIMAL(5,2) NOT NULL,
category VARCHAR(50),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
PRIMARY KEY (event_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE accommodation (
room_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
room_name VARCHAR(255) NOT NULL,
flat_number INT (1) NOT NULL,
building VARCHAR(255) NOT NULL,
price DECIMAL(5,2) NOT NULL,
PRIMARY KEY (room_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;