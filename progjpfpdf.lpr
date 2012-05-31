program progjpfpdf;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, libjpfpdf, sysutils;

var
  JPFpdf1: TJPFpdf;
  i,i2: Integer;
  st: string;
  t: TStrings;
begin
  st := '';
  JPFpdf1 := TJPFpdf.Fpdf;
  t := TStringList.Create;
  t.LoadFromFile(ExtractFilePath(ParamStr(0))+'20k_c1.txt');
  with JPFpdf1 do begin
    Open;
    AddPage;
    SetFont('Times','B',12);
    Cell(0, 10, 'TEXTO JUSTIFICADO','0',0,'C',0);
    Ln(20);
    SetFont('Times','',12);
    MultiCell(0, 5, t.Text);
    AddPage();
    SetFont('arial','B',16);
    Cell(40,10,'Free Jpdf Pascal','0',0,'',0);
    Ln(0);
    SetFont('courier','B',16);
    SetTextColor(98,147,199);
    Cell(80,10,'Free Jpdf Pascal','0',0,'',0);
    Line(90,10,100,100);
    SetFillColor(177,32,10);
    Rect(50,50,100,100,'F');
    SetFont('Times','BI',40);
    SetTextColor(92,255,102);
    Text(20,180,'PDF para Free Pascal Web');
    AddPage();
    SetFont('arial','B',16);
    Cell(40,10,'Free Jpdf Pascal','0',0,'',0);
    Ln(0);
    SetFont('courier','BI',16);
    Cell(80,10,'Free Jpdf Pascal','0',0,'',0);
    AddPage();
    SetFont('arial','B',16);
    Cell(40,10,'Free Jpdf Pascal','0',0,'',0);
    Ln(0);
    SetFont('courier','B',16);
    Cell(80,10,'Free Jpdf Pascal','0',0,'',0);
    Output(GetUserDir + '/JPFpdfTESTE.pdf');
  end;
end.

