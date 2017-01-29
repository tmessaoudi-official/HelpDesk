var w3c = document.getElementById && !document.all;
var ie = document.all;

if (ie || w3c) {
    // déclaration des variables uniquement pour IE vive microsoft ?!!
    var overlay;
    var my_window;
}


function affiche_overlay_window1(image_fond_overlay, adresse_page) {
    // creation de l'overlay et affichage de l'image
    montreoverlay1("<table class = 'image_calque ' valign = 'center' border = '0' align = 'center'><tr><td> <IMG  SRC='" + image_fond_overlay + "'></td></tr>");
    // creation de la fenêtre
    montrefenetre1(adresse_page);


}


function montreoverlay1(text) {
    if (w3c || ie) {
        overlay = document.all ? document.all["overlay1"] : document.getElementById ? document.getElementById("overlay1") : ""
        overlay.innerHTML = text; // fixe le code HTML dans l'overlay balise (div)
        overlay.style.visibility = "visible1"; // modification du style

    }
}

function montrefenetre1(html) {
    if (w3c || ie) {
        //affichage de la fenetre
        my_window = document.all ? document.all['window1'] : document.getElementById ? document.getElementById('window1') : ""
        my_window.style.visibility = "visible";

        // affichage du corps de la fenêtre (balise iframe)
        my_window = document.all ? document.all['contempwindow1'] : document.getElementById ? document.getElementById('contempwindow1') : ""
        my_window.style.visibility = "visible";
        frames['contempwindow1'].location.href = html;

    }
}




function cachetout1() {
    if (w3c || ie) {

        // masque la fenetre (balise div [window] )
        my_window = parent.document.getElementById('window1');
        my_window.style.visibility = "hidden";

        // masque le contenu (balise iframe [contempwindow])
        my_window = parent.document.getElementById('contempwindow1');
        my_window.style.visibility = "hidden";

        // masque l'overlay (balise div [overlay])
        my_window = document.all ? parent.document.all['overlay1'] : parent.document.getElementById ? parent.document.getElementById('overlay1') : ""
        my_window.style.visibility = "hidden";

    }


}

