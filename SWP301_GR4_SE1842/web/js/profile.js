function logout(){
    $.ajax({
        url: "/SWP301_GR4_SE1842/Logout",
        method: "GET",
        dataType: 'JSON',
        success: function (data) {
            location.reload(true);
        },
        error: function (Error) {
            location.reload(true);
        }
    });
}

function ChangePass() {
    var OldPass = $('#OldPass').val();
    var NewPass = $('#NewPass').val();
    var boxMess = $('#changePassMessageBox')
    var Mess = $('#changePassMessage')
    var CFPass = $('#CFPassrs').val();
    if(CFPass !== NewPass){
        boxMess.removeClass("fade")
        boxMess.addClass("bg-danger")
        Mess.text("Confirm Password incorrect");
        setTimeout(() => {
            boxMess.addClass("fade")
        }, 3000)
        return;
    }
    
    if(!ValidatePassword(NewPass)){
        boxMess.removeClass("fade")
        boxMess.addClass("bg-danger")
        Mess.text("Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character (@$!%*?&).");
        setTimeout(() => {
            boxMess.addClass("bg-danger").addClass("fade").addClass("bg-success")
        }, 3000)
        return;
    }
    
    if (OldPass == '' || NewPass == '') {
        boxMess.removeClass("fade")
        Mess.text("please input your old password and new password!!");
        setTimeout(() => {
            boxMess.addClass("fade")
        }, 3000)
        return;
    }

    $.ajax({// call api
        url: "/SWP301_GR4_SE1842/Profile",
        method: "POST",
        dataType: 'JSON',
        data: {
            Action: "ChangePass",
            OldPassword: OldPass,
            NewPassword: NewPass
        },
        success: function (data) {
            console.log("error", Error)
        },
        error: function (Error) {
            // show message action
            boxMess.removeClass("fade")
            Mess.text(Error.responseText)
            if (Error.responseText.toLowerCase().includes("incorrect")) {
                boxMess.removeClass("bg-success").addClass("bg-danger")
            } else {
                boxMess.removeClass("bg-danger").addClass("bg-success")
            }
            
            setTimeout(() => {
                boxMess.addClass("fade")
            }, 3000)
        }
    });
}

function ValidatePassword(pass) {
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordPattern.test(pass);
}