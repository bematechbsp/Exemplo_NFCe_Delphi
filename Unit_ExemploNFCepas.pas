unit Unit_ExemploNFCepas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, ComCtrls, ShellApi, Unit_VendeItemCompleto, Unit_DadosConsumidorNFCe, Unit_FormaPagamento;

type
  TForm_Principal = class(TForm)
    GroupBox1: TGroupBox;
    AbreCupom: TButton;
    VendeItemCustom: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    IniciaFechamentoCupom: TButton;
    TerminaFechamentoCupom: TButton;
    Sair: TButton;
    Limpar: TButton;
    CupomCompleto: TButton;
    GroupBox3: TGroupBox;
    CancelaCupom: TButton;
    LeituraX: TButton;
    ReducaoZ: TButton;
    GroupBox5: TGroupBox;
    ProgramaAliquota: TButton;
    RadioGroup5: TRadioGroup;
    Label4: TLabel;
    Edit5: TEdit;
    RetornoAliquotas: TButton;
    GroupBox4: TGroupBox;
    logo: TImage;
    Button1: TButton;
    GroupBox7: TGroupBox;
    Memo1: TMemo;
    GroupBox8: TGroupBox;
    Memo2: TMemo;
    NumeroCupom: TButton;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    ChaveAcessoNFCe: TButton;
    RadioGroup4: TRadioGroup;
    Edit2: TEdit;
    UltimaChaveAcessoNFCe: TButton;
    StatusUltimaNFCe: TButton;
    StatusUltimoCancelamentoNFCe: TButton;
    ProgramaContadorNFCe: TButton;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    Label5: TLabel;
    Button2: TButton;
    VendeItemCompleto: TButton;
    DadosConsumidorNFCe: TButton;
    EfetuaFormaPagamento: TButton;
    procedure AbreCupomClick(Sender: TObject);
    procedure IniciaFechamentoCupomClick(Sender: TObject);
    procedure EfetuaFormaPagamentoClick(Sender: TObject);
    procedure TerminaFechamentoCupomClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure LimparClick(Sender: TObject);
    procedure CupomCompletoClick(Sender: TObject);
    procedure CancelaCupomClick(Sender: TObject);
    procedure LeituraXClick(Sender: TObject);
    procedure ReducaoZClick(Sender: TObject);
    procedure NumeroCupomClick(Sender: TObject);
    procedure ChaveAcessoNFCeClick(Sender: TObject);
    procedure UltimaChaveAcessoNFCeClick(Sender: TObject);
    procedure StatusUltimaNFCeClick(Sender: TObject);
    procedure StatusUltimoCancelamentoNFCeClick(Sender: TObject);
    procedure ProgramaContadorNFCeClick(Sender: TObject);
    procedure VendeItemCustomClick(Sender: TObject);
    procedure ProgramaAliquotaClick(Sender: TObject);
    procedure RetornoAliquotasClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StatusDaNFCe;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VendeItemCompletoClick(Sender: TObject);
    procedure DadosConsumidorNFCeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;
  iRetorno, iRetornoX, ACK, ST1, ST2, ST3 : integer;
  Retorno, RetFuncao, TipoLayout, Layout : string;

implementation

