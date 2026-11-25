# Hospital Management System – SQL Database Design Project

## Project Title
Hospital Management System Database

## Selected Scenario
Healthcare Industry – Hospital Management

## Project Description
This project focuses on designing a relational database for a Hospital Management System using MySQL.

The database manages patient information, doctor details, hospital departments, appointment schedules, and payment records. It helps organize hospital data and maintain relationships between different entities.

## Tables Created

1. **Patients** – Stores patient personal details, contact information, and city.
2. **Departments** – Stores hospital department names, locations, and phone numbers.
3. **Doctors** – Stores doctor details, specialization, department, contact information, and consultation fees.
4. **Appointments** – Stores patient appointments, doctor details, appointment dates, status, and reasons.
5. **Payments** – Stores patient payment details, appointment references, payment amounts, methods, and payment status.

## Relationships

- Departments and Doctors are connected through `department_id`.
- Patients and Appointments are connected through `patient_id`.
- Doctors and Appointments are connected through `doctor_id`.
- Patients and Payments are connected through `patient_id`.
- Doctors and Payments are connected through `doctor_id`.
- Appointments and Payments are connected through `appointment_id`.

Primary Keys and Foreign Keys are used to establish relationships between the tables.

## Tools Used
- MySQL
- MySQL Workbench
- GitHub

## Project Files
- `database.sql` – SQL script containing database creation, table creation, and sample data insertion queries.
- `ER_Diagram.png` – Entity Relationship Diagram showing the tables and their relationships.

## Project Objective
To design and implement a relational database using MySQL and understand database creation, table relationships, Primary Keys, Foreign Keys, and SQL operations through a real-world hospital management scenario.
