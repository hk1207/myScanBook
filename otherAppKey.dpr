program otherAppKey;

uses
  Vcl.Forms,
  otherAppKeyMain in 'otherAppKeyMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
