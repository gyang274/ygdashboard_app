$(document).keyup(function(event) {
    if ($("#dbSearchTrm").is(":focus") && (event.keyCode == 13)) {
        $("#dbSearchBtn").click();
    }
});

$(document).keyup(function(event) {
    if ($("#chatText").is(":focus") && (event.keyCode == 13)) {
        $("#chatBtn").click();
    }
});