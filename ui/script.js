let selected = 0;
let firstopen = 0;
var power = 0;
$(function(){
    $(document).keyup(function(e){
        if(e.keyCode == 27){ // Escape
            $("#vehpage").css('display', 'none')
            $.post('http://carspawning/close', JSON.stringify({}));
        }
    });

    $("#reload").click(() => {
        $.post('http://carspawning/refresh', JSON.stringify({}));
    });

    window.addEventListener('message', function(event) {
        if(event.data.type == "close"){
            $("#vehpage").css('display', 'none');
            $.post('http://carspawning/close'), JSON.stringify({});
            return true;
        }
        if(event.data.type == "refresh"){
            if(event.data.power !== null || event.data.power !== 0){
                power = event.data.power
            }else{
                power = 0
            }

            RescanCards();
        }
        if(event.data.type == "open"){
            $('#vehpage').css('display', 'block');
        }

        if(firstopen == 0){
            $(".card").hide(); // Hide for security
            $.post('http://carspawning/refresh', JSON.stringify({}));
            firstopen = 1;
        }
        $("#vehpage").css('display', "block");
    });

    function RescanCards(){
        $(".card").each(function(idx, elem){
            let cardp = $(elem).attr("power");
            if(cardp == null){
                cardp = 0;
            }
            // Convert values to number
            power = Number(power);
            cardp = Number(cardp);
    
            //Check card power to player power
            if(power >= cardp){
                $(elem).show();
            }else{
                $(elem).hide();
            }
        });
    }

    $("#close").click(() => {
        $("#vehpage").css('display', 'none')
        $.post('http://carspawning/close', JSON.stringify({}));
    })

    $('button').click(function() {
        $(this).blur()
    });
})

$(document).ready(function(){

    $("#selected").children().hide();
    $("#notexist").show();

    $(".catagory").click(function(){
      $('.catagory').removeClass('selected');
      $("#selected").children().hide();
      $(this).addClass('selected');

      $('.catagories').css('display', 'none');
      $("#" + $(this).attr("value")).css('display', 'block');
      $('#notexist').css('display', 'none');
    });

    $("button[name=spawn]").click(function(){
      $.post("http://carspawning/spawnveh", JSON.stringify({vehicle: $(this).attr("modelname")}));
    });
  });
