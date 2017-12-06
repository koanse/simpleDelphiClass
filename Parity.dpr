program Project1;

{$APPTYPE CONSOLE}
uses
  SysUtils, Classes;

// Класс с информацией о работнике
type
  TWorker = class(TObject)
  public
    name    : string[100];
    post    : string[100];
    year    : Integer;
    salary  : Integer;

  // Декларация конструктора
  constructor Create(name, post: string; year, salary : Integer);
end;

  // Описание конструктора класса
  constructor TWorker.Create(name, post: string; year, salary : Integer);
begin
  self.name := name;
  self.post := post;
  self.year := year;
  self.salary := salary;
end;

var
  size        : Integer;
  myList      : TList;

// Вывод таблицы сотрудников
procedure PrintTable();
var
  i, n: Integer;
  worker: TWorker;
  name, post: string;
  year, salary : Integer;
begin
  for i := 0 to size - 1 do begin
    worker := myList[i];
      begin
        WriteLn(worker.name + '|' + worker.post + '|' +
         IntToStr(worker.year) + '|' + IntToStr(worker.salary));
      end;
  end;
end;


var
  i, n: Integer;
  worker: TWorker;
  name, post: string;
  year, salary : Integer;
  resultList   : TList;
begin
  myList := TList.Create;

  WriteLn('Enter the number of workers:');
  ReadLn(size);

 // Ввод информации о сотрудниках
  for i := 0 to size - 1 do begin

    WriteLn('Enter the element number: ', i);
    WriteLn('Name: ');
    ReadLn(name);
    WriteLn('Post: ');
    ReadLn(post);
    WriteLn('Year: ');
    ReadLn(year);
    WriteLn('Salary: ');
    ReadLn(salary);

    worker := TWorker.Create(name, post, year, salary);
    myList.Add(worker);
  end;

  WriteLn('Before: ');
  PrintTable();

  WriteLn('Enter the post: ');
  ReadLn(post);

  // Фильтрация по должности
  resultList := TList.Create;

  for i := 0 to size - 1 do begin
  worker := myList[i];
  if (worker.post <> post) then
    begin
      resultList.Add(worker);
    end;
  end;

  myList := resultList;

  WriteLn('Enter the new element index: ');
  ReadLn(i);
  WriteLn('Enter the new element: ');
  WriteLn('Name: ');
  ReadLn(name);
  WriteLn('Post: ');
  ReadLn(post);
  WriteLn('Year: ');
  ReadLn(year);
  WriteLn('Salary: ');
  ReadLn(salary);
  worker := TWorker.Create(name, post, year, salary);
  myList.Insert(i, worker);

  WriteLn('After: ');
  PrintTable(); 

  ReadLn;
end.
