unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uniGUIBaseClasses,
  uniGUIClasses, uniEdit, Vcl.ExtCtrls, Vcl.Mask ;

type
  TFrmPrincipal = class(TForm)
    edtEmail: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    memoResp: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    edtNode: TEdit;
    Label6: TLabel;
    edtKey: TEdit;
    Button3: TButton;
    Label7: TLabel;
    edtDomain: TEdit;
    edtToken: TEdit;
    Button4: TButton;
    Label13: TLabel;
    btCadProduto: TButton;
    Label14: TLabel;
    Panel1: TPanel;
    edNome: TEdit;
    edCod: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edEmail: TEdit;
    edTipo: TEdit;
    Label12: TLabel;
    edSenha: TEdit;
    Label11: TLabel;
    Label15: TLabel;
    Panel2: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    edNomeProd: TEdit;
    edCodProd: TEdit;
    edValorProd: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Cli(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btCadProdutoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  System.JSON,
  System.Net.HttpClient,
  System.Generics.Collections,
  System.JSON.Types,
  System.JSON.Writers;

{$R *.dfm}

procedure TFrmPrincipal.btCadProdutoClick(Sender: TObject);
var
    ADatabase: TFirebaseDatabase;
    AResponse: IFirebaseResponse;
    JSONReq: TJSONObject;
    JSONResp: TJSONValue;
    Writer: TJsonTextWriter;
    StringWriter: TStringWriter;
begin
  edtNode.Text := '/produto';
  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;


  Writer.WriteStartObject;
  Writer.WritePropertyName(edCodProd.Text);

  Writer.WriteStartObject;
  Writer.WritePropertyName('cod');
  Writer.WriteValue(edCodProd.Text);
  Writer.WritePropertyName('nome produto');
  Writer.WriteValue(edNomeProd.Text);
  Writer.WritePropertyName('valor');
  Writer.WriteValue(edValorProd.Text);

  Writer.WriteEndObject;

  Writer.WriteEndObject;

  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  memoResp.Text := StringWriter.ToString;


  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  try
    AResponse := ADatabase.Post([edtNode.Text + '.json'], JSONReq); // envia os dados
//    AResponse := ADatabase.Put([edtNode.Text + '.json'], JSONReq);  // altera a estrutura inteira
//    AResponse := ADatabase.Patch([edtNode.Text + '.json'], JSONReq); // editar
//    AResponse := ADatabase.Delete([edtNode.Text + '.json']);


    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    memoResp.Text := JSONResp.ToString;
  finally
    ADatabase.Free;
  end;

  edCodProd.Text := '';
  edNomeProd.Text := '';
  edValorProd.Text := '';

end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  Auth: IFirebaseAuth;
  AResponse: IFirebaseResponse;
  JSONResp: TJSONValue;
  Obj: TJSONObject;
begin
  Auth := TFirebaseAuth.Create;
  Auth.SetApiKey(edtKey.Text);
  AResponse := Auth.SignInWithEmailAndPassword(edtEmail.Text, edtPassword.Text);
  JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
  if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
  begin
    if Assigned(JSONResp) then
    begin
      JSONResp.Free;
    end;
    Exit;
  end;
  Obj := JSONResp as TJSONObject;
  Obj.Values['idToken'].Value;
  edtToken.Text := Obj.Values['idToken'].Value;
//  memoToken.Lines.Add(JSONResp.ToString);
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
var
  ADatabase: TFirebaseDatabase;
  AResponse: IFirebaseResponse;
  AParams: TDictionary<string, string>;
  JSONResp: TJSONValue;

begin
  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  memoResp.Lines.Clear;

  AParams := TDictionary<string, string>.Create;
  try
//    AParams.Add('orderBy', '"$key"'); // FILTRO DIRECIONADA ESPECIFICA
//    AParams.Add('orderBy', '"cod"'); // FILTRO DIRECIONADA ESPECIFICA POR COD ( TIPO INTEIRO = '', TIPO STRING = ""
//    AParams.Add('limitToLast', '2'); // FILTRA POR LIMITE
//    AParams.Add('equalTo', '1');
//    AParams.Add('startAt', '"2"');// FILTRO DIRECIONADA DE UM VALOR ATE O OUTRO
//    AParams.Add('endAt', '"4"'); // FILTRO DIRECIONADA DE UM VALOR ATE O OUTRO

    AResponse := ADatabase.Get([edtNode.Text + '.json'], AParams);
    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);

    memoResp.Lines.Add(AResponse.ContentAsString);

    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    //memoResp.Lines.Add(JSONResp.ToString);
  finally
    AParams.Free;
    ADatabase.Free;
  end;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
var
    ADatabase: TFirebaseDatabase;
    AResponse: IFirebaseResponse;
    JSONReq: TJSONObject;
    JSONResp: TJSONValue;
    Writer: TJsonTextWriter;
    StringWriter: TStringWriter;

begin
  edtNode.Text := '/usuario';
  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;

  //     {"6": {"cod": 6, "descricao": "Fone ouvido"} }
