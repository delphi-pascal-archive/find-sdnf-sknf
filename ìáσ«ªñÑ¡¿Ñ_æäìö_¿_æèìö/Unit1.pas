unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, Menus, ExtCtrls,unit3, ToolWin,
  ImgList, XPMan;

type
  TForm1 = class(TForm)
    Tool1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    Tree1: TTreeView;
    GroupBox1: TGroupBox;
    Grid1: TStringGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    Button4: TButton;
    Label4: TLabel;
    Button5: TButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    XPManifest1: TXPManifest;
    Edit2: TEdit;
    procedure Tree1Change(Sender: TObject; Node: TTreeNode);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:array [0..18] of string =('xyz','not(x)yz','not(x)not(y)z','not(x)not(y)not(z)',
  'not(x)ynot(z)','xnot(y)z','xynot(z)','xnot(y)not(z)','xy','xz','yz','not(x)y',
  'xnot(y)','not(x)z','xnot(z)','not(y)z','not(x)not(y)','not(x)not(z)','not(y)not(z)');

implementation

{$R *.dfm}
procedure pxyz(Grid1: TStringGrid; k:integer; j:integer);
begin
 case k of
 0:
 begin  //xyz
  for k := 1 to Grid1.ColCount - 1 do
  if k=1 then Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 1:
  begin  //not(x)yz
  for k := 1 to Grid1.ColCount - 1 do
  if k=5 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 2:
  begin  //not(x)not(y)z
  for k := 1 to Grid1.ColCount - 1 do
  if k=7 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 3:
  begin  //not(x)not(y)not(z)
  for k := 1 to Grid1.ColCount - 1 do
     if k=8 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 4:
  begin  //not(x)ynot(z)
  for k := 1 to Grid1.ColCount - 1 do
     if k=6 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 5:
  begin  //xnot(y)z
  for k := 1 to Grid1.ColCount - 1 do
    if k=3 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 6:
  begin  //xynot(z)
  for k := 1 to Grid1.ColCount - 1 do
     if k=2 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 7:
  begin  //xnot(y)not(z)
  for k := 1 to Grid1.ColCount - 1 do
     if k=4 then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 8:
  begin  //xy
  for k := 1 to Grid1.ColCount - 1 do
     if (k=1) or (k=2) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 9:
  begin  //xz
  for k := 1 to Grid1.ColCount - 1 do
  begin
   if (k=1) or (k=3) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
  end;
 end;
 10:
  begin  //yz
  for k := 1 to Grid1.ColCount - 1 do
     if (k=1) or (k=5) then
   Grid1.Cells[j,k]:='1'  else
   Grid1.Cells[j,k]:='0';
 end;
 11:
  begin  //not(x)y
  for k := 1 to Grid1.ColCount - 1 do
     if (k=5) or (k=6) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 12:
  begin  //xnot(y)
  for k := 1 to Grid1.ColCount - 1 do
     if (k=3) or (k=4) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 13:
  begin  //not(x)z
  for k := 1 to Grid1.ColCount - 1 do
    if (k=5) or (k=7) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 14:
  begin  //xnot(z)
  for k := 1 to Grid1.ColCount - 1 do
     if (k=2) or (k=4) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 15:
  begin  //not(y)z
  for k := 1 to Grid1.ColCount - 1 do
     if (k=3) or (k=7) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 16:
  begin  //not(x)not(y)
  for k := 1 to Grid1.ColCount - 1 do
    if (k=7) or (k=8) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 17:
  begin  //not(x)not(z)
  for k := 1 to Grid1.ColCount - 1 do
     if (k=6) or (k=8) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 18:
  begin  //not(y)not(z)
  for k := 1 to Grid1.ColCount - 1 do
    if (k=4) or (k=8) then
   Grid1.Cells[j,k]:='1' else
   Grid1.Cells[j,k]:='0';
 end;
 end;
end;


procedure pnotx(Grid1: TStringGrid; j:integer);
var
 i:integer;
begin
 for i := 1 to 5 do
 Grid1.Cells[j,i]:='0';
 for i := 5 to Grid1.ColCount - 1 do
 Grid1.Cells[j,i]:='1';
end;

//x
procedure px(Grid1: TStringGrid);
var
 j:integer;
begin
 for j:= 1 to 5 do Grid1.Cells[0,j]:='1';
 for j:= 5 to Grid1.ColCount - 1 do Grid1.Cells[0,j]:='0';
end;

//z
procedure pz(Grid1: TStringGrid);
var
 i:integer;
begin
 for i := 1 to Grid1.ColCount - 1 do
  if i mod 2=0 then Grid1.Cells[2,i]:='0'
  else Grid1.Cells[2,i]:='1';
end;

//y
procedure py(Grid1: TStringGrid);
var
 i:integer;
begin
 for i := 1 to 2 do
  Grid1.Cells[1,i]:='1';
 for i := 3 to 5 do
  Grid1.Cells[1,i]:='0';
 for i := 5 to 7 do
  Grid1.Cells[1,i]:='1';
 for i := 7 to 9 do
  Grid1.Cells[1,i]:='0';
