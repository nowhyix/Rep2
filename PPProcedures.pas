unit PPProcedures;
interface
uses TTTypes, Chesk1;

procedure read_f(f1:text; var v_l:vacancy_list; var p:byte);
procedure sort(var v_l:vacancy_list; p:byte);
procedure print(var f3:text; v_l:vacancy_list; p:byte);

implementation

procedure read_f(f1:text; var v_l:vacancy_list; var p:byte);
var err_unic :boolean;
    va:vacancy;
    j, i, tmp_err:integer;
    s,s1:string;
    organ,profes,educ: string;
    loc, exper, vacat,state: byte; 
    salar: word; 
    err_loc, err_organ, err_profes, err_educ, err_exper, err_salar, err_vacat :byte;
begin
    i := 0;
    p := 0;
    while (not eof(f1)) and (i <> n) do begin
      readln(f1, s); 
      i := i + 1;
      state := 0;
      if length(s) > 54 then writeln('Файл Вакансия: в строке №',i, s1)
      else if length(s) < 54 then writeln('Файл Вакансия: в строке №',i, s2)
      else 
        begin
        
        organ := copy(s, 1, 20); 
        Ch_org(organ, err_organ);
        case err_organ of
          8:writeln('Файл Вакансия: в строке №',i,' в поле НАИМЕНОВАНИЕ ОРГАНИЗАЦИИ ''',va.organ,'''',s8);
          81:writeln('Файл Вакансия: в строке №',i,' в поле НАИМЕНОВАНИЕ ОРГАНИЗАЦИИ ''',va.organ,'''',s81);
        end;
        
        s1:=copy(s, 21, 3);
        Ch_loc(s1,loc, err_loc);
         case err_loc of
          8:writeln('Файл Вакансия: в строке №',i,' в поле МЕСТОПОЛОЖЕНИЕ ОРГАНИЗАЦИИ ''',s1,'''',s8);
          9:writeln('Файл Вакансия: в строке №',i,' в поле МЕСТОПОЛОЖЕНИЕ ОРАГАНИЗАЦИИ  ''',s1,'''',s9);
          10:writeln('Файл Вакансия: в строке №',i,'в поле МЕСТОПОЛОЖЕНИЕ ОРАГАНИЗАЦИИ  ''',s1,'''',s10);
        end;
          
        profes := copy(s, 24, 20);
        Ch_prof(profes, err_profes);
        case err_profes of
          81:writeln('Файл Вакансия: в строке №',i,' в поле ДОЛЖНОСТЬ ''',va.profes,'''',s81);
          8:writeln('Файл Вакансия: в строке №',i,' в поле ДОЛЖНОСТЬ ''',va.profes,'''',s8);
        end;
      
       educ := copy(s, 44, 1); 
       Ch_edu(educ, err_educ);
       case err_educ of
          13:writeln('Файл Вакансия: в строке №',i,' поле КВАЛИФИКАЦИЯ ''',va.educ,'''',s13);
       end;  
        
        s1:= copy(s, 45, 2);
        Ch_exp(s1,exper,err_exper);
        case err_exper of
          8:writeln('Файл Вакансия: в строке №',i,' в поле СТАЖ РАБОТЫ ''',s1,'''',s8);
          14:writeln('Файл Вакансия: в строке №',i,' в поле СТАЖ РАБОТЫ ''',s1,'''',s14);
          15:writeln('Файл Вакансия: в строке №',i,' в поле СТАЖ РАБОТЫ ''',s1,'''',s15);
        end;
        
        s1:= copy(s, 47, 6); 
        Ch_sal(s1,salar, err_salar);
        case err_exper of
          8:writeln('Файл Вакансия: в строке №',i,' в поле ЗАРПЛАТА ''',s1,'''',s8);
          16:writeln('Файл Вакансия: в строке №',i,' в поле ЗАРПЛАТА ''',s1,'''',s16);
          17:writeln('Файл Вакансия: в строке №',i,' в поле ЗАРПЛАТА ''',s1,'''',s17);
        end;
        
        s1:= copy(s, 53, 2); 
        Ch_vac(s1,vacat, err_vacat);
        case err_exper of
          8:writeln('Файл Вакансия: в строке №',i,' в поле ОТПУСК ''',s1,'''',s8);
          18:writeln('Файл Вакансия: в строке №',i,' в поле ОТПУСК ''',s1,'''',s18);
          19:writeln('Файл Вакансия: в строке №',i,' в поле ОТПУСК ''',s1,'''',s19);
        end;
        
           
        if (err_organ = 0) and (err_loc = 0)and (err_profes = 0)and (err_educ = 0) and (err_exper  = 0) and (err_salar = 0) and (err_vacat = 0) 
        then begin
           va.organ:= organ;
           va.loc:= loc;
           va.profes:= profes;
           va.educ:= educ;
           va.exper:= exper;
           va.salar:= salar;
           va.vacat:= vacat;
         
           
           if ch_unic(va, v_l, p) = true 
           then writeln('Файл Вакансия: в строке №',i,' ' + s7)
           else begin
                p := p + 1;
                v_l[p] := va;
            end
            
     end;
end;
end;
end;
  
procedure sort(var v_l:vacancy_list; p:byte);
var cur:vacancy;
    i, j:integer;
begin
  for i := p downto 2 do 
    for j := 1 to p - 1 do begin
      if v_l[j].salar > v_l[j+1].salar then begin
        cur := v_l[j];
        v_l[j] := v_l[j+1];
        v_l[j+1] := cur; 
      end;
    end;
end;

procedure print(var f3:text; v_l:vacancy_list; p:byte);
var j:integer;
va:vacancy;
begin
  for j := 1 to p do begin
    write(f3, v_l[j].organ + ' ');
    write(f3, v_l[j].loc + ' ');
    write(f3, v_l[j].profes + ' ');
    write(f3, v_l[j].educ + ' ');
    write(f3, v_l[j].exper + ' ');
    write(f3, v_l[j].salar + ' ');
    write(f3, v_l[j].vacat);
    writeln(f3, '');
  end;
end;


begin
  
end.
