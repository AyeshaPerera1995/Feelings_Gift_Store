/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//set image product
function readurl(input, id) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.getElementById(id);
            img.src = e.target.result;
        };

        reader.readAsDataURL(input.files[0]);
    }
}

