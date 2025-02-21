set serveroutput ON;
create or replace function computeArea(radius number) return number is

	pi constant number := 3.14;
	c_area number;
begin
	c_area := pi * radius * radius;
	return c_area;
end;
/