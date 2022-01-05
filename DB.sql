-- Create a new database called 'lang_school'
CREATE DATABASE lang_school

--classes tables
CREATE TABLE class
(
    classes_id integer PRIMARY KEY,
    namee VARCHAR(100),
    start_datee date, 
    end_date date,
    price money,
    teacher_id integer REFERENCES teacher(teacher_id),
    course_id integer REFERENCES course(course_id)
);

CREATE TABLE class_weekday
(
    class_id integer REFERENCES class(classes_id),
    weekday_id integer REFERENCES weekdayy(weekdayy_id),
    hourss varchar(50)
    PRIMARY KEY (class_id, weekday_id)
);

CREATE TABLE weekdayy --pesquisar weekday na documentacao
(
    weekdayy_id integer PRIMARY KEY,
    namee varchar(100)
); 

CREATE TABLE class_student
(
    class_student_id integer PRIMARY KEY,
    class_id integer REFERENCES class(classes_id),
    student_id integer REFERENCES student(student_id),
);

--teachers tables

CREATE TABLE teacher
(
    teacher_id integer PRIMARY KEY,
    descriptionn varchar(300),
    photo image,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone varchar(15)
);

CREATE TABLE teacher_account
(
    teacher_account_id integer PRIMARY KEY,
    teacher_id integer REFERENCES teacher(teacher_id),
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100)
);

--students tables

CREATE TABLE student
(
    student_id integer PRIMARY KEY,
    date_birth date,
    statee varchar(150),
    city varchar(100),
    zip_code char(10),
    street varchar(100),
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone varchar(15)
);

CREATE TABLE student_account
(
    id integer PRIMARY KEY,
    student_id integer REFERENCES student(student_id),
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100)
);

--courses tables

CREATE TABLE course
(
    course_id integer PRIMARY KEY,
    lessons integer,
    descriptionn varchar(300),
    term varchar(100),
    language_id integer REFERENCES languagee(language_id),
    level_id integer REFERENCES levell(level_id),
    category_id integer REFERENCES category(category_id)
);

CREATE TABLE levell
(
    level_id integer PRIMARY KEY,
    sign char(2),
    namee varchar(100)   --pesquisar name -- aqui é o nivel de proficiencia
);

CREATE TABLE languagee
(
    language_id integer PRIMARY KEY,
    namee varchar(100)
);

CREATE TABLE category
(
    category_id integer PRIMARY KEY,
    namee varchar(20) --criança, adolescente, adulto, etc
);

--payment tables
CREATE TABLE payment
(
    id  integer PRIMARY KEY,
    payment_date datetime,
    amount  money,
    payment_method_id integer REFERENCES payment_method_id(pay_method_id),
    statuss VARCHAR(50),
    student_id integer REFERENCES student(student_id),
    class_id integer REFERENCES class(classes_id)
);

CREATE TABLE payment_method_id
(
    pay_method_id integer PRIMARY KEY,
    namee varchar(100)
);

--staff tables 

CREATE TABLE staff
(
    staff_id integer PRIMARY KEY,
    position varchar(120),
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone varchar(15)
);

CREATE TABLE staff_account
(
    staff_account_id integer PRIMARY KEY,
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100),
    staff_id integer REFERENCES staff(staff_id)
);