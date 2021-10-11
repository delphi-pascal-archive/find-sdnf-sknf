unit Unit2;

interface

uses Dialogs;

type
  fun = function(x, y: real): real;

  evalvec = ^evalobj;
  evalobj = object
    f1, f2: evalvec;
    f1x, f2y: real;
    f3: fun;
    function eval: real;
    function eval1d(x: real): real;
    function eval2d(x, y: real): real;
    function eval3d(x, y, z: real): real;
    constructor init(st: string);
    destructor done;
  end;
var
  evalx, evaly, evalz: real;

implementation

var
  analysetmp: fun;

{function IsLetter(c:char):boolean;
begin
   result:=((c>='a')and(c<='z'))or(c='_');
end;

function IsDigit(c:char):boolean;
begin
   result:=(c>='0')and(c<='9')or(c='-')or(c='_');
end;}

function search(text, code: string; var pos: integer): boolean;
var
  i, count: integer;
  flag: boolean;
  newtext: string;
begin
  if length(text) < length(code) then
  begin
    search := false;
    exit;
  end;
  flag := false;
  pos := length(text) - length(code) + 1;
  repeat
    if code = copy(text, pos, length(code)) then
      flag := true
    else
      dec(pos);
    if flag then
    begin
      count := 0;
      for i := pos + 1 to length(text) do
      begin
        if copy(text, i, 1) = '(' then
          inc(count);
        if copy(text, i, 1) = ')' then
          dec(count);
      end;
      if count <> 0 then
      begin
        dec(pos);
        flag := false;
      end;
    end;
  until (flag = true) or (pos = 0);
  search := flag;
end;

function myid(x, y: real): real;
begin
  myid := x;
end;

function myunequal(x, y: real): real;
begin
  if x <> y then
    myunequal := 1
  else
    myunequal := 0;
end;

function mylessequal(x, y: real): real;
begin
  if x <= y then
    mylessequal := 1
  else
    mylessequal := 0;
end;

function mygreater(x, y: real): real;
begin

  if x > y then
    mygreater := 1
  else
    mygreater := 0;
end;

function myless(x, y: real): real;
begin

  if x < y then
    myless := 1
  else
    myless := 0;
end;

function myequal(x, y: real): real;
begin

  if x = y then
    myequal := 1
  else
    myequal := 0;
end;

function myor(x, y: real): real;
begin
  myor := trunc(x) or trunc(y);
end;

function mymult(x, y: real): real;
begin
  mymult := x * y;
end;

function myand(x, y: real): real;
begin
  myand := trunc(x) and trunc(y);
end;

function mydiv(x, y: real): real;
begin
  mydiv := trunc(x) div trunc(y);
end;

function mynot(x, y: real): real;
begin
  mynot := not trunc(x);
end;

function myint(x, y: real): real;
begin
  myint := int(x);
end;

function myrnd(x, y: real): real;
begin
  myrnd := random;
end;

function myrandom(x, y: real): real;
begin
  myrandom := random(trunc(x));
end;

function myevalx(x, y: real): real;
begin
  myevalx := evalx;
end;

function myevalnotx(x, y: real): real;
begin
  myevalnotx := -1;
end;

function myevaly(x, y: real): real;
begin
  myevaly := evaly;
end;

function myevalz(x, y: real): real;
begin
  myevalz := evalz;
end;

procedure analyse(st: string; var st2, st3: string);
label
  start;
var
  pos: integer;
  value: real;
  newterm, term: string;
