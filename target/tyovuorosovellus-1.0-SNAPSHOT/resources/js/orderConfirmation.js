$(document).ready(function() {
    $('#orderConfirmationForm').submit(function(event) {

            $.ajax({
                url: "/order/confirm",
                type: 'POST',
                dataType: 'json',
                data: "{\"o\":\"hmkcode\",\"id\":2}",
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function(data) {
                    alert(data.id + " " + data.name);
                },
                error: function(data, status, er) {
                    alert("error: " + data + " status: " + status + " er:" + er);
                }
            });
    });
});