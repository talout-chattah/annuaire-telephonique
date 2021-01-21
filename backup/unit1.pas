unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

Type    //definition of the type contact
  contact = record
   FName : string;
   LName : string;
   Number : integer;

  end;

  { TForm1 }

  TForm1 = class(TForm)
    Result: TLabel;
    Search: TButton;
    Add: TButton;
    Delet: TButton;
    SearchSpace: TEdit;
    LNameSP: TEdit;
    FNameSP: TEdit;
    NumberSP: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure AddClick(Sender: TObject);
    procedure DeletClick(Sender: TObject);
    procedure FNameSPChange(Sender: TObject);
    procedure LNameSPChange(Sender: TObject);
    procedure NumberSPChange(Sender: TObject);
    procedure ResultClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure SearchSpaceChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Contacts: Array[1..100]of contact;
  j,i:integer;

implementation

{$R *.lfm}

procedure fill;
begin
  for i:=1 to 100 do              //fill the numbers by 0
  Contacts[i].Number:=0;
end;
{ TForm1 }

procedure TForm1.FNameSPChange(Sender: TObject);
begin

end;

procedure TForm1.LNameSPChange(Sender: TObject);
begin

end;

procedure TForm1.NumberSPChange(Sender: TObject);
begin

end;

procedure TForm1.ResultClick(Sender: TObject);
begin

end;
            //The Search Button Function
procedure TForm1.SearchClick(Sender: TObject);
var v:boolean;
begin


  if(SearchSpace.Text='')then
   begin
      Result.Caption:='Type A Contact';
   end
  else
  begin
   j:=1; v:=False;
  while (j<i) do
  begin

  if(Contacts[j].Number=strtoint(SearchSpace.Text))then

      begin
           v:=True;
      SearchSpace.Text:='';
      FNameSP.Text:=Contacts[j].FName;                     //finding The Contact And Display Him
      LNameSP.Text:=Contacts[j].LName;
      NumberSP.Text:='+2130'+inttostr(Contacts[j].Number);
      break;

      end;
          j:=j+1;
  end;
        //Display If Te Contact Exist Or Not
        if(v=False)then
            begin
            Result.caption:='This Contact Is Not Saved';
            FNameSP.Text:='';
            LNameSP.Text:='';
            NumberSP.Text:='';
            SearchSpace.Text:='';


            end
        else
            begin
            Result.caption:='This Is The Contact'
            end;
   end;
end;

procedure TForm1.SearchSpaceChange(Sender: TObject);
begin

end;

procedure TForm1.AddClick(Sender: TObject);
begin
      if( NumberSP.Text='')then
         begin
          Result.caption:='Type A Contact '
         end
      else
      begin
  //Finding A Blank Place For The New Contact
        i:=1;

   while(Contacts[i].Number<>0)and(i<=100)do
       begin
       i:=i+1;

       end;
  if(i>100) then
      begin
       Result.Caption:='Sorry No Disk Space';

      end
    else
      begin
      Contacts[i].FName:=FNameSP.Text;
      Contacts[i].LName:=LNameSP.Text;
      Contacts[i].Number:= strtoint(NumberSP.Text);
      i:=i+1;
      FNameSP.Text:='';
      LNameSP.Text:='';
      NumberSP.Text:='';

      end;
   end;
end;
procedure TForm1.DeletClick(Sender: TObject);
var k:integer;
begin


  if( NumberSP.Text='')then
      begin
       Result.Caption:='Type A Contact';
      end
  else
      begin
  i:=1; k:=0;
  for i:= 1 to 100 do
     begin
       if(contacts[i].Number=strtoint(NumberSP.Text))then
           begin
              k:=i;
           end;
     end;

  if(k=0)then
      begin
         Result.Caption:='Contact Does Not Exist';
      end
  else
      begin
      Contacts[k].Number:=0;
      FNameSP.Text:='';
      LNameSP.Text:='';
      NumberSP.Text:='';
      Result.Caption:='Contact Has Been Deleted ';
      end;

end;
end;


end.

