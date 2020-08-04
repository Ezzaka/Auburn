show databases;
use mysql;

/*

Table creation order (17 total tables)
Administrator
Admiting_Doctors
Doctors
Employee
Nurses
Patients
Rooms
Services
Technicians
Treatment
Treatment_Administered
Treatment_Ordered

*/

DROP TABLE Patients CASCADE;
DROP TABLE Employee CASCADE;
DROP TABLE Doctors CASCADE;
DROP TABLE Treatment CASCADE;
DROP TABLE Treatment_Ordered CASCADE;
DROP TABLE Treatment_Administered CASCADE;
DROP TABLE Admiting_Doctors CASCADE;
DROP TABLE Admitted_Patients CASCADE;
DROP TABLE Nurses CASCADE;
DROP TABLE Technicians CASCADE;


CREATE TABLE Patients( 
	pid char(3),
	pname varchar(20),
	insurance varchar(20), 
	contact varchar(20),
	patient_type char(3), 
	admitted date,
	discharged date,
	PRIMARY KEY (pid)
);

CREATE TABLE Employee (
	eid char(3),
	ename varchar(20), 
	etype varchar(20),
	PRIMARY KEY (eid)
);

CREATE TABLE Doctors(
	eid char(3),
    pid char(3),
   /* ename  char(20),
    pname varchar(20),*/
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);

CREATE TABLE Treatment(
	tid char(3),
	tdescription varchar(20),
	ttype char(1), 
	PRIMARY KEY (tid)
);

