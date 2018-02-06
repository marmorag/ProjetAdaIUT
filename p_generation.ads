with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;
with p_classification; use p_classification;

package p_generation is

---------------------------------------------------------------------------
-- type

  type TR_Entree is record
    mot : string(1..30);
    score : integer;
  end record;

  type TV_Dico is array(1..2000) of TR_Entree;

---------------------------------------------------------------------------
-- fonction

  function Recherche(VM : in TV_Dico; N : in integer; M : string) return integer;
    -- {} => {res = indice du mot M dans le vecteur VM si il est present sinon -1
    --          N est le nombre de mot rangé dans le vecteur}

  procedure Init_Dico(VD : in TV_Depeche; C : in T_Categorie; VM : out TV_Dico; N : out integer);
    -- {} => {charge dans VM tous les mot present dans au moins une depeche de la categorie C du vecteur
    --         de depeche VD. si le mot est present plusieurs fois il doit apparaitre qu'une seule fois
    --         }

  procedure Calcul_Scores(VD : in TV_Depeche; C : in T_Categorie; VM : in out TV_Dico; N : in integer);
  -- {} => {met  a jour les score des different mots present dans VM, lorsqu'un mot persent dans VM
  --         apparait dans une depeche du vecteur VD, son score est décrémenté si la depeche n'est
  --         pas dans la categorie C}

  function Poids_Score(S: in Integer)return Integer;
  --{} => {resultat = valeur du poids à attribuer étant donné un score s}

  procedure Generation_Lexique(VD: in Tv_Depeche;C : in T_Categorie;Fl : in string);
  -- {} =>{Cette procédure créé pour la catégorie C le fichier lexique de nom Fl à partir du vecteur
  -- de dépêches de nom VD. Cette procédure doit déclarer un vecteur de type
  -- V_Dico puis le remplir en utilisant Init_Dico , puis Calcul_Scores et enfin utiliser le vecteur résultant pour créer un fichier lexique en
  -- utilisant la fonction Poids_Score}


end p_generation;
