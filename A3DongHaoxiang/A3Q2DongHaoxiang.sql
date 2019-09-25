create or replace function find_max_commission (cname integer)
returns integer
as $$
declare
na integer;
c1 CURSOR IS SELECT * FROM agents;
begin

  SELECT commission into na FROM agents
  WHERE aid = cname;

  if not found then
    raise notice '%','Invalid agent id. Valid agent ids are:';
    FOR vc2 in c1 LOOP
      raise notice '%:% %',vc2.aid,vc2.fname,vc2.lname;

    END LOOP;
    raise EXCEPTION '%','Invalid agent id';

  else
    return na;
  end if;



end;
$$
language plpgsql;