end;

//pnotz
procedure pnotz(Grid1: TStringGrid; j:integer);
var
i:integer;
begin
 for i := 1 to Grid1.ColCount - 1 do
  if i mod 2=0 then Grid1.Cells[j,i]:='1'
  else Grid1.Cells[j,i]:='0';
end;

//noty
procedure pnoty(Grid1: TStringGrid; j:integer);
var
 i:integer;
begin
 for i := 1 to 2 do
  Grid1.Cells[j,i]:='0';
 for i := 3 to 5 do
  Grid1.Cells[j,i]:='1';
 for i := 5 to 7 do
  Grid1.Cells[j,i]:='0';
 for i := 7 to 9 do
  Grid1.Cells[j,i]:='1';
end;

//f
procedure pfunkcia(Grid1: TStringGrid);
var
 i,j:integer;
 begin
  for i:=1 to Grid1.ColCount - 1 do
   for j := 5 to Grid1.RowCount - 2 do
   begin
    Grid1.Cells[Grid1.ColCount - 1,0]:='f';
    if Grid1.Cells[j,i]='1' then Grid1.Cells[Grid1.ColCount-1,i]:='1';
    if (Grid1.Cells[1,2]='1') and (Grid1.Cells[Grid1.ColCount-1,i]='') then Grid1.Cells[Grid1.ColCount-1,i]:='0';
   end;
end;


procedure TForm1.Tree1Change(Sender: TObject; Node: TTreeNode);
begin
try
  if Tree1.Items.Item[1].Selected=true then
   Edit1.SelText:=Edit1.SelText + ' and ';
  if Tree1.Items.Item[2].Selected=true then
   Edit1.SelText:=Edit1.SelText + ' or ';
  if Tree1.Items.Item[3].Selected=true then
    Edit1.SelText:=Edit1.SelText + ' not() ';
  except
  exit;
 end; 
end;


procedure TForm1.Button1Click(Sender: TObject);
var
 st:string;
 i,k,j,n:integer;
begin
 Edit2.Text:='';
   //проверка на наличие элементов
 begin

 for i:=0 to Grid1.ColCount - 1 do  //проверка на наличие элементов
 begin
 if Grid1.Cells[i,0]='x' then
  px(Grid1);
 if Grid1.Cells[i,0]='y' then
  py(Grid1);
 if Grid1.Cells[i,0]='z' then
  pz(Grid1);
 if (Grid1.Cells[i,0]='not x') or (Grid1.Cells[i,0]='not(x)') then
  pnotx(Grid1,i);
 if (Grid1.Cells[i,0]='not y') or (Grid1.Cells[i,0]='not(y)') then
  pnoty(Grid1,i);
 if (Grid1.Cells[i,0]='not z') or (Grid1.Cells[i,0]='not(z)') then
  pnotz(Grid1,i);
 for j:=0 to Grid1.ColCount - 1 do
 for k:=0 to 18 do
 if Grid1.Cells[j,0]=a[k] then
 pxyz(Grid1,k,j);
 end;

 //конечный столбец
 pfunkcia(Grid1);

 //вычисление формулы
 for i := 1 to Grid1.ColCount - 1 do
  begin
   if Grid1.Cells[Grid1.ColCount - 1,i]='1' then
   begin
   for k:=0 to 2 do
   begin
    if Grid1.Cells[k,i]='1' then Edit2.Text:=Edit2.Text+Grid1.Cells[k,0] else
    if Grid1.Cells[k,i]='0' then Edit2.Text:=Edit2.Text+'not('+Grid1.Cells[k,0]+')';
   end;
   Edit2.Text:=Edit2.Text+' or ';
   end;
  end;
  st:=Edit2.Text;
  delete(st,length(st)-2,3);
  Edit2.Text:=st;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);  //clear
var
 j,i:integer;
begin
for i:= 0 to Grid1.RowCount - 1 do
 for j:= 0 to Grid1.ColCount - 1 do Grid1.Cells[i,j]:='';
 Edit2.Text:='';
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
 Form3.Show;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 Form3.Show;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
 Button1.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Grid1.ColCount:=Grid1.ColCount + 1;   //del
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Grid1.ColCount:=Grid1.ColCount - 1;    //add
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Form1.Close; // close program
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
 Form1.Close;  // close program
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
 Button2.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Grid1.Cells[0,0]:='x';
 Grid1.Cells[1,0]:='y';
 Grid1.Cells[2,0]:='z';
 Grid1.Cells[3,0]:='not x';
 Grid1.Cells[4,0]:='not z';
 Grid1.Cells[5,0]:='xz';
 Grid1.Cells[6,0]:='not(x)not(z)';
 Grid1.Cells[7,0]:='not(x)yz';
 Grid1.Cells[Grid1.ColCount - 1,0]:='f';
end;

end.

