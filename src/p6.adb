with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with calendar; use calendar;
with p_classification; use p_classification;
with p_generation; use p_generation;

procedure p6 is
  C : T_Categorie := Science;
  VD : TV_Depeche;
  VM : TV_Dico;
  N, i : integer;
  MotRech : String(1..30) := (others => ' ');


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

  Charge("depeches.txt",VD);
  Init_Dico(VD,C,VM,N);

  ce_time2 := clock;

  i := 1;
  while i <= N loop
    Ecrire(i);Ecrire(" : ");Ecrire(VM(i).mot);
    a_la_ligne;
    i := i+1;
  end loop;

  Ecrire("Saisir mot a rechercher : ");Lire(MotRech);
  i := Recherche(VM,N,MotRech);
  Ecrire_ligne(i);



  Split (Ce_Time1,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes1);
  Split (Ce_Time2,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes2);
  ces_secondes3:=ces_secondes2-ces_secondes1;
  ecrire("Temps d'execution :");ecrire(day_duration'Image(ces_secondes3));


end p6;
