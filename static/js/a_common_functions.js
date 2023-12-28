function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}


async function delReport(id) {

    swal({
        title: "Are You Sure?",
        text: "Deleting This Report ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(async (willDelete) => {
        if (willDelete) {
            $.ajax({
                method: 'DELETE',
                url: '/api/report-delete/' + id + '/',
                headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                success: function (stdDelResp) {
                    $.ajax({
                        type: "POST",
                        data: JSON.stringify({
                            'title':'Deleting A Car',
                            'info':'A car with this '+id+' Was deketed',
                            
                        }),
                        headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                        url: '/api/report-create/',
                        success: function (carFineResp) {
                            
                        },
                        error: function (carRespErr) {
            
                        }
                    })
                    swal("You Succesfully Deleted This Report", {
                        icon: "success",
                    });
                    location.reload()
                    
                }
            });

        }
    });

}


async function delCar(id) {

    swal({
        title: "Are You Sure?",
        text: "Deleting This Car ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(async (willDelete) => {
        if (willDelete) {
            $.ajax({
                method: 'DELETE',
                url: '/api/car-delete/' + id + '/',
                headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                success: function (stdDelResp) {
                    $.ajax({
                        type: "POST",
                        data: JSON.stringify({
                            'title':'Deleting A Car',
                            'info':'A car with this '+id+' Was deketed',
                            
                        }),
                        headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                        url: '/api/report-create/',
                        success: function (carFineResp) {
                            
                        },
                        error: function (carRespErr) {
            
                        }
                    })
                    swal("You Succesfully Deleted This Car", {
                        icon: "success",
                    });
                    location.reload()
                    
                }
            });

        }
    });

}

async function delFineReg(id) {
    swal({
        title: "Are You Sure?",
        text: "Deleting This Fine ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(async (willDelete) => {
        if (willDelete) {
            $.ajax({
                method: 'DELETE',
                url: '/api/fine-delete/' + id + '/',
                headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                success: function (stdDelResp) {
                    $.ajax({
                        type: "POST",
                        data: JSON.stringify({
                            'title':'Deleting A Fine',
                            'info':'A Fine with this '+id+' Was deleted',
                            
                        }),
                        headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                        url: '/api/report-create/',
                        success: function (carFineResp) {
                            
                        },
                        error: function (carRespErr) {
            
                        }
                    })
                    swal("You Succesfully Deleted This Fine", {
                        icon: "success",
                    });
                    location.reload()
                    
                }
            });

        }
    });
}

async function delUsr(id) {
    swal({
        title: "Are You Sure?",
        text: "Deleting This User ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(async (willDelete) => {
        if (willDelete) {
            $.ajax({
                method: 'DELETE',
                url: '/api/user-delete/' + id + '/',
                headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                success: function (stdDelResp) {
                    $.ajax({
                        type: "POST",
                        data: JSON.stringify({
                            'title':'Deleting A User',
                            'info':'A User with this '+id+' Was deleted',
                            
                        }),
                        headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                        url: '/api/report-create/',
                        success: function (carFineResp) {
                            
                        },
                        error: function (carRespErr) {
            
                        }
                    })
                    swal("You Succesfully Deleted This User", {
                        icon: "success",
                    });
                    location.reload()
                    
                }
            });

        }
    });

}

async function delFine(id) {

    swal({
        title: "Are You Sure?",
        text: "Deleting This Fine ",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(async (willDelete) => {
        if (willDelete) {
            $.ajax({
                method: 'DELETE',
                url: '/api/carFines-delete/' + id + '/',
                headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                success: function (stdDelResp) {
                    $.ajax({
                        type: "POST",
                        data: JSON.stringify({
                            'title':'Deleting A CarFine',
                            'info':'A CarFine with this '+id+' Was deleted',
                            
                        }),
                        headers: { 'X-CSRFToken': getCookie('csrftoken'), 'Content-type': "application/json" },
                        url: '/api/report-create/',
                        success: function (carFineResp) {
                            
                        },
                        error: function (carRespErr) {
            
                        }
                    })
                    swal("You Succesfully Deleted This CarFine", {
                        icon: "success",
                    });
                    location.reload()
                    
                }
            });

        }
    });

}