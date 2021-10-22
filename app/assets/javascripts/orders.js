const allSlots = { 
    "8" : "8:00 - 10:00", 
    "10" : "10:00 - 12:00", 
    "13" : "13:00 - 15:00",  
    "15" : "15:00 - 17:00", 
    "17" : "17:00 - 19:00"
 };
emptyAndDisableSlotSelect();
function check_slots() {
                    
    let availableSlots = ['8','10','13','15','17'];


    const user_id = $("#order_user_id").val();
    const scheduled_at = $("#order_scheduled_at").val();
    url = window.location.origin
    
    if (user_id != '' && scheduled_at != '') {
        slotApiUrl = url + "/api/v1/get_slots?user_id=" + user_id + "&scheduled_at=" + scheduled_at;
        fetch(slotApiUrl).then(function(response){
            return response.json()
        }).then((slots)=> {
            $("#order_time_slot").prop('disabled', false);
            slots.forEach(slot => {
                const indexAt = availableSlots.indexOf(slot.scheduled_slot);
                if(indexAt > -1) {
                    availableSlots.splice(indexAt, 1);
                }
            });
            addAvailableSlots(availableSlots);
        });
    } else {
        emptyAndDisableSlotSelect();
    }
}

function addAvailableSlots(availableSlots) {
    $("#order_time_slot").empty();
    select = document.getElementById('order_time_slot');
    availableSlots.forEach( slot => {
        let opt = document.createElement('option');
        opt.value = slot;
        opt.innerHTML = allSlots[slot];
        select.appendChild(opt);
    })
}

function emptyAndDisableSlotSelect(){
    $("#order_time_slot").empty();
    $("#order_time_slot").prop('disabled', 'disabled');
}

$("#order_user_id").change(function() {
    check_slots();
})

let x = document.getElementById("ubicacion");

function getLocation(order_id) {
    
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition( (position) => { 
            url = window.location.origin
            locationApiUrl = url + "/api/v1/save_location?order_id=" + order_id + "&longitude=" + position.coords.longitude + '&latitude=' + position.coords.latitude;
            saveLocationForOrder(locationApiUrl);
            let button = document.querySelector("#geo_"+order_id);
            button.disabled = true;
            button.textContent = 'Llegaste al lugar!'
        });
    } else {
        alert('Geolocation is not supported by this browser.')
    }
}
function saveLocationForOrder(url) {

    fetch(url).then(function(response){
        // alert('Location saved!')
    })

}