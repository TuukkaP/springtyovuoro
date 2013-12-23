           $(document).ready(function() {
                $("#date").datepicker();
                $('#place\\.id').change(function() {
                    var placeName = $('#place\\.id option:selected').text();
                    $("#user\\.id").empty();
                    $.getJSON(BASE_URL + '/admin/place/' + placeName + '/users.json', function(data) {
                        $('#user\\.id').append('<option value=\"0\">Ei tekijää</option>');
                        $.each(data, function(k, v) {
                            $("#user\\.id").append('<option value=\"' + v.id + '\">' + v.firstname + ' ' + v.lastname + '</option>');
                        });
                    });
                });
                $('#date').datepicker()
                        .on('changeDate', function(ev) {
                            $("#panel-title").empty().append("Vuorot " + $("#date").val());
                            $("#todaysOrdersTableBody").empty();
                            $.getJSON(BASE_URL + '/admin/order/show/' + $("#date").val() + '/orders.json', function(data) {
                                if ($.isEmptyObject(data)) {
                                    $("#todaysOrdersTableBody").append("<tr><td colspan='3'>Ei vuoroja tälle päivälle.</td></tr>");
                                }
                                else {
                                    $.each(data, function(k, v) {
                                        $("#todaysOrdersTableBody").append("<tr><td>" + v.user + "</td><td>" + v.place + "</td><td>" + v.time + "</td></tr>");
                                    });
                                }
                                $("#panel-footer").empty().append("Yhteensä " + data.length + " vuoroa.");
                            });
                        });
            });