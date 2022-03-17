$(document).ready(function () {
    if (
        $(".alert")
            .html()
            .indexOf("Thank you. We will communicate with you shortly!") >= 0
    ) {
        $(".alert").hide();
        $("#success-message").modal("show");
    }

    $("#subscribe-form").on("submit", function (e) {
        e.preventDefault();
        $("#subscribe-message").modal("show");
        this.reset();
    });
});
