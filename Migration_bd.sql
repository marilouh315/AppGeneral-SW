
DROP DATABASE IF EXISTS `bd_toDoList`;
CREATE DATABASE `bd_toDoList`;
USE `bd_toDoList`;
 
DROP TABLE IF EXISTS `sous_tache`;
DROP TABLE IF EXISTS `taches`;
DROP TABLE IF EXISTS `utilisateur`;


CREATE TABLE `utilisateur` (
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(30),
    `courriel` VARCHAR(255),
    `cle_api` VARCHAR(30) UNIQUE,
    `password` VARCHAR(100)
);

CREATE TABLE `taches` (
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `utilisateur_id` INTEGER,
    `titre` VARCHAR(100),
    `description` VARCHAR(500),
    `date_debut` DATE,
    `date_echeance` DATE,
    `complete` TINYINT(1),
    FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur`(`id`)
);
 
CREATE TABLE `sous_tache` (
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `tache_id` INTEGER,
    `titre` VARCHAR(100),
    `complete` TINYINT(1),
    FOREIGN KEY (`tache_id`) REFERENCES `taches`(`id`)
);

INSERT IGNORE INTO utilisateur (nom, courriel, cle_api, password) VALUES
('Nom_test', 'test@example.com', 'cle_api_test', 'allo123');
 
INSERT IGNORE INTO taches (utilisateur_id, titre, description, date_debut, date_echeance, complete) VALUES
(1, 'Tache en test', 'Description premiere tache', '2024-04-20', '2024-04-25', 0),
(1, 'Revient plus-tard', 'Description deuxieme tache', '2024-04-18', '2024-04-30', 0),
(1, 'Tache 3', 'Description 3e tache', '2023-12-12', '2024-02-23', 1);
 
INSERT IGNORE INTO sous_tache (tache_id, titre, complete) VALUES
(1, 'Sous-tache en test (Tache en test)', 0),
(1, 'Sous-tache en test 2 (Tache en test)', 0),
(2, 'Une autre sous-tache (Revient plus-tard)', 0),
(3, 'Sous tache complete (Tache 3)', 1);

SELECT * FROM utilisateur u ;

SELECT COUNT(*) AS nbUsager FROM utilisateur u WHERE cle_api = "cle_api_test";
