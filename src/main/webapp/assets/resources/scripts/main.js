$(document).ready(function (){

    let dec = $("#form-dec-input").val();

    if (dec !== null && dec !== undefined) {

        let decimal = $("#form-dec-input").val();
        let binary = $("#form-bin-input").val();
        let conversion = {
            decimal: decimal,
            binary: binary,
        };

        localStorage.setItem('last_conv', JSON.stringify(conversion));
    }

    let bin = $("#form-bin-input").val();

    if (bin !== null && bin !== undefined) {

        let decimal = $("#form-dec-input").val();
        let binary = $("#form-bin-input").val();
        let conversion = {
            num_decimal: decimal,
           num_binary: binary,
        };


        localStorage.setItem('last_conv', JSON.stringify(conversion));
    }


    let last_conv = JSON.parse(localStorage.getItem('last_conv'));
    console.log("Última Conversão: ");
    console.log("Decimal: " + last_conv.num_decimal);
    console.log("Binario: " + last_conv.num_binary);

    document.querySelector('#form-dec-input').oninvalid = function() {
        // remove mensagens de erro padrão
        this.setCustomValidity("");
        // faz a validação novamente
        if (!this.validity.valid) {
            // se estiver inválido, coloca a mensagem
            this.setCustomValidity("Digite um decimal de até no máximo 10 dígitos");
        }
    };

    document.querySelector('#form-bin-input').oninvalid = function() {
        // remove mensagens de erro padrão
        this.setCustomValidity("");
        // faz a validação novamente
        if (!this.validity.valid) {
            // se estiver inválido, coloca a mensagem
            this.setCustomValidity("Digite apenas 0 e/ou 1");
        }
    };

    //mostra msg de erro se tiver os campos vazios
    $(".btn-converter-area").click(function (event){
        if (($('#form-dec-input').val() == "") && ($('#form-bin-input').val() == "")){
            event.preventDefault();
            $('#msg-form-error').removeClass('d-none').fadeIn( "slow" );
            $('#msg-form-error').fadeOut( 2000);
        }

    })

    //Validação para nao aceitar nada alem de 0 e 1 no formulario
    $('#form-bin-input').on("keypress", function (event){
        if(((event.keyCode < 48) || (event.keyCode > 49)) && (event.keyCode != 13) ){
            event.preventDefault();
        }
    })

    //Validação para nao aceitar nada alem de decimais no formulario
    $('#form-dec-input').on("keypress", function (event){
        if(((event.keyCode < 48) || (event.keyCode > 57)) && (event.keyCode != 13)){
            event.preventDefault();
        }
    })


    $('#counterConverterDec').find('strong').each(function () {
        var contDec = $(this).text();
        if (contDec == 10){
            $('audio#hehe')[0].play()
        }
    });
    $('#counterConverterBin').find('strong').each(function () {
        var contDBin = $(this).text();
        if (contDBin == 10){
            $('audio#hehe')[0].play()
        }
    });

    //remove valores e deixa disabled o formulario vizinho pelo click
    $('#form-dec').click(function(i){
        $('#form-dec-input').removeClass('disabled');
        $('#form-bin-input').addClass('disabled');
        $('#form-bin-input').val("")
    });

    //remove valores e deixa disabled o formulario vizinho pelo click
    $('#form-bin').click(function(i){
        $('#form-bin-input').removeClass('disabled');
        $('#form-dec-input').addClass('disabled');
        $('#form-dec-input').val("")
    });

    //remove valores e deixa disabled o formulario vizinho pelo click
    $('#form-bin').focusin(function(i){
        $('#form-bin-input').removeClass('disabled');
        $('#form-dec-input').addClass('disabled');
        $('#form-dec-input').val("")
    });


    //remove valores e deixa disabled o formulario vizinho pelo click
    $('#form-dec').focusin(function(i){
        $('#form-dec-input').removeClass('disabled');
        $('#form-bin-input').addClass('disabled');
        $('#form-bin-input').val("")
    });



});