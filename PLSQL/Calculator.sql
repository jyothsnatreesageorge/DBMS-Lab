set serveroutput on;
declare
   num1 number:=&num1;
   num2 number:=&num2;
   op char:='&op';
   result number;
begin
   if op ='+' then
      result:=num1 + num2;
   elsif op ='-' then
      result:=num1 - num2;
   elsif op ='*' then
      result:=num1 * num2;
   elsif op ='/' then
      if num2=0 then
         dbms_output.put_line('Divison not possible');
         return;
      else
         result:=num1 / num2;
      end if;
   else
      dbms_output.put_line('Invalid operation');
      return;
   end if;
   dbms_output.put_line('Result: '||result);
end;
/
