
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
        nom_utilisateur:"nemo",
        courriel_utilisateur:"nemo@swim.com",
        motDePasse_utilisateur:"nemo"
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
            console.log(data[0]);
        }
        else {
            console.log('Erreur lors de la création de l\'utilisateur (data)');        
        }
    })
}