CREATE TABLE Treatment_Ordered(
	orderid char(3) UNIQUE,
	tid char(3),
	pid char(3),    
	eid char(3),
	orderdate date,
	PRIMARY KEY (tid, eid, pid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (eid) REFERENCES Doctors(eid),
	FOREIGN KEY (pid) REFERENCES Patients(pid)
);

CREATE TABLE Treatment_Administered(
	orderid char(3),
	tid char(3),
	pid char(3),
	eid char(3),
	ttype char(3),
	admindate date,
	PRIMARY KEY (tid, PID, eid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (eid) REFERENCES Employee(eid),
	FOREIGN KEY (pid) REFERENCES Patients(pid)
);

CREATE TABLE Admiting_Doctors(
	eid char(3),
	ename varchar(20), 
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Doctors(eid)
);

CREATE TABLE Admitted_Patients(
	pid char(3),
	eid char(3),
	admission date, 
	discharge date,
	PRIMARY KEY (pid, eid, admission),
	FOREIGN KEY (pid) REFERENCES Patients(pid),
	FOREIGN KEY (eid) REFERENCES Admiting_Doctors(eid)
);

CREATE TABLE Nurses(
	eid char(3),
	ename varchar(20), 
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Employee(eid)
);

CREATE TABLE Technicians(
	eid char(3),
	ename varchar(20), 
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES employee(eid)
);


/* INSERT statements */

INSERT INTO Patients VALUES
('h01', 'Emma', 'Horacemann', 'Nkechi', 'In', '2020/8/18', '2020/8/22'),
('h02', 'Mark', 'State Farm', 'Chinelo', 'In', '2020/7/31', NULL),
('h03', 'Oxide', 'Progressive', 'Amina', 'In', '2020/10/01', '2020/10/04'),
('h04', 'Spiritus', 'Liberty Mutual', 'James', 'In', '2020/8/01', NULL),
('h05', 'Fauzilante', 'Katapot', 'Uzochukwu',  'In', '2020/7/10', '2020/7/13'),
('h06', 'Frank', 'Geico',  'Ado', 'Out', NULL, NULL),
('h07', 'Wole', 'Banky', 'Funke', 'Out', NULL, NULL),
('h08', 'Baby', 'Wizzy', 'Burna', 'Out', NULL, NULL),
('h09', 'Oly', 'Don Jazzy', 'Olu', 'Out', NULL, NULL),
('h10', 'Paddy', 'Teckno', 'Tubaba', 'Out', NULL, NULL);

select * from patients;

INSERT INTO Employee VALUES
('AD0', 'David', 'ADoctor'),
('AD1', 'Victor', 'ADoctor'),
('AD2', 'Emma', 'ADoctor'),
('AD3', 'James', 'ADoctor'),
('AD4', 'Fab', 'ADoctor'),
('CD5', 'Chukwu', 'CDoctor'),
('CD6', 'Ken', 'CDoctor'),
('CD7', 'Jiji', 'CDoctor'),
('CD8', 'Ama', 'CDoctor'),
('CD9', 'Lisa', 'CDoctor'),
('N10', 'Beky', 'Nurse'),
('N12', 'Lion', 'Nurse'),
('N13', 'Tiger', 'Nurse'),
('N14', 'Leo', 'Nurse'),
('N15', 'Fab', 'Nurse'),
('T16', 'Parker', 'Technician'),
('T17', 'Sama', 'Technician'),
('T18', 'Cat', 'Technician'),
('T19', 'Kara', 'Technician'),
('T20', 'Tara', 'Technician');

select * from employee;

INSERT INTO Doctors VALUES
('AD0', 'h01' /*,'David', 'Emma'*/),
('AD1', 'h02' /*,'Victor', 'Mark'*/),
('AD2', 'h03' /*,'Emma', 'Oxide'*/),
('AD3', 'h04' /*,'James', 'Spiritus'*/),
('AD4', 'h05' /*,'Fab', 'Fauzilante'*/),
('CD5', 'h06' /*,'Chukwu', 'Frank'*/),
('CD6', 'h07' /*,'Ken', 'Wole'*/),
('CD7', 'h08' /*,'Jiji', 'Baby'*/),
('CD8', 'h09' /*,'Ama', 'Oly'*/),
('CD9', 'h10' /*,'Lisa', 'Paddy'*/);

select * from doctors;

INSERT INTO Treatment VALUES
('m00', 'Malaria', 'm'),
('m01', 'Fever', 'm'),
('m02', 'Missle', 'm'),
('m03', 'Corona', 'm'),
('m04', 'Typhord', 'm'),
('m05', 'Yeast', 'm'),
('m06', 'Surgery', 'm'),
('m07', 'Chemo', 'm'),
('p00', 'HIV test', 'p'),
('p01', 'Pregnancy test ', 'p'),
('p02', 'Blood test', 'p'),
('p03', 'Ultra sound', 'p'),
('p04', 'Blood sugar', 'p'),
('p05', 'Drug Test', 'p');

select * from Treatment;

INSERT INTO Treatment_Ordered VALUES
('O22', 'm01', 'h01', 'AD0', '2020/8/02'),
('O23', 'm04', 'h01', 'AD0', '2020/8/03'),

('O24', 'm01', 'h03', 'AD1', '2020-10-01'),
('O25', 'm03', 'h03', 'AD1', '2020-10-03'),

('O26', 'm04', 'h02', 'AD2', '2020/7/31'),
('O27', 'm05', 'h02', 'AD2', '2020/8/02'),

('O28', 'm06', 'h02', 'AD2', '2020/8/03'),
('O29', 'm07', 'h02', 'AD2', '2020/8/04'),

('O30', 'm06', 'h04', 'AD3', '2020/8/01'),
('O31', 'm02', 'h04', 'AD3', '2020/8/04'),

('O32', 'm02', 'h05', 'AD4', '2020/7/10'),
('O33', 'm07', 'h05', 'AD4', '2020/7/13'),

('O38', 'p02', 'h07', 'CD7', NULL),
('O39', 'p04', 'h07', 'CD7', NULL),
('O40', 'p03', 'h07', 'CD7', NULL),
('O41', 'p01', 'h07', 'CD7', NULL),

('O42', 'p04', 'h08', 'CD8', NULL),
('O43', 'p03', 'h08', 'CD8', NULL),

('O44', 'p02', 'h09', 'CD9', NULL),
('O45', 'p01', 'h09', 'CD9', NULL)
;

select * from Treatment_Ordered;

INSERT INTO Treatment_Administered VALUES -- list multiple nurses/doctors/technicians within this table
('O26', 'm04', 'h02', 'AD2', 'In', '2020/7/31'),
('O27', 'm05', 'h02', 'T16', 'In', '2020/8/03'),
('O28', 'm06', 'h02', 'T20', 'In', '2020/8/04'),
('O29', 'm07', 'h02', 'AD2', 'In', '2020/8/06'),
('O30', 'm06', 'h04', 'N10', 'In', '2020/8/02'),
('O30', 'm02', 'h04', 'N10', 'In', '2020/8/04'),
('O30', 'm06', 'h04', 'T16', 'In', '2020/8/06'),
('O31', 'm02', 'h04', 'AD3', 'In', '2020/8/06'),
('O32', 'm02', 'h05', 'AD4', 'In', '2020/07/10'),
('O32', 'm07', 'h05', 'N12', 'In', '2020/07/10'),
('O32', 'm07', 'h05', 'CD6', 'In', '2020/07/12'),
('O33', 'm07', 'h05', 'T19', 'In', '2020/07/12'),
('O24', 'm01', 'h03', 'AD1', 'In', '2020/10/01'),
('O24', 'm01', 'h03', 'T20', 'In', '2020/10/02'),
('O25', 'm03', 'h03', 'T18', 'In', '2020/10/02'),
('O25', 'm03', 'h03', 'N12', 'In', '2020/10/03'),
('O22', 'm01', 'h01', 'T19', 'In', '2020/8/18'),
('O22', 'm01', 'h01', 'AD0', 'In', '2020/8/19'),
('O23', 'm04', 'h01', 'AD0', 'In', '2020/8/20'),
('O23', 'm04', 'h01', 'N10', 'In', '2020/8/21'),
('O38', 'P02', 'h07', 'CD7', 'Out', NULL),
('O39', 'P02', 'h07', 'T17', 'Out', NULL),
('O40', 'P04', 'h07', 'CD8', 'Out', NULL),
('O41', 'P03', 'h07', 'N14', 'Out', NULL),
('O39', 'P01', 'h07', 'CD7', 'Out', NULL),
('O42', 'P04', 'h08', 'CD8', 'Out', NULL),
('O42', 'P04', 'h08', 'AD0', 'Out', NULL),
('O42', 'P04', 'h08', 'N10', 'Out', NULL),
('O43', 'P03', 'h08', 'T18', 'Out', NULL),
('O43', 'P03', 'h08', 'CD8', 'Out', NULL),
('O44', 'P02', 'h09', 'CD9', 'Out', NULL),
('O44', 'P01', 'h09', 'CD9', 'Out', NULL),
('O45', 'P02', 'h09', 'N12', 'Out', NULL),
('O45', 'P01', 'h09', 'T20', 'Out', NULL)
;
select * from Treatment_Administered;

INSERT INTO Admiting_Doctors VALUES
('AD0', 'David'),
('AD1', 'Victor'),
('AD2', 'Emma'),
('AD3', 'James'),
('AD4', 'Fab')
;

select * from Admiting_Doctors;

INSERT INTO Admitted_Patients VALUES
('h01', 'AD0', '2018/8/09', '2018/8/24'),
('h01', 'AD0', '2018/9/2', '2018/10/17'),
('h01', 'AD0', '2019/2/19', '2019/2/22'),
('h01', 'AD0', '2019/11/14', '2019/11/20'),
('h01', 'AD0', '2020/8/18', '2020/8/22'),

('h02', 'AD1', '2018/7/09', '2018/7/24'),
('h02', 'AD1', '2018/8/2', '2018/8/17'),
('h02', 'AD1', '2019/9/19', '2019/10/22'),
('h02', 'AD1', '2019/11/14', '2019/11/20'),
('h02', 'AD1', '2020/7/31', NULL),

('h03', 'AD2', '2018/8/07', '2018/8/22'),
('h03', 'AD2', '2018/10/2', '2018/10/17'),
('h03', 'AD2', '2019/2/13', '2019/2/17'),
('h03', 'AD2', '2019/10/14', '2019/10/19'),
('h03', 'AD2', '2020/10/01', '2020/10/04'),

('h04', 'AD3', '2017/12/09', '2017/12/28'),
('h04', 'AD3', '2018/6/2', '2018/7/17'),
('h04', 'AD3', '2018/11/19', '2018/12/22'),
('h04', 'AD3', '2019/2/1', '2019/4/20'),
('h04', 'AD3', '2020/8/01', NULL),

('h05', 'AD4', '2017/7/10', '2017/7/13'),
('h05', 'AD4', '2019/7/10', '2019/7/13'),
('h05', 'AD4', '2020/5/1', '2020/5/8'),
('h05', 'AD4', '2020/6/10', '2020/6/14'),
('h05', 'AD4', '2020/7/10', '2020/7/13')
;

select * from Admitted_Patients;

INSERT INTO Nurses VALUES
('N10', 'Beky'),
('N12', 'Lion'),
('N13', 'Tiger'),
('N14', 'Leo'),
('N15', 'Fab')
;
select * from Nurses;

INSERT INTO Technicians VALUES
('T16', 'Parker'),
('T17', 'Sama'),
('T18', 'Cat'),
('T19', 'Kara'),
('T20', 'Tara');

select * from Technicians;


/* MySQL queries*/

# A. Patient Information
/**************************************
 1. List all patients currently admitted to the hospital (i.e., those who are currently receiving inpatient services). List only patient identification
 	 number and name.
***************************************/
SELECT Admitted_Patients.pid, patients.pname
FROM Admitted_Patients JOIN patients USING (pid)
Where discharge is NULL;


/**************************************
 2. List all patients who have received outpatient services within a given date range. List only patient identification number and name.
***************************************/
SELECT patients.pid, patients.pname
FROM Patients join Treatment_Administered USING (pid)
Where admindate BETWEEN '2020/01/16' AND '2020/06/21';

/**************************************
 3. For a given patient (either patient identification number or name), list all treatments that were administered. Group treatments by admissions.
	List admissions in descending chronological order, and list treatments in ascending chronological order within each admission.
***************************************/
SELECT patients.pid, patients.pname, treatment.tid, treatment.tdescription, treatment.ttype, admitted_patients.admission
FROM treatment_administered join treatment using (tid) JOIN patients USING (pid) right join admitted_patients using (pid)
where patients.pid = 'h05' -- Specify patient's id
group by admission
order by admission desc
;

# B. Diagnosis and Treatment Information
/**************************************
 1. List the treatments performed at the hospital (to both inpatients and outpatients), in
descending order of occurrences. List treatment identification number, name, and total number
of occurrences of each treatment.
***************************************/
SELECT treatment.tid, treatment.tdescription, COUNT(*) AS occurrence
FROM Treatment_Administered JOIN Treatment USING (tid)
group by tdescription
ORDER BY occurrence desc;


/**************************************
2. For a given treatment occurrence, list all the hospital employees that were involved. Also
include the patient name and the doctor who ordered the treatment.
***************************************/
select q1.tid, q1.tdescription, q1.ename, q1.eid, Ordering_doctors, q1.pname from
(
SELECT treatment.tid, treatment.tdescription, employee.ename, employee.eid, patients.pname
FROM Treatment_Administered join Treatment USING (tid) join employee using (eid) join patients using (pid)
) q1
left join
(
SELECT employee.eid, employee.ename as Ordering_doctors
FROM Treatment_ordered join Treatment USING (tid) join employee using (eid) join patients using (pid) join doctors using (eid)
) q2 using (eid);

# C. Employee Information
/**************************************
 1. For a given doctor, list all treatments that they ordered in descending order of occurrence. For
each treatment, list the total number of occurrences for the given doctor.
***************************************/
SELECT employee.eid as doctor_id, employee.ename as doctor, treatment_Ordered.tid, Treatment.tdescription as Treatment, COUNT(Treatment.tid) AS occurrence
FROM Treatment_Ordered right join Treatment using (tid) join employee using (eid)
where employee.eid = 'CD9' -- Specify doctor's eid
group by tid
ORDER BY occurrence desc;

/**************************************
2. List employees who have been involved in the treatment of every admitted patient.
***************************************/
SELECT g1.eid, g2.ename, g1.pid, g1.pname  from
(
SELECT Treatment_Administered.eid, patients.pid, patients.pname
FROM Treatment_Administered JOIN Admitted_Patients USING (pid) join Patients using (pid)
) g1
join
(
SELECT employee.eid, Employee.ename
FROM employee
) g2 using (eid);

/**************************************
3. List the primary doctors of patients with a high admission rate (at least 4 admissions within a one-year time frame
***************************************/
SELECT Distinct employee.eid, employee.ename, Admitted_Patients.pid, count(admission)
FROM Admitted_Patients join employee using (eid) join Admiting_doctors using (eid)
where max(admission) - min(admission) = 0
group by pid
having count(*) > 3;



