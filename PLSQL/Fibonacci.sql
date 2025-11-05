set serveroutput on;
declare
   n number:=&num;
   first number:=0;
   second number:=1;
   next number;
   i number:=1;
begin
   if n<=0 then
      dbms_output.put_line('Enter a positive number');
   else
      dbms_output.put_line('Fibonacci series ');
      dbms_output.put_line(first||' ');
      while i<n loop
         dbms_output.put_line(second||' ');
         next:=first+second;
         first:=second;
         second:=next;
         i:=i+1;
      end loop;
   end if;
   dbms_output.put_line(' ');
end;
/
