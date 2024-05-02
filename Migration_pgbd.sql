DROP TABLE IF EXISTS public.sous_tache;
DROP TABLE IF EXISTS public.taches;
DROP TABLE IF EXISTS utilisateur;


CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(30),
    courriel VARCHAR(255),
    cle_api VARCHAR(30) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE public.taches (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER REFERENCES utilisateur(id) on delete cascade,
    titre VARCHAR(100),
    description VARCHAR(500),
    date_debut DATE,
    date_echeance DATE,
    complete BOOLEAN
    
);
 
CREATE TABLE public.sous_tache (
    id SERIAL PRIMARY KEY,
    tache_id INTEGER REFERENCES taches(id) on delete cascade,
    titre VARCHAR(100),
    complete BOOLEAN
);

INSERT INTO utilisateur (nom, courriel, cle_api, password) VALUES
('Nom_test', 'test@example.com', 'cle_api_test', 'allo123'),
('maril', 'maril@maril.com', 'maril_cle', 'maril');
 
INSERT INTO public.taches (utilisateur_id, titre, description, date_debut, date_echeance, complete) VALUES
(1, 'Tache en test', 'Description premiere tache', '2024-04-20', '2024-04-25', false),
(1, 'Revient plus-tard', 'Description deuxieme tache', '2024-04-18', '2024-04-30', false),
(1, 'Tache 3', 'Description 3e tache', '2023-12-12', '2024-02-23', true);
 
INSERT INTO public.sous_tache (tache_id, titre, complete) VALUES
(1, 'Sous-tache en test (Tache en test)', false),
(1, 'Sous-tache en test 2 (Tache en test)', false),
(2, 'Une autre sous-tache (Revient plus-tard)', false),
(3, 'Sous tache complete (Tache 3)', true);

select * from utilisateur;
select * from public.taches t ;
select * from public.sous_tache st ;
