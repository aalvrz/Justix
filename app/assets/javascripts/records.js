$(function () {
    $('.datetimepicker').datetimepicker({
        format: 'DD/MM/YYYY hh:mm A',
        //defaultDate: "<%= @record.visita %>",
        icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                    previous: 'fa fa-arrow-left',
                    next: 'fa fa-arrow-right'
                }
    });
});