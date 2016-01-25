import QtQuick 2.3
import "js/UIValue.js" as UI
import "js/JanKenPon.js" as JanKenPon

Item {
    id: root;
    width: UI.windowWidth;
    height: UI.windowHeight;
    property int animDuration: 600;
    property int robotThinkingDuration: 500;
    property int arrowAngle: 0;
    property string result:"";


    Image {
        id: playBoardImage;
        fillMode: Image.PreserveAspectCrop;
        source: "Images/play_board.jpg";
        anchors.fill: parent;
    }

    ParallelAnimation  {
        id: chooseAnimation;
        NumberAnimation {
            target:  myChoose
            property: "x"
            duration: 400;
            to: btnPaper.x;
        }
        NumberAnimation {
            target:  myChoose
            property: "y"
            duration: 400;
            to: btnPaper.y-200;
        }
    }
    MyButton {
        id: btnRock
        text: "Rock"
        width: 300;
        anchors.left: parent.left;
        anchors.margins: 50;
        anchors.bottomMargin: 300;
        anchors.bottom: parent.bottom;
        onBtnClicked: {
            JanKenPon.allRandom = false;
            randomArrow.visible = true;
            JanKenPon.newRound();
            myChoose.x = 2000;
            chooseAnimation.start();
            timer.start();
            myChooseText.text = btnRock.text;
            JanKenPon.gamePlayersList[3].value = "rock";
            winArrowForRobot1.visible = false;
            winArrowForRobot2.visible = false;
            winArrowForRobot3.visible = false;
            winArrowForUser.visible = false;
        }
    }
    MyButton {
        id: btnPaper
        text: "Paper"
        width: 300;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottomMargin: 300;
        anchors.bottom: parent.bottom;
        onBtnClicked: {
            JanKenPon.allRandom = false;
            randomArrow.visible = true;
            JanKenPon.newRound();
            myChoose.x = 2000;
            chooseAnimation.start();
            timer.start();
            myChooseText.text = btnPaper.text;
            JanKenPon.gamePlayersList[3].value = "paper";
            winArrowForRobot1.visible = false;
            winArrowForRobot2.visible = false;
            winArrowForRobot3.visible = false;
            winArrowForUser.visible = false;
        }
    }
    MyButton {
        id: btnScissors;
        text: "Scissors";
        width: 300;
        anchors.right: parent.right;
        anchors.margins: 50;
        anchors.bottomMargin: 300;
        anchors.bottom: parent.bottom;
        onBtnClicked: {
            JanKenPon.allRandom = false;
            randomArrow.visible = true;
            JanKenPon.newRound();
            myChoose.x = 2000;
            chooseAnimation.start();
            timer.start();
            myChooseText.text = btnScissors.text;
            JanKenPon.gamePlayersList[3].value = "scissors";
            winArrowForRobot1.visible = false;
            winArrowForRobot2.visible = false;
            winArrowForRobot3.visible = false;
            winArrowForUser.visible = false;
        }
    }

    Rectangle {
        id:myChoose;
        width: 300;
        height: mainWindow.height/14;
        color: "white";
        radius: UI.buttonRadius;
        x: 2000;
        y: btnPaper.y-200;
        Text {
            font.pixelSize: UI.buttonTextSize;
            anchors.centerIn: parent;
            id: myChooseText;
            text:""
        }
    }

    MyButton {
        id: btnRandom;
        text: "All Random";
        width: 600;
        anchors.left: parent.left;
        anchors.bottomMargin: 100;
        anchors.leftMargin: 150;
        anchors.bottom: parent.bottom;
        onBtnClicked: {
            chooseAnimation.start();
            randomArrow.visible = true;
            JanKenPon.newRound();
            timer.start();
            JanKenPon.allRandom = true;


            winArrowForRobot1.visible = false;
            winArrowForRobot2.visible = false;
            winArrowForRobot3.visible = false;
            winArrowForUser.visible = false;
        }
    }
    BlueButton {
        id: btnConfirm;
        text: "Confirm";
        width: 600;
        anchors.right: parent.right;
        anchors.bottomMargin: 100;
        anchors.rightMargin: 150;
        anchors.bottom: parent.bottom;
        onBtnClicked: {
            conFirmAnimation.start();
            timer.stop();
            randomArrow.visible = false;
            result = JanKenPon.judgeResult();
            console.log("result = "+result);

            winArrowForRobot1.visible = JanKenPon.setWinnerArrowVisible("Robot1");
            winArrowForRobot2.visible = JanKenPon.setWinnerArrowVisible("Robot2");
            winArrowForRobot3.visible = JanKenPon.setWinnerArrowVisible("Robot3");
            winArrowForUser.visible = JanKenPon.setWinnerArrowVisible("User");

        }
    }

    ParallelAnimation  {
        id: conFirmAnimation;

        NumberAnimation {
            target:  myChoose;
            property: "y"
            duration: 200;
            to: btnPaper.y-500;
        }
    }

    Rectangle{
        id: robot1;
        anchors.top: parent.top;
        anchors.margins: 50;
        anchors.horizontalCenter: parent.horizontalCenter;
        opacity: 0.5;
        Image {
            id: iamge1;
            source: "Images/Robot.png";
            x: parent.width/2 - iamge1.width/2;

        }
    }
    Rectangle{
        id: robot2;
        anchors.left: parent.left;
        anchors.margins: 150;
        y: parent.height/4;
        opacity: 0.5;
        Image {
            id: image2;
            source: "Images/Robot.png";
            anchors.left: parent.left;
        }
    }
    Rectangle{
        id: robot3;
        anchors.right: parent.right;
        anchors.margins: 150;
        y: parent.height/4;
        opacity: 0.5;
        Image {
            id: image3;
            source: "Images/Robot.png";
            anchors.right: parent.right;
        }
    }


    RobotChooseButton {
        id: robot1choose;

        color: "white";
        anchors.top: parent.top;
        anchors.topMargin: 350;
        anchors.horizontalCenter: parent.horizontalCenter;

    }
    RobotChooseButton {
        id: robot2choose;

        color: "white";
        anchors.left: parent.left;
        anchors.leftMargin: 100;
        y: robot2.y+300;
    }
    RobotChooseButton {
        id: robot3choose;

        color: "white";
        anchors.right: parent.right;
        anchors.rightMargin: 100;
        y: robot3.y+300;
    }
    SequentialAnimation{
        id: robotThinkingAnimation;
        ParallelAnimation  {
            NumberAnimation {
                target: robot1
                property: "opacity"
                duration: robotThinkingDuration
                to: 0.2;
                easing.type: Easing.InOutBack
            }
            NumberAnimation {
                target: robot2
                property: "opacity"
                duration: robotThinkingDuration
                to: 0.2;
                easing.type: Easing.InOutBack
            }
            NumberAnimation {
                target: robot3
                property: "opacity"
                duration: robotThinkingDuration
                to: 0.2;
                easing.type: Easing.InOutBack
            }
        }

        ParallelAnimation  {
            NumberAnimation {
                target: robot1
                property: "opacity"
                duration: robotThinkingDuration
                to: 1;
                easing.type: Easing.InOutBack
            }
            NumberAnimation {
                target: robot2
                property: "opacity"
                duration: robotThinkingDuration
                to: 1;
                easing.type: Easing.InOutBack
            }
            NumberAnimation {
                target: robot3
                property: "opacity"
                duration: robotThinkingDuration
                to: 1;
                easing.type: Easing.InOutBack
            }
        }
    }


    Image {
        visible: false;
        id:randomArrow;
        x: robot1.x-randomArrow.width/2;
        y: robot2.y + 300;
        source: "Images/arrow.png"
        transform: Rotation {
            id: winnerRotation
            origin.x: randomArrow.width/2
            origin.y: -100
            angle: arrowAngle;
            Behavior on angle {
                NumberAnimation {
                    easing.type: Easing.InCurve
                }
            }
        }
    }
    Rectangle{
        id: winnersArrowRec;
        x: robot1.x-randomArrow.width/2;
        y: robot2.y + 300;

        Arrow {
            visible: false;
            id: winArrowForUser;
            transform: Rotation {
                origin.x: randomArrow.width/2
                origin.y: -100
                angle: 0;
            }

        }
        Arrow {
            visible: false;
            id: winArrowForRobot1;
            transform: Rotation {
                origin.x: randomArrow.width/2
                origin.y: -100
                angle: 180;
            }
        }

        Arrow {
            visible: false;
            id: winArrowForRobot2;
            transform: Rotation {
                origin.x: randomArrow.width/2
                origin.y: -100
                angle: 90;
            }
        }



        Arrow {
            visible: false;
            id: winArrowForRobot3;
            transform: Rotation {
                origin.x: randomArrow.width/2
                origin.y: -100
                angle: 270;
            }
        }
    }

    Rectangle {
        id: gameResultText;
        x: robot1.x+(robot1.width-200)/2;
        y: randomArrow.y-200
        width:200;
        height:200;
        radius: 100;
        Text {
            anchors.centerIn: parent;
            text: result;
            color: "black";
        }
        color: "white";
    }

    Timer {
        id: timer;
        repeat: true;
        running: false;
        interval: 200;
        onTriggered: {
            robotThinkingAnimation.start();
            arrowAngle = JanKenPon.winnerAngle();
            JanKenPon.gamePlayersList[0].value = JanKenPon.robotRandom();
            JanKenPon.gamePlayersList[1].value = JanKenPon.robotRandom();
            JanKenPon.gamePlayersList[2].value = JanKenPon.robotRandom();
            robot1choose.text = JanKenPon.gamePlayersList[0].value;
            robot2choose.text = JanKenPon.gamePlayersList[1].value;
            robot3choose.text = JanKenPon.gamePlayersList[2].value;
            if (JanKenPon.allRandom) {
                JanKenPon.gamePlayersList[3].value = JanKenPon.robotRandom();
                myChooseText.text = JanKenPon.gamePlayersList[3].value;
            }



        }
    }
    Component.onCompleted: {
        JanKenPon.newRound();
        JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot1", JanKenPon.robotRandom()));
        JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot2", JanKenPon.robotRandom()));
        JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot3", JanKenPon.robotRandom()));
        JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("User", JanKenPon.robotRandom()));
    }

}
