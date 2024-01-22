fetch("http://localhost:3000/api/user/all", )
    .then( response => {
        console.log(response);
        if (response.status === 200) return response.json()
            else if (response.status === 404) console.log(response.text); 
            else console.log("Todo mal");
    })
    .then( data => {
        console.log(data);
    })

let user = {
    "name": "Adrian Gutierrez Usoz",
    "username": "adrianAVeces",
    "mail": "adrian@hotmal.com",
    "pass": "pasaste",
    "city": "España",
    "phone": "982345200",
    "club": "CM Teide",
    "rol": "organizer"
};

fetch("http://localhost:3000/api/user/register", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=utf-8"
        },
        body: JSON.stringify(user)
    }).then( response => {
        console.log(response);
        if (response.status === 200) return response.json()
            else if (response.status === 404) console.log(response.text); 
            else console.log("Todo mal");
    }).then( data => {
        console.log(data);
    }).catch ( error => {
        console.log(error);
    })

let token;
document.getElementById("photos").addEventListener("click", getParams);

function getParams() {

    let user = {
        "username": `${document.getElementById("nombre").value}`,
        "pass": `${document.getElementById("contrasena").value}`
    };


    fetch("http://localhost:3000/api/auth/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            },
            body: JSON.stringify(user)
        }).then( response => {
            // console.log(response);
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.text); 
                else alert("Todo mal");
        }).then( data => {
            token = data.token;
            console.log(data);
            localStorage.setItem('token', token);
            console.log(localStorage.getItem('token'));
        }).catch ( error => {
            console.log(error);
        })
}

document.getElementById("photos").addEventListener("click", getParams);

function getParams() {

    let user = {
        "username": `${document.getElementById("nombre").value}`,
        "pass": `${document.getElementById("contrasena").value}`
    };


    fetch("http://localhost/php/proyecto/api/users/getUser.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            },
            mode: "cors",
            body: JSON.stringify(user)
        }).then( response => {
            // console.log(response);
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.text); 
                else alert("Todo mal");
        }).then( data => {
            console.log(data);
            localStorage.setItem('token', data.token);
            localStorage.setItem('token', data.username);
        }).catch ( error => {
            console.log(error);
        })
}


document.getElementById("photos").addEventListener("click", getParams);

function getParams() {

    fetch("http://localhost/php/proyecto/api/users/getUser.php", )
        .then( response => {
            console.log(response);
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.statusText)
                else console.log("Todo mal");
        })
        .then( data => {
            let exists = false;
            data.forEach(item => {
                if (item.username == document.getElementById("nombre").value
                    && item.pass == document.getElementById("contrasena").value) {
                        localStorage.setItem("token", item.username);
                        localStorage.setItem("rol", item.rol);
                        location.href ="http://localhost/php/proyecto/paginaPpal.html";
                        exists = true;
                } 
            });

            if (!exists) {
                // let div = document.createElement("div");
                // div.id = "error";
                // let main = document.getElementsByTagName("main");
                // div.innerHTML = "No se ha encontrado ningun usuario, revise los datos";
                // main[0].append(div);
                alert("No se ha encontrado ningun usuario, revise los datos");
            }
        })
}