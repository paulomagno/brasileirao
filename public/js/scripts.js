// Valida os dados e Salva o placar da partida no banco de dados
$("#salvar").click(function(){
    $.ajax({
        url : '/incluirResultado',
        type : "POST",
        dataType : "json",
        data: {
               _token : $("input[name='_token']").val(),
               mandante : $('select[name="mandante"]').val(),
               placarMandante : $('input[name="placarMandante"]').val(),
               visitante : $('select[name="visitante"]').val(),
               placarVisitante : $('input[name="placarVisitante"]').val(),
        },
        success:function(data) {
            let mensagens = '';

            if(data.message && typeof data.message === 'object') {
                $.each(data.message, function(key,value){
                    mensagens += value + "\n";
                });
            }


            alert('Aviso \n ' +  (mensagens != '' ? mensagens : data.message));

            if(data.success) {

                atualizaClassificacao();

               // $('#confrontoModal').delay(5000).modal('toggle').fadeout();
                $('#confrontoModal').fadeOut(2000).modal('hide');

                $('select[name="mandante"]').val('');
                $('input[name="placarMandante"]').val(0);
                $('select[name="visitante"]').val('');
                $('input[name="placarVisitante"]').val(0);
            }
        }
    });
});

// Atualiza a classificação do campeonato após inclusão do resultado
function atualizaClassificacao () {

    $.ajax({
        url : '/',
        type : "GET",
        dataType : "html",
        success:function(data) {
           $("#dados").html(data);
        }
    });
};
