//Random Food ID
function FoodIDGenerate() {
    var code = 'OD';
    var result = '';
    var characters = '0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < 10; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    document.getElementById('f_id').value = code + result;
}