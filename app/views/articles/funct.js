$("#button1").click(function(){
    $.ajax({
        url: "/update_lv",
        type: "GET",
        dataType: "json",
        success:function(result){
            alert(result);
        }
    });
});

$("#button").click(function(){
    $.ajax({
        url: "/update_lv",
        type: "POST",
        dataType: "json",
        success:function(data){
            let t = JSON.parse(data)
            alert(t['1'])
            console.log(t['1'])
        }
    });
});

