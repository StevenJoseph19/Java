DROP DATABASE IF EXISTS mydb
GO

CREATE DATABASE mydb
GO

USE mydb
GO
 
CREATE TABLE dbo.users (
	id   int PRIMARY KEY IDENTITY NOT NULL,
    name VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL
);

insert into users(name,password)  values ('Yo','Yo');

CREATE TABLE dbo.Course (
    CourseId INT PRIMARY KEY IDENTITY NOT NULL,
    CourseTitle VARCHAR(45) NOT NULL,
    Trainer VARCHAR(45) NOT NULL,
	ImageUrl VARCHAR(45) ,   
    Fees INT,
	CourseDescription VARCHAR(450) 
);

insert into Course(CourseTitle,Trainer,ImageUrl,Fees,CourseDescription)  values ('Android','Sekhar','./images/android.png', 3500, 'Android is a mobile operating system development environment');
insert into Course(CourseTitle,Trainer,ImageUrl,Fees,CourseDescription)  values ('JSP','Steve','./images/jsp.png', 9999, 'JavaServer Pages is a technology that helps software developers to create platform independent dynamic web applications rapidly based on HTML or XML document types. ');













