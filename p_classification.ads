with P_Esiut; use P_Esiut;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;
with p_depeche; use p_depeche;

package p_classification is



  function Score(D : in TR_Depeche; L : in TV_lexique) return integer;
  --{} => {res = score de la depeche D pour la categorie dont le lexique est L}
-------------------------------------------------------------------------------------------
  function Max_Score (VS : in TV_Score) return T_Categorie;
  -- {} => {res = categorie ayant le score maximale dans VS}
-------------------------------------------------------------------------------------------
  procedure Run(VD : in Tv_Depeche; Lp, Ls, Lc, Le, Les : TV_Lexique; nomfic : string);
  --{} => {genere le fichier texte reponse nomfic etant donnée les depeche et lexique
  -- passé en arguments}
-------------------------------------------------------------------------------------------


end p_classification;
