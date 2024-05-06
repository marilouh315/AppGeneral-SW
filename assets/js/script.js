
/**
 * Fonction pour ajouter un utilisateur avec l'API
 */
let formulaire = document.getElementById("form");
formulaire.addEventListener("submit", ajouterUtilisateur); // Pas de parenthèses

function ajouterUtilisateur(event) {
    event.preventDefault();

    console.log("Ajout d'un utilisateur");

    
    const input_nom = document.getElementById("nom").value;
    const input_courriel = document.getElementById("courriel").value;
    const input_mot_de_passe = document.getElementById("mot_de_passe").value;

    let body_utilisateur = {
        nom_utilisateur:input_nom,
        courriel_utilisateur:input_courriel,
        motDePasse_utilisateur:input_mot_de_passe
    };

    console.log(body_utilisateur);

    const requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body_utilisateur)
    };

    fetch(`https://app-taches.onrender.com/api/users/`, requestOptions)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        if (data) {
            console.log(data.nom_utilisateur);
            console.log(data.cle_api);
            document.querySelector('.message_succes').innerHTML = 'Utilisateur ajouté avec succès : <br><strong>Nom d\'utilisateur : </strong>' + body_utilisateur.nom_utilisateur + '<br><strong>Courriel : </strong>' + body_utilisateur.courriel_utilisateur + '<br><strong>Clé API : </strong>' + data.utilisateur_ajoute.cleAPI;
        }
        else {
            console.log('Erreur lors de la création de l\'utilisateur (data)');        
        }
    })
}




let formulaire2 = document.getElementById("form2");
formulaire2.addEventListener("submit", genererCleAPI); // Pas de parenthèses

function genererCleAPI(event) {
    event.preventDefault();

    console.log("Génération d'une clé API");

    const input_courriel = document.getElementById("courriel_cle").value;
    const input_mot_de_passe = document.getElementById("mot_de_passe_cle").value;

    let body_utilisateur = {
        courriel_utilisateur:input_courriel,
        motDePasse_utilisateur:input_mot_de_passe
    };

    console.log(body_utilisateur);

    const requestOptions = {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body_utilisateur)
    };

    fetch(`https://app-taches.onrender.com/api/users/`, requestOptions)
    .then(response => response.json())
    .then(data => {
        if (data) {
            document.querySelector('.message_succes_generer').innerHTML = data.message;
        }
        else {
            console.log('Erreur lors de la création de l\'utilisateur (data)');        
        }
    })
}
