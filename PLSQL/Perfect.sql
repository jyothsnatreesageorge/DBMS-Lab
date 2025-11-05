set serveroutput on;
declare
   num number:=&num;
   sum_div number:=0;
   i number:=1;
begin
   while i<num loop
      if mod(num,i)=0 then
         sum_div:=sum_div+i;
      end if;
      i:=i+1;
   end loop;
   if sum_div=num then
      dbms_output.put_line(num||' is a perfect number ');
   else
      dbms_output.put_line(num||' is not a perfect number ');
   end if;
end;
/
