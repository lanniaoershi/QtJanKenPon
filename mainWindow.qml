import QtQuick 2.3
import QtQuick.Controls 1.2
import QtSensors 5.3
import QtQuick.Window 2.0
import "js/UIValue.js" as UI
import "js/JanKenPon.js" as JanKenPon

ApplicationWindow {
    visible: true;
    title: qsTr("CRT game");
    id: mainWindow;
    property alias mainWindow: mainWindow;
    property double pixelDensityq;
    property variant play_board;
    width: UI.windowWidth;
    height: UI.windowHeight;
    Component.onCompleted: {
        pixelDensityq = Screen.logicalPixelDensity;
    }

    StackView {
        id: stack
        initialItem: rootView
        focus: true
        anchors.fill: parent
        Keys.onReleased: if (event.key === Qt.Key_Back && stack.depth > 1) {
                             stack.pop();
                             event.accepted = true;
                             console.log("back key pressed");
                         }
        Rectangle{
            id: rootView;
            anchors.fill: parent;
            Image {
                id: backgroundImage;
                fillMode: Image.PreserveAspectCrop;
                source: "Images/background.jpg";
                anchors.fill: parent;

            }

            Image {
                id: linkImage;
                fillMode: Image.PreserveAspectCrop;
                source: "Images/link.png";


                Behavior on x {
                    NumberAnimation { duration: 100 }
                }
                Behavior on y {
                    NumberAnimation { duration: 100 }
                }
            }



            Text {
                id: introText;
                text: "rock-paper-scissors game by Qt5.";
                anchors.centerIn: rootView;
                color: "lightgray";
                font.pixelSize: 50;
                objectName: "introText"
            }
            Text {
                id: emailText;
                objectName: "emailText"
                text: "<a href='mailto:wei.a.wei@tieto.com?subject=Qt5%20rock-paper-scissors game'>wei.a.wei@tieto.com</a>";
                anchors.top: introText.bottom;
                anchors.horizontalCenter: rootView.horizontalCenter;
                font.pixelSize: 50;
                color: "white";

            }

            MyButton {
                z: 2;
                id: btnStart;
                objectName: "btnStart";
                text: "Start Game";
                anchors.horizontalCenter: rootView.horizontalCenter;
                anchors.bottomMargin: 100;
                anchors.bottom: rootView.bottom;
                onBtnClicked: {
                    //            JanKenPon.gamePlayersList.length = 0;
                    //            JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot1", JanKenPon.robotRandom()));
                    //            JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("wei wei", "rock"));
                    //            emailText.text = JanKenPon.judgeResult();

                    //            JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot2", JanKenPon.robotRandom()));
                    //            JanKenPon.gamePlayersList.push(JanKenPon.createPlayer("Robot3", JanKenPon.robotRandom()));
                    //            emailText.text =
                    //            timer.start();

                }

                onBtnPressed:{
                    JanKenPon.newRound();
                    stack.push("qrc:/PlayBoard.qml");
                }

            }


            Accelerometer {
                id: accelerometer;
                active: true;
                dataRate: 20;
                onReadingChanged: {
                    var newX = linkImage.x - reading.x * pixelDensityq * 3;
                    var newY = linkImage.y + reading.y * pixelDensityq * 3;

                    if (newX + linkImage.width > mainWindow.width) {
                        newX = mainWindow.width - linkImage.width;
                    } else if (newX < 0) {
                        newX = 0;
                    }

                    if (newY + linkImage.height > mainWindow.height) {
                        newY = mainWindow.height - linkImage.height;
                    } else if (newY < 0) {
                        newY = 0;
                    }

                    linkImage.x = newX;
                    linkImage.y = newY;

                }
            }
        }
    }
}
