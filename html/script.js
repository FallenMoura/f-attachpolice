window.addEventListener("message", function (play) {
    if (play.data.action == "showassalto") {

        $('.top-right-container').fadeIn();
        $(".top-right-container").css({ "display": "flex" })

    }
    else if (play.data.action == "hideassalto") {
        $('.top-right-container').fadeOut();
    }
});
