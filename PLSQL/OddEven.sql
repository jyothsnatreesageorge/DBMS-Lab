set serveroutput on;
declare
   num number := &num;
begin
   if mod(num,2)=0 then
      dbms_output.put_line(num || ' is Even.');
   else
      dbms_output.put_line(num || ' is Odd ');
   end if;
end;
/
