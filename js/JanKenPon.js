var JanKenPon = {
    paper: "paper",
    rock: "rock",
    scissors: "scissors"
};

var paperList = [];
var rockList = [];
var scissorsList = [];

var gamePlayersList = [];
var gameWinnersList = [];
var gameLosersList = [];
var allRandom = false;

var newRound = function(){
    paperList.length = 0;
    rockList.length = 0;
    scissorsList.length = 0;
//    gamePlayersList.length = 0;
    gameWinnersList.length = 0;
    gameLosersList.length = 0;
}

var judgeResult = function() {

    var playersCount = gamePlayersList.length;
    for (var i=0; i<playersCount; i++) {
        var player = gamePlayersList[i];
        console.log("player:"+player.name+" value:"+player.value);
        if (JanKenPon.paper === player.value) {
            paperList.push(player.name);
            console.log("paperList"+paperList);
        } else if (JanKenPon.rock === player.value) {
            rockList.push(player.name);
            console.log("rockList"+rockList);
        } else if (JanKenPon.scissors === player.value){
            scissorsList.push(player.name);
            console.log("scissorsList"+scissorsList);
        }
    }

    var paperCount = paperList.length;
    var rockCount = rockList.length;
    var scissorsCount = scissorsList.length;

    if (paperCount * rockCount * scissorsCount != 0) {
        return "Draw";
    }

    if (paperCount === playersCount ||
            rockCount === playersCount ||
            scissorsCount === playersCount){
        return "Draw";
    }

    if (paperCount === 0){
        gameWinnersList = rockList.concat();
        gameLosersList = scissorsList.concat();
    }
    if (rockCount === 0){
        gameWinnersList = scissorsList.concat();
        gameLosersList = paperList.concat();
    }
    if (scissorsCount === 0){
        gameWinnersList = paperList.concat();
        gameLosersList = rockList.concat();
    }
    console.log("gameWinnersList:"+gameWinnersList);
    console.log("gameWinnersList length = :"+gameWinnersList.length);
    console.log("gameLosersList:"+gameLosersList);
    return "Winner";

}

var createPlayer = function(name, value){
    var playerObj = {
        name: "",
        value: ""};
    playerObj.name = name;
    playerObj.value = value;
    return playerObj;
}

var robotRandom = function(){

    var computerChoice = Math.random();

    if (0 <= computerChoice && computerChoice <= 0.33){
        computerChoice = "rock";
    } else if (0.34 <= computerChoice && computerChoice <= 0.66){
        computerChoice = "paper";
    } else {
        computerChoice = "scissors";
    }
    return computerChoice;
}
var winnerAngle = function(){
    var winnerAngle = Math.random();

    if (0 <= winnerAngle && winnerAngle <= 0.24){
        winnerAngle = 0;
    } else if (0.25 <= winnerAngle && winnerAngle <= 0.49){
        winnerAngle = 90;
    } else if (0.50 <= winnerAngle && winnerAngle <= 0.74){
        winnerAngle = 180;
    } else {
        winnerAngle = 270;
    }

    return winnerAngle;
}


var setWinnerArrowVisible = function (gamer) {
    var i = gameWinnersList.length;
    console.log("i = "+i);
    while (i--) {
        console.log("how many?");
        if (gameWinnersList[i] === gamer) {
            return true;
        }
    }
    return false;
}


