-- tables
-- Table: evaluation
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';
flush privileges;

CREATE DATABASE db_kodomocare;
USE db_kodomocare;

CREATE TABLE evaluation (
    id varchar(50) NOT NULL,
    type varchar(50) NOT NULL,
    score int NOT NULL,
    answers json NOT NULL,
    created_date date NOT NULL,
    questionnaire_id varchar(50) NOT NULL,
    CONSTRAINT evaluation_pk PRIMARY KEY (id)
);

-- Table: kid
CREATE TABLE kid (
    id varchar(50) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    identification_number varchar(10) NOT NULL,
    birthdate date NOT NULL,
    gender varchar(20) NOT NULL,
    relationship varchar(50) NOT NULL,
    avatar_image varchar(100) NOT NULL,
    user_id varchar(50) NOT NULL,
    CONSTRAINT kid_pk PRIMARY KEY (id)
);

-- Table: questionnaire
CREATE TABLE questionnaire (
    id varchar(50) NOT NULL,
    kid_id varchar(50) NOT NULL,
    CONSTRAINT questionnaire_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    permission_level int NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE user (
    id varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    password varchar(200) NOT NULL,
    email varchar(50) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    identification_number varchar(10) NOT NULL,
    avatar_image varchar(100) NOT NULL,
    status int NOT NULL,
    role_id varchar(50) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);
alter table questionnaire add status int NOT NULL;
alter table questionnaire add updated_date date NOT NULL;
alter table user add created_date date NOT NULL;
alter table evaluation add rating int;

insert into user values(uuid(), 'kodomo-admin@gmail.com', '$2b$10$uw1yFP188znD3oYGEwb0kupHqhGQGeG09BlCD5wJZOclQx9C3ViXm', 'kodomo-admin@gmail.com', 'Admin', 'KodomoCare', '00000000', 'avatar_profile_1.png', 0, 2, '2022-04-30');
