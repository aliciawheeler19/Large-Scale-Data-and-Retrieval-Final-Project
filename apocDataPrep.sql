use song;

-- 4950 links in total
select count(*) from links;

-- 100 songs in total
select count(*) from node;

-- 6 distinct genre: r&b, rock, edm,  rap, latin, pop
select distinct genre
from node;

-- 6 distinct decades: 60s, 70s, 80s, 90s, 00s, 10s,
select distinct decade
from node;

-- Total Links ----------------------------------------------------------------------------

-- 1% and below entire: 50 links
select count(*)
from links 
where euclidean < 0.121576;

-- 5% and below entire: 248 links
select count(*) 
from links 
where euclidean < 0.206442;

-- 10% and below entire: 495 links
select count(*) 
from links 
where euclidean < 0.259790;

-- Create the views for Neo4J -------------------------------------------------------------

-- view for link
drop view link;
create view link as
select *
from links
order by euclidean
limit 1000;

-- view for node
create view nodes as
select * from node;

