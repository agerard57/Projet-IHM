unit u_select_inscrit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tf_select_inscrit }

  Tf_select_inscrit = class(TForm)
    btn_ok: TButton;
    edt_num_etu: TEdit;
    edt_nom_etu: TEdit;
    edt_code_fil: TEdit;
    lbl_num_etu: TLabel;
    lbl_nom_etu: TLabel;
    lbl_code_fil: TLabel;
    pnl_ok: TPanel;
    pnl_filliere_edit: TPanel;
    pnl_filliere_btn: TPanel;
    pnl_filliere: TPanel;
    pnl_etudiant_edit: TPanel;
    pnl_etudiant_btn: TPanel;
    pnl_etudiant: TPanel;
    pnl_tous_edit: TPanel;
    pnl_tous_btn: TPanel;
    pnl_tous: TPanel;
    pnl_choix: TPanel;
    pnl_titre: TPanel;
    procedure btn_okClick(Sender: TObject);
    procedure Init;
    procedure NonSelectionPanel (pnl : TPanel);
    procedure AucuneSelection;
    procedure pnl_choix_btnClick (Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_select_inscrit: Tf_select_inscrit;
  pnl_actif : TPanel;

implementation

{$R *.lfm}

uses u_feuille_style, u_list_inscrit, u_modele;


{ Tf_select_inscrit }

procedure Tf_select_inscrit.Init;
begin
 style.panel_defaut(pnl_choix);
 style.panel_selection(pnl_titre);
 style.panel_defaut(pnl_ok);
 pnl_choix_btnClick (pnl_tous_btn);
end;

procedure Tf_select_inscrit.btn_okClick(Sender: TObject);
begin
 btn_ok.visible := false;
 pnl_actif.enabled := false;

  if pnl_tous_edit.Visible then
   f_list_inscrit.affi_data(modele.inscri_list_tous)

   else if pnl_etudiant_edit.visible then
   f_list_inscrit.affi_data(modele.inscri_list_etu(edt_num_etu.text, edt_nom_etu.text))

   else if pnl_filliere_edit.visible then
   f_list_inscrit.affi_data(modele.inscri_list_filiere(edt_code_fil.text))

end ;


procedure Tf_select_inscrit.pnl_choix_btnClick (Sender : TObject);
var pnl : TPanel;
begin
 AucuneSelection;
 pnl := TPanel(Sender) ;
 style.panel_selection (pnl);
 pnl := TPanel(pnl.Parent);
 style.panel_selection (pnl);
 pnl := TPanel(f_select_inscrit.FindComponent(pnl.name +'_edit'));
 style.panel_selection (pnl);
 pnl.show;
 pnl_actif := pnl; pnl_actif.enabled := true;
 btn_ok.visible := true;
end;

procedure Tf_select_inscrit.NonSelectionPanel (pnl : TPanel);
var pnl_enfant : TPanel;
begin
 style.panel_defaut(pnl);
 pnl_enfant := TPanel(f_select_inscrit.FindComponent(pnl.name +'_btn'));
 style.panel_bouton(pnl_enfant);
 pnl_enfant := TPanel(f_select_inscrit.FindComponent(pnl.name +'_edit'));
 pnl_enfant.Hide;
end;
procedure Tf_select_inscrit.AucuneSelection;
begin
 NonSelectionPanel (pnl_tous);
 NonSelectionPanel (pnl_etudiant);
 NonSelectionPanel (pnl_filliere);
end;

end.

