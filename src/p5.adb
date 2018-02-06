with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with p_classification; use p_classification;
with Calendar; use Calendar;


procedure p5 is

nbes, nbe, nbc, nbp, nbs : integer;  -- taille des lexique
VD : TV_Depeche;
nomfich : string(1..13) := "RESULTAT2.txt";

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

  nbes := Nb_Mots("lexiqueEnv_Science.txt");
  nbe := Nb_Mots("lexiqueEconomie.txt");
  nbc := Nb_Mots("lexiqueCulture.txt");
  nbp := Nb_Mots("lexiquePolitique.txt");
  nbs := Nb_Mots("lexiqueSports.txt");

  declare
    les : TV_lexique(1..nbes);   -- declaration dyn des lexique
    le : TV_lexique(1..nbe);
    lc : TV_lexique(1..nbc);
    lp : TV_lexique(1..nbp);
    ls : TV_lexique(1..nbs);

  begin
    Charge("depeches.txt",VD);        -- chargement depeche et lexique
    Init_Lexique("lexiqueEnv_Science.txt",les);
    Init_Lexique("lexiqueEconomie.txt",le);
    Init_Lexique("lexiqueCulture.txt",lc);
    Init_Lexique("lexiquePolitique.txt",lp);
    Init_Lexique("lexiqueSports.txt",ls);

    Run(VD,lp,ls,lc,le,les,nomfich);
  end;



      -- temps d'exec.
  ce_time2 := clock;
  Split (Ce_Time1,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes1);
  Split (Ce_Time2,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes2);
  ces_secondes3:=ces_secondes2-ces_secondes1;
  ecrire("Temps d'execution :");ecrire(day_duration'Image(ces_secondes3));

end p5;
