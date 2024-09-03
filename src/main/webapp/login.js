document.addEventListener("DOMContentLoaded", function() {
            const signup = document.getElementById("signup_form");
            const login = document.getElementById("login_form");
            const loinswitch = document.getElementById("loinswitch");

            function toggleSignup() {
                if (signup.style.display === "none") {
                    signup.style.display = "flex";
                    login.style.display = "none";
                    loinswitch.querySelector('p').innerHTML = "Have an account ?";
                    loinswitch.querySelector('a').innerHTML = "Login";
                } else {
                    login.style.display = "flex";
                    signup.style.display = "none";
                    loinswitch.querySelector('p').innerHTML = "Don't have an account ?";
                    loinswitch.querySelector('a').innerHTML = "Register";
                }
            }

            document.getElementById("regBtn").addEventListener("click", toggleSignup);
            
            window.onload = (event) => {
                console.log("page is fully loaded");
                toggleSignup();
            };           
});
