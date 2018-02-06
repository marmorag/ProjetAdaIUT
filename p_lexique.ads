package P_Lexique is

    type TR_mot is record
		chaine : String(1..30);
		poids: positive;
	end record;

type TV_lexique is array(Integer range<>) of TR_mot;

function Nb_Mots(nomfic : in String)  return Integer;
--{} => {résultat = nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}

procedure Init_Lexique(Nomfic: in String; L : out Tv_lexique);
-- => {On suppose que la taille du vecteur L correspond exactement au nombre de mots contenus dans le fichier}
-- => {Range dans le vecteur  L, les mots contenus dans le fichier lexiqueNomfic et les poids associés}

function Poids_Mot(M : in string; L : in TV_Lexique) return integer;
--{} => {res = le poids de M dans le Lexique L et 0 si pas dans le lexique}


end p_lexique;
