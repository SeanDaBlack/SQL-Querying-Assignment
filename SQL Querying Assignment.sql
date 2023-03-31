use university;

select first_name, last_name from student;

select * from instructor
where tenured=1;

select student.first_name as 'Student First Name', student.last_name as 'Student Last Name',
instructor.first_name as 'Advisor First Name', instructor.last_name as 'Advisor Last Name'
from student, instructor
where student.advisor_id=instructor.instructor_id;

select instructor.instructor_id, instructor.first_name, instructor.last_name from instructor
left join student
on instructor.instructor_id = student.advisor_id
where advisor_id is null;

select i.first_name, SUM(c.num_credits) as '# of Credits' from instructor as i, course as c
where i.instructor_id=c.instructor_id
group by i.first_name
order by SUM(c.num_credits);

select course_code, course_name from course
where course_code like '%3___%';

select c.course_code, i.first_name, i.last_name, c.num_credits from student_schedule as ss, course as c,
student as s, instructor as i
where ss.course_id=c.course_id and ss.student_id=s.student_id and ss.student_id=1 and
i.instructor_id=c.instructor_id;
