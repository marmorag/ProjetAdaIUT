with TEXT_IO;use TEXT_IO;
with p_chaine; use p_chaine;


package body P_Lexique  is


function Nb_Mots(nomfic : in String)  return Integer is
--{} => {résultat = nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}
i:integer:=0;
last:Natural;
ligne:String(1..100);
f:Text_Io.File_Type;
begin
	open(f,in_file,nomfic);
		while not end_of_file(f) loop -- compteur du nb mot
			get_line(f,ligne,last);
			i:=i+1;
		end loop;

  close(f);
	return i;
end Nb_Mots;

procedure Init_Lexique(Nomfic: in String; L : out Tv_lexique) is
last : natural; 								-- indice du dernier de f
ligne : string(1..100);					-- tout les caractere de la ligne
n, separ : integer;							-- separ : indice du : dans la chaine
f:Text_Io.File_Type;

begin
  open(f,in_file,Nomfic);
  n := L'first;

  while not end_of_file(f) loop   -- recupere la ligne, determine l'indice de :
    get_line(f,ligne,last);						--, rempli la chaine de ' ', rempli L(n)
    separ := Index(':',ligne);
    L(n).chaine := (others=>' ');
    L(n).chaine(1..separ-1) := ligne(1..separ-1);
    L(n).poids := integer'value(ligne(separ+1..separ+1));
    n := n+1;
  end loop;

  close(f);

end Init_Lexique;

function Poids_Mot(M : in string; L : in TV_Lexique) return integer is
--{} => {res = le poids de M dans le Lexique L et 0 si pas dans le lexique}
p : integer := 0;
i : integer := L'first;
trouv : boolean := false;
begin
  while i <= L'last and then not trouv loop
    if M = L(i).chaine then
      p := L(i).poids;
      trouv := true;
    else
      i := i+1;
    end if;
  end loop;

  return p;
end Poids_Mot;












end p_lexique;
