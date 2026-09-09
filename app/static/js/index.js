window.onload = function() {
    setTimeout(function() {
        var logoElement = document.getElementsByClassName('logo')[0];
        if (logoElement){
            logoElement.classList.add('animate-Up');
        }
    }, 0);

    setTimeout(function() {
        var titleElement = document.getElementsByClassName('title')[0];
        if (titleElement) {
            titleElement.classList.add('animate-Up');
        }
    }, 1000);

    setTimeout(function() {
        var subtitleElement = document.getElementsByClassName('subtitle')[0];
        if (subtitleElement) {
            subtitleElement.classList.add('animate-Down');
        }
    }, 1000);
};
