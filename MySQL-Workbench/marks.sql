use student;

create table marks(student_id int , Maths int, Science int, Phy int, Chem int );

INSERT INTO marks (student_id, Maths, Science, Phy, Chem)
VALUES
(1, 85, 78, 82, 80),
(2, 92, 88, 90, 91),
(3, 76, 72, 70, 74),
(4, 89, 84, 86, 88),
(5, 67, 71, 69, 65),
(6, 95, 93, 96, 94),
(7, 81, 79, 77, 80),
(8, 73, 75, 78, 72),
(9, 88, 90, 87, 89),
(10, 62, 68, 64, 66),
(11, 79, 82, 80, 81),
(12, 91, 89, 92, 90),
(13, 70, 74, 72, 73),
(14, 84, 86, 85, 83);

alter table marks add column  Total int , add column  percentage float ;
alter table marks change column percentage percentage DECIMAL(5,2);

UPDATE marks
SET
    Total = Maths + Science + Phy + Chem,
    percentage = (Maths + Science + Phy + Chem) * 100 / 400;

SELECT student_id, Maths, Science, Phy, Chem, total, percentage
FROM marks;
select * from marks;

alter table marks  rename column student_id to id; 

select First_Name , Total from students join marks on (student_id = id);


select First_name, Total
 from students join marks on(student_id = id)
 where Total > (select avg(Total) from marks);
