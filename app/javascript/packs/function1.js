function ajaxcall(){
    console.log('works')
    $.ajax({
        type: "POST",
        url: "/update_lv",
        dataType: "json",
        data :
            {
                //'fetch' : fetch // You might want to indicate what you're requesting.
            },
        success : function(data){
            console.log( data[0]['article_visits'] )
            refresh_fields(data)
        }
    })
}

function  refresh_fields(data){
    console.log('refresh_funct works')
    console.log( data[0]['article_visits'] )
    let likes_element
    let visits_element
    for (let i = 0; i < data.length; i++)
    {
        likes_element = document.getElementById("l_"+data[i]['article_id']);
        visits_element = document.getElementById("v_"+data[i]['article_id']);

        likes_element.innerText=data[i]['article_likes']
        visits_element.innerText=data[i]['article_visits']
    }
}

document.addEventListener('turbolinks:load', () => {
    const clickButton = document.getElementById("button");
    clickButton.addEventListener('click', (event) => {
        ajaxcall()
    });
});