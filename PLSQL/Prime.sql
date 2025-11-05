set serveroutput on;
declare
   num number:= &num;
   i number:=2;
   is_prime boolean:= true;
begin
   if num<=1 then
      is_prime:= false;
   else
         while i<num loop
         if mod(num,i)=0 then
            is_prime:=false;
            exit;
         end if;
         i:=i+1;
         end loop;
   end if;
   if is_prime then
      dbms_output.put_line(num||' is a prime number ');
   else
      dbms_output.put_line(num||' is not a prime number ');
   end if;
end;
/
