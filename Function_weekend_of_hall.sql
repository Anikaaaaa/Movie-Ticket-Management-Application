create function weekend_hall(@hall_id int)
returns int
as
begin
declare @weekend int
set @weekend = (select TOP 1 weekend_id 
from weekend_list w
INNER JOIN cinema_hall c ON c.cinema_hall_id = w.cinema_hall_id
where c.cinema_hall_id = @hall_id)
return @weekend 
end


select dbo.weekend_hall(4)