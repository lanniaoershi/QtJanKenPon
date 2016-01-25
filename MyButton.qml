import QtQuick 2.3
import "js/UIValue.js" as UI
import "js/JanKenPon.js" as JanKenPon

Rectangle {
    id: button;

    property alias text: btnText.text;
    signal btnPressed;
    signal btnReleased;
    signal btnClicked;
    width: mainWindow.width/2;
    height: mainWindow.height/14;
    radius: UI.buttonRadius;
    color: UI.buttonReleasedColor;

    Text {
        id: btnText;
        font.pixelSize: UI.buttonTextSize;
        color: "white";
        anchors.centerIn: parent;
    }
    MouseArea {
        anchors.fill: parent;
        onPressed: {
            parent.color = UI.buttonPressedColor;
            button.btnPressed();
        }
        onReleased: {
            parent.color = UI.buttonReleasedColor;
            button.btnReleased();
        }
        onClicked: {
            button.btnClicked();
//            JanKenPon.newRound();
        }
    }

}
