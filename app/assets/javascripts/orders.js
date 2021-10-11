

function check_slots() {

    const user_id = $("#order_user_id").val();
    const scheduled_at = $("#order_scheduled_at").val();
    url = window.location.origin
    
    if (user_id != '' && scheduled_at != '') {
        slotApiUrl = url + "/api/v1/get_slots?user_id=" + user_id + "&scheduled_at=" + scheduled_at;
        fetch(slotApiUrl).then(function(response){
            alert(response);
        })
    }

    //alert("user id " + user_id + " slot " + scheduled_at)
}

$("#order_user_id").change(function() {
    check_slots();
})
