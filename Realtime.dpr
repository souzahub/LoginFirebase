program Realtime;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Firebase.Auth in 'Firebase\Firebase.Auth.pas',
  Firebase.Database in 'Firebase\Firebase.Database.pas',
  Firebase.Interfaces in 'Firebase\Firebase.Interfaces.pas',
  Firebase.Request in 'Firebase\Firebase.Request.pas',
  Firebase.Response in 'Firebase\Firebase.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
