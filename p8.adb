with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with calendar; use calendar;
with p_classification; use p_classification;
with p_generation; use p_generation;


procedure p8 is
  C : T_Categorie;
  VD : TV_Depeche;

begin
  Charge("depeches.txt",VD);

    C := Science;
  Generation_Lexique(VD,C,"lexEnv_ScienceAUTO.txt");
    C := Sports;
  Generation_Lexique(VD,C,"lexSportsAUTO.txt");
    C := Culture;
  Generation_Lexique(VD,C,"lexCultureAUTO.txt");
    C := Politique;
  Generation_Lexique(VD,C,"lexPolitiqueAUTO.txt");
    C := Economie;
  Generation_Lexique(VD,C,"lexEconomieAUTO.txt");

end p8;
