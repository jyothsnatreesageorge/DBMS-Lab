set serveroutput on;
declare
   str_input varchar2(100):='&str_input';
   str_clean varchar2(100);
   str_rev varchar2(100);
begin
   str_clean:=upper(replace(str_input,' ',''));
   str_rev:='';
   for i in reverse 1..length(str_clean) loop
      str_rev:=str_rev||substr(str_clean,i,1);
   end loop;
   if str_clean=str_rev then
      dbms_output.put_line('Palindrome');
   else
      dbms_output.put_line('Not Palindrome');
   end if;
end;
/
