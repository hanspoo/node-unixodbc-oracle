CONNECT sample_user/Sample123@FREEPDB1;

-- Insert a few sample rows
INSERT into employees (name, department, salary) VALUES ('Alice', 'Engineering', 75000);
INSERT into employees (name, department, salary) VALUES ('Bob', 'Finance', 68000);
INSERT into employees (name, department, salary) VALUES ('Charlie', 'HR', 62000);
COMMIT;

