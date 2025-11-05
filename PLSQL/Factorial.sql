set serveroutput on;
declare
   num number:=&num;
   fact number:=1;
   i number;
begin
   if num<0then
      dbms_output.put_line('Factorial not available for negative numbers');
   else
      i:=1;
      while i<=num loop
         fact:=fact*i;
         i:=i+1;
      end loop;
      dbms_output.put_line('Factorial of '||num||' is '||fact);
   end if;
end;
/
