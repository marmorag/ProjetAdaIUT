with p_esiut;use p_esiut;
with p_chaine;use p_chaine;
with p_lexique; use p_lexique;
with text_io;use text_io;
procedure p2 is

nb : integer;
f : text_io.file_type;
test : string(1..30) := (others => ' ');

begin
  nb := Nb_Mots("lexiqueEconomie.txt");
  Ecrire("nb mot : ");Ecrire(nb); A_la_ligne;
  declare
    l : TV_lexique(1..nb);
    i : integer := l'first;
  begin
    Init_Lexique("lexiqueEconomie.txt",l);
    Ecrire("Lexique : "); a_la_ligne;
    while i <= l'last loop
      Ecrire(l(i).chaine);Ecrire(" : ");Ecrire_ligne(l(i).poids);
      i := i+1;
    end loop;
    Ecrire("Ecrire mot :");Lire(test);
    Ecrire("Poids : "); Ecrire(Poids_Mot(test,l));    
  end;

end p2;
