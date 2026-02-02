USE unisystem;

-- Insert data into student table
INSERT INTO student (first_name, last_name, dateofbirth, gender, enrollmentdate) VALUES
('John', 'Doe', '2000-01-01', 'M', '2018-09-01'),
('Jane', 'Smith', '2001-02-02', 'F', '2019-09-01'),
('Michael', 'Johnson', '2002-03-03', 'M', '2020-09-01'),
('Emily', 'Davis', '2000-04-04', 'F', '2018-09-01'),
('Chris', 'Miller', '2001-05-05', 'M', '2019-09-01'),
('Anna', 'Wilson', '2002-06-06', 'F', '2020-09-01'),
('David', 'Moore', '2000-07-07', 'M', '2018-09-01'),
('Jessica', 'Taylor', '2001-08-08', 'F', '2019-09-01'),
('James', 'Anderson', '2002-09-09', 'M', '2020-09-01'),
('Laura', 'Thomas', '2000-10-10', 'F', '2018-09-01');

-- Insert data into teacher table
INSERT INTO teacher (first_name, last_name, dateofbirth, gender, hiredate) VALUES
('Robert', 'Brown', '1980-01-01', 'M', '2005-08-15'),
('Mary', 'Jones', '1981-02-02', 'F', '2006-08-15'),
('William', 'Garcia', '1982-03-03', 'M', '2007-08-15'),
('Patricia', 'Martinez', '1980-04-04', 'F', '2005-08-15'),
('Charles', 'Rodriguez', '1981-05-05', 'M', '2006-08-15'),
('Linda', 'Hernandez', '1982-06-06', 'F', '2007-08-15'),
('Thomas', 'Lopez', '1980-07-07', 'M', '2005-08-15'),
('Barbara', 'Gonzalez', '1981-08-08', 'F', '2006-08-15'),
('Joseph', 'Wilson', '1982-09-09', 'M', '2007-08-15'),
('Susan', 'Anderson', '1980-10-10', 'F', '2005-08-15');

-- Insert data into department table
INSERT INTO department (department_name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('English'),
('History'),
('Geography'),
('Philosophy'),
('Economics');

-- Insert data into courses table
INSERT INTO courses (course_name, teacher_id, department_id) VALUES
('Introduction to Programming', 1, 1),
('Calculus I', 2, 2),
('General Physics', 3, 3),
('Organic Chemistry', 4, 4),
('Biology 101', 5, 5),
('English Literature', 6, 6),
('World History', 7, 7),
('Geography Basics', 8, 8),
('Philosophical Thoughts', 9, 9),
('Microeconomics', 10, 10);

-- Insert data into course_teacher table
INSERT INTO course_teacher (teacher_id, course_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO canteen (item_name, price, category) VALUES
('Sandwich', 2.50, 'Food'),
('Salad', 3.00, 'Food'),
('Soda', 1.25, 'Drink'),
('Juice', 1.50, 'Drink'),
('Coffee', 1.75, 'Drink'),
('Tea', 1.50, 'Drink'),
('Burger', 3.50, 'Food'),
('Fries', 2.00, 'Food'),
('Pizza', 2.75, 'Food'),
('Pasta', 3.75, 'Food');

INSERT INTO library (item_name, author, date_of_publication, price, category) VALUES
('database systems','Thomas Connolly','2019-02-28','0.00','Book'),
('View from inside: Full Moon over the Stonewall','Howard Smith','1969-06-03','0.00','Newspaper article'),
('fintech explained: how technology is transforming financial services','Michael R. King','2023-09-02','30.00','Book'),
('The Coming Wave: The instant Sunday Times bestseller from the ultimate AI insider', 'Mustafa Suleyman', '2024-09-03', '9.00', 'book'),
('Cybersecurity for beginners','Kevin Clark','2022-10-13','0.00','Audio'),
('The Complete Developer: Master the Full Stack with Typescript, React, Next.Js, Mongodb, and Docker','Martin Krause','2024-03-19','31.00','Book'),
('Film directing shot by shot','Steve Katz','1991-07-31','5.60','Book'),
('Designing Creatures and Characters: How to Build an Artists Portfolio for Video Games, Film, Animation and More','Marc Taro Holmes','2016-09-28','22.01','Book'),
('The Artists Way: A Spiritual Path to Higher Creativity','Julia Cameron','2020-10-05','15.00','Book'),
('The Indie Game Developer Handbook','Richard Hill-Whithall','2015-03-27','44.99','Book');

INSERT INTO glasshouse (event_name, price, category, start_date, end_date) Values
('Metal night', '4.00', 'Metal', '2025-01-31','2025-02-01'),
('Boombox(80s Night)', '5.00', '80s', '2025-01-24', '2025-01-25'),
('UCA locked in', '3.00', 'Garage', '2025-01-25', '2025-01-26'),
('Radiance', '3.00', 'K-Pop', '2025-02-01', '2025-02-02'),
('Charity boxing', '4.00', 'Sports', '2025-02-22', '2025-02-22'),
('Fantasy Ball', '80.00', 'Fantasy', '2025-04-05', '2025-04-06'),
('Taylor swift party', '3.00', 'Pop', '2025-03-01', '2025-03-02'),
('Punk rock', '4.00', 'Rock', '2025-02-22', '2025-02-23'),
('Octoberfest', '3.00', 'Culture', '2025-08-01', '2025-08-02'),
('Y2K', '4.00', '2000s', '2025-02-23', '2025-02-24');

INSERT INTO accommodation (room_name, flat_number, building, price) Values
('H','3','Watts House','198.00'),
('E','2','Watts House','198.00'),
('F','1','Swift House','198.00'),
('A','32','Friars field','180.00'),
('D','6','Godfrey House','198.00'),
('C','4','Godfrey House','198.00'),
('B','8','Swift House','198.00'),
('E','3','Watts House','198.00'),
('H','3','Swift House','198.00'),
('A','1','Godfrey House','198.00');