begin
  term := st;
  start:
  if term = '' then
  begin
    analysetmp := myid;
    st2 := '0';
    st3 := '';
    exit;
  end;
  newterm := '';
  for pos := 1 to length(term) do
    if copy(term, pos, 1) <> ' ' then
      newterm := newterm + copy(term, pos, 1);
  term := newterm;
  if term = '' then
  begin
    analysetmp := myid;
    st2 := '0';
    st3 := '';
    exit;
  end;
  val(term, value, pos);
  if pos = 0 then
  begin
    analysetmp := myid;
    st2 := term;
    st3 := '';
    exit;
  end;
  if search(term, '<>', pos) then
  begin
    analysetmp := myunequal;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 2, length(term) - pos - 1);
    exit;
  end;
  if search(term, '<=', pos) then
  begin
    analysetmp := mylessequal;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 2, length(term) - pos - 1);
    exit;
  end;
  if search(term, '>=', pos) then
  begin
    //analysetmp := mygreaterequal;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 2, length(term) - pos - 1);
    exit;
  end;
  if search(term, '>', pos) then
  begin
    analysetmp := mygreater;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 1, length(term) - pos);
    exit;
  end;
  if search(term, '<', pos) then
  begin
    analysetmp := myless;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 1, length(term) - pos);
    exit;
  end;
  if search(term, '=', pos) then
  begin
    analysetmp := myequal;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 1, length(term) - pos);
    exit;
  end;
  if search(term, 'or', pos) then
  begin
    analysetmp := myor;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 2, length(term) - pos - 1);
    exit;
  end;
  if search(term, '*', pos) then
  begin
    analysetmp := mymult;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 1, length(term) - pos);
    exit;
  end;
  if search(term, 'and', pos) then
  begin
    analysetmp := myand;
    st2 := copy(term, 1, pos - 1);
    st3 := copy(term, pos + 3, length(term) - pos - 2);
    exit;
  end;
  if copy(term, 1, 1) = '(' then
  begin
    term := copy(term, 2, length(term) - 2);
    goto start;
  end;
  if copy(term, 1, 3) = 'not' then
  begin
    analysetmp := mynot;
    st2 := copy(term, 4, length(term) - 3);
    st3 := '';
    exit;
  end;
  if copy(term, 1, 3) = 'int' then
  begin
    analysetmp := myint;
    st2 := copy(term, 4, length(term) - 3);
    st3 := '';
    exit;
  end;
  if term = 'x' then
  begin
    analysetmp := myevalx;
    st2 := '';
    st3 := '';
    exit;
  end;
  if term = 'y' then
  begin
    analysetmp := myevaly;
    st2 := '';
    st3 := '';
    exit;
  end;
  if term = 'z' then
  begin
    analysetmp := myevalz;
    st2 := '';
    st3 := '';
    exit;
  end;
  showmessage(' ÂÍÈÌÀÍÈÅ : ÍÅÄÅÊÎÄÈÐÓÅÌÀß ÔÎÐÌÓËÀ! ');
  analysetmp := myid;
  st2 := '';
  st3 := '';
end;

function evalobj.eval: real;
var
  tmpx, tmpy: real;
begin

  if f1 = nil then
    tmpx := f1x
  else
    tmpx := f1^.eval;
  if f2 = nil then
    tmpy := f2y
  else
    tmpy := f2^.eval;
  eval := f3(tmpx, tmpy);
end;

function evalobj.eval1d(x: real): real;
begin
  evalx := x;
  evaly := 0;
  evalz := 0;
  eval1d := eval;
end;

function evalobj.eval2d(x, y: real): real;
begin
  evalx := x;
  evaly := y;
  evalz := 0;
  eval2d := eval;
end;

function evalobj.eval3d(x, y, z: real): real;
begin
  evalx := x;
  evaly := y;
  evalz := z;
  eval3d := eval;
end;

constructor evalobj.init(st: string);
var
  st2, st3: string;
  error: integer;
begin
  f1 := nil;
  f2 := nil;
  analyse(st, st2, st3);
  f3 := analysetmp;
  val(st2, f1x, error);
  if st2 = '' then
  begin
    f1x := 0;
    error := 0;
  end;
  if error <> 0 then
    new(f1, init(st2));
  val(st3, f2y, error);
  if st3 = '' then
  begin
    f2y := 0;
    error := 0;
  end;
  if error <> 0 then
    new(f2, init(st3));
end;

destructor evalobj.done;
begin
  if f1 <> nil then

    dispose(f1, done);
  if f2 <> nil then
    dispose(f2, done);
end;

end.
 