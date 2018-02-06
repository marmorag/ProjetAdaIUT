with P_Esiut; use P_Esiut;
with Text_IO; use TEXT_IO;
with p_chaine; use p_chaine;
with p_lexique; use p_lexique;

package body p_classification is


  --------------------------------------------------------------------
    function Score(D : in TR_Depeche; L : in TV_lexique) return integer is
      --{} => {res = score de la depeche D pour la categorie dont le lexique est L}
      scor : integer :=0;

    begin

    for i in D.texte'range loop
        scor := scor + Poids_Mot(D.texte(i),L);
    end loop;
      return scor;
    end Score;
  ----------------------------------------------------------------------------
    function Max_Score (VS : in TV_Score) return T_Categorie is
    -- {} => {res = categorie ayant le score maximale dans VS}
      maxcat : T_Categorie;
      max : integer := 0;
    begin
      if VS(Politique) > max then
        max := VS(Politique);
        maxcat := Politique;
      elsif VS(Sports) > max then
        max := VS(Sports);
        maxcat := Sports;
      elsif VS(Culture) > max then
        max := VS(Culture);
        maxcat := Culture;
      elsif VS(Economie) > max then
        max := VS(Economie);
        maxcat := Economie;
      elsif VS(Science) > max then
        max := VS(Science);
        maxcat := Science;
      end if;
      return maxcat;
    end Max_Score;
  ----------------------------------------------------------------------------
    procedure Run(VD : in Tv_Depeche; lp, ls, lc, le, les : TV_Lexique; nomfic : string) is
    --{} => {genere le fichier texte reponse nomfic etant donnée les depeche et lexique
    -- passé en arguments}
    tab : TV_Score;                      -- tableau pour 1 score de depeche
    f : file_type;                       -- fichier a rendre
    max : T_Categorie;
    moy : integer := 0;
    res, re, rc, rp, rs : integer := 0;   -- var. pour compteur de %reussite

    begin
      create(f,out_file,nomfic);

      for i in VD'range loop
                -- remplissage tableau avec les score
        tab(Politique) := Score(VD(i),lp);
        tab(Sports) := Score(VD(i),ls);
        tab(Culture) := Score(VD(i),lc);
        tab(Economie) := Score(VD(i),le);
        tab(Science) := Score(VD(i),les);
        max := Max_Score(tab);

                -- insertion dans le fichier "III:CATEGORIE"
        put_line(f,integer'image(i) & ":" & T_Categorie'image(max));

                -- verification resultat
        case max is
          when Politique  => if(VD(i).Cat = Politique) then rp := rp + 1; end if;
          when Sports     => if (VD(i).Cat = Sports) then rs := rs + 1; end if;
          when Culture    => if (VD(i).Cat = Culture) then rc := rc + 1; end if;
          when Economie   => if (VD(i).Cat = Economie) then re := re + 1; end if;
          when Science    => if (VD(i).Cat = Science) then res := res + 1; end if;
        end case;
      end loop;

                -- rajout des ligne de stat.
      put_line(f," ");
      put_line(f,"ENVIRRONNEMENT-SCIENCES: " & integer'image(res));
      put_line(f,"CULTURE: " & integer'image(rc));
      put_line(f,"ECONOMIE: " & integer'image(re));
      put_line(f,"POLITIQUE: " & integer'image(rp));
      put_line(f,"SPORTS: " & integer'image(rs));

      moy := (rs+rc+res+rp+re)/5;
      put_line(f,"MOYENNE: " & integer'image(moy));

    end Run;




















  end p_classification;
  ----------------------------------------------------------------------------------
