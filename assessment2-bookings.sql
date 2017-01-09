/* How can you retrieve all the information from the cd.facilities table?*/
select * from cd.facilities;

/* You want to print out a list of all of the facilities and their cost to members. 
 How would you retrieve a list of only facility names and costs?*/
select name, membercost from cd.facilities;

/* How can you produce a list of facilities that charge a fee to members?*/
select name, membercost from cd.facilities where membercost > 0;

/* How can you produce a list of facilities that charge a fee to members, 
 and that fee is less than 1/50th of the monthly maintenance cost? 
 Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.*/
select facid, name, membercost, monthlymaintenance 
from cd.facilities
where membercost > 0
and membercost < (monthlymaintenance/50);

/* How can you produce a list of all facilities with the word 'Tennis' in their name?*/
select facid, name, membercost, monthlymaintenance 
from cd.facilities
where name LIKE '%Tennis%';

/* How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.*/
select facid, name, membercost, monthlymaintenance 
from cd.facilities
where facid in (1,5);

/* How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, 
 firstname, and joindate of the members in question.*/
select * from cd.members where joindate > '2012-09-01';

/* How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.*/
select distinct surname
from cd.members
order by surname
limit 10;

/* You'd like to get the signup date of your last member. How can you retrieve this information?*/
select * from cd.members 
order by joindate desc
limit 1;

select max(joindate) as latest from cd.members;/*solution from course*/

/* Produce a count of the number of facilities that have a cost to guests of 10 or more.*/
select name, membercost, guestcost from cd.facilities where guestcost >= 10;

/* Skip this one, no question for #11.
 Produce a list of the total number of slots booked per facility in the month of September 2012. 
 Produce an output table consisting of facility id and slots, sorted by the number of slots.*/
select facid, sum(slots) as total_slots
from cd.bookings
group by facid
having ('2012-09-01' <= starttime and starttime <= '2012-09-30');/*does not work because the filter should have been a where*/

select facid, sum(slots) as "Total Slots" 
from cd.bookings 
where starttime >= '2012-09-01' and starttime < '2012-10-01' 
group by facid order by sum(slots);/*solution provided by course*/


/* Produce a list of facilities with more than 1000 slots booked. 
Produce an output table consisting of facility id and total slots, sorted by facility id.*/
select facid, sum(cd.bookings.slots) as total_slots
from cd.bookings
group by facid
having sum(cd.bookings.slots) > 1000
order by facid;

/*solution provided: */
select facid, sum(slots) as "Total Slots" from cd.bookings group by facid having sum(slots) > 1000 order by facid;


/* How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
Return a list of start time and facility name pairings, ordered by the time. */
create view tennis_courts_sep as
select cd.facilities.name, starttime
from cd.bookings
inner join cd.facilities 
on cd.facilities.facid = cd.bookings.facid
where starttime between '2012-09-21' and '2012-09-22'
and cd.facilities.name like '%Tennis Court%'
order by starttime;

select * from tennis_courts_sep; 

select bks.starttime as start, facs.name as name 
from cd.facilities facs 
inner join cd.bookings bks on facs.facid = bks.facid 
where facs.facid in (0,1) 
and bks.starttime >= '2012-09-21' 
and bks.starttime < '2012-09-22' 
order by bks.starttime;/*solution provided*/

/* How can you produce a list of the start times for bookings by members named 'David Farrell'?*/
select cd.facilities.name, starttime
from cd.bookings
inner join cd.facilities 
on cd.facilities.facid = cd.bookings.facid
inner join cd.members
on members.memid = bookings.memid
where members.surname='Farrell'
and members.firstname='David'
order by starttime;

select bks.starttime 
from cd.bookings bks 
inner join cd.members mems 
on mems.memid = bks.memid 
where mems.firstname='David' and mems.surname='Farrell';/*solution provided*/

select * from cd.bookings;