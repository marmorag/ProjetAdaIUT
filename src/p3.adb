with p_esiut; use p_esiut;
with p_depeche; use p_depeche;
with p_lexique; use p_lexique;
with TEXT_IO; use TEXT_IO;

procedure p3 is
  nb : integer;
begin

  nb := Nb_Mots("lexiqueEnv_Science.txt");
  declare
    l : TV_lexique(1..nb);
    i : integer := l'first;
    d : TV_Depeche;
  begin
    Init_Lexique("lexiqueEnv_Science.txt",l);
    Charge("depeches.txt",d);

    Ecrire(d(1).texte(1));Ecrire("§§§");a_la_ligne;
    Ecrire("Score 001 : ");Ecrire_ligne(Score(d(001),l));
    Ecrire("Score 68 : ");Ecrire_ligne(Score(d(68),l));
    a_la_ligne;a_la_ligne;a_la_ligne;

  end;

end p3;
