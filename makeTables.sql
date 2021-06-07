CREATE TABLE PROFESSOR
(
	_Ssn numeric(9) not null,
	    _name varchar(20) not null,
	        _StreetAddr varchar(30) not null,
	            _City varchar(20) not null,
	                _State char(2) not null,
	                    _Zip numeric(5) not null,
	                        _Area_code numeric(3) not null,
	                    _Seven_digits numeric(7) not null,
	                _Sex enum('M', 'F', 'Prefer Not To Say') not null,
	            _Title enum('Dr.', 'Mr.', 'Ms.', 'Mrs.') not null,
	        _Salary numeric(9) not null,
        _College_name varchar(20) not null,
	primary key(_Ssn)
);

CREATE TABLE COLLEGE_DEGREES
(
	_Owner_SSN numeric(9) not null,
	    _Degree_name varchar(25) not null,
	    primary key(_Owner_SSN, _Degree_name),
	foreign key(_Owner_SSN) references PROFESSOR(_Ssn)
);

CREATE TABLE DEPARTMENT
(
	_Dno numeric(5) not null,
	    _name varchar(25) not null,
	        _Telephone numeric(10) not null,
	            _Office_Location varchar(10) not null,
	        _Department_chair_no numeric(9) not null,
	    primary key(_DNo),
	foreign key(_Department_chair_no) references PROFESSOR(_Ssn)
);

CREATE TABLE COURSE
(
	_Course_department_no numeric(5) not null,
	    _Course_no varchar(10) not null,
            _Prerequisite_course_no varchar(10) null,
	            _Title varchar(50) not null,
	                _Textbook varchar(50) not null,
	            _Units tinyint not null,
	        primary key(_Course_no),
	    foreign key(_Course_department_no) references DEPARTMENT(_Dno),
    foreign key(_Prerequisite_course_no) references COURSE(_Course_no)
);

CREATE TABLE SECTION
(
	_Sno numeric(5) not null,
	    _Cno varchar(10) not null,
	        _Instructor_ssn numeric(9) not null,
	            _Classroom varchar(10) not null,
	                _Meeting_Days char(7) not null,
	                    _Start_time varchar(10) not null,
	                _End_time varchar(10) not null,
	            _No_of_seats numeric(3) not null,
	        primary key(_Sno, _Cno),
	    foreign key(_Cno) references COURSE(_Course_no),
	foreign key(_Instructor_ssn) references PROFESSOR(_Ssn)
);

CREATE TABLE STUDENT
(
	_CWID numeric(10) not null,
	    _First_name varchar(20) not null,
	        _Last_name varchar(20) not null,
	            _Address varchar(60) not null,
	            _Telephone_No numeric(10) not null,
	        _Major_department_no numeric(5) not null,
	    primary key(_CWID),
	foreign key(_Major_department_no) references DEPARTMENT(_Dno)
);

CREATE TABLE MINOR
(
	_Student_id numeric(10) not null,
	    _Department_id numeric(5) not null,
	        primary key(_Student_id, _Department_id),
	    foreign key(_Student_id) references STUDENT(_CWID),
	foreign key(_Department_id) references DEPARTMENT(_Dno)
);

CREATE TABLE ENROLLMENT
(
	_Student_no numeric(10) not null,
	    _Section_no numeric(5) not null,
	        _Grade enum('A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F') not null,
	        primary key(_Student_no, _Section_no),
	    foreign key(_Section_no) references SECTION(_Sno),
	foreign key(_Student_no) references STUDENT(_CWID)
);

-- PROFESSOR
-- 4 PROFESSORS

INSERT INTO PROFESSOR VALUES (762039736, "Elon Musk", 
                                "800 N State College Blvd", "Fullerton", 
                                    "CA", 92831, 714, 9875432, 'M', "Dr.", 999231098, 'Stanford University');

