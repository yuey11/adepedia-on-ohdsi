--Input location table data to formal OHDSI CDM database from public_temp schema.
--The public schema is the OHDSI CDM database.
--All the data in temporary schema could be inputted into the OHDSI CDM table whether there have been some data in the database or not.


set search_path = public_temp;

with cte1 as
(
	select count(*) as qu from public.location
)
insert into public.location(location_id, location_source_value)
(select location_id + cte1.qu, location_source_value from public_temp.location, cte1)

