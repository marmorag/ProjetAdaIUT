with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with p_classification; use p_classification;
with ada.strings; use ada.strings;
with ada.strings.fixed; use ada.strings.fixed;

package body p_generation is


----------------------------------------------------------------------------------------
  function Recherche(VM : in TV_Dico; N : in integer; M : string) return integer is
    -- {} => {res = indice du mot M dans le vecteur VM si il est present sinon -1
    --          N est le nombre de mot rangé dans le vecteur}
    i : integer := VM'first;

  begin

    while M /= VM(i).mot and then i <= N loop
      i := i+1;
    end loop;

    if M /= VM(i).mot then
      return -1;
    else
      return i;
    end if;


  end Recherche;
----------------------------------------------------------------------------------------
  procedure Init_Dico(VD : in TV_Depeche; C : in T_Categorie; VM : out TV_Dico; N : out integer) is
    -- {} => {charge dans VM tous les mot present dans au moins une depeche de la categorie C du vecteur
    --         de depeche VD. si le mot est present plusieurs fois il doit apparaitre qu'une seule fois
    --         la procedure initialise les score a 1 et compte dans N le nombre de mot de VM}

  begin
    for i in VM'first..VM'last loop
      VM(i).Score := 0;
    end loop;
    N := 1;
    for j in VD'range loop
      if VD(j).Cat = C then
        for k in 1..VD(j).nbmots loop
          if Recherche(VM,N,VD(j).texte(k)) = -1 then
            VM(N).mot := VD(j).texte(k);
            N := N+1;
          end if;
        end loop;
      end if;
    end loop;
  end Init_Dico;
---------------------------------------------------------------------------------------
  procedure Calcul_Scores(VD : in TV_Depeche; C : in T_Categorie; VM : in out TV_Dico; N : in integer) is
  -- {} => {met  a jour les score des different mots present dans VM, lorsqu'un mot present dans VM
  --         apparait dans une depeche du vecteur VD, son score est décrémenté si la depeche n'est
  --         pas dans la categorie C}

  begin
    for i in VD'range loop
      for j in 1..VD(i).nbmots loop
        if C /= VD(i).cat then
          if Recherche(VM,N,VD(i).texte(j)) > 0 then
            VM(Recherche(VM,N,VD(i).texte(j))).score := VM(Recherche(VM,N,VD(i).texte(j))).score -1;
          end if;
          else
            if Recherche(VM,N,VD(i).texte(j)) > 0 then
              VM(Recherche(VM,N,VD(i).texte(j))).score := VM(Recherche(VM,N,VD(i).texte(j))).score +1;
            end if;
        end if;
      end loop;
    end loop;
  end Calcul_Scores;
------------------------------------------------------------------------------------------
  function Poids_Score(S: in Integer)return Integer is
  --{} => {resultat = valeur du poids à attribuer étant donné un score s}

  begin
   if S <= 0 then
     return 0;
   else
     return S;
   end if;

  end Poids_Score;
---------------------------------------------------------------------------------------------
  procedure Generation_Lexique(VD: in Tv_Depeche; C : in T_Categorie; Fl : in string) is
  -- {} =>{Cette procédure créé pour la catégorie C le fichier lexique de nom Fl à partir du vecteur
  -- de dépêches de nom VD. Cette procédure doit déclarer un vecteur de type
  -- V_Dico puis le remplir en utilisant Init_Dico , puis Calcul_Scores et enfin utiliser le vecteur résultant pour créer un fichier lexique en
  -- utilisant la fonction Poids_Score}
    VDic : TV_Dico;
    f: file_type;
    N :integer;
  begin
    create(f,out_file,Fl);
    Init_Dico(VD,C,Vdic,N);
    Calcul_Scores(VD,C,Vdic,N);
    for i in VDic'range loop
      if VDic(i).score <= 1 then
        null;
      else
        put_line(f,trim(VDic(i).mot,both) & ":" & trim(Integer'image(Poids_Score(VDic(i).score)),both));
      end if;
    end loop;

    Close(f);
  end Generation_Lexique;




end p_generation;
