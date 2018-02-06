with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with calendar; use calendar;
with p_classification; use p_classification;
with p_generation; use p_generation;


procedure p7 is
  C : T_Categorie := Science;
  VD : TV_Depeche;
  VM : TV_Dico;
  N, i : integer;

begin

  Charge("depeches.txt",VD);
  Init_Dico(VD,C,VM,N);

  Calcul_Scores(VD,C,VM,N);

  i := 1;
  while i <= N loop
    Ecrire(i);Ecrire(" : ");Ecrire(VM(i).mot);Ecrire(" | ");Ecrire(VM(i).score);
    a_la_ligne;
    i := i+1;
  end loop;






end p7;
