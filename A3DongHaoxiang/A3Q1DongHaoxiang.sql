create or replace function numberAgents(cname varchar)
returns integer
as $$
declare
na integer;
begin
SELECT Count(agents.uid) into na FROM agents , university
WHERE university.name = upper(cname)
AND university.uid = agents.uid;

return na;

end;
$$
language plpgsql;
