
let CheersModel = {
    initialCheer : "",
    firstCheerRoundOne : "WE ARE",
    firstCheerRoundTwo : "PENN STATE",
    secondCheerRoundOne : "THANK YOU",
    secondCheerRoundTwo : "YOU'RE WELCOME"
}

var cheerCount = 0

document.addEventListener('DOMContentLoaded', function() {
    console.log("adding event listener")
    var changeTextButton = document.getElementById("changeTextButton");
    var imageToChange = document.getElementById("mascotImage");
    var textToChange = document.getElementById("cheerText")

    changeTextButton.addEventListener('click', function() {
        if(cheerCount < 6) {
            if(cheerCount%2 == 0){
                textToChange.textContent = CheersModel.firstCheerRoundOne
                cheerCount = cheerCount + 1
                imageToChange.src = "assets/Mascot1.png"
                return
            }
            textToChange.textContent = CheersModel.firstCheerRoundTwo
            cheerCount = cheerCount + 1
            imageToChange.src = "assets/Mascot1Reversed.png"
            return
        } else {
            if(cheerCount%2 == 0){
                textToChange.textContent = CheersModel.secondCheerRoundOne
                cheerCount = cheerCount + 1
                imageToChange.src = "assets/Mascot2.png"
                return
            }
            textToChange.textContent = CheersModel.secondCheerRoundTwo
            cheerCount = 0
            imageToChange.src = "assets/Mascot2Reversed.png"
            return
        }

    })


})
