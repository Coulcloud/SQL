use Education;
/*
--1
select * from subject;
--2
select * from institute;
--3
select DISTINCT stipendia  from student ;  
--4
select DISTINCT course from student;
--5
select family, name, last_name,birthday from student ORDER BY birthday ASC;
--6
select family,course, birthday from student ORDER BY birthday DESC;
--7
select lect_id,family,name,last_name from lecturer;
--8
select  family, name, last_name,birthday,stipendia from student where stipendia>0 ORDER BY family DESC  
--9
select  family, name, last_name,course from student where course=1 ORDER BY family DESC  
--10
select  family, name, last_name,course from student where course=3 or course=2;  
--11
select  family, name, last_name,course from student where course NOT IN ('1','3');
--12
select DISTINCT subj_id,subj_name,mark from exam, subject where mark=5  ;
--13 
SELECT subj_name, knowledge.hour 
FROM subject, nagruzka, knowledge, exam 
where (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND exam.nagr_id = nagruzka.nagr_id) AND exam.mark = 2 
group by  subj_name, hour; 

--14
SELECT family, town_name, subj_name, mark 
FROM town, parents, student, subject, exam, knowledge, uch_plan  
WHERE town.town_id = parents.town_id AND parents.student_id = student.student_id AND student.student_id = exam.student_id AND subject.subj_id = knowledge.subj_id 
AND knowledge.kvant_id = uch_plan.kvant_id AND uch_plan.Spec_id = student.Spec_id AND subj_name = 'бжд' AND mark > 2 AND town_name = 'Березовский'
GROUP BY family, town_name, subj_name, mark; 
--15

SELECT family, name, last_name, subj_name, mark 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id 
ORDER BY subj_name ASC, mark DESC, family ASC;


--16
SELECT family, name, last_name, subj_name, mark 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2 AND subj_name = 'экономика'
GROUP BY family, subj_name, mark, name, last_name
ORDER BY family ASC;

--17
SELECT family, name, last_name, name_medal, town_name
FROM medali, medalist, student, parents, town
WHERE medali.medal_id = medalist.medal_id AND medalist.student_id = student.student_id 
AND student.student_id = parents.student_id AND parents.town_id = town.town_id AND name_medal = 'золотая'*

--18
SELECT family, subj_name, exam_date 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2
GROUP BY family, subj_name, exam_date
ORDER BY subj_name, family;

--19
SELECT family, subj_name, exam_date 
FROM student, exam, nagruzka, knowledge, subject 
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id AND mark = 2 AND (exam.exam_date = '2019-06-13' OR exam.exam_date = '2019-05-24')
GROUP BY family, subj_name, exam_date
ORDER BY subj_name, family;


--20
SELECT * FROM student, exam, nagruzka, lecturer, knowledge, subject
WHERE student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.lect_id = lecturer.lect_id AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.subj_id = subject.subj_id 
*/

--21
SELECT inst_name
FROM institute, lecturer, nagruzka, exam, knowledge
WHERE institute.inst_id = lecturer.inst_id AND lecturer.lect_id = nagruzka.lect_id AND nagruzka.nagr_id = exam.nagr_id
AND nagruzka.kvant_id = knowledge.kvant_id AND hour > 80 AND mark = 2
GROUP BY inst_name
--
SELECT *
FROM exam, nagruzka, knowledge, subject
WHERE exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id AND knowledge.subj_id = subject.subj_id
