Create Table Departments(
DepartmentId INTEGER PRIMARY KEY AUTOINCREMENT,
DepartmentName VARCHAR(255) NOT NULL,
Description Text,
ManagerId INTEGER,
Foreign Key (ManagerId) References Employees(EmployeeId) 
);

Create Table Employees(
EmployeeId INTEGER PRIMARY KEY AUTOINCREMENT,
FullName VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
DepartmentId INT,
ManagerId INT,
Foreign Key (ManagerId) References Employees(EmployeeId),
Foreign Key (DepartmentId) References Departments(DepartmentId);
);


INSERT INTO Departments (DepartmentName,Description) Values ('Engineering', 'Handles software development and IT infrastructure.'),
('Human Resources', 'Manages employee relations and workplace culture.');

INSERT INTO Employees (FullName,Email,DepartmentId,ManagerId) Values ('Alice Johnson', 'alice@example.com', '2021-01-15', (SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Engineering'), NULL),
('Bob Smith', 'bob@example.com', (SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Engineering'), (SELECT EmployeeId FROM Employees WHERE FullName = 'Alice Johnson')),
('Carol White', 'carol@example.com',  (SELECT DepartmentId FROM Departments WHERE DepartmentName = 'Human Resources'), NULL);