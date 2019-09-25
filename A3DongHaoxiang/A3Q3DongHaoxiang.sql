create or replace function generateEmail (cname integer)
returns varchar
as $$
declare
fna varchar;
lna varchar;
place varchar;
re varchar;
sc varchar;
ag CURSOR IS SELECT * FROM agents;
co CURSOR IS SELECT * FROM agents, country, university
  where country.cid = agents.cid and cname = agents.aid and university.uid = agents.uid;
c1 CURSOR IS SELECT * FROM agents, university
  where cname = agents.aid and university.uid = agents.uid;
begin
  FOR vc2 in co LOOP
    lna = vc2.lname;
    fna = vc2.fname;
    place = vc2.name;

  END LOOP;

  FOR vc2 in c1 LOOP
    sc= vc2.name;

  END LOOP;


  if sc = 'BROCK' THEN
    sc = 'brocku';

  end if;

  if sc = 'GUELPH' THEN
    sc = 'uoguelph';

  end if;

  if sc = 'WINDSOR' THEN
    sc = 'uwindsor';

  end if;
  if sc = 'SHERBROOKE' THEN
    sc = 'usherbrooke';

  end if;
  if sc = 'TRENT' THEN
    sc = 'trentu';

  end if;

  if sc = 'TORONTO' THEN
    sc = 'utoronto';

  end if;






  re = lower(fna) || '.' || lower(lna) || '.' || lower(place) || '@' || sc || '.ca';
  return re;
end;
$$
language plpgsql;
