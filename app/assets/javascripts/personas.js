$(function () {
    $('.datepicker').datetimepicker({
        viewMode: 'years',
        icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                    previous: 'fa fa-arrow-left',
                    next: 'fa fa-arrow-right'
                }
    });
    
    $(document).bind('ajaxError', 'form#new_persona', function(event, jqxhr, settings, exception){
        // note: jqxhr.responseJSON undefined, parsing responseText instead
        $(event.data).render_form_errors( $.parseJSON(jqxhr.responseText) );
    });
    
    
    $(".modal").on("hidden.bs.modal", function(){
        // Clear the modal form on Hide
        $(this).find('form')[0].reset();
        
        // Clear errors
        $('.form-group.has-error', this).each(function(){
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
        });
    });
});

(function($) {

    $.fn.modal_success = function(){
        // close modal
        this.modal('hide');

        // clear error state
        this.clear_previous_errors();
    };

    $.fn.render_form_errors = function(errors){
        $form = this;
        this.clear_previous_errors();
        model = this.data('model');

        // show error messages in input form-group help-block
        $.each(errors, function(field, messages){
            $input = $('input[name="' + model + '[' + field + ']"]');
            $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
        });
    };

    $.fn.clear_previous_errors = function(){
        $('.form-group.has-error', this).each(function(){
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
        });
    }

}(jQuery));