//       {"2": {"cod":1,"nome":"luan","senha":123,"tipo":"gmail"}]

  Writer.WriteStartObject;
  Writer.WritePropertyName(edCod.Text);

  Writer.WriteStartObject;
  Writer.WritePropertyName('cod');
  Writer.WriteValue(edCod.Text);
  Writer.WritePropertyName('nome');
  Writer.WriteValue(edNome.Text);
  Writer.WritePropertyName('email');
  Writer.WriteValue(edEmail.Text);
  Writer.WritePropertyName('tipo');
  Writer.WriteValue(edTipo.Text);
  Writer.WritePropertyName('senha');
  Writer.WriteValue(edSenha.Text);
  Writer.WritePropertyName('user');
  Writer.WriteValue('luan');

  Writer.WriteEndObject;

  Writer.WriteEndObject;

  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  memoResp.Text := StringWriter.ToString;


  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  try
    AResponse := ADatabase.Post([edtNode.Text + '.json'], JSONReq); // envia os dados
//    AResponse := ADatabase.Put([edtNode.Text + '.json'], JSONReq);  // altera a estrutura inteira
//    AResponse := ADatabase.Patch([edtNode.Text + '.json'], JSONReq); // editar
//    AResponse := ADatabase.Delete([edtNode.Text + '.json']);


    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    memoResp.Text := JSONResp.ToString;
  finally
    ADatabase.Free;
  end;

  edCod.Text := '';
  edNome.Text := '';
  edEmail.Text := '';
  edTipo.Text := '';
  edSenha.Text := '';

end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
var
    ADatabase: TFirebaseDatabase;
    AResponse: IFirebaseResponse;
    JSONReq: TJSONObject;
    JSONResp: TJSONValue;
    Writer: TJsonTextWriter;
    StringWriter: TStringWriter;
begin

  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;

 //     {"6": {"cod": 6, "descricao": "Fone ouvido"} }
//      {"2": {"cod":1,"nome":"luan","senha":123,"tipo":"gmail"}]
  Writer.WriteStartObject;
  Writer.WritePropertyName('2');
  Writer.WriteStartObject;
  Writer.WritePropertyName('cod');
  Writer.WriteValue('2');
  Writer.WritePropertyName('nome');
  Writer.WriteValue('lucio');
  Writer.WritePropertyName('senha');
  Writer.WriteValue('1');
  Writer.WritePropertyName('tipo');
  Writer.WriteValue('gmail');
  Writer.WriteEndObject;

  Writer.WriteEndObject;



  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  memoResp.Text := StringWriter.ToString;


  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  try
//    AResponse := ADatabase.Post([edtNode.Text + '.json'], JSONReq);
//    AResponse := ADatabase.Put([edtNode.Text + '.json'], JSONReq);
//    AResponse := ADatabase.Patch([edtNode.Text + '.json'], JSONReq);
    AResponse := ADatabase.Delete([edtNode.Text + '.json']);


    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    memoResp.Text := JSONResp.ToString;
  finally
    ADatabase.Free;
  end;
end;

procedure TFrmPrincipal.Button5Cli(Sender: TObject);
var
    ADatabase: TFirebaseDatabase;
    AResponse: IFirebaseResponse;
    JSONReq: TJSONObject;
    JSONResp: TJSONValue;
    Writer: TJsonTextWriter;
    StringWriter: TStringWriter;
begin

  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Writer.Formatting := TJsonFormatting.None;

  //     {"6": {"cod": 6, "descricao": "Fone ouvido"} }
//       {"2": {"cod":1,"nome":"luan","senha":123,"tipo":"gmail"}]


  Writer.WriteStartObject;
  Writer.WritePropertyName('2');
  Writer.WriteStartObject;
  Writer.WritePropertyName('cod');
  Writer.WriteValue('2');
  Writer.WritePropertyName('nome');
  Writer.WriteValue('lucio');
  Writer.WritePropertyName('senha');
  Writer.WriteValue('1');
  Writer.WritePropertyName('tipo');
  Writer.WriteValue('gmail');
  Writer.WriteEndObject;

  Writer.WriteEndObject;



  JSONReq := TJSONObject.ParseJSONValue(StringWriter.ToString) as TJSONObject;

  memoResp.Text := StringWriter.ToString;


  ADatabase := TFirebaseDatabase.Create;
  ADatabase.SetBaseURI(edtDomain.Text);
  ADatabase.SetToken(edtToken.Text);
  try
    AResponse := ADatabase.Post([edtNode.Text + '.json'], JSONReq);
    //AResponse := ADatabase.Put([edtNode.Text + '.json'], JSONReq);
    //AResponse := ADatabase.Patch([edtNode.Text + '.json'], JSONReq);
    // AResponse := ADatabase.Delete([edtNode.Text + '.json']);


    JSONResp := TJSONObject.ParseJSONValue(AResponse.ContentAsString);
    if (not Assigned(JSONResp)) or (not(JSONResp is TJSONObject)) then
    begin
      if Assigned(JSONResp) then
      begin
        JSONResp.Free;
      end;
      Exit;
    end;
    memoResp.Text := JSONResp.ToString;
  finally
    ADatabase.Free;
  end;


end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
 Button1Click(Sender);
end;

end.