INSERT INTO PROFESSOR VALUES (146928993, "Jeffrey Bezos", 
                                "800 N State College Blvd", "Fullerton", 
                                    "CA", 92831, 714, 5557787, 'M', "Mr.", 856123000, "Princeton University");

INSERT INTO PROFESSOR VALUES (013861162, "Mark Zuckerburg", 
                                "800 N State College Blvd", "Fullerton", 
                                    "CA", 92831, 714, 5557876, 'M', "Dr.", 987366456, "Harvard University");

INSERT INTO PROFESSOR VALUES (987655432, "Lisa Su", 
                                "800 N State College Blvd", "Fullerton", 
                                    "CA", 92831, 714, 5557876, 'F', "Dr.", 989366059, "MIT");

-- COLLEGE DEGREES
-- 9 COLLEGE DEGREES

INSERT INTO COLLEGE_DEGREES VALUES (987655432, "Ph.D Computer Science");

INSERT INTO COLLEGE_DEGREES VALUES (987655432, "M.S Computer Science");

INSERT INTO COLLEGE_DEGREES VALUES (987655432, "B.S Computer Science");

    INSERT INTO COLLEGE_DEGREES VALUES (146928993, "M.S Computer Engineering");

    INSERT INTO COLLEGE_DEGREES VALUES (146928993, "B.S Mathematics");

INSERT INTO COLLEGE_DEGREES VALUES (013861162, "Ph.D Computer Science");

INSERT INTO COLLEGE_DEGREES VALUES (013861162, "M.S Computer Science");

INSERT INTO COLLEGE_DEGREES VALUES (013861162, "B.S Computer Science");

    INSERT INTO COLLEGE_DEGREES VALUES (762039736, "B.S Computer Science");

-- DEPARTMENT
-- 2 DEPARTMENT

INSERT INTO DEPARTMENT VALUES (10000, "Computer Science", 7145558765, "CPSC-300", 987655432);

INSERT INTO DEPARTMENT VALUES (10001, "Computer Engineering", 7145552345, "EGCP-200", 146928993);

-- COURSE
-- 4 COURSE

INSERT INTO COURSE (_Course_department_no, _Course_no, _Title, _Textbook, _Units) 
                            VALUES (10000, "CPSC-131", 
                                "Data Structures Concepts", "Introduction to Data Structures, Tenth Edition", 3);

INSERT INTO COURSE (_Course_department_no, _Course_no, _Prerequisite_course_no, _Title, _Textbook, _Units)
                            VALUES (10000, "CPSC-332", "CPSC-131",
                                "Databases Systems and File Structures", "Database in SQL", 3);

INSERT INTO COURSE (_Course_department_no, _Course_no, _Title, _Textbook, _Units)
                            VALUES (10001, "EGCP-180", 
                                "Digital Logic", "Digital Logic and Arithmetic", 3);

INSERT INTO COURSE (_Course_department_no, _Course_no, _Prerequisite_course_no, _Title, _Textbook, _Units)
                            VALUES (10001, "EGCP-280", "EGCP-180",
                                "Microcontrollers", "Microcontrollers: A Real Guide", 3);

-- SECTION
-- 8 SECTION

INSERT INTO SECTION VALUES (74937, "CPSC-131", 762039736, "CS-355", "TTH", "10:30am", "11:45pm", 10);

INSERT INTO SECTION VALUES (23802, "CPSC-131", 762039736, "CS-355", "TTH", "1:30pm", "2:45pm", 9);

INSERT INTO SECTION VALUES (85390, "CPSC-332", 987655432, "CS-555", "MW", "10:30am", "11:45pm", 35);

INSERT INTO SECTION VALUES (65487, "CPSC-332", 013861162, "CS-455", "TH", "10:30am", "11:45pm", 3);

