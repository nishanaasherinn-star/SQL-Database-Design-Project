create database hospital_managment;
use hospital_managment;
create table patiants
(patiant_id int primary key,
first_name varchar(20),
gender varchar(10),
date_of_brith date,
phone varchar(10),
email varchar(30),
city varchar(20));
describe patiants;
alter table patiants  modify patiant_id int AUTO_INCREMENT,
modify city varchar(20) DEFAULT ('kozhikode'); 
describe patiants;
insert into patiants(first_name,gender,date_of_brith,phone,email,city)
values('arun','male','2000-01-04',0987654321,'arun@gamil.com','kannur'),
	  ('meera','feamale','2004-09-23',2345678901,'meera@gamil.com','kochi'),
	  ('anagha','feamale','2002-10-23',2316589391,'anagha@gamil.com','thrissur'),
	  ('manu','male','2003-04-13',1234567890,'manu@gamil.com','wayanad'),
	  ('james','male','2000-09-08',0987654321,'james@gamil.com','kottayam'),
	  ('jaison','male','2003-12-23',6789054321,'jaison@gamil.com','pathanamthitta'),
	  ('anjali','feamale','2002-03-12',3456789012,'anjali@gamil.com','idukki'),
	  ('shobhana','feamale','2000-07-10',7654321890,'shobhana@gamil.com','kannur'),
	  ('keerthana','feamale','2000-03-11',9876567890,'keerthana@gamil.com','kochi'),
	  ('amal','male','2002-02-06',8976546710,'amal@gamil.com','palakkad');
      select * from patiants;
      insert into patiants 
      (first_name,gender,date_of_brith,phone,email) values
      ('Nisha', 'Female', '2001-05-10', '9876543210', 'nisha@gmail.com');
      drop table departments;
      create table departments
      (department_id int primary key AUTO_INCREMENT,
      department_name varchar(20) default('genaral medicin'),
      dept_location varchar(20) default ('main block'),
      phone varchar(10) not null );
      describe departments;
      insert into departments(department_name,dept_location,phone) values
      ('Cardiology', 'First Floor', '9876543210'),
('Neurology', 'Second Floor', '9876543211'),
('Orthopedics', 'Third Floor', '9876543212'),
('Dermatology', 'First Floor', '9876543213'),
('Pediatrics', 'Ground Floor', '9876543214');
insert into departments(department_name,phone) values
('ENT','9876543210'),
('Ophthalmology','9876543211'),
('Urology','9876543212'),
('Psychiatry','9876543213'),
('General Medicine','9876543214'),
('Gynecology','9876543215'),
('Oncology','9876543216');
select * from departments;
drop table doctors;
create table doctors
(doctor_id int primary key auto_increment,
first_name varchar(20)not null,
gender varchar(20),
specialization varchar(20),
department_id int,
phone varchar(10) unique ,
email varchar(20)unique ,
consultation_fee decimal(10,2) default 300.00,
foreign KEY (department_id)
 references departments(department_id));
 describe doctors;
 insert into doctors(first_name,gender,specialization,department_id,phone,email,consultation_fee) values
 ('dr.radhika','female','Cardiology',8,0987654321,'radhika@gmail.com',500),
 ('dr.kiran','male','Neurology',9,1234567890,'kiran@gmail.com',400),
 ('dr.aslam','male','Dermatology',11,6789054321,'aslam@gmail.com',300),
 ('dr.sujit','male','Oncology',7,4321567890,'sujit@gmail.com',500),
 ('dr.reema','female','Orthopedics',10,3214567890,'reema@gmail.com',400),
 ('dr.renuka','female','Pediatrics',12,8905674321,'renuka@gmail.com',400),
 ('dr.manu','male','Ophthalmology',2,2314568790,'manu@gmail.com',500),
 ('dr.gayathri','female','General Medicine',5,6655447788,'gayathri@gmail.com',300),
 ('dr.shaheem','male','Urology',3,1108896675,'shaheem@gmail.com',200),
 ('dr.arya','female','Psychiatry',4,6547890123,'arya@gmail.com',300);
 select * from doctors;
 CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patiant_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20) DEFAULT 'Scheduled',
    reason VARCHAR(100),

    FOREIGN KEY (patiant_id)
    REFERENCES patiants(patiant_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)
);
INSERT INTO appointments
(patiant_id, doctor_id, appointment_date, status, reason)
VALUES
(1, 1, '2026-11-25 09:00:00', 'Scheduled', 'Chest Pain'),
(2, 2, '2026-11-25 10:00:00', 'Completed', 'Headache'),
(3, 3, '2026-11-25 11:00:00', 'Scheduled', 'Tooth Pain'),
(4, 4, '2026-11-26 09:30:00', 'Cancelled', 'Cancer Checkup'),
(5, 5, '2026-11-26 10:30:00', 'Completed', 'Bone Pain'),
(6, 6, '2026-11-26 11:30:00', 'Scheduled', 'Child Fever'),
(7, 7, '2026-11-27 09:00:00', 'Scheduled', 'Eye Checkup'),
(8, 8, '2026-11-27 10:00:00', 'Completed', 'General Checkup'),
(9, 9, '2026-11-28 11:00:00', 'Scheduled', 'Kidney Pain'),
(10, 10, '2026-11-28 12:00:00', 'Scheduled', 'Mental Health Checkup');
select * from appointments;
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    patiant_id INT,
    doctor_id INT,
    appointment_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),

    FOREIGN KEY (patiant_id)
    REFERENCES patiants(patiant_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id),

    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id));
INSERT INTO payments
(patiant_id, doctor_id, appointment_id, payment_date,
amount, payment_method, payment_status)
VALUES
(1, 1, 1, '2026-11-25', 500, 'UPI', 'Paid'),
(2, 2, 2, '2026-11-25', 600, 'Cash', 'Paid'),
(3, 3, 3, '2026-11-25', 300, 'Card', 'Paid'),
(4, 4, 4, '2026-11-26', 700, 'UPI', 'Pending'),
(5, 5, 5, '2026-11-26', 450, 'Cash', 'Paid'),
(6, 6, 6, '2026-11-26', 400, 'Card', 'Paid'),
(7, 7, 7, '2026-11-27', 500, 'UPI', 'Paid'),
(8, 8, 8, '2026-11-27', 350, 'Cash', 'Pending'),
(9, 9, 9, '2026-11-28', 550, 'Card', 'Paid'),
(10, 10, 10, '2026-11-28', 300, 'UPI', 'Paid');
SELECT * FROM payments;





  


     


