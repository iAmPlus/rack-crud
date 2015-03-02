
function deleteRequest( model, id ){
    console.log('Deleting ' + model + ' with id ' + id);

    $.ajax({
        type: 'DELETE',
        url: '/' + model + 's/' + id,
        data: { id:id }
    })
    .done( function(){
        console.log('Done.');
       window.location.href = '/' + model + 's';
    })
}


function postObject( model ){
    console.log('Posting ' + model);
    data = $('form').serialize();
    console.log(data);

    $.ajax({
        type: 'POST',
        url: '/' + model + 's',
        data: data
    })
    .done( function(){
        console.log('Success.');
        window.location.href = '/' + model + 's';
    })
    .fail( function(response){
        console.log('Failure.');
        $('div.errors').text(response.getResponseHeader('Warning'));
    })
}


function putObject( model, id ){
    console.log('Putting ' + model + ' with id ' + id);
    data = $('form').serialize();
    console.log(data);

    $.ajax({
        type: 'PUT',
        url: '/' + model + 's/' + id,
        data: data
    })
    .done( function(){
        console.log('Done.');
        window.location.href = '/' + model + 's';
    })
    .fail( function(response){
        console.log('Failure.');
        $('div.errors').text(response.getResponseHeader('Warning'));
    })
}
