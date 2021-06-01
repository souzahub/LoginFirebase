object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Firebase Authentication Demo'
  ClientHeight = 497
  ClientWidth = 1047
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 7
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label2: TLabel
    Left = 9
    Top = 47
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 9
    Top = 219
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object Label4: TLabel
    Left = 23
    Top = 288
    Width = 47
    Height = 13
    Caption = 'Response'
  end
  object Label5: TLabel
    Left = 8
    Top = 87
    Width = 25
    Height = 13
    Caption = 'Node'
  end
  object Label6: TLabel
    Left = 8
    Top = 131
    Width = 62
    Height = 13
    Caption = 'Firebase Key'
  end
  object Label7: TLabel
    Left = 8
    Top = 173
    Width = 79
    Height = 13
    Caption = 'Firebase Domain'
  end
  object Label13: TLabel
    Left = 321
    Top = 107
    Width = 102
    Height = 13
    Caption = 'DADOS DO USUARIO'
  end
  object Label14: TLabel
    Left = 320
    Top = 164
    Width = 113
    Height = 13
    Caption = 'CADASTRO PRODUTOS'
  end
  object edtEmail: TEdit
    Left = 8
    Top = 20
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'luansouza88@gmail.com'
  end
  object edtPassword: TEdit
    Left = 8
    Top = 63
    Width = 289
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = 'Souz@199122'
  end
  object Button1: TButton
    Left = 320
    Top = 21
    Width = 143
    Height = 25
    Caption = 'Login'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 61
    Width = 143
    Height = 25
    Caption = 'Buscar Dados'
    TabOrder = 2
    OnClick = Button2Click
  end
  object memoResp: TMemo
    Left = 23
    Top = 307
    Width = 454
    Height = 132
    Lines.Strings = (
      '')
    TabOrder = 8
  end
  object edtNode: TEdit
    Left = 8
    Top = 103
    Width = 289
    Height = 21
    TabOrder = 5
    Text = '/usuario'
  end
  object edtKey: TEdit
    Left = 8
    Top = 147
    Width = 289
    Height = 21
    TabOrder = 6
    Text = 'AIzaSyA8LFFy2ngRy4Ri0j7IdfpiZ1mCaAIRs9M'
  end
  object Button3: TButton
    Left = 319
    Top = 126
    Width = 143
    Height = 25
    Caption = 'Cadastro de Usuario'
    TabOrder = 4
    OnClick = Button3Click
  end
  object edtDomain: TEdit
    Left = 8
    Top = 189
    Width = 289
    Height = 21
    TabOrder = 7
    Text = 'https://salvadados-f83da.firebaseio.com/'
  end
  object edtToken: TEdit
    Left = 9
    Top = 234
    Width = 289
    Height = 21
    TabOrder = 9
  end
  object Button4: TButton
    Left = 319
    Top = 232
    Width = 143
    Height = 25
    Caption = 'Deletar'
    TabOrder = 10
    OnClick = Button4Click
  end
  object btCadProduto: TButton
    Left = 319
    Top = 183
    Width = 143
    Height = 25
    Caption = 'Cadastro Produto'
    TabOrder = 11
    OnClick = btCadProdutoClick
  end
  object Panel1: TPanel
    Left = 494
    Top = 8
    Width = 545
    Height = 200
    Caption = 'Panel1'
    TabOrder = 12
    object Label8: TLabel
      Left = 21
      Top = 57
      Width = 26
      Height = 13
      Caption = 'COD:'
    end
    object Label9: TLabel
      Left = 144
      Top = 57
      Width = 33
      Height = 13
      Caption = 'NOME:'
    end
    object Label10: TLabel
      Left = 144
      Top = 118
      Width = 34
      Height = 13
      Caption = 'EMAIL:'
    end
    object Label12: TLabel
      Left = 21
      Top = 118
      Width = 28
      Height = 13
      Caption = 'TIPO:'
    end
    object Label11: TLabel
      Left = 392
      Top = 118
      Width = 37
      Height = 13
      Caption = 'SENHA:'
    end
    object Label15: TLabel
      Left = 224
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Cadastro Usuario'
    end
    object edNome: TEdit
      Left = 144
      Top = 76
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object edCod: TEdit
      Left = 21
      Top = 76
      Width = 95
      Height = 21
      TabOrder = 1
    end
    object edEmail: TEdit
      Left = 144
      Top = 137
      Width = 225
      Height = 21
      TabOrder = 2
    end
    object edTipo: TEdit
      Left = 21
      Top = 137
      Width = 95
      Height = 21
      TabOrder = 3
    end
    object edSenha: TEdit
      Left = 384
      Top = 137
      Width = 113
      Height = 21
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 494
    Top = 231
    Width = 545
    Height = 200
    Caption = 'Panel1'
    TabOrder = 13
    object Label16: TLabel
      Left = 21
      Top = 57
      Width = 26
      Height = 13
      Caption = 'COD:'
    end
    object Label17: TLabel
      Left = 144
      Top = 57
      Width = 33
      Height = 13
      Caption = 'NOME:'
    end
    object Label19: TLabel
      Left = 21
      Top = 118
      Width = 31
      Height = 13
      Caption = 'Valor :'
    end
    object Label21: TLabel
      Left = 224
      Top = 24
      Width = 90
      Height = 13
      Caption = 'Cadastro Produtos'
    end
    object edNomeProd: TEdit
      Left = 144
      Top = 76
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object edCodProd: TEdit
      Left = 21
      Top = 76
      Width = 95
      Height = 21
      TabOrder = 1
    end
    object edValorProd: TEdit
      Left = 21
      Top = 137
      Width = 100
      Height = 21
      TabOrder = 2
    end
  end
end
