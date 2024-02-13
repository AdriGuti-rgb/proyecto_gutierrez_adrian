let form = document.forms.nuevaContrasena
let contrasena
let canSubmitPass = false

function checkPass (e) {
    contrasena = e.target.value;
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (!contrasena.match(regex)) {
        putErrors("La contraseña no cumple con los requisitos")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        form.elements.repetido.disabled = false
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
    }
}

function checkPassTwice (e) {
    let contrasenaTwice = e.target.value;

    if (contrasenaTwice != contrasena) {
        putErrors("Las contraseñas no coinciden")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSubmitPass = true
    }
}

function getParams (e) {
    if (canSubmitPass) {
        let formData = new FormData()
        let url = new URL(window.location.href);
        
        let mail = url.searchParams.get('mail');
        formData.append("pass", contrasena)
        formData.append("mail", mail)
        
        fetch("http://localhost/php/proyecto/api/users/changePass/", {
            method: "POST",
            mode: "cors",
            body: formData
        })
        .then( response => {
            if (response.status === 200) {
                confirmChange("Contraseña modificada")
                setTimeout(() => {
                    window.close()
                }, 3000)
            } else if (response.status === 401) {
                putErrors("Error, vuelva a intentarlo+")
            } else console.log("Todo mal");
        })
        .then( data => {
            if (data) {
                
            }
        })
    } else putErrors("Rellene bien los campos")
}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    main[0].append(div);
}

function confirmChange (change) {
    if (document.getElementById("change") != null) document.getElementById("change").remove();
    let div = document.createElement("div");
    div.id = "change";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${change}`;
    main[0].append(div);
}

form.elements.actual.addEventListener("blur", checkPass)
form.elements.repetido.addEventListener("blur", checkPassTwice)
form.elements.change.addEventListener("click", getParams)
form.elements.cancel.addEventListener("click", () => window.close())