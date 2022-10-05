﻿unit TTTypes;
interface

const n = 100;

s3 = ' должно соответствовать установленному формату';
s4 = ' разделителем должна быть точка';
s5 = ' значение года должно входить в область допустимых значений [2015;2022]';
s6 = ' значение месяца должно входить в область допустимых значений [1;12]';
s7 = ' неуникальные данные, переход к следующей строке';
s8 = ' встречен недопустимый символ';
s9 = ' введено значение,превышающее верхнюю границу допустимого интервала [1..100]';
s10 = ' введено значение, не достигающее нижнюю границу интервала [1..100]';
s11 = ' значение дня должно входить в область допустимых значений [1;31], установленных для этого месяца и этого года';
s12 = ' значение дня должно входить в область допустимых значений [1;30], установленных для этого месяца и этого года';
s13 = ' должно соответствовать одному из трёх возможных вариантов {s(secondary)/f(further)/h(higher)}';
s14 = ' введено значение,превышающее верхнюю границу допустимого интервала [1..50 ]';
s15 = ' введено значение, не достигающее нижнюю границу интервала [1..50]';
s16 = ' введено значение,превышающее верхнюю границу допустимого интервала [1000..100000]';
s17 = ' введено значение, не достигающее нижнюю границу интервала [1000..100000]';
s18 = ' введено значение,превышающее верхнюю границу допустимого интервала [28..50]';
s19 = ' введено значение, не достигающее нижнюю границу интервала [28..50]';
s20 = ' значение дня должно входить в область допустимых значений [1;29], установленных для этого месяца и этого года';
s21 = ' значение дня должно входить в область допустимых значений [1;28], установленных для этого месяца и этого года';
s22 = ' Файл Резюме: обработано максимальное количество строк';
s23 = ' Файл Вакансия: обработано максимальное количество строк';
s24 = 'Файл Вакансия: пробел не является разделителем';
s25 = 'Файл Резюме: пробел не является разделителем';

s81 = ' встречены лишние символы после пробела';

type
data = record
  d:byte;
  m:byte;
  y:word;
end;

name = record
  surname: string[20];
  IO: string[4];
end;

type vacancy = record 
 organ: string[20];
 loc: byte; 
 profes: string[20]; 
 educ: string; 
 exper:byte; 
 salar: longword; 
 vacat:byte;
end;

summary = record
  FIO: name;
  date: data;
  profes2: string[20];
  educ2: string;
  exper2: byte;
  salar: longword;
end;

employee = record
  surname: string[20];
  salar: longword;
  organ: string[20];
  loc: byte; 
end;

vacancy_list_v = array[1..n] of vacancy;
vacancy_list_s = array[1..n] of summary;
vacancy_list_e = array[1..n*n] of employee;

implementation

begin
  
end.