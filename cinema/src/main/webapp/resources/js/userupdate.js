document.getElementById("userPassword").addEventListener("keyup", validatePassword);
    document.getElementById("confirm-password").addEventListener("keyup", validatePassword);

    function validatePassword() {
        var password = document.getElementById("userPassword").value;
        var confirmPassword = document.getElementById("confirm-password").value;

        if (password === '' || confirmPassword === '') {
            document.getElementById("password-error-message").style.display = "none";
        } else if (password !== confirmPassword) {
            document.getElementById("password-error-message").style.display = "block";
        } else {
            document.getElementById("password-error-message").style.display = "none";
        }
    }