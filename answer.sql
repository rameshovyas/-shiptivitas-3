-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
select avg(before.id) as "Avg Users Before" , avg(after.id) as "Avg Users After"  
from login_history before, login_history after
 where before.login_timestamp in
 (select distinct(login_timestamp) from login_history where DATE(login_timestamp, 'unixepoch') < '2018-06-02')  
 
 and 
 after.login_timestamp in
 (select distinct(login_timestamp) from login_history where DATE(login_timestamp, 'unixepoch') >= '2018-06-02')  



-- PART 2: Create a SQL query that indicates the number of status changes by card

select cardId,count(newStatus) as "No. of Status Changed" from card_change_history group by cardId



