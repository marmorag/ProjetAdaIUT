with p_esiut; use p_esiut;
with p_depeche; use p_depeche;
with p_lexique; use p_lexique;
with TEXT_IO; use TEXT_IO;

procedure p4 is
  tab : TV_Score;
  d : TV_Depeche;
  nbes, nbe, nbc, nbp, nbs : integer;
begin

  nbes := Nb_Mots("lexiqueEnv_Science.txt");
  nbe := Nb_Mots("lexiqueEconomie.txt");
  nbc := Nb_Mots("lexiqueCulture.txt");
  nbp := Nb_Mots("lexiquePolitique.txt");
  nbs := Nb_Mots("lexiqueSports.txt");

  declare
    le_s : TV_lexique(1..nbes);
    le : TV_lexique(1..nbe);
    lc : TV_lexique(1..nbc);
    lp : TV_lexique(1..nbp);
    ls : TV_lexique(1..nbs);
    max : T_Categorie;
    n : integer := 255;
  begin
    Charge("depeches.txt",d);
    Init_Lexique("lexiqueEnv_Science.txt",le_s);
    Init_Lexique("lexiqueEconomie.txt",le);
    Init_Lexique("lexiqueCulture.txt",lc);
    Init_Lexique("lexiquePolitique.txt",lp);
    Init_Lexique("lexiqueSports.txt",ls);

    tab(Politique) := Score(d(n),lp);
    tab(Sports) := Score(d(n),ls);
    tab(Culture) := Score(d(n),lc);
    tab(Economie) := Score(d(n),le);
    tab(Science) := Score(d(n),le_s);

    max := Max_Score(tab);

    Ecrire("Max Score : ");P_CategorieIO.Ecrire(max);
  end;
end p4;
