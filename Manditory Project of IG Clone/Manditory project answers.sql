use ig_clone;
-- 2. We want to reward the user who has been around the longest, Find the 5 oldest users.
select * from users
order by created_at 
limit 5;

-- 3.To understand when to run the ad campaign, 
-- figure out the day of the week most users register on? 
select distinct(count(*)) total,dayname(created_at) register_day from users
group by register_day
order by total desc
limit 5;

-- 4.To target inactive users in an email ad campaign, 
-- find the users who have never posted a photo.

select u.id,username from users u
left join photos p on u.id=p.user_id
where p.id is null
order by id;

-- 5. Suppose you are running a contest to find out who got the most likes on a photo. 
-- Find out who won?
select u.id,image_url,l.user_id,count(*)as total from photos p
inner join likes l on l.user_id=p.user_id
inner join users u on u.id=l.user_id
group by photo_id
order by total desc
limit 5;

-- 6.The investors want to know how many times does the average user post.
with cte as(
select (select count(*) from photos) / (select count(*)from users) as avg)
select * from cte;	

-- 7.A brand wants to know which hashtag to use on a post,
--  and find the top 5 most used hashtags.
with cte as(
select distinct(t.tag_name),t.id,count(*) total from photo_tags pt
join tags t on t.id=pt.tag_id
group by t.id 
order by total desc
limit 5)
select * from cte;

-- 8.To find out if there are bots, 
-- find users who have liked every single photo on the site.

select distinct(username),count(*) likes from likes l
left join users u on u.id=l.user_id
group by username
order by count(*) desc;
  
  
--  9.To know who the celebrities are, find users who have never commented on a photo.
select * from comments










