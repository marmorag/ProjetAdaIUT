with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with calendar; use calendar;
with p_classification; use p_classification;
with p_generation; use p_generation;



procedure p9 is
  nbes, nbe, nbc, nbp, nbs : integer;  -- taille des lexique
  VD : TV_Depeche;
  nomfich : string(1..16) := "RESULTATauto.txt";
  C : T_Categorie;

        -- temps execution
        Ce_Time1 : Time;
        ce_Time2 : time;
        cette_annee : year_number;
        ce_mois : month_number;
        ce_jour : day_number;
        ces_Secondes1 : Day_Duration;
        Ces_Secondes2 : Day_Duration;
        ces_secondes3 : day_duration;

  begin
    ce_time1 := clock;

    Charge("test.txt",VD);

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

    nbes := Nb_Mots("lexEnv_ScienceAUTO.txt");
    nbe := Nb_Mots("lexEconomieAUTO.txt");
    nbc := Nb_Mots("lexCultureAUTO.txt");
    nbp := Nb_Mots("lexPolitiqueAUTO.txt");
    nbs := Nb_Mots("lexSportsAUTO.txt");

    declare
      les : TV_lexique(1..nbes);   -- declaration dyn des lexique
      le : TV_lexique(1..nbe);
      lc : TV_lexique(1..nbc);
      lp : TV_lexique(1..nbp);
      ls : TV_lexique(1..nbs);

    begin

      Init_Lexique("lexEnv_ScienceAUTO.txt",les);
      Init_Lexique("lexEconomieAUTO.txt",le);
      Init_Lexique("lexCultureAUTO.txt",lc);
      Init_Lexique("lexPolitiqueAUTO.txt",lp);
      Init_Lexique("lexSportsAUTO.txt",ls);

      Run(VD,lp,ls,lc,le,les,nomfich);

    end;



        -- temps d'exec.
    ce_time2 := clock;
    Split (Ce_Time1,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes1);
    Split (Ce_Time2,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes2);
    ces_secondes3:=ces_secondes2-ces_secondes1;
    ecrire("Temps d'execution :");ecrire(day_duration'Image(ces_secondes3));

end p9;