function Bematech_FI_VendeItemCompleto( Codigo: string;
										EAN13: string;
										Descricao: string;
										IndiceDepartamento: string;
										Aliquota: string;
										UnidadeMedida: string;
										TipoQuantidade: string;
										CasasDecimaisQtde: string;
										Quantidade: string;
										CasasDecimaisValor: string;
										ValorUnitario: string;
										TipoDesconto: string;
										ValorAcrescimo: string;
										ValorDesconto: string;
										ArredondaTrunca: string;
										NCM: string;
										CFOP: string;
										InformacaoAdicional: string;
										CST_ICMS: string;
										OrigemProduto: string;
										ItemListaServico: string;
										CodigoISS: string;
										NaturezaOperacaoISS: string;
										IndicadorIncentivoFiscal: string;
										CodigoIBGE: string; CSOSN: string;
										ValorBaseCalculoSimples: string;
										ValorICMSRetidoSimples: string;
										ModalidadeBaseCalculo: string;
										PercentualReducaoBase: string;
										ModalidadeBC: string;
										PercentualMargemICMS: string;
										PercentualBCICMS: string;
										ValorReducaoBCICMS: string;
										ValorAliquotaICMS: string;
										ValorICMS: string;
										ValorICMSDesonerado: string;
										MotivoDesoneracaoICMS: string;
										AliquotaCalculoCredito: string;
										ValorCreditoICMS: string;
										Reservado01: string;
										Reservado02: string;
										Reservado03: string;
										Reservado04: string;
										Reservado05: string;
										Reservado06: string;
										Reservado07: string;
										Reservado08: string;
										Reservado09: string;
										Reservado10: string;
										Reservado11: string;
										Reservado12: string;
										Reservado13: string;
										Reservado14: string;
										Reservado15: string;
										Reservado16: string;
										Reservado17: string;
										Reservado18: string;
										Reservado19: string;
										Reservado20: string;
										Reservado21: string;
										Reservado22: string;
										Reservado23: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoNFCe( paymentForm: String; value: String; licensingCNPJ: String; licensingCode: String; authorizationCode: String ): Integer; StdCall; External 'BEMAFI32.DLL';

function Bematech_FI_ChaveAcessoNFCe (cIndice: string; cContador: string; cChaveAcesso: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UltimaChaveAcessoNFCe (cChaveAcesso: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_StatusUltimaNFCe(Status: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_StatusUltimoCancelamentoNFCe (cStatus: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaContadorNFCe (cIndice: string; cContador: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieNFCe (var cNumSerie: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosEnvioNFCe (TipoLayout: string; TipoEmissao: string; cEmail : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraX: Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_LeituraXSerial: Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom ( cMensagem: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
//function Bematech_FI_DadosConsumidorNFCe (String: CPF, String: name, String: address, String: complement, String: number, String: neighborhood, String: IBGECode, String: city, String: UF, String: CEP, String: countyCode, String: country, String: phone, String: stateRegistrationIndicator, String: stateRegistration, String: SUFRAMACode, String: email;): Integer; StdCall; External 'BEMAFI32.DLL';
{$R *.dfm}
//=========================================

//BEMATECH SOFTWARE PARTNERS
// J�LIO C�SAR BRUNO
//ATUALIZADO 09-12-2014
//VERS�O 1.0.10
//==========================================

procedure TForm_Principal.AbreCupomClick(Sender: TObject);
var
cCPF : string;

begin
cCPF := '';
iRetorno := Bematech_FI_AbreCupom( pchar( '' ) );
Memo1.Lines.Add('Abre Cupom');
Memo1.Lines.Add('CPF: '+cCPF);
Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('AbreCupom: '+ IntToStr(iRetorno));

iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
if ST3 = 66 then
  ShowMessage('Redu��o Z pendente!');

Memo2.Lines.Add('Retorno AbreCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

//#### DADOSCONSUMIDORNFCE #####################################################

//iRetorno := Bematech_FI_DadosConsumidorNFCe(CPF, name, address, complement, number, neighborhood, IBGECode, city, UF, CEP, countyCode, country, phone, stateRegistrationIndicator, stateRegistration, SUFRAMACode, email);

//##############################################################################
end;

procedure TForm_Principal.IniciaFechamentoCupomClick(Sender: TObject);
var
Layout, cEmail, Emissao, cAcreDesc, Acre, cTipoAcreDesc, cValorAcreDesc, TipoEmissao : string;

begin
TipoLayout  := IntToStr(RadioGroup1.ItemIndex);
if TipoLayout = '0' then
  Layout := 'DANFE normal';
if TipoLayout = '1' then
  Layout := 'DANFE simplificada';

TipoEmissao := IntToStr(RadioGroup2.ItemIndex);

if TipoEmissao = '0' then
  Emissao := 'Sem emiss�o';
if TipoEmissao = '1' then
  Emissao := 'Somente impress�o';
if TipoEmissao = '2' then
  Emissao := 'Somente envio de e-mail';
if TipoEmissao = '3' then
  Emissao := 'Somente gera��o de arquivo PDF';
if TipoEmissao = '4' then
  Emissao := 'Impress�o + envio de e-mail';
if TipoEmissao = '5' then
  Emissao := 'Impress�o + gera��o de arquivo PDF';
if TipoEmissao = '6' then
  Emissao := 'Impress�o + envio de e-mail + gera��o de arquivo PDF';
if TipoEmissao = '7' then
  Emissao := 'Envio de e-mail e gera��o de arquivo PDF';

cEmail := '';
iRetorno := Bematech_FI_DadosEnvioNFCe (TipoLayout, TipoEmissao, cEmail);
Memo2.Clear;
Memo2.Lines.Add('DadosEnvioNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno DadosEnvioNFCe: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
cAcreDesc      := 'A';
if cAcreDesc = 'A' then
  Acre := 'Acr�scimo: ';
if cAcreDesc = 'D' then
  Acre := 'Desconto: ';

cTipoAcreDesc  := '%';
cValorAcreDesc := '00';

iRetorno := Bematech_FI_IniciaFechamentoCupom( pchar( cAcreDesc ), pchar( cTipoAcreDesc ), pchar( cValorAcreDesc ) );
Memo2.Lines.Add('IniciaFechamentoCupom: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno IniciaFechamentoCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
Memo1.Lines.Add(Acre+cValorAcreDesc+cTipoAcreDesc);
Memo1.Lines.Add('Tipo de Layout: '+Layout);
Memo1.Lines.Add('Tipo de Emiss�o: '+Emissao);
Memo1.Lines.Add('E-mail: '+cEmail);
Memo1.Lines.Add('----------------------------------------------------------');

end;

procedure TForm_Principal.EfetuaFormaPagamentoClick(Sender: TObject);
var
//cFormaPgto, cValorPago : string;
cPaymentForm, cValue : string;
clicensingCNPJ, clicensingCode, cAuthorizationCode : string;

begin
{cFormaPgto := Edit1.Text;
cValorPago := '10,00';
iRetorno := Bematech_FI_EfetuaFormaPagamento( pchar( cFormaPgto ), pchar( cValorPago ) );
Memo1.Lines.Add('Forma de Pagamento: '+cFormaPgto);
Memo1.Lines.Add('Valor: '+cValorPago);
Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('EfetuaFormaPagamento: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno EfetuaFormaPagamento: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));}

Form_Pagamento := TForm_Pagamento.Create(Application);
Form_Pagamento.ShowModal;
end;

procedure TForm_Principal.TerminaFechamentoCupomClick(Sender: TObject);
var
cMsgPromocional, cMsg1, cMsg2, cChaveAcesso, Coo, NumeroCupom : string;
iConta : integer;

begin
for iConta := 1 to 7 do NumeroCupom := NumeroCupom + ' ';
iRetorno := Bematech_FI_NumeroCupom( NumeroCupom );
Coo := NumeroCupom;
cMsg1 := 'N�mero do COO: '+Coo+'                           ';
cMsg2 := 'Tipo de Layout: '+ Layout;
cMsgPromocional := cMsg1+
  '                                 '+cMsg2+
  'Obrigado, volte sempre !!!                      ';

  //Campo + StringOfChar(� �, 35 - Length(Campo))

iRetorno := Bematech_FI_TerminaFechamentoCupom( cMsgPromocional );
Memo2.Clear;
Memo2.Lines.Add('TerminaFechamentoCupom: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
if ST3<>0 then
  StatusDaNFCe;
Memo2.Lines.Add('Retorno TerminaFechamentoCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
Memo1.Lines.Add('Mensagem: '+cMsgPromocional);
Memo1.Lines.Add('----------------------------------------------------------');


for iConta := 1 to 45 do cChaveAcesso := cChaveAcesso + ' '; //destinado a receber a chave de acesso, com 44 caracteres.
iRetorno:= Bematech_FI_UltimaChaveAcessoNFCe (cChaveAcesso);

Memo1.Lines.Add('Chave de Acesso: '+cChaveAcesso);
Memo1.Lines.Add('----------------------------------------------------------');

end;

procedure TForm_Principal.SairClick(Sender: TObject);
begin
Close;
end;

procedure TForm_Principal.LimparClick(Sender: TObject);
begin
Memo1.Clear;
end;

procedure TForm_Principal.CupomCompletoClick(Sender: TObject);
var
cCPF : string;
Codigo: string;
EAN13: string;
Descricao: string;
IndiceDepartamento: string;
Aliquota: string;
UnidadeMedida: string;
TipoQuantidade: string;
CasasDecimaisQtde: string;
Quantidade: string;
CasasDecimaisValor: string;
ValorUnitario: string;
TipoDesconto: string;
ValorAcrescimo: string;
ValorDesconto: string;
ArredondaTrunca: string;
NCM: string;
CFOP: string;
InformacaoAdicional: string;
CST_ICMS: string;
OrigemProduto: string;
ItemListaServico: string;
CodigoISS: string;
NaturezaOperacaoISS: string;
IndicadorIncentivoFiscal: string;
CodigoIBGE: string;
CSOSN: string;
ValorBaseCalculoSimples: string;
ValorICMSRetidoSimples: string;
ModalidadeBaseCalculo: string;
PercentualReducaoBase: string;
ModalidadeBC: string;
PercentualMargemICMS: string;
PercentualBCICMS: string;
ValorReducaoBCICMS: string;
ValorAliquotaICMS: string;
ValorICMS: string;
ValorICMSDesonerado: string;
MotivoDesoneracaoICMS: string;
AliquotaCalculoCredito: string;
ValorCreditoICMS: string;
Reservado01 :  string;
Reservado02 :  string;
Reservado03 :  string;
Reservado04 :  string;
Reservado05 :  string;
Reservado06 :  string;
Reservado07 :  string;
Reservado08 :  string;
Reservado09 :  string;
Reservado10 :  string;
Reservado11 :  string;
Reservado12 :  string;
Reservado13 :  string;
Reservado14 :  string;
Reservado15 :  string;
Reservado16 :  string;
Reservado17 :  string;
Reservado18 :  string;
Reservado19 :  string;
Reservado20 :  string;
Reservado21 :  string;
Reservado22 :  string;
Reservado23 :  string;
cAcreDesc, cTipoAcreDesc, cValorAcreDesc : string;
Acre : string;
cFormaPgto, cValorPago : string;
cMsgPromocional : string;
TipoLayout, TipoEmissao, cEmail : string;
Emissao : string;
Layout, cTaxas, NumeroCupom, Coo, cChaveAcesso : string;
iConta : integer;

begin
iRetorno := Bematech_FI_AbreCupom( pchar( '' ) );
Memo1.Lines.Add('Abre Cupom');
Memo1.Lines.Add('CPF: '+cCPF);
Memo1.Lines.Add('----------------------------------------------------------');

  Codigo := '1234567890';
  EAN13 := '7891000081754';
  Descricao := '�gua Mineral';
  IndiceDepartamento := '01';
  Aliquota := 'I1';
  UnidadeMedida := 'UN';
  TipoQuantidade := 'I';
  CasasDecimaisQtde := '2';
  Quantidade := '1,00';
  CasasDecimaisValor := '2';
  ValorUnitario := '0,50';
  TipoDesconto := '$';
  ValorAcrescimo := '00';
  ValorDesconto := '00';
  ArredondaTrunca := 'A';
  NCM := '62000000';
  CFOP := '5101';
  InformacaoAdicional := 'INFORMA��ES';
  OrigemProduto := '0';
  CST_ICMS := '00';
  CodigoIBGE := '5103403';
  CodigoISS := '';
  NaturezaOperacaoISS := '';
  IndicadorIncentivoFiscal := '';
  ItemListaServico := '1234';
  CSOSN := '';
  ValorBaseCalculoSimples := '';
  ValorICMSRetidoSimples := '';
  ModalidadeBaseCalculo := '';
  PercentualReducaoBase := '';
  ModalidadeBC := '0';
  PercentualMargemICMS := '';
  PercentualBCICMS := '';
  ValorReducaoBCICMS := '';
  ValorAliquotaICMS := '';
  ValorICMS := '';
  ValorICMSDesonerado := '';
  MotivoDesoneracaoICMS := '';
  AliquotaCalculoCredito := '';
  ValorCreditoICMS := '';
  Reservado01 := ''; //tributos
  Reservado02 := '';
  Reservado03 := '';
  Reservado04 := '';
  Reservado05 := '';
  Reservado06 := '';
  Reservado07 := '';
  Reservado08 := '';
  Reservado09 := '';
  Reservado10 := '';
  Reservado11 := '';
  Reservado12 := '';
  Reservado13 := '';
  Reservado14 := '';
  Reservado15 := '';
  Reservado16 := '';
  Reservado17 := '';
  Reservado18 := '';
  Reservado19 := '';
  Reservado20 := '';
  Reservado21 := '';
  Reservado22 := '';
  Reservado23 := '';
  iRetorno := Bematech_FI_VendeItemCompleto( pchar( Codigo ), pchar( EAN13 ), pchar( Descricao ), pchar( IndiceDepartamento ), pchar( Aliquota ), pchar( UnidadeMedida ), pchar( TipoQuantidade ), pchar( CasasDecimaisQtde ), pchar( Quantidade ), pchar( CasasDecimaisValor ), pchar( ValorUnitario ), pchar( TipoDesconto ), pchar( ValorAcrescimo ), pchar( ValorDesconto ), pchar( ArredondaTrunca ), pchar( NCM ), pchar( CFOP ), pchar( InformacaoAdicional ), pchar( CST_ICMS ), pchar( OrigemProduto ), pchar( ItemListaServico ), pchar( CodigoISS ), pchar( NaturezaOperacaoISS ), pchar( IndicadorIncentivoFiscal ), pchar(
CodigoIBGE ), pchar( CSOSN ), pchar( ValorBaseCalculoSimples ), pchar( ValorICMSRetidoSimples ), pchar( ModalidadeBaseCalculo ), pchar( PercentualReducaoBase ), pchar( ModalidadeBC ), pchar( PercentualMargemICMS ), pchar( PercentualBCICMS ), pchar( ValorReducaoBCICMS ), pchar( ValorAliquotaICMS ), pchar( ValorICMS ), pchar( ValorICMSDesonerado ), pchar( MotivoDesoneracaoICMS ), pchar( AliquotaCalculoCredito ), pchar( ValorCreditoICMS ), pchar( Reservado01 ), pchar( Reservado02 ), pchar( Reservado03 ), pchar( Reservado04 ), pchar( Reservado05 ), pchar( Reservado06 ), pchar( Reservado07 ), pchar( Reservado08 ), pchar( Reservado09 ), pchar( Reservado10 ), pchar( Reservado11 ), pchar( Reservado12 ), pchar( Reservado13 ), pchar( Reservado14 ), pchar( Reservado15 ), pchar( Reservado16 ), pchar( Reservado17 ), pchar( Reservado18 ), pchar( Reservado19 ), pchar( Reservado20 ), pchar( Reservado21 ), pchar( Reservado22 ), pchar( Reservado23 ) );
Memo1.Lines.Add('C�digo: '+Codigo);
Memo1.Lines.Add('EAN13: '+EAN13);
Memo1.Lines.Add('Descri��o: '+Descricao);
Memo1.Lines.Add('�ndice Departamento: '+IndiceDepartamento);
Memo1.Lines.Add('Al�quota: '+Aliquota);
Memo1.Lines.Add('Unidade de Medida: '+UnidadeMedida);
Memo1.Lines.Add('Tipo de Quantidade: '+TipoQuantidade);
Memo1.Lines.Add('Qtde. de casas decimais: '+CasasDecimaisQtde);
Memo1.Lines.Add('Quantidade: '+Quantidade);
Memo1.Lines.Add('Casas Decimais: '+CasasDecimaisValor);
Memo1.Lines.Add('Valor Unit�rio'+ValorUnitario);
Memo1.Lines.Add('Tipo de desconto: '+TipoDesconto);
Memo1.Lines.Add('Valor Acr�scimo: '+ValorAcrescimo);
Memo1.Lines.Add('Valor Desconto: '+ValorDesconto);
Memo1.Lines.Add('Arredonda/Trunca: '+ArredondaTrunca);
Memo1.Lines.Add('NCM: '+NCM);
Memo1.Lines.Add('CFOP: '+CFOP);
Memo1.Lines.Add('Informa��o Adicional: '+InformacaoAdicional);
Memo1.Lines.Add('Origem do Produto: '+OrigemProduto);
Memo1.Lines.Add('CST ICMS: '+CST_ICMS);
Memo1.Lines.Add('C�digo IBGE: '+CodigoIBGE);
Memo1.Lines.Add('C�digo ISS: '+CodigoISS);
Memo1.Lines.Add('Nat. Oper. ISS: '+NaturezaOperacaoISS);
Memo1.Lines.Add('Ind. Incentivo Fiscal: '+IndicadorIncentivoFiscal);
Memo1.Lines.Add('Item Lista Servi�o: '+ItemListaServico);
Memo1.Lines.Add('CSOSN: '+CSOSN);
Memo1.Lines.Add('Valor BC Simples: '+ValorBaseCalculoSimples);
Memo1.Lines.Add('ICMS retido Simples: '+ValorICMSRetidoSimples);
Memo1.Lines.Add('ModalidadeBC: '+ModalidadeBaseCalculo);
Memo1.Lines.Add('Redu��o Base: '+PercentualReducaoBase);
Memo1.Lines.Add('Modalidade BC: '+ModalidadeBC);
Memo1.Lines.Add('Margem ICMS: '+PercentualMargemICMS);
Memo1.Lines.Add('Percent. BC ICMS: '+PercentualBCICMS);
Memo1.Lines.Add('Redu��o BC ICMS: '+ValorReducaoBCICMS);
Memo1.Lines.Add('Aliquota ICMS: '+ValorAliquotaICMS);
Memo1.Lines.Add('ICMS: '+ValorICMS);
Memo1.Lines.Add('ICMS Desonerado: '+ValorICMSDesonerado);
Memo1.Lines.Add('Motivo Deson. ICMS: '+MotivoDesoneracaoICMS);
Memo1.Lines.Add('Aliq. Calculo Cr�dito: '+AliquotaCalculoCredito);
Memo1.Lines.Add('Cr�dito ICMS: '+ValorCreditoICMS);
Memo1.Lines.Add('----------------------------------------------------------');

begin
TipoLayout  := IntToStr(RadioGroup2.ItemIndex);
if TipoLayout = '0' then
  Layout := 'DANFE normal';
if TipoLayout = '1' then
  Layout := 'DANFE simplificada';

TipoEmissao := IntToStr(RadioGroup1.ItemIndex);

if TipoEmissao = '0' then
  Emissao := 'Sem emiss�o';
if TipoEmissao = '1' then
  Emissao := 'Somente impress�o';
if TipoEmissao = '2' then
  Emissao := 'Somente impress�o';

cEmail := 'joao@joao.com.br';

iRetorno := Bematech_FI_DadosEnvioNFCe (pchar(TipoLayout), pchar(TipoEmissao), pchar(cEmail));

cAcreDesc      := 'A';
if cAcreDesc = 'A' then
  Acre := 'Acr�scimo: ';
if cAcreDesc = 'D' then
  Acre := 'Desconto: ';

cTipoAcreDesc  := '%';
cValorAcreDesc := '00';

iRetorno := Bematech_FI_IniciaFechamentoCupom( pchar( cAcreDesc ), pchar( cTipoAcreDesc ), pchar( cValorAcreDesc ) );
Memo1.Lines.Add(Acre+cValorAcreDesc+cTipoAcreDesc);
Memo1.Lines.Add('----------------------------------------------------------');

cFormaPgto := 'Dinheiro';
cValorPago := '50,00';
iRetorno := Bematech_FI_EfetuaFormaPagamento( pchar( cFormaPgto ), pchar( cValorPago ) );
Memo1.Lines.Add('Forma de Pagamento: '+cFormaPgto);
Memo1.Lines.Add('Valor: '+cValorPago);
Memo1.Lines.Add('----------------------------------------------------------');

for iConta := 1 to 7 do NumeroCupom := NumeroCupom + ' ';
iRetorno := Bematech_FI_NumeroCupom( NumeroCupom );
Coo := NumeroCupom;
cMsgPromocional := 'N�mero do COO: '+Coo+#10+'Obrigado, volte sempre !!!';
iRetornoX := Bematech_FI_TerminaFechamentoCupom( cMsgPromocional );
Memo1.Lines.Add('Mensagem: '+cMsgPromocional);
Memo1.Lines.Add('----------------------------------------------------------');


for iConta := 1 to 45 do cChaveAcesso := cChaveAcesso + ' '; //destinado a receber a chave de acesso, com 44 caracteres.
iRetorno:= Bematech_FI_UltimaChaveAcessoNFCe (cChaveAcesso);

Memo1.Lines.Add('Chave de Acesso: '+cChaveAcesso);
Memo1.Lines.Add('----------------------------------------------------------');

Memo2.Clear;
Memo2.Lines.Add('TerminaFechamentoCupom: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
if ST3<>0 then
  StatusDaNFCe;
Memo2.Lines.Add('Retorno TerminaFechamentoCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;
end;

procedure TForm_Principal.CancelaCupomClick(Sender: TObject);
begin
iRetorno := Bematech_FI_CancelaCupom();
Memo2.Clear;
Memo2.Lines.Add('CancelaCupom: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno CancelaCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

end;

procedure TForm_Principal.LeituraXClick(Sender: TObject);
begin
iRetorno := Bematech_FI_LeituraX();
Memo2.Clear;
Memo2.Lines.Add('LeituraX: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno LeituraX: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;

procedure TForm_Principal.ReducaoZClick(Sender: TObject);
begin
iRetorno := Bematech_FI_ReducaoZ( pchar( '' ), pchar( '' ) );
Memo2.Clear;
Memo2.Lines.Add('ReducaoZ: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno ReducaoZ: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
Memo1.Lines.Add('Redu��o Z na data '+DateToStr(Date)+' emitida!');
Memo1.Lines.Add('----------------------------------------------------------');
end;

procedure TForm_Principal.NumeroCupomClick(Sender: TObject);
var
NumeroCupom : string;
iConta : integer;

begin
for iConta := 1 to 7 do NumeroCupom := NumeroCupom + ' ';
iRetorno := Bematech_FI_NumeroCupom( NumeroCupom );
Memo2.Clear;
Memo2.Lines.Add('NumeroCupom: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno NumeroCupom: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
Memo1.Lines.Add('N�mero do �ltimo COO: '+NumeroCupom);
Memo1.Lines.Add('----------------------------------------------------------');
end;

procedure TForm_Principal.ChaveAcessoNFCeClick(Sender: TObject);

var
cIndice, cContador, cChaveAcesso : string;
iConta : integer;

begin
cIndice := IntToStr(RadioGroup4.ItemIndex); //0 - COO / 1 - CCF
cContador := Edit2.Text;//Tamanho m�ximo de 6 caracteres para impressoras do conv�nio ICMS 85/01 e 9 caracteres para ICMS 09/09.
for iConta := 1 to 44 do cChaveAcesso := cChaveAcesso + ' '; //destinado a receber a chave de acesso, com 44 caracteres

iRetorno := Bematech_FI_ChaveAcessoNFCe ( cIndice, cContador, cChaveAcesso);
Memo2.Clear;
Memo2.Lines.Add('ChaveAcessoNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno ChaveAcessoNFCe: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

Memo1.Lines.Add('Tipo: '+cIndice+' --> 0 - COO / 1 - CCF');
Memo1.Lines.Add('N�mero: '+cContador);
if (cChaveAcesso = Null) then
  Memo1.Lines.Add('N�o existe chave de acesso para esse COO')
else
  Memo1.Lines.Add('Chave de Acesso: '+cChaveAcesso);
Memo1.Lines.Add('----------------------------------------------------------');

end;


procedure TForm_Principal.UltimaChaveAcessoNFCeClick(Sender: TObject);
var
cChaveAcesso: string;
iConta : integer;

begin
for iConta := 1 to 44 do cChaveAcesso := cChaveAcesso + ' '; //destinado a receber a chave de acesso, com 44 caracteres.
iRetorno:= Bematech_FI_UltimaChaveAcessoNFCe (cChaveAcesso);
Memo1.Lines.Add('�ltima Chave de Acesso:');
Memo1.Lines.Add(cChaveAcesso);
Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('UltimaChaveAcessoNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno UltimaChaveAcessoNFCe: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

end;

//++++++++PROCEDURE STATUSULTIMANFCE++++++++++++++++++++++++++++++++++++
procedure TForm_Principal.StatusDaNFCe;
Var
Ret:integer;
Status : string;
iConta : integer;

begin
for iConta := 1 to 7 do Status := Status + ' ';
iRetorno := Bematech_FI_StatusUltimaNFCe(Status);
Ret:=strToInt(Status);
case Ret of
100:ShowMessage('100: Autorizado o uso da NFC-e');
101:ShowMessage('101: Cancelamento de NFC-e homologado');
102:ShowMessage('102: Inutiliza��o de n�mero homologado');
103:ShowMessage('103: Lote recebido com sucesso');
104:ShowMessage('104: Lote processado');
105:ShowMessage('105: Lote em processamento');
106:ShowMessage('106: Lote n�o localizado');
107:ShowMessage('107: Servi�o em Opera��o');
108:ShowMessage('108: Servi�o Paralisado Momentaneamente (curto prazo)');
109:ShowMessage('109: Servi�o Paralisado sem Previs�o');
110:ShowMessage('110: Uso Denegado');
111:ShowMessage('111: Consulta cadastro com uma ocorr�ncia');
112:ShowMessage('112: Consulta cadastro com mais de uma ocorr�ncia');
128:ShowMessage('128: Lote de Evento Processado');
135:ShowMessage('135: Evento registrado e vinculado a NFC-e');
136:ShowMessage('136: Evento registrado, mas n�o vinculado a NFC-e');
201:ShowMessage('201: O numero m�ximo de numera��o de NFC-e a inutilizar ultrapassou o limite');
202:ShowMessage('202: Falha no reconhecimento da autoria ou integridade do arquivo digital');
203:ShowMessage('203: Emissor n�o habilitado para emiss�o da NFC-e');
204:ShowMessage('204: Duplicidade de NFC-e [nRec:999999999999999]');
205:ShowMessage('205: NFC-e est� denegada na base de dados da SEFAZ [nRec:999999999999999]');
206:ShowMessage('206: NFC-e j� est� inutilizada na Base de dados da SEFAZ');
207:ShowMessage('207: CNPJ do emitente inv�lido');
208:ShowMessage('208: Rejei��o: CNPJ do destinat�rio inv�lido');
209:ShowMessage('209: Rejei��o: IE do emitente inv�lida');
210:ShowMessage('210: Rejei��o: IE do destinat�rio inv�lida');
211:ShowMessage('211: Rejei��o: IE do substituto inv�lida');
212:ShowMessage('212: Rejei��o: Data de emiss�o NFC-e posterior a data de recebimento');
213:ShowMessage('213: Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital');
214:ShowMessage('214: Rejei��o: Tamanho da mensagem excedeu o limite estabelecido');
215:ShowMessage('215: Rejei��o: Falha no schema XML');
216:ShowMessage('216: Rejei��o: Chave de Acesso difere da cadastrada');
217:ShowMessage('217: Rejei��o: NFC-e n�o consta na base de dados da SEFAZ');
218:ShowMessage('218: NFC-e j� est� cancelada na base de dados da SEFAZ [nRec:999999999999999]');
219:ShowMessage('219: Rejei��o: Circula��o da NFC-e verificada');
220:ShowMessage('220: Rejei��o: Prazo de Cancelamento superior ao previsto na Legisla��o');
221:ShowMessage('221: Rejei��o: Confirmado o recebimento da NFC-e pelo destinat�rio');
222:ShowMessage('222: Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado');
223:ShowMessage('223: Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta');
224:ShowMessage('224: Rejei��o: A faixa inicial � maior que a faixa final');
225:ShowMessage('225: Rejei��o: Falha no Schema XML do lote de NFC-e');
226:ShowMessage('226: Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora');
227:ShowMessage('227: Rejei��o: Erro na Chave de Acesso - Campo Id � falta a literal NFC-e');
228:ShowMessage('228: Rejei��o: Data de Emiss�o muito atrasada');
229:ShowMessage('229: Rejei��o: IE do emitente n�o informada');
230:ShowMessage('230: Rejei��o: IE do emitente n�o cadastrada');
231:ShowMessage('231: Rejei��o: IE do emitente n�o vinculada ao CNPJ');
232:ShowMessage('232: Rejei��o: IE do destinat�rio n�o informada');
233:ShowMessage('233: Rejei��o: IE do destinat�rio n�o cadastrada');
234:ShowMessage('234: Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ');
235:ShowMessage('235: Rejei��o: Inscri��o SUFRAMA inv�lida');
236:ShowMessage('236: Rejei��o: Chave de Acesso com d�gito verificador inv�lido');
237:ShowMessage('237: Rejei��o: CPF do destinat�rio inv�lido');
238:ShowMessage('238: Rejei��o: Cabe�alho - Vers�o do arquivo XML superior a Vers�o vigente');
239:ShowMessage('239: Rejei��o: Cabe�alho - Vers�o do arquivo XML n�o suportada');
240:ShowMessage('240: Rejei��o: Cancelamento/Inutiliza��o - Irregularidade Fiscal do Emitente');
241:ShowMessage('241: Rejei��o: Um n�mero da faixa j� foi utilizado');
242:ShowMessage('242: Rejei��o: Cabe�alho - Falha no Schema XML');
243:ShowMessage('243: Rejei��o: XML Mal Formado');
244:ShowMessage('244: Rejei��o: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do Emitente');
245:ShowMessage('245: Rejei��o: CNPJ Emitente n�o cadastrado');
246:ShowMessage('246: Rejei��o: CNPJ Destinat�rio n�o cadastrado');
247:ShowMessage('247: Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora');
248:ShowMessage('248: Rejei��o: UF do Recibo diverge da UF autorizadora');
249:ShowMessage('249: Rejei��o: UF da Chave de Acesso diverge da UF autorizadora');
250:ShowMessage('250: Rejei��o: UF diverge da UF autorizadora');
251:ShowMessage('251: Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA');
252:ShowMessage('252: Rejei��o: Ambiente informado diverge do Ambiente de recebimento');
253:ShowMessage('253: Rejei��o: Digito Verificador da chave de acesso composta inv�lida');
254:ShowMessage('254: Rejei��o: NFC-e complementar n�o possui NFC-e referenciada');
255:ShowMessage('255: Rejei��o: NFC-e complementar possui mais de uma NF referenciada');
256:ShowMessage('256: Rejei��o: Uma NFC-e da faixa j� est� inutilizada na Base de dados da SEFAZ');
257:ShowMessage('257: Rejei��o: Solicitante n�o habilitado para emiss�o da NFC-e');
258:ShowMessage('258: Rejei��o: CNPJ da consulta inv�lido');
259:ShowMessage('259: Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF');
260:ShowMessage('260: Rejei��o: IE da consulta inv�lida');
261:ShowMessage('261: Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF');
262:ShowMessage('262: Rejei��o: UF n�o fornece consulta por CPF');
263:ShowMessage('263: Rejei��o: CPF da consulta inv�lido');
264:ShowMessage('264: Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF');
265:ShowMessage('265: Rejei��o: Sigla da UF da consulta difere da UF do Web Service');
266:ShowMessage('266: Rejei��o: S�rie utilizada n�o permitida no Web Service');
267:ShowMessage('267: Rejei��o: NFC-e Complementar referencia uma NFC-e inexistente');
268:ShowMessage('268: Rejei��o: NFC-e Complementar referencia uma outra NFC-e Complementar');
269:ShowMessage('269: Rejei��o: CNPJ Emitente da NFC-e Complementar difere do CNPJ da NFC-e Referenciada');
270:ShowMessage('270: Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido');
271:ShowMessage('271: Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente');
272:ShowMessage('272: Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido');
273:ShowMessage('273: Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente');
274:ShowMessage('274: Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido');
275:ShowMessage('275: Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio');
276:ShowMessage('276: Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido');
277:ShowMessage('277: Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de Retirada');
278:ShowMessage('278: Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido');
279:ShowMessage('279: Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega');
280:ShowMessage('280: Rejei��o: Certificado Transmissor inv�lido');
281:ShowMessage('281: Rejei��o: Certificado Transmissor Data Validade');
282:ShowMessage('282: Rejei��o: Certificado Transmissor sem CNPJ');
283:ShowMessage('283: Rejei��o: Certificado Transmissor - erro Cadeia de Certifica��o');
284:ShowMessage('284: Rejei��o: Certificado Transmissor revogado');
285:ShowMessage('285: Rejei��o: Certificado Transmissor difere ICP-Brasil');
286:ShowMessage('286: Rejei��o: Certificado Transmissor erro no acesso a LCR');
287:ShowMessage('287: Rejei��o: C�digo Munic�pio do FG - ISSQN: d�gito inv�lido');
288:ShowMessage('288: Rejei��o: C�digo Munic�pio do FG - Transporte: d�gito inv�lido');
289:ShowMessage('289: Rejei��o: C�digo da UF informada diverge da UF solicitada');
290:ShowMessage('290: Rejei��o: Certificado Assinatura inv�lido');
291:ShowMessage('291: Rejei��o: Certificado Assinatura Data Validade');
292:ShowMessage('292: Rejei��o: Certificado Assinatura sem CNPJ');
293:ShowMessage('293: Rejei��o: Certificado Assinatura - erro Cadeia de Certifica��o');
294:ShowMessage('294: Rejei��o: Certificado Assinatura revogado');
295:ShowMessage('295: Rejei��o: Certificado Assinatura difere ICP-Brasil');
296:ShowMessage('296: Rejei��o: Certificado Assinatura erro no acesso a LCR');
297:ShowMessage('297: Rejei��o: Assinatura difere do calculado');
298:ShowMessage('298: Rejei��o: Assinatura difere do padr�o do Sistema');
299:ShowMessage('299: Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8');
401:ShowMessage('401: Rejei��o: CPF do remetente inv�lido');
402:ShowMessage('402: Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8');
403:ShowMessage('403: Rejei��o: O grupo de informa��es da NFC-e avulsa � de uso exclusivo do Fisco');
404:ShowMessage('404: Rejei��o: Uso de prefixo de namespace n�o permitido');
405:ShowMessage('405: Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido');
406:ShowMessage('406: Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido');
407:ShowMessage('407: Rejei��o: O CPF s� pode ser informado no campo emitente para a NFC-e avulsa');
409:ShowMessage('409: Rejei��o: Campo cUF inexistente no elemento NFC-eCabecMsg do SOAP Header');
410:ShowMessage('410: Rejei��o: UF informada no campo cUF n�o � atendida pelo Web Service');
411:ShowMessage('411: Rejei��o: Campo versaoDados inexistente no elemento NFC-eCabecMsg do SOAP Header');
420:ShowMessage('420: Rejei��o: Cancelamento para NFC-e j� cancelada');
450:ShowMessage('450: Rejei��o: Modelo da NFC-e diferente de 55');
451:ShowMessage('451: Rejei��o: Processo de emiss�o informado inv�lido');
452:ShowMessage('452: Rejei��o: Tipo Autorizador do Recibo diverge do �rg�o Autorizador');
453:ShowMessage('453: Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual');
454:ShowMessage('454: Rejei��o: Ano de inutiliza��o n�o pode ser iNFC-erior a 2006');
478:ShowMessage('478: Rejei��o: Local da entrega n�o informado para faturamento direto de ve�culos novos');
489:ShowMessage('489: Rejei��o: CNPJ informado inv�lido (DV ou zeros)');
490:ShowMessage('490: Rejei��o: CPF informado inv�lido (DV ou zeros)');
491:ShowMessage('491: Rejei��o: O tpEvento informado inv�lido');
492:ShowMessage('492: Rejei��o: O verEvento informado inv�lido');
493:ShowMessage('493: Rejei��o: Evento n�o atende o Schema XML espec�fico');
494:ShowMessage('494: Rejei��o: Chave de Acesso inexistente');
502:ShowMessage('502: Rejei��o: Erro na Chave de Acesso - Campo Id n�o corresponde � concatena��o dos campos correspondentes');
503:ShowMessage('503: Rejei��o: S�rie utilizada fora da faixa permitida no SCAN (900-999)');
504:ShowMessage('504: Rejei��o: Data de Entrada/Sa�da posterior ao permitido');
505:ShowMessage('505: Rejei��o: Data de Entrada/Sa�da anterior ao permitido');
506:ShowMessage('506: Rejei��o: Data de Sa�da menor que a Data de Emiss�o');
507:ShowMessage('507: Rejei��o: O CNPJ do destinat�rio/remetente n�o deve ser informado em opera��o com o exterior');
508:ShowMessage('508: Rejei��o: O CNPJ com conte�do nulo s� � v�lido em opera��o com exterior');
509:ShowMessage('509: Rejei��o: Informado c�digo de munic�pio diferente de �9999999� para opera��o com o exterior');
510:ShowMessage('510: Rejei��o: Opera��o com Exterior e C�digo Pa�s destinat�rio � 1058 (Brasil) ou n�o informado');
511:ShowMessage('511: Rejei��o: N�o � de Opera��o com Exterior e C�digo Pa�s destinat�rio difere de 1058 (Brasil)');
512:ShowMessage('512: Rejei��o: CNPJ do Local de Retirada inv�lido');
513:ShowMessage('513: Rejei��o: C�digo Munic�pio do Local de Retirada deve ser 9999999 para UF retirada = EX');
514:ShowMessage('514: Rejei��o: CNPJ do Local de Entrega inv�lido');
515:ShowMessage('515: Rejei��o: C�digo Munic�pio do Local de Entrega deve ser 9999999 para UF entrega = EX');
516:ShowMessage('516: Rejei��o: Falha no schema XML � inexiste a tag raiz esperada para a mensagem');
517:ShowMessage('517: Rejei��o: Falha no schema XML � inexiste atributo versao na tag raiz da mensagem');
518:ShowMessage('518: Rejei��o: CFOP de entrada para NFC-e de sa�da');
519:ShowMessage('519: Rejei��o: CFOP de sa�da para NFC-e de entrada');
520:ShowMessage('520: Rejei��o: CFOP de Opera��o com Exterior e UF destinat�rio difere de EX');
521:ShowMessage('521: Rejei��o: CFOP de Opera��o Estadual e UF do emitente difere da UF do destinat�rio para destinat�rio contribuinte do ICMS.');
522:ShowMessage('522: Rejei��o: CFOP de Opera��o Estadual e UF emitente difere da UF remetente para remetente contribuinte do ICMS.');
523:ShowMessage('523: Rejei��o: CFOP n�o � de Opera��o Estadual e UF emitente igual a UFdestinat�rio.');
524:ShowMessage('524: Rejei��o: CFOP de Opera��o com Exterior e n�o informado NCM');
525:ShowMessage('525: Rejei��o: CFOP de Importa��o e n�o informado dados da DI');
526:ShowMessage('526: Rejei��o: CFOP de Exporta��o e n�o informado Local de Embarque');
527:ShowMessage('527: Rejei��o: Opera��o de Exporta��o com informa��o de ICMS incompat�vel');
528:ShowMessage('528: Rejei��o: Valor do ICMS difere do produto BC e Al�quota');
529:ShowMessage('529: Rejei��o: NCM de informa��o obrigat�ria para produto tributado pelo IPI');
530:ShowMessage('530: Rejei��o: Opera��o com tributa��o de ISSQN sem informar a Inscri��o Municipal');
531:ShowMessage('531: Rejei��o: Total da BC ICMS difere do somat�rio dos itens');
532:ShowMessage('532: Rejei��o: Total do ICMS difere do somat�rio dos itens');
533:ShowMessage('533: Rejei��o: Total da BC ICMS-ST difere do somat�rio dos itens');
534:ShowMessage('534: Rejei��o: Total do ICMS-ST difere do somat�rio dos itens');
535:ShowMessage('535: Rejei��o: Total do Frete difere do somat�rio dos itens');
536:ShowMessage('536: Rejei��o: Total do Seguro difere do somat�rio dos itens');
537:ShowMessage('537: Rejei��o: Total do Desconto difere do somat�rio dos itens');
538:ShowMessage('538: Rejei��o: Total do IPI difere do somat�rio dos itens');
539:ShowMessage('539: Duplicidade de NFC-e com diferen�a na Chave de Acesso [chNFC-e: 99999999999999999999999999999999999999999999][nRec:999999999999999]');
540:ShowMessage('540: Rejei��o: CPF do Local de Retirada inv�lido');
541:ShowMessage('541: Rejei��o: CPF do Local de Entrega inv�lido');
542:ShowMessage('542: Rejei��o: CNPJ do Transportador inv�lido');
543:ShowMessage('543: Rejei��o: CPF do Transportador inv�lido');
544:ShowMessage('544: Rejei��o: IE do Transportador inv�lida');
545:ShowMessage('545: Rejei��o: Falha no schema XML � vers�o informada na versaoDados do SOAPHeader diverge da vers�o da mensagem');
546:ShowMessage('546: Rejei��o: Erro na Chave de Acesso � Campo Id � falta a literal NFC-e');
547:ShowMessage('547: Rejei��o: D�gito Verificador da Chave de Acesso da NFC-e Referenciada inv�lido');
548:ShowMessage('548: Rejei��o: CNPJ da NF referenciada inv�lido.');
549:ShowMessage('549: Rejei��o: CNPJ da NFC-e referenciada de produtor inv�lido.');
550:ShowMessage('550: Rejei��o: CPF da NFC-e referenciada de produtor inv�lido.');
551:ShowMessage('551: Rejei��o: IE da NFC-e referenciada de produtor inv�lido.');
552:ShowMessage('552: Rejei��o: D�gito Verificador da Chave de Acesso do CT-e Referenciado inv�lido');
553:ShowMessage('553: Rejei��o: Tipo autorizador do recibo diverge do �rg�o Autorizador.');
554:ShowMessage('554: Rejei��o: S�rie difere da faixa 0-899');
555:ShowMessage('555: Rejei��o: Tipo autorizador do protocolo diverge do �rg�o Autorizador.');
556:ShowMessage('556: Rejei��o: Justificativa de entrada em conting�ncia n�o deve ser informada para tipo de emiss�o normal.');
557:ShowMessage('557: Rejei��o: A Justificativa de entrada em conting�ncia deve ser informada.');
558:ShowMessage('558: Rejei��o: Data de entrada em conting�ncia posterior a data de recebimento.');
559:ShowMessage('559: Rejei��o: UF do Transportador n�o informada');
560:ShowMessage('560: Rejei��o: CNPJ base do emitente difere do CNPJ base da primeira NFC-e do lote recebido');
561:ShowMessage('561: Rejei��o: M�s de Emiss�o informado na Chave de Acesso difere do M�s de Emiss�o da NFC-e');
562:ShowMessage('562: Rejei��o: C�digo Num�rico informado na Chave de Acesso difere do C�digo Num�rico da NFC-e [chNFC-e:99999999999999999999999999999999999999999999]');
563:ShowMessage('563: Rejei��o: J� existe pedido de Inutiliza��o com a mesma faixa de inutiliza��o');
564:ShowMessage('564: Rejei��o: Total do Produto / Servi�o difere do somat�rio dos itens');
565:ShowMessage('565: Rejei��o: Falha no schema XML � inexiste a tag raiz esperada para o lote de NFC-e');
567:ShowMessage('567: Rejei��o: Falha no schema XML � vers�o informada na versaoDados do SOAPHeader diverge da vers�o do lote de NFC-e');
568:ShowMessage('568: Rejei��o: Falha no schema XML � inexiste atributo versao na tag raiz do lote de NFC-e');
569:ShowMessage('569: Rejei��o: Data de entrada em conting�ncia muito atrasada');
570:ShowMessage('570: Rejei��o: tpEmis = 3 s� � v�lido na conting�ncia SCAN');
571:ShowMessage('571: Rejei��o: O tpEmis informado diferente de 3 para conting�ncia SCAN');
572:ShowMessage('572: Rejei��o: Erro Atributo ID do evento n�o corresponde a concatena��o dos campos (�ID� + tpEvento + chNFC-e + nSeqEvento)');
573:ShowMessage('573: Rejei��o: Duplicidade de Evento');
574:ShowMessage('574: Rejei��o: O autor do evento diverge do emissor da NFC-e');
575:ShowMessage('575: Rejei��o: O autor do evento diverge do destinat�rio da NFC-e');
576:ShowMessage('576: Rejei��o: O autor do evento n�o � um �rg�o autorizado a gerar o evento');
577:ShowMessage('577: Rejei��o: A data do evento n�o pode ser menor que a data de emiss�o da NFC-e');
578:ShowMessage('578: Rejei��o: A data do evento n�o pode ser maior que a data do processamento');
579:ShowMessage('579: Rejei��o: A data do evento n�o pode ser menor que a data de autoriza��o para NFC-e n�o emitida em conting�ncia');
580:ShowMessage('580: Rejei��o: O evento exige uma NFC-e autorizada');
587:ShowMessage('587: Rejei��o: Usar somente o namespace padr�o da NFC-e');
588:ShowMessage('588: Rejei��o: N�o � permitida a presen�a de caracteres de edi��o no in�cio/fim da mensagem ou entre as tags da mensagem');
590:ShowMessage('590: Rejei��o: Informado CST para emissor do Simples Nacional (CRT=1)');
591:ShowMessage('591: Rejei��o: Informado CSOSN para emissor que n�o � do Simples Nacional (CRT diferente de 1)');
592:ShowMessage('592: Rejei��o: A NFC-e deve ter pelo menos um item de produto sujeito ao ICMS');
594:ShowMessage('594: Rejei��o: O n�mero de sequencia do evento informado � maior que o permitido');
595:ShowMessage('595: Rejei��o: A vers�o do leiaute da NFC-e utilizada n�o � mais v�lida');
596:ShowMessage('596: Rejei��o: Ambiente de homologa��o indispon�vel para recep��o de NFC-e da vers�o 1.10.');
597:ShowMessage('597: Rejei��o: CFOP de Importa��o e n�o informado dados de IPI');
598:ShowMessage('598: Rejei��o: NFC-e emitida em ambiente de homologa��o com Raz�o Social do destinat�rio diferente de NFC-e EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL');
599:ShowMessage('599: Rejei��o: CFOP de Importa��o e n�o informado dados de II');
601:ShowMessage('601: Rejei��o: Total do II difere do somat�rio dos itens');
602:ShowMessage('602: Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ICMS');
603:ShowMessage('603: Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ICMS');
604:ShowMessage('604: Rejei��o: Total do vOutro difere do somat�rio dos itens');
605:ShowMessage('605: Rejei��o: Total do vISS difere do somat�rio do vProd dos itens sujeitos ao ISSQN');
606:ShowMessage('606: Rejei��o: Total do vBC do ISS difere do somat�rio dos itens');
607:ShowMessage('607: Rejei��o: Total do ISS difere do somat�rio dos itens');
608:ShowMessage('608: Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ISSQN');
609:ShowMessage('609: Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ISSQN');
610:ShowMessage('610: Rejei��o: Total da NFC-e difere do somat�rio dos Valores comp�e o valor Total da NFC-e.');
611:ShowMessage('611: Rejei��o: cEAN inv�lido');
612:ShowMessage('612: Rejei��o: cEANTrib inv�lido');
613:ShowMessage('613: Rejei��o: Chave de Acesso difere da existente em BD');
614:ShowMessage('614: Rejei��o: Chave de Acesso inv�lida (C�digo UF inv�lido)');
615:ShowMessage('615: Rejei��o: Chave de Acesso inv�lida (Ano < 05 ou Ano maior que Ano corrente)');
616:ShowMessage('616: Rejei��o: Chave de Acesso inv�lida (M�s < 1 ou M�s > 12)');
617:ShowMessage('617: Rejei��o: Chave de Acesso inv�lida (CNPJ zerado ou d�gito inv�lido)');
618:ShowMessage('618: Rejei��o: Chave de Acesso inv�lida (modelo diferente de 55)');
619:ShowMessage('619: Rejei��o: Chave de Acesso inv�lida (n�mero NFC-e = 0)');
620:ShowMessage('620: Rejei��o: Chave de Acesso difere da existente em BD');
621:ShowMessage('621: Rejei��o: CPF Emitente n�o cadastrado');
622:ShowMessage('622: Rejei��o: IE emitente n�o vinculada ao CPF');
623:ShowMessage('623: Rejei��o: CPF Destinat�rio n�o cadastrado');
624:ShowMessage('624: Rejei��o: IE Destinat�rio n�o vinculada ao CPF');
625:ShowMessage('625: Rejei��o: Inscri��o SUFRAMA deve ser informada na venda com isen��o para ZFM');
626:ShowMessage('626: Rejei��o: O CFOP de opera��o isenta para ZFM deve ser 6109 ou 6110');
627:ShowMessage('627: Rejei��o: O valor do ICMS desonerado deve ser informado');
628:ShowMessage('628: Rejei��o: Total da NFC-e superior ao valor limite estabelecido pela SEFAZ [Limite]');
629:ShowMessage('629: Rejei��o: Valor do Produto difere do produto Valor Unit�rio de Comercializa��o e Quantidade Comercial');
630:ShowMessage('630: Rejei��o: Valor do Produto difere do produto Valor Unit�rio de Tributa��o e Quantidade Tribut�vel');
635:ShowMessage('635: Rejei��o: NFC-e com mesmo n�mero e s�rie j� transmitida e aguardando processamento');
301:ShowMessage('301: Uso Denegado: Irregularidade fiscal do emitente');
302:ShowMessage('302: Uso Denegado: Irregularidade fiscal do destinat�rio');
999:ShowMessage('999: Rejei��o: Erro n�o catalogado (informar a mensagem de erro capturado no tratamento da exce��o)');
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end;
procedure TForm_Principal.StatusUltimaNFCeClick(Sender: TObject);
Var
Ret:integer;
Status : string;
iConta : integer;

begin
for iConta := 1 to 7 do Status := Status + ' ';
iRetorno := Bematech_FI_StatusUltimaNFCe(Status);
Memo1.Lines.Add('Status da �ltima NFC-e:');
Ret:=strToInt(Status);
case Ret of
100:Memo1.Lines.Add('100: Autorizado o uso da NFC-e');
101:Memo1.Lines.Add('101: Cancelamento de NFC-e homologado');
102:Memo1.Lines.Add('102: Inutiliza��o de n�mero homologado');
103:Memo1.Lines.Add('103: Lote recebido com sucesso');
104:Memo1.Lines.Add('104: Lote processado');
105:Memo1.Lines.Add('105: Lote em processamento');
106:Memo1.Lines.Add('106: Lote n�o localizado');
107:Memo1.Lines.Add('107: Servi�o em Opera��o');
108:Memo1.Lines.Add('108: Servi�o Paralisado Momentaneamente (curto prazo)');
109:Memo1.Lines.Add('109: Servi�o Paralisado sem Previs�o');
110:Memo1.Lines.Add('110: Uso Denegado');
111:Memo1.Lines.Add('111: Consulta cadastro com uma ocorr�ncia');
112:Memo1.Lines.Add('112: Consulta cadastro com mais de uma ocorr�ncia');
128:Memo1.Lines.Add('128: Lote de Evento Processado');
135:Memo1.Lines.Add('135: Evento registrado e vinculado a NFC-e');
136:Memo1.Lines.Add('136: Evento registrado, mas n�o vinculado a NFC-e');
201:Memo1.Lines.Add('201: O numero m�ximo de numera��o de NFC-e a inutilizar ultrapassou o limite');
202:Memo1.Lines.Add('202: Falha no reconhecimento da autoria ou integridade do arquivo digital');
203:Memo1.Lines.Add('203: Emissor n�o habilitado para emiss�o da NFC-e');
204:Memo1.Lines.Add('204: Duplicidade de NFC-e [nRec:999999999999999]');
205:Memo1.Lines.Add('205: NFC-e est� denegada na base de dados da SEFAZ [nRec:999999999999999]');
206:Memo1.Lines.Add('206: NFC-e j� est� inutilizada na Base de dados da SEFAZ');
207:Memo1.Lines.Add('207: CNPJ do emitente inv�lido');
208:Memo1.Lines.Add('208: Rejei��o: CNPJ do destinat�rio inv�lido');
209:Memo1.Lines.Add('209: Rejei��o: IE do emitente inv�lida');
210:Memo1.Lines.Add('210: Rejei��o: IE do destinat�rio inv�lida');
211:Memo1.Lines.Add('211: Rejei��o: IE do substituto inv�lida');
212:Memo1.Lines.Add('212: Rejei��o: Data de emiss�o NFC-e posterior a data de recebimento');
213:Memo1.Lines.Add('213: Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital');
214:Memo1.Lines.Add('214: Rejei��o: Tamanho da mensagem excedeu o limite estabelecido');
215:Memo1.Lines.Add('215: Rejei��o: Falha no schema XML');
216:Memo1.Lines.Add('216: Rejei��o: Chave de Acesso difere da cadastrada');
217:Memo1.Lines.Add('217: Rejei��o: NFC-e n�o consta na base de dados da SEFAZ');
218:Memo1.Lines.Add('218: NFC-e j� est� cancelada na base de dados da SEFAZ [nRec:999999999999999]');
219:Memo1.Lines.Add('219: Rejei��o: Circula��o da NFC-e verificada');
220:Memo1.Lines.Add('220: Rejei��o: Prazo de Cancelamento superior ao previsto na Legisla��o');
221:Memo1.Lines.Add('221: Rejei��o: Confirmado o recebimento da NFC-e pelo destinat�rio');
222:Memo1.Lines.Add('222: Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado');
223:Memo1.Lines.Add('223: Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta');
224:Memo1.Lines.Add('224: Rejei��o: A faixa inicial � maior que a faixa final');
225:Memo1.Lines.Add('225: Rejei��o: Falha no Schema XML do lote de NFC-e');
226:Memo1.Lines.Add('226: Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora');
227:Memo1.Lines.Add('227: Rejei��o: Erro na Chave de Acesso - Campo Id � falta a literal NFC-e');
228:Memo1.Lines.Add('228: Rejei��o: Data de Emiss�o muito atrasada');
229:Memo1.Lines.Add('229: Rejei��o: IE do emitente n�o informada');
230:Memo1.Lines.Add('230: Rejei��o: IE do emitente n�o cadastrada');
231:Memo1.Lines.Add('231: Rejei��o: IE do emitente n�o vinculada ao CNPJ');
232:Memo1.Lines.Add('232: Rejei��o: IE do destinat�rio n�o informada');
233:Memo1.Lines.Add('233: Rejei��o: IE do destinat�rio n�o cadastrada');
234:Memo1.Lines.Add('234: Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ');
235:Memo1.Lines.Add('235: Rejei��o: Inscri��o SUFRAMA inv�lida');
236:Memo1.Lines.Add('236: Rejei��o: Chave de Acesso com d�gito verificador inv�lido');
237:Memo1.Lines.Add('237: Rejei��o: CPF do destinat�rio inv�lido');
238:Memo1.Lines.Add('238: Rejei��o: Cabe�alho - Vers�o do arquivo XML superior a Vers�o vigente');
239:Memo1.Lines.Add('239: Rejei��o: Cabe�alho - Vers�o do arquivo XML n�o suportada');
240:Memo1.Lines.Add('240: Rejei��o: Cancelamento/Inutiliza��o - Irregularidade Fiscal do Emitente');
241:Memo1.Lines.Add('241: Rejei��o: Um n�mero da faixa j� foi utilizado');
242:Memo1.Lines.Add('242: Rejei��o: Cabe�alho - Falha no Schema XML');
243:Memo1.Lines.Add('243: Rejei��o: XML Mal Formado');
244:Memo1.Lines.Add('244: Rejei��o: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do Emitente');
245:Memo1.Lines.Add('245: Rejei��o: CNPJ Emitente n�o cadastrado');
246:Memo1.Lines.Add('246: Rejei��o: CNPJ Destinat�rio n�o cadastrado');
247:Memo1.Lines.Add('247: Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora');
248:Memo1.Lines.Add('248: Rejei��o: UF do Recibo diverge da UF autorizadora');
249:Memo1.Lines.Add('249: Rejei��o: UF da Chave de Acesso diverge da UF autorizadora');
250:Memo1.Lines.Add('250: Rejei��o: UF diverge da UF autorizadora');
251:Memo1.Lines.Add('251: Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA');
252:Memo1.Lines.Add('252: Rejei��o: Ambiente informado diverge do Ambiente de recebimento');
253:Memo1.Lines.Add('253: Rejei��o: Digito Verificador da chave de acesso composta inv�lida');
254:Memo1.Lines.Add('254: Rejei��o: NFC-e complementar n�o possui NFC-e referenciada');
255:Memo1.Lines.Add('255: Rejei��o: NFC-e complementar possui mais de uma NF referenciada');
256:Memo1.Lines.Add('256: Rejei��o: Uma NFC-e da faixa j� est� inutilizada na Base de dados da SEFAZ');
257:Memo1.Lines.Add('257: Rejei��o: Solicitante n�o habilitado para emiss�o da NFC-e');
258:Memo1.Lines.Add('258: Rejei��o: CNPJ da consulta inv�lido');
259:Memo1.Lines.Add('259: Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF');
260:Memo1.Lines.Add('260: Rejei��o: IE da consulta inv�lida');
261:Memo1.Lines.Add('261: Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF');
262:Memo1.Lines.Add('262: Rejei��o: UF n�o fornece consulta por CPF');
263:Memo1.Lines.Add('263: Rejei��o: CPF da consulta inv�lido');
264:Memo1.Lines.Add('264: Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF');
265:Memo1.Lines.Add('265: Rejei��o: Sigla da UF da consulta difere da UF do Web Service');
266:Memo1.Lines.Add('266: Rejei��o: S�rie utilizada n�o permitida no Web Service');
267:Memo1.Lines.Add('267: Rejei��o: NFC-e Complementar referencia uma NFC-e inexistente');
268:Memo1.Lines.Add('268: Rejei��o: NFC-e Complementar referencia uma outra NFC-e Complementar');
269:Memo1.Lines.Add('269: Rejei��o: CNPJ Emitente da NFC-e Complementar difere do CNPJ da NFC-e Referenciada');
270:Memo1.Lines.Add('270: Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido');
271:Memo1.Lines.Add('271: Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente');
272:Memo1.Lines.Add('272: Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido');
273:Memo1.Lines.Add('273: Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente');
274:Memo1.Lines.Add('274: Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido');
275:Memo1.Lines.Add('275: Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio');
276:Memo1.Lines.Add('276: Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido');
277:Memo1.Lines.Add('277: Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de Retirada');
278:Memo1.Lines.Add('278: Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido');
279:Memo1.Lines.Add('279: Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega');
280:Memo1.Lines.Add('280: Rejei��o: Certificado Transmissor inv�lido');
281:Memo1.Lines.Add('281: Rejei��o: Certificado Transmissor Data Validade');
282:Memo1.Lines.Add('282: Rejei��o: Certificado Transmissor sem CNPJ');
283:Memo1.Lines.Add('283: Rejei��o: Certificado Transmissor - erro Cadeia de Certifica��o');
284:Memo1.Lines.Add('284: Rejei��o: Certificado Transmissor revogado');
285:Memo1.Lines.Add('285: Rejei��o: Certificado Transmissor difere ICP-Brasil');
286:Memo1.Lines.Add('286: Rejei��o: Certificado Transmissor erro no acesso a LCR');
287:Memo1.Lines.Add('287: Rejei��o: C�digo Munic�pio do FG - ISSQN: d�gito inv�lido');
288:Memo1.Lines.Add('288: Rejei��o: C�digo Munic�pio do FG - Transporte: d�gito inv�lido');
289:Memo1.Lines.Add('289: Rejei��o: C�digo da UF informada diverge da UF solicitada');
290:Memo1.Lines.Add('290: Rejei��o: Certificado Assinatura inv�lido');
291:Memo1.Lines.Add('291: Rejei��o: Certificado Assinatura Data Validade');
292:Memo1.Lines.Add('292: Rejei��o: Certificado Assinatura sem CNPJ');
293:Memo1.Lines.Add('293: Rejei��o: Certificado Assinatura - erro Cadeia de Certifica��o');
294:Memo1.Lines.Add('294: Rejei��o: Certificado Assinatura revogado');
295:Memo1.Lines.Add('295: Rejei��o: Certificado Assinatura difere ICP-Brasil');
296:Memo1.Lines.Add('296: Rejei��o: Certificado Assinatura erro no acesso a LCR');
297:Memo1.Lines.Add('297: Rejei��o: Assinatura difere do calculado');
298:Memo1.Lines.Add('298: Rejei��o: Assinatura difere do padr�o do Sistema');
299:Memo1.Lines.Add('299: Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8');
401:Memo1.Lines.Add('401: Rejei��o: CPF do remetente inv�lido');
402:Memo1.Lines.Add('402: Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8');
403:Memo1.Lines.Add('403: Rejei��o: O grupo de informa��es da NFC-e avulsa � de uso exclusivo do Fisco');
404:Memo1.Lines.Add('404: Rejei��o: Uso de prefixo de namespace n�o permitido');
405:Memo1.Lines.Add('405: Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido');
406:Memo1.Lines.Add('406: Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido');
407:Memo1.Lines.Add('407: Rejei��o: O CPF s� pode ser informado no campo emitente para a NFC-e avulsa');
409:Memo1.Lines.Add('409: Rejei��o: Campo cUF inexistente no elemento NFC-eCabecMsg do SOAP Header');
410:Memo1.Lines.Add('410: Rejei��o: UF informada no campo cUF n�o � atendida pelo Web Service');
411:Memo1.Lines.Add('411: Rejei��o: Campo versaoDados inexistente no elemento NFC-eCabecMsg do SOAP Header');
420:Memo1.Lines.Add('420: Rejei��o: Cancelamento para NFC-e j� cancelada');
450:Memo1.Lines.Add('450: Rejei��o: Modelo da NFC-e diferente de 55');
451:Memo1.Lines.Add('451: Rejei��o: Processo de emiss�o informado inv�lido');
452:Memo1.Lines.Add('452: Rejei��o: Tipo Autorizador do Recibo diverge do �rg�o Autorizador');
453:Memo1.Lines.Add('453: Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual');
454:Memo1.Lines.Add('454: Rejei��o: Ano de inutiliza��o n�o pode ser iNFC-erior a 2006');
478:Memo1.Lines.Add('478: Rejei��o: Local da entrega n�o informado para faturamento direto de ve�culos novos');
489:Memo1.Lines.Add('489: Rejei��o: CNPJ informado inv�lido (DV ou zeros)');
490:Memo1.Lines.Add('490: Rejei��o: CPF informado inv�lido (DV ou zeros)');
491:Memo1.Lines.Add('491: Rejei��o: O tpEvento informado inv�lido');
492:Memo1.Lines.Add('492: Rejei��o: O verEvento informado inv�lido');
493:Memo1.Lines.Add('493: Rejei��o: Evento n�o atende o Schema XML espec�fico');
494:Memo1.Lines.Add('494: Rejei��o: Chave de Acesso inexistente');
502:Memo1.Lines.Add('502: Rejei��o: Erro na Chave de Acesso - Campo Id n�o corresponde � concatena��o dos campos correspondentes');
503:Memo1.Lines.Add('503: Rejei��o: S�rie utilizada fora da faixa permitida no SCAN (900-999)');
504:Memo1.Lines.Add('504: Rejei��o: Data de Entrada/Sa�da posterior ao permitido');
505:Memo1.Lines.Add('505: Rejei��o: Data de Entrada/Sa�da anterior ao permitido');
506:Memo1.Lines.Add('506: Rejei��o: Data de Sa�da menor que a Data de Emiss�o');
507:Memo1.Lines.Add('507: Rejei��o: O CNPJ do destinat�rio/remetente n�o deve ser informado em opera��o com o exterior');
508:Memo1.Lines.Add('508: Rejei��o: O CNPJ com conte�do nulo s� � v�lido em opera��o com exterior');
509:Memo1.Lines.Add('509: Rejei��o: Informado c�digo de munic�pio diferente de �9999999� para opera��o com o exterior');
510:Memo1.Lines.Add('510: Rejei��o: Opera��o com Exterior e C�digo Pa�s destinat�rio � 1058 (Brasil) ou n�o informado');
511:Memo1.Lines.Add('511: Rejei��o: N�o � de Opera��o com Exterior e C�digo Pa�s destinat�rio difere de 1058 (Brasil)');
512:Memo1.Lines.Add('512: Rejei��o: CNPJ do Local de Retirada inv�lido');
513:Memo1.Lines.Add('513: Rejei��o: C�digo Munic�pio do Local de Retirada deve ser 9999999 para UF retirada = EX');
514:Memo1.Lines.Add('514: Rejei��o: CNPJ do Local de Entrega inv�lido');
515:Memo1.Lines.Add('515: Rejei��o: C�digo Munic�pio do Local de Entrega deve ser 9999999 para UF entrega = EX');
516:Memo1.Lines.Add('516: Rejei��o: Falha no schema XML � inexiste a tag raiz esperada para a mensagem');
517:Memo1.Lines.Add('517: Rejei��o: Falha no schema XML � inexiste atributo versao na tag raiz da mensagem');
518:Memo1.Lines.Add('518: Rejei��o: CFOP de entrada para NFC-e de sa�da');
519:Memo1.Lines.Add('519: Rejei��o: CFOP de sa�da para NFC-e de entrada');
520:Memo1.Lines.Add('520: Rejei��o: CFOP de Opera��o com Exterior e UF destinat�rio difere de EX');
521:Memo1.Lines.Add('521: Rejei��o: CFOP de Opera��o Estadual e UF do emitente difere da UF do destinat�rio para destinat�rio contribuinte do ICMS.');
522:Memo1.Lines.Add('522: Rejei��o: CFOP de Opera��o Estadual e UF emitente difere da UF remetente para remetente contribuinte do ICMS.');
523:Memo1.Lines.Add('523: Rejei��o: CFOP n�o � de Opera��o Estadual e UF emitente igual a UFdestinat�rio.');
524:Memo1.Lines.Add('524: Rejei��o: CFOP de Opera��o com Exterior e n�o informado NCM');
525:Memo1.Lines.Add('525: Rejei��o: CFOP de Importa��o e n�o informado dados da DI');
526:Memo1.Lines.Add('526: Rejei��o: CFOP de Exporta��o e n�o informado Local de Embarque');
527:Memo1.Lines.Add('527: Rejei��o: Opera��o de Exporta��o com informa��o de ICMS incompat�vel');
528:Memo1.Lines.Add('528: Rejei��o: Valor do ICMS difere do produto BC e Al�quota');
529:Memo1.Lines.Add('529: Rejei��o: NCM de informa��o obrigat�ria para produto tributado pelo IPI');
530:Memo1.Lines.Add('530: Rejei��o: Opera��o com tributa��o de ISSQN sem informar a Inscri��o Municipal');
531:Memo1.Lines.Add('531: Rejei��o: Total da BC ICMS difere do somat�rio dos itens');
532:Memo1.Lines.Add('532: Rejei��o: Total do ICMS difere do somat�rio dos itens');
533:Memo1.Lines.Add('533: Rejei��o: Total da BC ICMS-ST difere do somat�rio dos itens');
534:Memo1.Lines.Add('534: Rejei��o: Total do ICMS-ST difere do somat�rio dos itens');
535:Memo1.Lines.Add('535: Rejei��o: Total do Frete difere do somat�rio dos itens');
536:Memo1.Lines.Add('536: Rejei��o: Total do Seguro difere do somat�rio dos itens');
537:Memo1.Lines.Add('537: Rejei��o: Total do Desconto difere do somat�rio dos itens');
538:Memo1.Lines.Add('538: Rejei��o: Total do IPI difere do somat�rio dos itens');
539:Memo1.Lines.Add('539: Duplicidade de NFC-e com diferen�a na Chave de Acesso [chNFC-e: 99999999999999999999999999999999999999999999][nRec:999999999999999]');
540:Memo1.Lines.Add('540: Rejei��o: CPF do Local de Retirada inv�lido');
541:Memo1.Lines.Add('541: Rejei��o: CPF do Local de Entrega inv�lido');
542:Memo1.Lines.Add('542: Rejei��o: CNPJ do Transportador inv�lido');
543:Memo1.Lines.Add('543: Rejei��o: CPF do Transportador inv�lido');
544:Memo1.Lines.Add('544: Rejei��o: IE do Transportador inv�lida');
545:Memo1.Lines.Add('545: Rejei��o: Falha no schema XML � vers�o informada na versaoDados do SOAPHeader diverge da vers�o da mensagem');
546:Memo1.Lines.Add('546: Rejei��o: Erro na Chave de Acesso � Campo Id � falta a literal NFC-e');
547:Memo1.Lines.Add('547: Rejei��o: D�gito Verificador da Chave de Acesso da NFC-e Referenciada inv�lido');
548:Memo1.Lines.Add('548: Rejei��o: CNPJ da NF referenciada inv�lido.');
549:Memo1.Lines.Add('549: Rejei��o: CNPJ da NFC-e referenciada de produtor inv�lido.');
550:Memo1.Lines.Add('550: Rejei��o: CPF da NFC-e referenciada de produtor inv�lido.');
551:Memo1.Lines.Add('551: Rejei��o: IE da NFC-e referenciada de produtor inv�lido.');
552:Memo1.Lines.Add('552: Rejei��o: D�gito Verificador da Chave de Acesso do CT-e Referenciado inv�lido');
553:Memo1.Lines.Add('553: Rejei��o: Tipo autorizador do recibo diverge do �rg�o Autorizador.');
554:Memo1.Lines.Add('554: Rejei��o: S�rie difere da faixa 0-899');
555:Memo1.Lines.Add('555: Rejei��o: Tipo autorizador do protocolo diverge do �rg�o Autorizador.');
556:Memo1.Lines.Add('556: Rejei��o: Justificativa de entrada em conting�ncia n�o deve ser informada para tipo de emiss�o normal.');
557:Memo1.Lines.Add('557: Rejei��o: A Justificativa de entrada em conting�ncia deve ser informada.');
558:Memo1.Lines.Add('558: Rejei��o: Data de entrada em conting�ncia posterior a data de recebimento.');
559:Memo1.Lines.Add('559: Rejei��o: UF do Transportador n�o informada');
560:Memo1.Lines.Add('560: Rejei��o: CNPJ base do emitente difere do CNPJ base da primeira NFC-e do lote recebido');
561:Memo1.Lines.Add('561: Rejei��o: M�s de Emiss�o informado na Chave de Acesso difere do M�s de Emiss�o da NFC-e');
562:Memo1.Lines.Add('562: Rejei��o: C�digo Num�rico informado na Chave de Acesso difere do C�digo Num�rico da NFC-e [chNFC-e:99999999999999999999999999999999999999999999]');
563:Memo1.Lines.Add('563: Rejei��o: J� existe pedido de Inutiliza��o com a mesma faixa de inutiliza��o');
564:Memo1.Lines.Add('564: Rejei��o: Total do Produto / Servi�o difere do somat�rio dos itens');
565:Memo1.Lines.Add('565: Rejei��o: Falha no schema XML � inexiste a tag raiz esperada para o lote de NFC-e');
567:Memo1.Lines.Add('567: Rejei��o: Falha no schema XML � vers�o informada na versaoDados do SOAPHeader diverge da vers�o do lote de NFC-e');
568:Memo1.Lines.Add('568: Rejei��o: Falha no schema XML � inexiste atributo versao na tag raiz do lote de NFC-e');
569:Memo1.Lines.Add('569: Rejei��o: Data de entrada em conting�ncia muito atrasada');
570:Memo1.Lines.Add('570: Rejei��o: tpEmis = 3 s� � v�lido na conting�ncia SCAN');
571:Memo1.Lines.Add('571: Rejei��o: O tpEmis informado diferente de 3 para conting�ncia SCAN');
572:Memo1.Lines.Add('572: Rejei��o: Erro Atributo ID do evento n�o corresponde a concatena��o dos campos (�ID� + tpEvento + chNFC-e + nSeqEvento)');
573:Memo1.Lines.Add('573: Rejei��o: Duplicidade de Evento');
574:Memo1.Lines.Add('574: Rejei��o: O autor do evento diverge do emissor da NFC-e');
575:Memo1.Lines.Add('575: Rejei��o: O autor do evento diverge do destinat�rio da NFC-e');
576:Memo1.Lines.Add('576: Rejei��o: O autor do evento n�o � um �rg�o autorizado a gerar o evento');
577:Memo1.Lines.Add('577: Rejei��o: A data do evento n�o pode ser menor que a data de emiss�o da NFC-e');
578:Memo1.Lines.Add('578: Rejei��o: A data do evento n�o pode ser maior que a data do processamento');
579:Memo1.Lines.Add('579: Rejei��o: A data do evento n�o pode ser menor que a data de autoriza��o para NFC-e n�o emitida em conting�ncia');
580:Memo1.Lines.Add('580: Rejei��o: O evento exige uma NFC-e autorizada');
587:Memo1.Lines.Add('587: Rejei��o: Usar somente o namespace padr�o da NFC-e');
588:Memo1.Lines.Add('588: Rejei��o: N�o � permitida a presen�a de caracteres de edi��o no in�cio/fim da mensagem ou entre as tags da mensagem');
590:Memo1.Lines.Add('590: Rejei��o: Informado CST para emissor do Simples Nacional (CRT=1)');
591:Memo1.Lines.Add('591: Rejei��o: Informado CSOSN para emissor que n�o � do Simples Nacional (CRT diferente de 1)');
592:Memo1.Lines.Add('592: Rejei��o: A NFC-e deve ter pelo menos um item de produto sujeito ao ICMS');
594:Memo1.Lines.Add('594: Rejei��o: O n�mero de sequencia do evento informado � maior que o permitido');
595:Memo1.Lines.Add('595: Rejei��o: A vers�o do leiaute da NFC-e utilizada n�o � mais v�lida');
596:Memo1.Lines.Add('596: Rejei��o: Ambiente de homologa��o indispon�vel para recep��o de NFC-e da vers�o 1.10.');
597:Memo1.Lines.Add('597: Rejei��o: CFOP de Importa��o e n�o informado dados de IPI');
598:Memo1.Lines.Add('598: Rejei��o: NFC-e emitida em ambiente de homologa��o com Raz�o Social do destinat�rio diferente de NFC-e EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL');
599:Memo1.Lines.Add('599: Rejei��o: CFOP de Importa��o e n�o informado dados de II');
601:Memo1.Lines.Add('601: Rejei��o: Total do II difere do somat�rio dos itens');
602:Memo1.Lines.Add('602: Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ICMS');
603:Memo1.Lines.Add('603: Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ICMS');
604:Memo1.Lines.Add('604: Rejei��o: Total do vOutro difere do somat�rio dos itens');
605:Memo1.Lines.Add('605: Rejei��o: Total do vISS difere do somat�rio do vProd dos itens sujeitos ao ISSQN');
606:Memo1.Lines.Add('606: Rejei��o: Total do vBC do ISS difere do somat�rio dos itens');
607:Memo1.Lines.Add('607: Rejei��o: Total do ISS difere do somat�rio dos itens');
608:Memo1.Lines.Add('608: Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ISSQN');
609:Memo1.Lines.Add('609: Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ISSQN');
610:Memo1.Lines.Add('610: Rejei��o: Total da NFC-e difere do somat�rio dos Valores comp�e o valor Total da NFC-e.');
611:Memo1.Lines.Add('611: Rejei��o: cEAN inv�lido');
612:Memo1.Lines.Add('612: Rejei��o: cEANTrib inv�lido');
613:Memo1.Lines.Add('613: Rejei��o: Chave de Acesso difere da existente em BD');
614:Memo1.Lines.Add('614: Rejei��o: Chave de Acesso inv�lida (C�digo UF inv�lido)');
615:Memo1.Lines.Add('615: Rejei��o: Chave de Acesso inv�lida (Ano < 05 ou Ano maior que Ano corrente)');
616:Memo1.Lines.Add('616: Rejei��o: Chave de Acesso inv�lida (M�s < 1 ou M�s > 12)');
617:Memo1.Lines.Add('617: Rejei��o: Chave de Acesso inv�lida (CNPJ zerado ou d�gito inv�lido)');
618:Memo1.Lines.Add('618: Rejei��o: Chave de Acesso inv�lida (modelo diferente de 55)');
619:Memo1.Lines.Add('619: Rejei��o: Chave de Acesso inv�lida (n�mero NFC-e = 0)');
620:Memo1.Lines.Add('620: Rejei��o: Chave de Acesso difere da existente em BD');
621:Memo1.Lines.Add('621: Rejei��o: CPF Emitente n�o cadastrado');
622:Memo1.Lines.Add('622: Rejei��o: IE emitente n�o vinculada ao CPF');
623:Memo1.Lines.Add('623: Rejei��o: CPF Destinat�rio n�o cadastrado');
624:Memo1.Lines.Add('624: Rejei��o: IE Destinat�rio n�o vinculada ao CPF');
625:Memo1.Lines.Add('625: Rejei��o: Inscri��o SUFRAMA deve ser informada na venda com isen��o para ZFM');
626:Memo1.Lines.Add('626: Rejei��o: O CFOP de opera��o isenta para ZFM deve ser 6109 ou 6110');
627:Memo1.Lines.Add('627: Rejei��o: O valor do ICMS desonerado deve ser informado');
628:Memo1.Lines.Add('628: Rejei��o: Total da NFC-e superior ao valor limite estabelecido pela SEFAZ [Limite]');
629:Memo1.Lines.Add('629: Rejei��o: Valor do Produto difere do produto Valor Unit�rio de Comercializa��o e Quantidade Comercial');
630:Memo1.Lines.Add('630: Rejei��o: Valor do Produto difere do produto Valor Unit�rio de Tributa��o e Quantidade Tribut�vel');
635:Memo1.Lines.Add('635: Rejei��o: NFC-e com mesmo n�mero e s�rie j� transmitida e aguardando processamento');
301:Memo1.Lines.Add('301: Uso Denegado: Irregularidade fiscal do emitente');
302:Memo1.Lines.Add('302: Uso Denegado: Irregularidade fiscal do destinat�rio');
999:Memo1.Lines.Add('999: Rejei��o: Erro n�o catalogado (informar a mensagem de erro capturado no tratamento da exce��o)');
else
Memo1.Lines.Add('Alerta! Ocorr�ncia n�o contida nos retornos da SEFAZ');
end;
Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('StatusUltimaNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno StatusUltimaNFCe: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;

procedure TForm_Principal.StatusUltimoCancelamentoNFCeClick(Sender: TObject);
var
cStatus : string;
iConta  : integer;
Ret:integer;

begin

for iConta := 1 to 5 do cStatus := cStatus + ' ';//destinado a receber o status, 5 caracteres.
iRetorno := Bematech_FI_StatusUltimoCancelamentoNFCe(cStatus);

Ret:=strToInt(cStatus);

Memo1.Lines.Add('Status do �ltimo cancelamento: ');
case Ret of
100:Memo1.Lines.Add('Autorizado o uso da NFC-e');
101:Memo1.Lines.Add('Cancelamento de NF-e homologado');
102:Memo1.Lines.Add('Inutiliza��o de n�mero homologado');
103:Memo1.Lines.Add('Lote recebido com sucesso');
104:Memo1.Lines.Add('Lote processado');
105:Memo1.Lines.Add('Lote em processamento');
106:Memo1.Lines.Add('Lote n�o localizado');
107:Memo1.Lines.Add('Servi�o em Opera��o');
108:Memo1.Lines.Add('Servi�o Paralisado Momentaneamente (curto prazo)');
109:Memo1.Lines.Add('Servi�o Paralisado sem Previs�o');
110:Memo1.Lines.Add('Uso Denegado');
111:Memo1.Lines.Add('Consulta cadastro com uma ocorr�ncia');
112:Memo1.Lines.Add('Consulta cadastro com mais de uma ocorr�ncia');
113:Memo1.Lines.Add('SCAN ser� desabilitado para a UF �s hh:mm');
114:Memo1.Lines.Add('SCAN desabilitado pela SEFAZ Origem');
128:Memo1.Lines.Add('Lote de Evento Processado');
135:Memo1.Lines.Add('Evento registrado e vinculado a NF-e');
136:Memo1.Lines.Add('Evento registrado, mas n�o vinculado a NF-e');
137:Memo1.Lines.Add('Nenhum documento localizado para o Destinat�rio');
138:Memo1.Lines.Add('Documento localizado para o Destinat�rio');
139:Memo1.Lines.Add('Pedido de Download processado');
140:Memo1.Lines.Add('Download disponibilizado');
150:Memo1.Lines.Add('Autorizado o uso da NF-e');
151:Memo1.Lines.Add('Cancelamento de NF-e homologado fora de prazo');
155:Memo1.Lines.Add('Cancelamento de NF-e homologado fora de prazo');
201:Memo1.Lines.Add('Rejei��o: O numero m�ximo de numera��o de NF-e a inutilizar ultrapassou o limite');
202:Memo1.Lines.Add('Rejei��o: Falha no reconhecimento da autoria ou integridade do arquivo digital');
203:Memo1.Lines.Add('Rejei��o: Emissor n�o habilitado para emiss�o da NF-e');
204:Memo1.Lines.Add('Rejei��o: Duplicidade de NF-e');
205:Memo1.Lines.Add('Rejei��o: NF-e est� denegada na base de dados da SEFAZ');
206:Memo1.Lines.Add('Rejei��o: NF-e j� est� inutilizada na Base de dados da SEFAZ');
207:Memo1.Lines.Add('Rejei��o: CNPJ do emitente inv�lido');
208:Memo1.Lines.Add('Rejei��o: CNPJ do destinat�rio inv�lido');
209:Memo1.Lines.Add('Rejei��o: IE do emitente inv�lida');
210:Memo1.Lines.Add('Rejei��o: IE do destinat�rio inv�lida');
211:Memo1.Lines.Add('Rejei��o: IE do substituto inv�lida');
212:Memo1.Lines.Add('Rejei��o: Data de emiss�o NF-e posterior a data de recebimento');
213:Memo1.Lines.Add('Rejei��o: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital');
214:Memo1.Lines.Add('Rejei��o: Tamanho da mensagem excedeu o limite estabelecido');
215:Memo1.Lines.Add('Rejei��o: Falha no schema XML');
216:Memo1.Lines.Add('Rejei��o: Chave de Acesso difere da cadastrada');
217:Memo1.Lines.Add('Rejei��o: NF-e n�o consta na base de dados da SEFAZ');
218:Memo1.Lines.Add('Rejei��o: NF-e j� esta cancelada na base de dados da SEFAZ');
219:Memo1.Lines.Add('Rejei��o: Circula��o da NF-e verificada');
220:Memo1.Lines.Add('Rejei��o: Prazo de Cancelamento Superior ao Previsto na Legisla��o');
221:Memo1.Lines.Add('Rejei��o: Confirmado o recebimento da NF-e pelo destinat�rio');
222:Memo1.Lines.Add('Rejei��o: Protocolo de Autoriza��o de Uso difere do cadastrado');
223:Memo1.Lines.Add('Rejei��o: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta');
224:Memo1.Lines.Add('Rejei��o: A faixa inicial � maior que a faixa final');
225:Memo1.Lines.Add('Rejei��o: Falha no Schema XML da NFe');
226:Memo1.Lines.Add('Rejei��o: C�digo da UF do Emitente diverge da UF autorizadora');
227:Memo1.Lines.Add('Rejei��o: Erro na Chave de Acesso - Campo ID');
228:Memo1.Lines.Add('Rejei��o: Data de Emiss�o muito atrasada');
229:Memo1.Lines.Add('Rejei��o: IE do emitente n�o informada');
230:Memo1.Lines.Add('Rejei��o: IE do emitente n�o cadastrada');
231:Memo1.Lines.Add('Rejei��o: IE do emitente n�o vinculada ao CNPJ');
232:Memo1.Lines.Add('Rejei��o: IE do destinat�rio n�o informada');
233:Memo1.Lines.Add('Rejei��o: IE do destinat�rio n�o cadastrada');
234:Memo1.Lines.Add('Rejei��o: IE do destinat�rio n�o vinculada ao CNPJ');
235:Memo1.Lines.Add('Rejei��o: Inscri��o SUFRAMA inv�lida');
236:Memo1.Lines.Add('Rejei��o: Chave de Acesso com d�gito verificador inv�lido');
237:Memo1.Lines.Add('Rejei��o: CPF do destinat�rio inv�lido');
238:Memo1.Lines.Add('Rejei��o: Cabe�alho - Vers�o do arquivo XML superior a Vers�o vigente');
239:Memo1.Lines.Add('Rejei��o: Cabe�alho - Vers�o do arquivo XML n�o suportada');
240:Memo1.Lines.Add('Rejei��o: Cancelamento/Inutiliza��o - Irregularidade Fiscal do Emitente');
241:Memo1.Lines.Add('Rejei��o: Um n�mero da faixa j� foi utilizado');
242:Memo1.Lines.Add('Rejei��o: Cabe�alho - Falha no Schema XML');
243:Memo1.Lines.Add('Rejei��o: XML Mal Formado');
244:Memo1.Lines.Add('Rejei��o: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do Emitente');
245:Memo1.Lines.Add('Rejei��o: CNPJ Emitente n�o cadastrado');
246:Memo1.Lines.Add('Rejei��o: CNPJ Destinat�rio n�o cadastrado');
247:Memo1.Lines.Add('Rejei��o: Sigla da UF do Emitente diverge da UF autorizadora');
248:Memo1.Lines.Add('Rejei��o: UF do Recibo diverge da UF autorizadora');
249:Memo1.Lines.Add('Rejei��o: UF da Chave de Acesso diverge da UF autorizadora');
250:Memo1.Lines.Add('Rejei��o: UF diverge da UF autorizadora');
251:Memo1.Lines.Add('Rejei��o: UF/Munic�pio destinat�rio n�o pertence a SUFRAMA');
252:Memo1.Lines.Add('Rejei��o: Ambiente informado diverge do Ambiente de recebimento');
253:Memo1.Lines.Add('Rejei��o: Digito Verificador da chave de acesso composta inv�lida');
254:Memo1.Lines.Add('Rejei��o: NF-e complementar n�o possui NF referenciada');
255:Memo1.Lines.Add('Rejei��o: NF-e complementar possui mais de uma NF referenciada');
256:Memo1.Lines.Add('Rejei��o: Uma NF-e da faixa j� est� inutilizada na Base de dados da SEFAZ');
257:Memo1.Lines.Add('Rejei��o: Solicitante n�o habilitado para emiss�o da NF-e');
258:Memo1.Lines.Add('Rejei��o: CNPJ da consulta inv�lido');
259:Memo1.Lines.Add('Rejei��o: CNPJ da consulta n�o cadastrado como contribuinte na UF');
260:Memo1.Lines.Add('Rejei��o: IE da consulta inv�lida');
261:Memo1.Lines.Add('Rejei��o: IE da consulta n�o cadastrada como contribuinte na UF');
262:Memo1.Lines.Add('Rejei��o: UF n�o fornece consulta por CPF');
263:Memo1.Lines.Add('Rejei��o: CPF da consulta inv�lido');
264:Memo1.Lines.Add('Rejei��o: CPF da consulta n�o cadastrado como contribuinte na UF');
265:Memo1.Lines.Add('Rejei��o: Sigla da UF da consulta difere da UF do Web Service');
266:Memo1.Lines.Add('Rejei��o: S�rie utilizada fora da faixa permitida no SCAN (0-889)');
267:Memo1.Lines.Add('Rejei��o: Chave de Acesso referenciada inexistente');
268:Memo1.Lines.Add('Rejei��o: NF Complementar referencia uma outra NF-e Complementar');
269:Memo1.Lines.Add('Rejei��o: CNPJ Emitente da NF Complementar difere do CNPJ da NF Referenciada');
270:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Fato Gerador: d�gito inv�lido');
271:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Fato Gerador: difere da UF do emitente');
272:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Emitente: d�gito inv�lido');
273:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Emitente: difere da UF do emitente');
274:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Destinat�rio: d�gito inv�lido');
275:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Destinat�rio: difere da UF do Destinat�rio');
276:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Local de Retirada: d�gito inv�lido');
277:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Local de Retirada: difere da UF do Local de Retirada');
278:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Local de Entrega: d�gito inv�lido');
279:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do Local de Entrega: difere da UF do Local de Entrega');
280:Memo1.Lines.Add('Rejei��o: Certificado Transmissor inv�lido');
281:Memo1.Lines.Add('Rejei��o: Certificado Transmissor Data Validade');
282:Memo1.Lines.Add('Rejei��o: Certificado Transmissor sem CNPJ');
283:Memo1.Lines.Add('Rejei��o: Certificado Transmissor - erro Cadeia de Certifica��o');
284:Memo1.Lines.Add('Rejei��o: Certificado Transmissor revogado');
285:Memo1.Lines.Add('Rejei��o: Certificado Transmissor difere ICP-Brasil');
286:Memo1.Lines.Add('Rejei��o: Certificado Transmissor erro no acesso a LCR');
287:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do FG - ISSQN: d�gito inv�lido');
288:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio do FG - Transporte: d�gito inv�lido');
289:Memo1.Lines.Add('Rejei��o: C�digo da UF informada diverge da UF solicitada');
290:Memo1.Lines.Add('Rejei��o: Certificado Assinatura inv�lido');
291:Memo1.Lines.Add('Rejei��o: Certificado Assinatura Data Validade');
292:Memo1.Lines.Add('Rejei��o: Certificado Assinatura sem CNPJ');
293:Memo1.Lines.Add('Rejei��o: Certificado Assinatura - erro Cadeia de Certifica��o');
294:Memo1.Lines.Add('Rejei��o: Certificado Assinatura revogado');
295:Memo1.Lines.Add('Rejei��o: Certificado Assinatura difere ICP-Brasil');
296:Memo1.Lines.Add('Rejei��o: Certificado Assinatura erro no acesso a LCR');
297:Memo1.Lines.Add('Rejei��o: Assinatura difere do calculado');
298:Memo1.Lines.Add('Rejei��o: Assinatura difere do padr�o do Projeto');
299:Memo1.Lines.Add('Rejei��o: XML da �rea de cabe�alho com codifica��o diferente de UTF-8');
301:Memo1.Lines.Add('Uso Denegado : Irregularidade fiscal do emitente');
302:Memo1.Lines.Add('Uso Denegado : Irregularidade fiscal do destinat�rio');
303:Memo1.Lines.Add('Uso Denegado : Destinat�rio n�o habilitado a operar na UF');
304:Memo1.Lines.Add('Rejei��o: Pedido de Cancelamento para NF-e com evento da Suframa');
321:Memo1.Lines.Add('Rejei��o: NF-e de devolu��o n�o possui conhecimento fiscal referenciado');
322:Memo1.Lines.Add('Rejei��o: NF-e de devolu��o com mais de um documento fiscal referenciado');
323:Memo1.Lines.Add('Rejei��o: CNPJ autorizado para download inv�lido');
324:Memo1.Lines.Add('Rejei��o: CNPJ do destinat�rio ja autorizado para download');
325:Memo1.Lines.Add('Rejei��o: CPF autorizado para download inv�lido');
326:Memo1.Lines.Add('Rejei��o: CPF do destinat�rio autorizado para download');
327:Memo1.Lines.Add('Rejei��o: CFOP inv�lido para NF-e com finalidade de devolu��o');
328:Memo1.Lines.Add('Rejei��o: CFOP inv�lido para NF-e que n�o tem finalidade de devolu��o');
329:Memo1.Lines.Add('Rejei��o: N�mero da DI/DSI inv�lido');
330:Memo1.Lines.Add('Rejei��o: Informar o valor da AFRMM na importa��o por via mar�tima');
331:Memo1.Lines.Add('Rejei��o: Informar o CNPJ do adquirente ou do encomendante nesta forma de importa��o');
332:Memo1.Lines.Add('Rejei��o: CNPJ do adquirente ou do encomendante da importa��o inv�lido');
333:Memo1.Lines.Add('Rejei��o: Informar a UF do adquirente ou do encomendante nesta forma de importa��o');
334:Memo1.Lines.Add('Rejei��o: N�mero do processo de drawback n�o informado na importa��o');
335:Memo1.Lines.Add('Rejei��o: N�mero do processo de drawback na importa��o inv�lido');
336:Memo1.Lines.Add('Rejei��o: Informado o grupo de exporta��o no item para CFOP que n�o � de exporta��o');
337:Memo1.Lines.Add('Rejei��o: N�o informado o grupo de exporta��o no item');
338:Memo1.Lines.Add('Rejei��o: N�mero de processo de drawback n�o informado na exporta��o');
339:Memo1.Lines.Add('Rejei��o: N�mero de processo de drawback na exporta��o inv�lido');
340:Memo1.Lines.Add('Rejei��o: N�o informado o grupo de exporta��o indireta no item');
341:Memo1.Lines.Add('Rejei��o: N�mero do registro de exporta��o inv�lido');
342:Memo1.Lines.Add('Rejei��o: Chave de acesso informada na exporta��o indireta com DV inv�lido');
343:Memo1.Lines.Add('Rejei��o: Modelo da NF-e informada na exporta��o indireta diferente de 55');
344:Memo1.Lines.Add('Rejei��o: Duplicidade de NF-e informada na exporta��o indireta (chave acesso informada mais de uma vez)');
345:Memo1.Lines.Add('Rejei��o: Chave de acesso informada na exporta��o indireta n�o consta como NF-e referenciada');
346:Memo1.Lines.Add('Rejei��o: Somat�rio quantidades informadas na exporta��o indireta n�o corresponde total do item');
347:Memo1.Lines.Add('Rejei��o: Descri��o do combust�vel diverge da descri��o adotada pela ANP');
348:Memo1.Lines.Add('Rejei��o: NFC-e com grupo RECOPI');
349:Memo1.Lines.Add('Rejei��o: N�mero RECOPI n�o informado');
350:Memo1.Lines.Add('Rejei��o: N�mero RECOPI inv�lido');
351:Memo1.Lines.Add('Rejei��o: Valor do ICMS da opera��o no ICMS-ST=51 difere do produto BC e al�quota');
352:Memo1.Lines.Add('Rejei��o: Valor do ICMS diferido no CST=51 difere do produto Valor ICMS opera��o e ICMS diferido');
353:Memo1.Lines.Add('Rejei��o: Valor do ICMS no CST=51 n�o corresponde a diferen�a do ICMS opera��o e ICMS diferido');
354:Memo1.Lines.Add('Rejei��o: Informado grupo de devolu��ode tributos para NF-e e que n�o tem finalidade de devolu��o');
355:Memo1.Lines.Add('Rejei��o: Informar o local de sa�da do pa�s no caso de exporta��o');
356:Memo1.Lines.Add('Rejei��o: Informar o clocal de sa�da do p�s somente no caso de exporta��o');
357:Memo1.Lines.Add('Rejei��o: Chave de acesso do grupo de exporta��o indireta inexistente');
358:Memo1.Lines.Add('Rejei��o: Chave de acesso no grupo de exporta��o indireta cancelada ou denegada');
359:Memo1.Lines.Add('Rejei��o: NF-e de venda a �rg�o p�blico sem informar a Nota de Empenho');
360:Memo1.Lines.Add('Rejei��o: NF-e com Nota de Empenho inv�lida para UF');
361:Memo1.Lines.Add('Rejei��o: NF-e com Nota de Empenho inexistente na UF');
362:Memo1.Lines.Add('Rejei��o: Venda de combust�vel sem informa��o do Transportador');
363:Memo1.Lines.Add('Rejei��o: Total do ISS difere do somat�rio dos itens');
364:Memo1.Lines.Add('Rejei��o: Total do valor da dedu��o do ISS difere do somat�rio dos itens');
365:Memo1.Lines.Add('Rejei��o: Total de outras reten��es difere do somat�rio dos itens');
366:Memo1.Lines.Add('Rejei��o: Total do desconto incondicionado do ISS difere do somat�rio dos itens');
367:Memo1.Lines.Add('Rejei��o: Total do desconto condicionado do ISS difere do somat�rio dos itens');
368:Memo1.Lines.Add('Rejei��o: Total do ISS retido difere do somat�rio dos itens');
369:Memo1.Lines.Add('Rejei��o: N�o informado o grupo avulsa na emiss�o pelo Fisco');
370:Memo1.Lines.Add('Rejei��o: Nota Fiscal Avusa com tipo de emiss�o inv�lido');
401:Memo1.Lines.Add('Rejei��o: CPF do remetente inv�lido');
402:Memo1.Lines.Add('Rejei��o: XML da �rea de dados com codifica��o diferente de UTF-8');
403:Memo1.Lines.Add('Rejei��o: O grupo de informa��es da NF-e avulsa � de uso exclusivo do Fisco');
404:Memo1.Lines.Add('Rejei��o: Uso de prefixo de namespace n�o permitido');
405:Memo1.Lines.Add('Rejei��o: C�digo do pa�s do emitente: d�gito inv�lido');
406:Memo1.Lines.Add('Rejei��o: C�digo do pa�s do destinat�rio: d�gito inv�lido');
407:Memo1.Lines.Add('Rejei��o: O CPF s� pode ser informado no campo emitente para a NF-e avulsa');
409:Memo1.Lines.Add('Rejei��o: Campo cUF inexistente no elemento nfeCabecMsg do SOAP Header');
410:Memo1.Lines.Add('Rejei��o: UF informada no campo cUF n�o � atendida pelo Web Service');
411:Memo1.Lines.Add('Rejei��o: Campo versaoDados inexistente no elemento nfeCabecMsg do SOAP Header');
417:Memo1.Lines.Add('Rejei��o: Total do ICMS superior ao valor limite estabelecido');
418:Memo1.Lines.Add('Rejei��o: Total do ICMS-ST superior ao limite estabelecido');
420:Memo1.Lines.Add('Rejei��o: Cancelamento para NF-e j� cancelada');
450:Memo1.Lines.Add('Rejei��o: Modelo da NF-e diferente de 55');
451:Memo1.Lines.Add('Rejei��o: Processo de emiss�o informado inv�lido');
452:Memo1.Lines.Add('Rejei��o: Tipo Autorizador do Recibo diverge do �rg�o Autorizador');
453:Memo1.Lines.Add('Rejei��o: Ano de inutiliza��o n�o pode ser superior ao Ano atual');
454:Memo1.Lines.Add('Rejei��o: Ano de inutiliza��o n�o pode ser inferior a 2006');
461:Memo1.Lines.Add('Rejei��o: Informado percentual de g�s natural na mistura para produto diferente de GLP');
465:Memo1.Lines.Add('Rejei��o: N�mero de controle da FCI inexistente');
478:Memo1.Lines.Add('Rejei��o: Local da entrega n�o informado para faturamto direto de ve�culos novos');
479:Memo1.Lines.Add('Rejei��o: Emissor em situa��o irregular peranto o fisco');
480:Memo1.Lines.Add('Rejei��o: CNPJ da Chave de acesso da NF-e informada diverge do CNPJ do emitente');
481:Memo1.Lines.Add('Rejei��o: UF da Chave de acesso diverge do c�digo da UF informada');
482:Memo1.Lines.Add('Rejei��o: AA da Chave de acesso inv�lida');
483:Memo1.Lines.Add('Rejei��o: MM da Chave de acesso inv�lido');
484:Memo1.Lines.Add('Rejei��o: DPEC com tipo de emiss�o diferente de "4"(posi��o 35 da Chave de Acess');
485:Memo1.Lines.Add('Rejei��o: N�mero DPEC j� existe no cadastro de DPEC');
486:Memo1.Lines.Add('Rejei��o: DPEC n�o localizada para o n�mero de registro de DPEC informado');
487:Memo1.Lines.Add('Rejei��o: Nenhuma DPEC localizada para a chave de acesso informada');
488:Memo1.Lines.Add('Rejei��o: Requisitante de Consulta n�o tem o mesmo CNPJ base do emissor da DPEC');
489:Memo1.Lines.Add('Rejei��o: CNPJ informado inv�lido (DV ou zeros)');
490:Memo1.Lines.Add('Rejei��o: CPF informado inv�lido (DV ou zeros');
492:Memo1.Lines.Add('Rejei��o: O verEvento informado inv�lido');
493:Memo1.Lines.Add('Rejei��o: Evento n�o atende o Schema XML espec�fico');
494:Memo1.Lines.Add('Rejei��o: Chave de Acesso inexistente');
501:Memo1.Lines.Add('Rejei��o: Verificar NFe autorizada h� mais de 30 dias (720) horas');
502:Memo1.Lines.Add('Rejei��o: Erro Chave Acesso - Campo Id � corresponde � conct. dos campos corresp');
503:Memo1.Lines.Add('Rejei��o: S�rie utilizada fora da faixa permitida no SCAN(900-999)');
504:Memo1.Lines.Add('Rejei��o: Data de Entrada/Sa�da posterior ao permitido');
505:Memo1.Lines.Add('Rejei��o: Data de Entrada/Sa�da anterior ao permitido');
506:Memo1.Lines.Add('Rejei��o: Data de Sa�da menor que a Data de Emiss�o');
507:Memo1.Lines.Add('Rejei��o: CNPJ destinat�rio/remetente � deve ser inform. em opera��o c/ exterior');
508:Memo1.Lines.Add('Rejei��o: CNPJ com conte�do nulo s� � v�lido em opera��o com exterior');
509:Memo1.Lines.Add('Rejei��o: Inform. c�d.munic�pio diferente de "9999999" para opera��o c/ exterior');
510:Memo1.Lines.Add('Rejei��o: Oper.c/ Exterior e C�d.Pa�s destinat�rio � 1058(Brasil) ou � informado');
511:Memo1.Lines.Add('Rejei��o: N�o � Oper.c/ Exterior e C�d.Pa�s destinat�rio difere de 1058 (Brasil)');
512:Memo1.Lines.Add('Rejei��o: CNPJ do Local de retirada inv�lido');
513:Memo1.Lines.Add('Rejei��o: C�digo Munic�pio Local Retirada deve ser 9999999 para UF retirada = EX');
514:Memo1.Lines.Add('Rejei��o: CNPJ do Local de Entrega inv�lido');
515:Memo1.Lines.Add('Rejei��o: C�digo Munic. do Local de Entrega deve ser 9999999 p/ UF entrega=EX');
516:Memo1.Lines.Add('Rejei��o: Falha no schema XML - inexiste a tag raiz esperada para a mensagem');
517:Memo1.Lines.Add('Rejei��o: Falha no schema XML - inexiste atributo versao na tag raiz da mensagem');
518:Memo1.Lines.Add('Rejei��o: CFOP de entrada para NF-e de sa�da');
519:Memo1.Lines.Add('Rejei��o: CFOP de sa�da para NF-e de entrada');
520:Memo1.Lines.Add('Rejei��o: CFOP de Opera��o com Exterior e UF destinat�rio difere de EX');
521:Memo1.Lines.Add('Rejei��o: CFOP n�o � de Opera��o com Exterior e UF destinat�rio � EX');
522:Memo1.Lines.Add('Rejei��o: CFOP de opera��o estadual e UF emitente <> da UF remetente contribuinte ICMS');
523:Memo1.Lines.Add('Rejei��o: CFOP n�o � de Opera��o Estadual e UF emitente igual a UF destinat�rio');
524:Memo1.Lines.Add('Rejei��o: CFOP de Opera��o com Exterior e n�o informado NCM');
525:Memo1.Lines.Add('Rejei��o: CFOP de Importa��o e n�o informado dados da DI');
526:Memo1.Lines.Add('Rejei��o: CFOP de Exporta��o e n�o informado Local de Embarque');
527:Memo1.Lines.Add('Rejei��o: Opera��o de Exporta��o com informa��o de ICMS incompat�vel');
528:Memo1.Lines.Add('Rejei��o: Valor do ICMS difere do produto BC e Al�quota');
529:Memo1.Lines.Add('Rejei��o: NCM de informa��o obrigat�ria para produto tributado pelo IPI');
530:Memo1.Lines.Add('Rejei��o: Opera��o com tributa��o de ISSQN sem informar a Inscri��o Municipal');
531:Memo1.Lines.Add('Rejei��o: Total da BC ICMS difere do somat�rio dos itens');
532:Memo1.Lines.Add('Rejei��o: Total do ICMS difere do somat�rio dos itens');
533:Memo1.Lines.Add('Rejei��o: Total da BC ICMS-ST difere do somat�rio dos itens');
534:Memo1.Lines.Add('Rejei��o: Total do ICMS-ST difere do somat�rio dos itens');
535:Memo1.Lines.Add('Rejei��o: Total do Frete difere do somat�rio dos itens');
536:Memo1.Lines.Add('Rejei��o: Total do Seguro difere do somat�rio dos itens');
537:Memo1.Lines.Add('Rejei��o: Total do Desconto difere do somat�rio dos itens');
538:Memo1.Lines.Add('Rejei��o: Total do IPI difere do somat�rio dos itens');
539:Memo1.Lines.Add('Rejei��o: Duplicidade de NF-e, com diferen�a na Chave de Acesso');
540:Memo1.Lines.Add('Rejei��o: CPF do Local de Retirada inv�lido');
541:Memo1.Lines.Add('Rejei��o: CPF do Local de Entrega inv�lido');
542:Memo1.Lines.Add('Rejei��o: CNPJ do Transportador inv�lido');
543:Memo1.Lines.Add('Rejei��o: CPF do Transportador inv�lido');
544:Memo1.Lines.Add('Rejei��o: IE do Transportador inv�lida');
545:Memo1.Lines.Add('Rejei��o: Falha schema XML - vers�o inform.na Dados do SOAPHeader difere da msg');
546:Memo1.Lines.Add('Rejei��o: Erro na Chave de Acesso - Campo Id - falta a literal NFe');
547:Memo1.Lines.Add('Rejei��o: D�gito Verificador da Chave de Acesso da NF-e Referenciada inv�lido');
548:Memo1.Lines.Add('Rejei��o: CNPJ da NF referenciada inv�lido.');
549:Memo1.Lines.Add('Rejei��o: CNPJ da NF referenciada de produtor inv�lido.');
550:Memo1.Lines.Add('Rejei��o: CPF da NF referenciada de produtor inv�lido.');
551:Memo1.Lines.Add('Rejei��o: IE da NF referenciada de produtor inv�lido.');
552:Memo1.Lines.Add('Rejei��o: D�gito Verificador da Chave de Acesso do CT-e Referenciado inv�lido');
553:Memo1.Lines.Add('Rejei��o: Tipo autorizador do recibo diverge do �rg�o Autorizador');
554:Memo1.Lines.Add('Rejei��o: S�rie difere da faixa 0-899');
555:Memo1.Lines.Add('Rejei��o: Tipo autorizador do protocolo diverge do �rg�o Autorizador');
556:Memo1.Lines.Add('Rejei��o: Justific.de entrada em conting.n�o deve ser informada p/tp.emis.normal');
557:Memo1.Lines.Add('Rejei��o: A Justificativa de entrada em conting�ncia deve ser informada');
558:Memo1.Lines.Add('Rejei��o: Data de entrada em conting�ncia posterior a data de emiss�o');
559:Memo1.Lines.Add('Rejei��o: UF do Transportador n�o informada');
560:Memo1.Lines.Add('Rejei��o: CNPJ base do emitente <> CNPJ base da primeira NF-e do lote recebido');
561:Memo1.Lines.Add('Rejei��o: M�s de Emiss�o informado na Chave de Acesso difere do M�s de Emiss�o da NFCe');
562:Memo1.Lines.Add('Rejei��o: C�digo Num�rico informado da Chave de Acesso <> C�digo Num�rico da NFe');
563:Memo1.Lines.Add('Rejei��o: J� existe pedido de Inutiliza��o com a mesma faixa de inutiliza��o');
564:Memo1.Lines.Add('Rejei��o: Total do Produto / Servi�o difere do somat�rio dos itens');
565:Memo1.Lines.Add('Rejei��o: Falha no schema XML - inexiste a tag raiz esperada para o lote de NF-e');
567:Memo1.Lines.Add('Rejei��o: Falha schema XML - vers�o inform.na Dados do SOAPHeader difere do lote');
568:Memo1.Lines.Add('Rejei��o: Falha schema XML inexiste atributo vers�o na tag raiz do lote de NF-e');
569:Memo1.Lines.Add('Rejei��o: Data de entrada em conting�ncia muito atrasada');
570:Memo1.Lines.Add('Rejei��o: Tipo de emiss�o 3, 6 e 7 s� � valido nas conting�ncis SCAN/SVC');
571:Memo1.Lines.Add('Rejei��o:  O tpEmis informado diferente de 3 para conting�ncia SCAN');
572:Memo1.Lines.Add('Rejei��o: Erro Atributo ID do evento erro concatena��o dos campos (�ID� + tpEvento + chNFe + nSeq)');
573:Memo1.Lines.Add('Rejei��o: Duplicidade de Evento');
574:Memo1.Lines.Add('Rejei��o: O autor do evento diverge do emissor da NF-e');
575:Memo1.Lines.Add('Rejei��o: O autor do evento diverge do destinat�rio da NF-e');
576:Memo1.Lines.Add('Rejei��o: O autor do evento n�o � um �rg�o autorizado a gerar o evento');
577:Memo1.Lines.Add('Rejei��o: A data do evento n�o pode ser menor que a data de emiss�o da NF-e');
578:Memo1.Lines.Add('Rejei��o: A data do evento n�o pode ser maior que a data do processamento');
579:Memo1.Lines.Add('Rejei��o: A data do evento n�o pode ser menor que a data de autoriza��o para NF-e n�o emitida em conting�ncia');
580:Memo1.Lines.Add('Rejei��o: O evento exige uma NF-e autorizada');
587:Memo1.Lines.Add('Rejei��o: Usar somente o namespace padr�o da NF-e');
588:Memo1.Lines.Add('Rejei��o: N�o � permitida a presen�a de caracteres de edi��o no in�cio/fim da mensagem ou entre as tags da mensagem');
589:Memo1.Lines.Add('Rejei��o: N�mero do NSU informado superior ao maior NSU da base de dados da SEFAZ');
590:Memo1.Lines.Add('Rejei��o: Informado CST para emissor do Simples Nacional');
591:Memo1.Lines.Add('Rejei��o: Informado CSOSN para emissor que n�o � do Simples Nacional (CRT diferente de 1)');
592:Memo1.Lines.Add('Rejei��o: A NF-e deve ter pelo menos um item de produto sujeito ao ICMS');
593:Memo1.Lines.Add('Rejei��o: CNPJ-Base consultado difere do CNPJ-Base do Certificado Digital');
594:Memo1.Lines.Add('Rejei��o: O n�mero de sequencia do evento informado � maior que o permitido');
595:Memo1.Lines.Add('Rejei��o: Rejei��o: A vers�o do leiaute da NF-e utilizada n�o � mais v�lida');
596:Memo1.Lines.Add('Rejei��o: Rejei��o: Ambiente de homologa��o indispon�vel para recep��o de NF-e da vers�o 1.10.');
597:Memo1.Lines.Add('Rejei��o: CFOP de Importa��o e n�o informado dados de IPI');
598:Memo1.Lines.Add('Rejei��o: NF-e emitida em ambiente de homologa��o com raz�o social <> de NF-e (Emitida homologa��o - S/vlr fiscal)');
599:Memo1.Lines.Add('Rejei��o: CFOP de Importa��o e n�o informado dados de II');
601:Memo1.Lines.Add('Rejei��o: Total do II difere do somat�rio dos itens');
602:Memo1.Lines.Add('Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ICMS');
603:Memo1.Lines.Add('Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ICMS');
604:Memo1.Lines.Add('Rejei��o: Total do vOutro difere do somat�rio dos itens');
605:Memo1.Lines.Add('Rejei��o: Total do vServ difere do somat�rio do vProd dos itens sujeitos ao ISSQN');
606:Memo1.Lines.Add('Rejei��o: Total do vBC do ISS difere do somat�rio dos itens');
607:Memo1.Lines.Add('Rejei��o: Total do ISS difere do somat�rio dos itens');
608:Memo1.Lines.Add('Rejei��o: Total do PIS difere do somat�rio dos itens sujeitos ao ISSQN');
609:Memo1.Lines.Add('Rejei��o: Total do COFINS difere do somat�rio dos itens sujeitos ao ISSQN');
610:Memo1.Lines.Add('Rejei��o: Total da NF difere do somat�rio dos Valores comp�e o valor Total da NF');
611:Memo1.Lines.Add('Rejei��o: cEAN inv�lido');
612:Memo1.Lines.Add('Rejei��o: cEANTrib inv�lido');
613:Memo1.Lines.Add('Rejei��o: Chave de Acesso difere da existente em BD');
614:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (C�digo UF inv�lido)');
615:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (Ano < 05 ou Ano maior que Ano corrente)');
616:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (M�s < 1 ou M�s > 12)');
617:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (CNPJ zerado ou d�gito inv�lido)');
618:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (modelo diferente de 55 e 65 )');
619:Memo1.Lines.Add('Rejei��o: Chave de Acesso inv�lida (n�mero NF = 0)');
620:Memo1.Lines.Add('Rejei��o: Chave de Acesso difere da existente em BD');
621:Memo1.Lines.Add('Rejei��o: CPF Emitente n�o cadastrado');
622:Memo1.Lines.Add('Rejei��o: IE emitente n�o vinculada ao CPF');
623:Memo1.Lines.Add('Rejei��o: CPF Destinat�rio n�o cadastrado');
624:Memo1.Lines.Add('Rejei��o: IE Destinat�rio n�o vinculada ao CPF');
625:Memo1.Lines.Add('Rejei��o: Inscri��o SUFRAMA deve ser informada na venda com isen��o para ZFM');
626:Memo1.Lines.Add('Rejei��o: O CFOP de opera��o isenta para ZFM diferente do previsto');
627:Memo1.Lines.Add('Rejei��o: O valor do ICMS desonerado deve ser informado');
628:Memo1.Lines.Add('Rejei��o: Total da NF superior ao valor limite estabelecido pela SEFAZ [Limite]');
629:Memo1.Lines.Add('Rejei��o: Vlr Produto difere do produto Valor Unit�rio de Comercializa��o e quantidade comercial');
630:Memo1.Lines.Add('Rejei��o: Vlr Produto difere do produto Valor Unit�rio de Tributa��o e quantidade tribut�vel');
631:Memo1.Lines.Add('Rejei��o: CNPJ-Base do Destinat�rio difere do CNPJ-Base do Certificado Digital');
632:Memo1.Lines.Add('Rejei��o: Solicita��o fora de prazo, a NF-e n�o est� mais dispon�vel para download');
633:Memo1.Lines.Add('Rejei��o: NF-e indispon�vel para download devido a aus�ncia de Manifesta��o do Destinat�rio');
634:Memo1.Lines.Add('Rejei��o: Destinat�rio da NF-e n�o tem o mesmo CNPJ raiz do solicitante do download');
635:Memo1.Lines.Add('Rejei��o: NF-e com mesmo n�mero e s�rie j� transmitida e aguardando processamento');
650:Memo1.Lines.Add('Rejei��o: Evento de "Ci�ncia da Opera��o" para NF-e Cancelada ou Denegada');
651:Memo1.Lines.Add('Rejei��o: Evento de "Desconhecimento da Opera��o" para NF-e Cancelada ou Denegada');
653:Memo1.Lines.Add('Rejei��o: NF-e Cancelada, arquivo indispon�vel para download');
654:Memo1.Lines.Add('Rejei��o: NF-e Denegada, arquivo indispon�vel para download');
655:Memo1.Lines.Add('Rejei��o: Evento de Ci�ncia da Opera��o informado ap�s a manifesta��o final do destinat�rio');
656:Memo1.Lines.Add('Rejei��o: Consumo indevido');
657:Memo1.Lines.Add('Rejei��o: C�digo do �rg�o diverge do �rg�o autorizador');
658:Memo1.Lines.Add('Rejei��o: UF do destinat�rio da Chave de Acesso diverge da UF autorizadora');
660:Memo1.Lines.Add('Rejei��o: CFOP de Combust�vel e n�o informado grupo de combust�vel da NF-e');
661:Memo1.Lines.Add('Rejei��o: NF-e j� existente para o n�mero da DPEC informada');
662:Memo1.Lines.Add('Rejei��o: Numera��o da DPEC est� inutilizada na Base de Dados da SEFAZ');
663:Memo1.Lines.Add('Rejei��o: Al�q. ICMS maior que 4% na sa�da interestadual com produtos importados');
678:Memo1.Lines.Add('Rejei��o: NF referenciada com UF diferente da UF da NF-e complementar');
679:Memo1.Lines.Add('Rejei��o: Modelo da NF-e referenciada diferente de 55');
680:Memo1.Lines.Add('Rejei��o: Duplicidade de NF-e referenciada (chave de acesso ref mais de uma vez)');
681:Memo1.Lines.Add('Rejei��o: Duplicidade de NF Modelo 1 referenciada (CNPJ, Modelo S�rie e N�mero)');
682:Memo1.Lines.Add('Rejei��o: Duplicidade de NF de produtor referenciada (IE, Modelo, S�rie e N�mero)');
683:Memo1.Lines.Add('Rejei��o: Modelo do CT-e referenciado diferente de 57');
684:Memo1.Lines.Add('Rejei��o: Duplicidade de Cupom Fiscal referenciado (Modelo, N�mero e Ordem e COO)');
685:Memo1.Lines.Add('Rejei��o: Total do valor aproximado dos tributos difere do somat�rio dos itens');
686:Memo1.Lines.Add('Rejei��o: NF complementar referencia uma NF-e cancelada');
687:Memo1.Lines.Add('Rejei��o: NF complementar referencia uma NF-e denegada');
688:Memo1.Lines.Add('Rejei��o: NF referenciada de produtor com IE inexistente (nREF: xxx)');
689:Memo1.Lines.Add('Rejei��o: NF referenciada de produtor com IE n�o vinculada ao CNPJ/CPF informado (nREF: xxx)');
690:Memo1.Lines.Add('Rejei��o: Pedido de cancelamento para NF-e com CT-e ou MDF-e');
701:Memo1.Lines.Add('Rejei��o: NF-e n�o pode utilizar ver�o 3.00');
702:Memo1.Lines.Add('Rejei��o: NFC-e n�o � aceita pela UF do Emitente');
703:Memo1.Lines.Add('Rejei��o: Data-hora de emiss�o posterior ao hor�rio de recebimento');
704:Memo1.Lines.Add('Rejei��o: NFC-e com data-hora de emiss�o atrasada');
705:Memo1.Lines.Add('Rejei��o: NFC-e com data de entrada/saida');
706:Memo1.Lines.Add('Rejei��o: NFC-e para opera��o de entrada');
707:Memo1.Lines.Add('Rejei��o: NFC-e para opera��o interestadual ou com o exterior');
708:Memo1.Lines.Add('Rejei��o: NFC-e nao pode referenciar um documento fiscal');
709:Memo1.Lines.Add('Rejei��o: NFC-e com formato de DANFE inv�lido');
710:Memo1.Lines.Add('Rejei��o: NF-e com formado de DANFE inv�lido');
711:Memo1.Lines.Add('Rejei��o: NF-e com conting�ncia off-line');
712:Memo1.Lines.Add('Rejei��o: NFC-e com conting�ncia off-line para a UF');
713:Memo1.Lines.Add('Rejei��o: Tipo de emiss�o diferente de 6 ou 7 para conting�ncia da SVC acessada');
714:Memo1.Lines.Add('Rejei��o: NFC-e com conting�ncia DPEC inexistente');
715:Memo1.Lines.Add('Rejei��o: NFC-e com finalidade inv�lida');
716:Memo1.Lines.Add('Rejei��o: NFC-e em opera�o� n�o destinada a consumidor final');
717:Memo1.Lines.Add('Rejei��o: NFC-e em opera��o n�o presencial');
718:Memo1.Lines.Add('Rejei��o: NFC-e n�o deve informar IE de substituto tribut�rio');
719:Memo1.Lines.Add('Rejei��o: NF-e sem identifica��o do destinat�rio');
720:Memo1.Lines.Add('Rejei��o: Na opera��o com exterior deve ser informada tag id Estrangeiro');
721:Memo1.Lines.Add('Rejie��o: Opera��o interestadual deve informar CNPJ ou CPF');
722:Memo1.Lines.Add('Rejei��o: Opera��o interna com idEstrangeiro informado deve ser presencial');
723:Memo1.Lines.Add('Rejei��o: Opera��o interna com idEstrangeiro informado deve ser para consumidor final');
724:Memo1.Lines.Add('Rejei��o: NF-e sem o nome do destinat�rio');
725:Memo1.Lines.Add('Rejei��o: NFC-e com CFOP inv�lido');
726:Memo1.Lines.Add('Rejei��o: NF-e sem a informa��o de endere�o do destinat�rio');
727:Memo1.Lines.Add('Rejei��o: Opera��o com exterior e UF diferente de EX');
728:Memo1.Lines.Add('Rejei��o: NF-e sem informa��o da IE do destinat�rio');
729:Memo1.Lines.Add('Rejei��o: NFC-e sem informa��o da IE do destinat�rio');
730:Memo1.Lines.Add('Rejei��o: NFC-e com inscri��o SUFRAMA');
731:Memo1.Lines.Add('Rejei��o: CFOP de opera��o com exterior idDest <> 3');
732:Memo1.Lines.Add('Rejei��o: CFOP de opera��o com interestadual e idDest <> 2');
733:Memo1.Lines.Add('Rejei��o: CFOP de opera��o interna e idDest <> 1');
734:Memo1.Lines.Add('Rejei��o: NFC-e com unidade de comercializa��o inv�lida');
735:Memo1.Lines.Add('Rejei��o: NFC-e com unidade de tributa��o inv�lida');
736:Memo1.Lines.Add('Rejei��o: NFC-e com grupo de ve�culos novos');
737:Memo1.Lines.Add('Rejei��o: NFC-e com grupo de medicamentos');
738:Memo1.Lines.Add('Rejei��o: NFC-e com grupo de armamentos');
739:Memo1.Lines.Add('Rejei��o: NFC-e com grupo de combust�veis');
740:Memo1.Lines.Add('Rejei��o: NFC-e com CST 51 - diferimento');
741:Memo1.Lines.Add('Rejei��o: NFC-e com partilha de CIMS entre UF');
742:Memo1.Lines.Add('Rejei��o: NFC-e com grupo do IPI');
743:Memo1.Lines.Add('Rejei��o: NFC-e com grupo do II');
745:Memo1.Lines.Add('Rejei��o: NF-e sem grupo do PIS');
746:Memo1.Lines.Add('Rejei��o: NFC-e com grupo do PIS-ST');
748:Memo1.Lines.Add('Rejei��o: NF-e sem grupo do COFINS');
749:Memo1.Lines.Add('Rejei��o: NF-e sem grupo do COFINS-ST');
750:Memo1.Lines.Add('Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (c�digo)');
751:Memo1.Lines.Add('Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (nome)');
752:Memo1.Lines.Add('Rejei��o: NFC-e com valor total superior ao permitido para destinat�rio n�o identificado (endere�o)');
753:Memo1.Lines.Add('Rejei��o: NFC-e sem frete');
754:Memo1.Lines.Add('Rejei��o: NFC-e com dados do transportador');
755:Memo1.Lines.Add('Rejei��o: NFC-e com dados de reten��o do ICMS no transporte');
756:Memo1.Lines.Add('Rejei��o: NFC-e com dados do ve�culo de transporte');
757:Memo1.Lines.Add('Rejei��o: NFC-e com dados de reboque do ve�culo de transporte');
758:Memo1.Lines.Add('Rejei��o: NFC-e com dados do vag�o de transporte');
759:Memo1.Lines.Add('Rejei��o: NFC-e co dados da balsa de transporte');
760:Memo1.Lines.Add('Rejei��o: NFC-e com dados de cobran�a (fatura, duplicata)');
762:Memo1.Lines.Add('Rejei��o: NFC-e com dados de compra (empenho, pedido, contrato)');
763:Memo1.Lines.Add('Rejei��o: NFC-e com dados de aquisi��od e cana');
765:Memo1.Lines.Add('Rejei��o: Lote s� poder� conter NF-e ou NFC-e');
766:Memo1.Lines.Add('Rejei��o: NFC-e com CST 50-suspen��o');
767:Memo1.Lines.Add('Rejei��o: NFC-e com somat�rio dos pagamentos diferente do total da Nota Fiscal');
768:Memo1.Lines.Add('Rejei��o: NF-e n�o deve possuir o grupo de formas de pagamento');
769:Memo1.Lines.Add('Rejei��o: NFC-e deve possuir o grupo de formas de pagamento');
771:Memo1.Lines.Add('Rejei��o: Opera��o interestadual e UF de destino com EX');
772:Memo1.Lines.Add('Rejei��o: Opera��o interestadual e UF de destino igual � UF do emitente');
773:Memo1.Lines.Add('Rejei��o: Opera��o interna e UF de destino difere da UF do emitente');
774:Memo1.Lines.Add('Rejei��o: NFC-e com indicador de item n�o participante do total');
775:Memo1.Lines.Add('Rejei��o: Modelo da NFC-e diferente de 65');
777:Memo1.Lines.Add('Rejei��o: NFC-e deve informar NCM completo');
778:Memo1.Lines.Add('Rejei��o: Informado NCM inexistente');
779:Memo1.Lines.Add('Rejei��o:NFC-e com NCM incompat�vel');
780:Memo1.Lines.Add('Rejei��o: Total da NFC-e superior ao valor limite estabelecido pela SEFAZ');
781:Memo1.Lines.Add('Rejei��o: Emissor n�o habilitado para emiss�o de NFC-e');
782:Memo1.Lines.Add('Rejei��o: NFC-e n�o � autorizada pelo SCAN');
783:Memo1.Lines.Add('Rejei��o: NFC-e n�o � autorizada pelo SVC');
784:Memo1.Lines.Add('Rejei��o: NF-e com indicativo de NFC-e com entrega a domicilio');
785:Memo1.Lines.Add('Rejei��o: NFC-e com entrega a domicilio n�o permitida pela UF');
786:Memo1.Lines.Add('Rejei�ao: NFC-e de entrega a domicilio sem dados dos transportador');
787:Memo1.Lines.Add('Rejei��o: NFC-e de entrega a domicilio sem a identifica��o do destinat�rio');
788:Memo1.Lines.Add('Rejei��o: NFC-e de entrega a domic�lio sem o endere�o do destinat�rio');
789:Memo1.Lines.Add('Rejei��o: NFC-e para destinat�rio contribuinte de ICMS');
790:Memo1.Lines.Add('Rejei��o: Opera��o com exterior para destinat�rio contribuinte do ICMS');
791:Memo1.Lines.Add('Rejei��o: NF-e com indica��o de destinat�rio isento de IE, com a informa��o da IE do destinatario');
792:Memo1.Lines.Add('Rejei��o: Informada a IE do destinat�rio para opera��o com destinat�rio do exterior');
793:Memo1.Lines.Add('Rejei��o: Informado cap�tulo do NCM inexistente');
999:Memo1.Lines.Add('Rejei��o: Erro n�o catalogado');
else
Memo1.Lines.Add('Alerta! Ocorr�ncia n�o contida nos retornos da SEFAZ');
end;
Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('StatusUltimoCancelamentoNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno StatusUltimoCancelamentoNFCe: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

end;

procedure TForm_Principal.ProgramaContadorNFCeClick(Sender: TObject);
var
cIndice, cContador : string;
Indice : string;
begin
cIndice := IntToStr(ComboBox1.ItemIndex); {contador ser� programado:
                                    0 - COO
                                    1 - CRZ
                                    2 - CRO
                                    3 - CCF}
cContador := '10'; //valor do contador a ser programado.

if cIndice = '0' then
  Indice := 'COO';
if cIndice = '1' then
  Indice := 'CRZ';
if cIndice = '2' then
  Indice := 'CRO';
if cIndice = '3' then
  Indice := 'CCF';

cContador := Edit6.Text;

iRetorno := Bematech_FI_ProgramaContadorNFCe (pchar(cIndice), pchar(cContador));
Memo2.Clear;
Memo2.Lines.Add('ProgramaContadorNFCe: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
if (ST3=0) then
  begin
    Memo1.Lines.Add('Programar Contador Tipo: '+Indice);
    Memo1.Lines.Add('Contador: '+cContador);
    Memo1.Lines.Add('----------------------------------------------------------');
  end
else
  begin
    Memo1.Lines.Add('Problema ao registrar contador!');
  end;
Memo2.Lines.Add('Retorno ProgramaContadorNFCe: ');
    Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
    Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
    Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
    Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;

procedure TForm_Principal.VendeItemCustomClick(Sender: TObject);
begin
Form_VIC := TForm_VIC.Create(Application);
Form_VIC.ShowModal;
end;

procedure TForm_Principal.ProgramaAliquotaClick(Sender: TObject);
var
tipo, cValor : string;
iTipo  : integer;

begin
cValor := Edit5.Text;

iTipo :=  RadioGroup5.ItemIndex;
if iTipo = 0 then
  tipo := 'ICMS';
if iTipo = 1 then
  tipo := 'ISS';

iRetornoX:= Bematech_FI_ProgramaAliquota( pchar( cValor ), iTipo );
Memo2.Clear;
Memo2.Lines.Add('ProgramaAliquota: '+IntToStr(iRetornoX));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
if ((ST3 <> 0) or (iRetornoX <= 0)) then
  begin
    Insert(',',cValor,3);
    Memo1.Lines.Add('Problema ao cadastrar a aliquota! Veja o retorno abaixo.');
    Memo1.Lines.Add('----------------------------------------------------------');
    Memo2.Lines.Add('Retorno ProgramaAliquota: ');
    Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
    Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
    Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
    Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
  end
else
  begin
    Insert(',',cValor,3);
    Memo1.Lines.Add('Aliquota: '+cValor+' % ' + ' de '+tipo+' cadastrada!');
    Memo1.Lines.Add('----------------------------------------------------------');
    Memo2.Lines.Add('Retorno ProgramaAliquota: ');
    Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
    Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
    Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
    Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
  end;
end;
procedure TForm_Principal.RetornoAliquotasClick(Sender: TObject);
var
Aliquotas : string;

iConta    : integer;

begin
for iConta := 1 to 80 do Aliquotas := Aliquotas + ' ';
iRetorno := Bematech_FI_RetornoAliquotas( Aliquotas );

if iRetorno = 1 then
  Memo1.Lines.Add('Aliquotas: ');
  Memo1.Lines.Add(Aliquotas);
  Memo1.Lines.Add('----------------------------------------------------------');
Memo2.Clear;
Memo2.Lines.Add('RetornoAliquotas: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno RetornoAliquotas: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;

procedure TForm_Principal.Edit5Change(Sender: TObject);

var
  TW: Integer;
begin
  TW := Canvas.TextWidth((Sender as TEdit).Text);
  (Sender as TEdit).Perform(EM_SETMARGINS, EC_LEFTMARGIN, ((Sender as TEdit).Width - TW-15));

end;

procedure TForm_Principal.Edit3Change(Sender: TObject);
var
  TW: Integer;
begin
  TW := Canvas.TextWidth((Sender as TEdit).Text);
  (Sender as TEdit).Perform(EM_SETMARGINS, EC_LEFTMARGIN, ((Sender as TEdit).Width - TW-15));

end;

procedure TForm_Principal.Edit6Change(Sender: TObject);
var
  TW: Integer;
begin
  TW := Canvas.TextWidth((Sender as TEdit).Text);
  (Sender as TEdit).Perform(EM_SETMARGINS, EC_LEFTMARGIN, ((Sender as TEdit).Width - TW-15));

end;



procedure TForm_Principal.Edit4Change(Sender: TObject);
var
  TW: Integer;
begin
  TW := Canvas.TextWidth((Sender as TEdit).Text);
  (Sender as TEdit).Perform(EM_SETMARGINS, EC_LEFTMARGIN, ((Sender as TEdit).Width - TW-15));

end;
procedure TForm_Principal.Button1Click(Sender: TObject);
var
arquivo : TextFile;

begin

AssignFile(arquivo, 'c:\\Retorno.txt');
    //Rewrite(arquivo);

iRetorno := Bematech_FI_LeituraXSerial();
Memo1.Lines.LoadFromFile('c:\\Retorno.txt');
Memo2.Clear;
Memo2.Lines.Add('LeituraXSerial: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno LeituraXSerial: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));
end;

procedure TForm_Principal.Button2Click(Sender: TObject);
var
Pdir : PChar;
begin
Pdir := '';
ShellExecute(0, nil, 'http://partners.bematech.com.br/suporte/bemafi32/h_d_ret_est_logger.htm', nil, Pdir, SW_NORMAL);
end;
procedure TForm_Principal.FormCreate(Sender: TObject);
begin
iRetorno := Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD( '1' );
end;

procedure TForm_Principal.VendeItemCompletoClick(Sender: TObject);
var
Codigo: string;
EAN13: string;
Descricao: string;
IndiceDepartamento: string;
Aliquota: string;
UnidadeMedida: string;
TipoQuantidade: string;
CasasDecimaisQtde: string;
Quantidade: string;
CasasDecimaisValor: string;
ValorUnitario: string;
TipoDesconto: string;
ValorAcrescimo: string;
ValorDesconto: string;
ArredondaTrunca: string;
NCM: string;
CFOP: string;
InformacaoAdicional: string;
CST_ICMS: string;
OrigemProduto: string;
ItemListaServico: string;
CodigoISS: string;
NaturezaOperacaoISS: string;
IndicadorIncentivoFiscal: string;
CodigoIBGE: string;
CSOSN: string;
ValorBaseCalculoSimples: string;
ValorICMSRetidoSimples: string;
ModalidadeBaseCalculo: string;
PercentualReducaoBase: string;
ModalidadeBC: string;
PercentualMargemICMS: string;
PercentualBCICMS: string;
ValorReducaoBCICMS: string;
ValorAliquotaICMS: string;
ValorICMS: string;
ValorICMSDesonerado: string;
MotivoDesoneracaoICMS: string;
AliquotaCalculoCredito: string;
ValorCreditoICMS: string;
ValorTotalTributos :  string;
CSTPIS :  string;
BaseCalculoPIS :  string;
AliquotaPIS : string;
ValorPIS :  string;
QuantVendidaPIS :  string;
ValorAliquotaPIS :  string;
CSTCOFINS :  string;
BaseCalculoCOFINS :  string;
AliquotaCOFINS :  string;
ValorCOFINS :  string;
QunatVendidaCOFINS :  string;
ValorAliquotaCOFINS :  string;
Reservado01 :  string;
Reservado02 :  string;
Reservado03 :  string;
Reservado04 :  string;
Reservado05 :  string;
Reservado06 :  string;
Reservado07 :  string;
Reservado08 :  string;
Reservado09 :  string;
Reservado10 :  string;

begin

  Codigo := '1234567890';
  EAN13 := '';
  Descricao := 'AGUA MINERAL SEM GAS - COPO 200 ML';
  IndiceDepartamento := '00';
  Aliquota := 'F1';
  UnidadeMedida := 'UN';
  TipoQuantidade := 'I';
  CasasDecimaisQtde := '3';
  Quantidade := '1000';
  CasasDecimaisValor := '2';
  ValorUnitario := '1,00';
  TipoDesconto := '$';
  ValorAcrescimo := '0,00';
  ValorDesconto := '0,00';
  ArredondaTrunca := 'A';
  NCM := '22011000';
  CFOP := '5403';
  InformacaoAdicional := 'INFORMA��ES';
  OrigemProduto := '0';
  CST_ICMS := '60';
  CodigoIBGE := '';
  CodigoISS := '';
  NaturezaOperacaoISS := '';
  IndicadorIncentivoFiscal := '';
  ItemListaServico := '1234';
  //CSOSN := '102'; //--> Simples Nacional
  CSOSN := '';
  ValorBaseCalculoSimples := '0';
  ValorICMSRetidoSimples := '0';
  ModalidadeBaseCalculo := '0';
  PercentualReducaoBase := '0';
  ModalidadeBC := '0';
  PercentualMargemICMS := '0';
  PercentualBCICMS := '0';
  ValorReducaoBCICMS := '0';
  ValorAliquotaICMS := '0';
  ValorICMS := '0';
  ValorICMSDesonerado := '0';
  MotivoDesoneracaoICMS := '0';
  AliquotaCalculoCredito := '0';
  ValorCreditoICMS := '0';
  ValorTotalTributos := ''; //tributos
  CSTPIS := '';
  BaseCalculoPIS := '';
  AliquotaPIS := '';
  ValorPIS := '';
  QuantVendidaPIS := '';
  ValorAliquotaPIS := '';
  CSTCOFINS := '';
  BaseCalculoCOFINS := '';
  AliquotaCOFINS := '';
  ValorCOFINS := '';
  QunatVendidaCOFINS := '';
  ValorAliquotaCOFINS := '';
  Reservado01 := '';
  Reservado02 := '';
  Reservado03 := '';
  Reservado04 := '';
  Reservado05 := '';
  Reservado06 := '';
  Reservado07 := '';
  Reservado08 := '';
  Reservado09 := '';
  Reservado10 := '';
  iRetorno := Bematech_FI_VendeItemCompleto( pchar( Codigo ), pchar( EAN13 ), pchar( Descricao ), pchar( IndiceDepartamento ), pchar( Aliquota ), pchar( UnidadeMedida ), pchar( TipoQuantidade ), pchar( CasasDecimaisQtde ), pchar( Quantidade ), pchar( CasasDecimaisValor ), pchar( ValorUnitario ), pchar( TipoDesconto ), pchar( ValorAcrescimo ), pchar( ValorDesconto ), pchar( ArredondaTrunca ), pchar( NCM ), pchar( CFOP ), pchar( InformacaoAdicional ), pchar( CST_ICMS ), pchar( OrigemProduto ), pchar( ItemListaServico ), pchar( CodigoISS ), pchar( NaturezaOperacaoISS ), pchar( IndicadorIncentivoFiscal ), pchar(
CodigoIBGE ), pchar( CSOSN ), pchar( ValorBaseCalculoSimples ), pchar( ValorICMSRetidoSimples ), pchar( ModalidadeBaseCalculo ), pchar( PercentualReducaoBase ), pchar( ModalidadeBC ), pchar( PercentualMargemICMS ), pchar( PercentualBCICMS ), pchar( ValorReducaoBCICMS ), pchar( ValorAliquotaICMS ), pchar( ValorICMS ), pchar( ValorICMSDesonerado ), pchar( MotivoDesoneracaoICMS ), pchar( AliquotaCalculoCredito ), pchar( ValorCreditoICMS ), pchar( ValorTotalTributos ), pchar( CSTPIS ), pchar( BaseCalculoPIS ), pchar( AliquotaPIS ), pchar( ValorPIS ), pchar( QuantVendidaPIS ), pchar( ValorAliquotaPIS ), pchar( CSTCOFINS ), pchar( BaseCalculoCOFINS ), pchar( AliquotaCOFINS ), pchar( ValorCOFINS ), pchar( QunatVendidaCOFINS ), pchar( ValorAliquotaCOFINS ), pchar( Reservado01 ), pchar( Reservado02 ), pchar( Reservado03 ), pchar( Reservado04 ), pchar( Reservado05 ), pchar( Reservado06 ), pchar( Reservado07 ), pchar( Reservado08 ), pchar( Reservado09 ), pchar( Reservado10 ));
Memo2.Clear;
Memo2.Lines.Add('VendeItemCompleto: '+IntToStr(iRetorno));
iRetorno := Bematech_FI_RetornoImpressoraMFD( ACK, ST1, ST2, ST3 );
Memo2.Lines.Add('Retorno VendeItemCompleto: ');
Memo2.Lines.Add('ACK: '+ IntToStr(ACK));
Memo2.Lines.Add('ST1: '+ IntToStr(ST1));
Memo2.Lines.Add('ST2: '+ IntToStr(ST2));
Memo2.Lines.Add('ST3: '+ IntToStr(ST3));

Memo1.Lines.Add('C�digo: '+Codigo);
Memo1.Lines.Add('EAN13: '+EAN13);
Memo1.Lines.Add('Descri��o: '+Descricao);
Memo1.Lines.Add('�ndice Departamento: '+IndiceDepartamento);
Memo1.Lines.Add('Al�quota: '+Aliquota);
Memo1.Lines.Add('Unidade de Medida: '+UnidadeMedida);
Memo1.Lines.Add('Tipo de Quantidade: '+TipoQuantidade);
Memo1.Lines.Add('Qtde. de casas decimais: '+CasasDecimaisQtde);
Memo1.Lines.Add('Quantidade: '+Quantidade);
Memo1.Lines.Add('Casas Decimais: '+CasasDecimaisValor);
Memo1.Lines.Add('Valor Unit�rio'+ValorUnitario);
Memo1.Lines.Add('Tipo de desconto: '+TipoDesconto);
Memo1.Lines.Add('Valor Acr�scimo: '+ValorAcrescimo);
Memo1.Lines.Add('Valor Desconto: '+ValorDesconto);
Memo1.Lines.Add('Arredonda/Trunca: '+ArredondaTrunca);
Memo1.Lines.Add('NCM: '+NCM);
Memo1.Lines.Add('CFOP: '+CFOP);
Memo1.Lines.Add('Informa��o Adicional: '+InformacaoAdicional);
Memo1.Lines.Add('Origem do Produto: '+OrigemProduto);
Memo1.Lines.Add('CST ICMS: '+CST_ICMS);
Memo1.Lines.Add('C�digo IBGE: '+CodigoIBGE);
Memo1.Lines.Add('C�digo ISS: '+CodigoISS);
Memo1.Lines.Add('Nat. Oper. ISS: '+NaturezaOperacaoISS);
Memo1.Lines.Add('Ind. Incentivo Fiscal: '+IndicadorIncentivoFiscal);
Memo1.Lines.Add('Item Lista Servi�o: '+ItemListaServico);
Memo1.Lines.Add('CSOSN: '+CSOSN);
Memo1.Lines.Add('Valor BC Simples: '+ValorBaseCalculoSimples);
Memo1.Lines.Add('ICMS retido Simples: '+ValorICMSRetidoSimples);
Memo1.Lines.Add('ModalidadeBC: '+ModalidadeBaseCalculo);
Memo1.Lines.Add('Redu��o Base: '+PercentualReducaoBase);
Memo1.Lines.Add('Modalidade BC: '+ModalidadeBC);
Memo1.Lines.Add('Margem ICMS: '+PercentualMargemICMS);
Memo1.Lines.Add('Percent. BC ICMS: '+PercentualBCICMS);
Memo1.Lines.Add('Redu��o BC ICMS: '+ValorReducaoBCICMS);
Memo1.Lines.Add('Aliquota ICMS: '+ValorAliquotaICMS);
Memo1.Lines.Add('ICMS: '+ValorICMS);
Memo1.Lines.Add('ICMS Desonerado: '+ValorICMSDesonerado);
Memo1.Lines.Add('Motivo Deson. ICMS: '+MotivoDesoneracaoICMS);
Memo1.Lines.Add('Aliq. Calculo Cr�dito: '+AliquotaCalculoCredito);
Memo1.Lines.Add('Cr�dito ICMS: '+ValorCreditoICMS);
Memo1.Lines.Add('----------------------------------------------------------');
end;

procedure TForm_Principal.DadosConsumidorNFCeClick(Sender: TObject);
begin
Form_DadosConsumidorNFCe := TForm_DadosConsumidorNFCe.Create(Application);
Form_DadosConsumidorNFCe.ShowModal;
end;

end.


