$(document).ready(function () {
    $("#contact-form").on("submit", function (e) {
        e.preventDefault();
        $("#success-message").modal("show");
        this.reset();
    });
    $("#subscribe-form").on("submit", function (e) {
        e.preventDefault();
        $("#subscribe-message").modal("show");
        this.reset();
    });
});
