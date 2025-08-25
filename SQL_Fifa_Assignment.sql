
#▪How many players are there in the dataset?
   
   select count(*) as count from fifa;

   select count( distinct name) as unq_name_cnt from fifa;

#▪How many nationalities do these players belong to?
   select count( distinct nationality) from fifa;
#▪What is the total wage given to all players? What's the average and standard deviation?
   select sum(wage) as tot_wage, 
   avg(wage) as avg_wage,
   stddev(wage) as stddev_wage
   from fifa;
#▪Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
   SELECT nationality, COUNT(*) AS player_count
   FROM fifa
   GROUP BY nationality
   ORDER BY player_count DESC
   LIMIT 3;


#▪Which player has the highest wage? Who has the lowest?
       
    # Highest wage
    select name,wage from fifa
   order by wage desc limit 1; 
    # Lowest Wage
   select name,wage from fifa
   order by wage limit 1;

#▪The player having the – best overall rating? Worst overall rating?

   # Highest Rating
  select name,overall from fifa
  order by overall desc;
  # Lowest Wage
  select name,overall from fifa
  order by overall;

▪Club having the highest total of overall rating? Highest Average of overall rating?
   # Club with highest average overall rating
   Select club, sum(Overall) as total_overall
   From fifa
   GROUP BY Club
   ORDER BY total_overall desc
   LIMIT 1;

# Club with highest average overall rating
Select club, avg(overall) as avg_overall
From fifa 
Group by club
Having count(*) > 1 
Order by avg_overall desc limit 1;

#▪What are the top 5 clubs based on the average ratings of their players and their corresponding averages?

select club, avg(overall) as avg_overall
from fifa
group by Club
having COUNT(*) > 1
order by avg_overall desc
Limit 5;

#▪What is the distribution of players whose preferred foot is left vs right?

select Preferred_Foot,
count(*) as player_count from fifa 
group by Preferred_Foot;
#▪Which jersey number is the luckiest? 

select Jersey_Number, count(*) as frequency
from fifa
group  by Jersey_Number
order  by frequency desc
limit 1;

#▪What is the frequency distribution of nationalities among players whose club name starts with M?

select Nationality, count(*) as player_count
from fifa
where Club like 'M%'
group by Nationality
order by player_count desc;

#▪How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?

select count(*) as total_joined from fifa 
where str_to_date(Joined, '%d-%m-%Y')
 between '2018-05-20' and '2019-04-10';

#▪How many players have joined their respective clubs date wise?

 select Joined,
 count(*) as player_count from fifa 
 group by Joined 
 order by str_to_date(Joined, '%d-%m-%Y');

#▪How many players have joined their respective clubs yearly?

select year(str_to_date(Joined, '%d-%m-%Y')) as join_year, 
count(*) as player_count from fifa 
where Joined is not null
 group by join_year 
order by join_year;