INSERT INTO SECTION VALUES (71157, "CPSC-332", 013861162, "CS-235", "T", "10:30am", "11:45pm", 7);

    INSERT INTO SECTION VALUES (15853, "EGCP-180", 146928993, "CS-205", "TH", "10:30am", "11:45pm", 4);

    INSERT INTO SECTION VALUES (96241, "EGCP-180", 146928993, "CS-110", "TTH", "10:30am", "11:45pm", 30);

    INSERT INTO SECTION VALUES (98723, "EGCP-280", 987655432, "CS-105", "TTH", "10:30am", "11:45pm", 20);

-- STUDENT
-- 10 STUDENT

INSERT INTO STUDENT VALUES (1837492844, "Jyo", "Jain", "132 Nutwood Ave. Fullerton, CA 92831", 7145558315, 10000);

INSERT INTO STUDENT VALUES (9872589514, "Albert", "Dang", "450 Nutwood Ave. Fullerton, CA 92831", 7145552354, 10000);

INSERT INTO STUDENT VALUES (1598523575, "Minh", "Le", "132 Nutwood Ave. Fullerton, CA 92831", 7145558521, 10000);

INSERT INTO STUDENT VALUES (1478963250, "Shawn", "Wang", "450 Nutwood Ave. Fullerton, CA 92831", 7145555896, 10000);

INSERT INTO STUDENT VALUES (5812301578, "Travis", "Scott", "450 Nutwood Ave. Fullerton, CA 92831", 7145551793, 10000);

INSERT INTO STUDENT VALUES (5872365470, "Naruto", "Uzumaki", "123 Fullerton Blvd Fullerton, CA 92831", 7145558595, 10000);

INSERT INTO STUDENT VALUES (3579514879, "Frank", "Underwood", "123 Fullerton Blvd Fullerton, CA 92831", 7145554879, 10001);

INSERT INTO STUDENT VALUES (7890286981, "James", "Bond", "350 Fullerton Blvd Fullerton, CA 92831", 7145556981, 10001);

INSERT INTO STUDENT VALUES (2486309715, "Kendrick", "Lamar", "850 Fullerton Blvd Fullerton, CA 92831", 7145553597, 10001);

INSERT INTO STUDENT VALUES (7093214568, "Dick", "Cheney", "456 Fullerton Blvd Fullerton, CA 92831", 7145554587, 10001);

-- MINOR
-- 10 MINOR
INSERT INTO MINOR (_Student_id, _Department_id) VALUES (3579514879, 10000);

INSERT INTO MINOR VALUES (7890286981, 10000);

INSERT INTO MINOR VALUES (2486309715, 10000);

INSERT INTO MINOR VALUES (7093214568, 10000);

    INSERT INTO MINOR VALUES (1837492844, 10001);

    INSERT INTO MINOR VALUES (9872589514, 10001);

    INSERT INTO MINOR VALUES (1598523575, 10001);

    INSERT INTO MINOR VALUES (1478963250, 10001);

    INSERT INTO MINOR VALUES (5812301578, 10001);

    INSERT INTO MINOR VALUES (5872365470, 10001);

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1837492844, 74937, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1837492844, 15853, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1837492844, 96241, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (9872589514, 23802, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (9872589514, 15853, 'C+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (9872589514, 96241,'B');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1598523575, 71157, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1598523575, 15853, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1598523575, 98723, 'B-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1478963250, 65487, 'A-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1478963250, 15853, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (1478963250, 96241, 'C-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5812301578, 23802, 'C-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5812301578, 15853, 'B-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5812301578, 98723, 'A-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5872365470, 74937, 'B-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5872365470, 15853, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (5872365470, 98723, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (3579514879, 85390, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (3579514879, 15853, 'A-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (3579514879, 96241, 'C+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7890286981, 71157, 'B-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7890286981, 15853, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7890286981, 98723, 'A-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (2486309715, 23802, 'B-');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (2486309715, 15853, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (2486309715, 96241, 'A');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7093214568, 71157, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7093214568, 15853, 'B+');

INSERT INTO ENROLLMENT(_Student_no, _Section_no, _Grade)
VALUES (7093214568, 98723, 'B-');