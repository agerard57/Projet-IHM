unit u_gabarit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls;

type

  { Tf_gabarit }

  Tf_gabarit = class(TForm)
    item_accueil: TMenuItem;
    item_filliere_stats: TMenuItem;
    item_inscrit: TMenuItem;
    item_filliere: TMenuItem;
    item_quitter: TMenuItem;
    item_inscrit_liste: TMenuItem;
    item_inscrit_archive: TMenuItem;
    item_inscrit_archive_n1: TMenuItem;
    item_inscrit_archive_n2: TMenuItem;
    item_filliere_liste: TMenuItem;
    lbl_bienvenue: TLabel;
    mnu_main: TMainMenu;
    pnl_selection: TPanel;
    pnl_travail: TPanel;
    pnl_info: TPanel;
    pnl_ariane: TPanel;
    procedure FormShow(Sender: TObject);
    procedure item_quitterClick(Sender: TObject);
    procedure lbl_bienvenueClick(Sender: TObject);
    procedure mnu_item_Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  f_gabarit: Tf_gabarit;

implementation

{$R *.lfm}

{ Tf_gabarit }


USES u_feuille_style;



procedure Tf_gabarit.FormShow(Sender: TObject);
begin
  style.panel_selection (pnl_ariane);
  style.panel_defaut (pnl_selection);
  style.panel_travail (pnl_travail);
  style.panel_defaut (pnl_info);
  f_gabarit.width := 1200;
  f_gabarit.height := 800;
end;

procedure Tf_gabarit.item_quitterClick(Sender: TObject);
begin
  close;
end;

procedure Tf_gabarit.lbl_bienvenueClick(Sender: TObject);
begin

end;

procedure Tf_gabarit.mnu_item_Click(Sender: TObject);
var
  item : TMenuItem;
begin
  pnl_selection.show;

  pnl_ariane.Caption := ' ';
  item := TmenuItem(Sender);
  repeat
    pnl_ariane.Caption := ' > ' + item.caption + pnl_ariane.Caption;
    item := item.parent;
  until item.parent = nil;
end;

end.
