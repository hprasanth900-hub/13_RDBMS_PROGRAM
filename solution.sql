CREATE DATABASE College3NF;

USE College3NF;


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
  );

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);



CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL
);



CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);



INSERT INTO Department
(DepartmentID, DepartmentName)
VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics');



INSERT INTO Faculty
(FacultyID, FacultyName, DepartmentID)
VALUES
(501, 'Dr. Kumar', 101),
(502, 'Dr. Priya', 102),
(503, 'Dr. Ravi', 103);



INSERT INTO Course
(CourseID, CourseName, FacultyID)
VALUES
(201, 'Database Management System', 501),
(202, 'Python Programming', 501),
(203, 'Mathematics', 502),
(204, 'Physics', 503);



INSERT INTO Student
(StudentID, StudentName)
VALUES
(1001, 'Arun'),
(1002, 'Divya'),
(1003, 'Karthik'),
(1004, 'Nisha');



INSERT INTO Enrollment
(EnrollmentID, StudentID, CourseID)
VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201),
(5, 1003, 202),
(6, 1004, 204);




SELECT * FROM Department;

SELECT * FROM Faculty;

SELECT * FROM Course;

SELECT * FROM Student;

SELECT * FROM Enrollment;



SELECT
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Faculty
    ON Course.FacultyID = Faculty.FacultyID
INNER JOIN Department
    ON Faculty.DepartmentID = Department.DepartmentID;
