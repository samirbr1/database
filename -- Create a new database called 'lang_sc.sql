-- Create a new database called 'lang_scholl'
CREATE DATABASE lang_scholl

--classes tables
CREATE TABLE class
(
    id integer PRIMARY KEY,
    namee VARCHAR(100),
    start_datee date,
    end_date date,
    price money,
    teacher_id integer,
    course_id integer
);

CREATE TABLE class_weekday
(
    class_id integer,
    weekday_id integer,
    hourss varchar(50)
);

CREATE TABLE weekdayy --pesquisar weekday na documentacao
(
    id integer PRIMARY KEY,
    namee varchar(100)
);

CREATE TABLE class_student
(
    id integer PRIMARY KEY,
    class_id integer,
    student_id integer
);

--teachers tables

CREATE TABLE teacher
(
    id integer PRIMARY KEY,
    descriptionn varchar(300),
    photo image,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone varchar(15)
);

CREATE TABLE teacher_account
(
    id integer PRIMARY KEY,
    teacher_id integer,
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100)
);

--students tables

CREATE TABLE student
(
    id integer PRIMARY KEY,
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
    student_id integer,
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100)
);

--courses tables

CREATE TABLE course
(
    id integer PRIMARY KEY,
    lessons integer,
    descriptionn varchar(300),
    term varchar(100),
    language_id integer,
    level_id integer,
    category_id integer
);

CREATE TABLE levell
(
    id integer PRIMARY KEY,
    sign char(2),
    namee varchar(100)   --pesquisar name -- aqui é o nivel de proficiencia
);

CREATE TABLE languagee
(
    id integer PRIMARY KEY,
    namee varchar(100)
);

CREATE TABLE category
(
    id integer PRIMARY KEY,
    namee varchar(20) --criança, adolescente, adulto, etc
);
--payment tables
CREATE TABLE payment
(
    id  integer PRIMARY KEY,
    payment_date datetime,
    amount  money,
    payment_method_id integer,
    statuss VARCHAR(50),
    student_id integer,
    class_id integer
);

CREATE TABLE payment_method_id
(
    id integer PRIMARY KEY,
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
    id integer PRIMARY KEY,
    is_active bit,
    loginn varchar(100),
    passwordd varchar(100),
    staff_id integer REFERENCES staff(staff_id)
);