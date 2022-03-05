
 SQL Assessment Test 2
Questions and Expected Results
Keep in mind there is usually more than one way to answer these questions. For the solutions you can visit this link:
https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit?usp=sharing
OR you can watch the solutions video walkthrough lecture.
These questions start off with the basics and then get continually more difficult.

1.	How can you retrieve all the information from the cd.facilities table?
●	Expected Result should look similar to this (with more rows):
 
select * from cd.facilities

2.	You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

select name, membercost from cd.facilities


3.	How can you produce a list of facilities that charge a fee to members?
●	Expected Results should have just 5 rows:
●	 
select name, guestcost, membercost,initialoutlay,monthlymaintenance
from cd.facilities 

where membercost > 0


4.	How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

select name, facid, membercost, monthlymaintenance from cd.facilities 
where membercost > 0
and membercost < (monthlymaintenance/50)


●	Result is just two rows:
 

5.	How can you produce a list of all facilities with the word 'Tennis' in their name?
●	Expected Result is 3 rows

●	 

select * from cd.facilities 
where name like '%Tennis%'



6.	How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
●	Expected Result is 2 rows
●	 
select * from cd.facilities 
where facid IN (1,5)


7.	How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
●	Expected Result is 10 rows (not all are shown below)
●	 
select memid,surname,firstname,joindate
from cd.members 
where joindate > '2012-08-30'




8.	How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
●	Expected Result should be 10 rows if you include GUEST as a last name

select distinct (surname)  from cd.members
order by surname
limit 10

●	 




9.	You'd like to get the signup date of your last member. How can you retrieve this information?
●	Expected Result
●	2012-09-26 18:08:45

select joindate from cd.members 
order by joindate desc

10.	Produce a count of the number of facilities that have a cost to guests of 10 or more.
●	Expected Result
●	6


select count(guestcost) from cd.facilities 
where guestcost >= 10


11.	Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
●	Expected Result is 9 rows

select facid, sum(slots) as Total_slots from cd.bookings 
where starttime between '2012-09-01' and '2012-10-01'
group by facid
order by total_slots
●	 
 

12.	Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
●	Expected Result is 5 rows
●	 

select facid, sum(slots) as total_slots from cd.bookings
group by facid  
having sum (slots) >1000 
order by facid

13.	How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
●	Expected Result is 12 rows
●	 
select starttime as start, cd.facilities.name from cd.bookings
full outer join cd.facilities 
on cd.bookings.facid = cd.facilities.facid
where name like '%Tennis Court%' 
and starttime between '2012-09-21' and '2012-09-22' 
order by start

14.	How can you produce a list of the start times for bookings by members named 'David Farrell'?
●	Expected result is 34 rows of timestamps

select starttime from cd.bookings
inner join cd.members ON 
cd.bookings.memid = cd.members.memid 
where cd.members.firstname = 'David'
and cd.members.surname = 'Farrell'


