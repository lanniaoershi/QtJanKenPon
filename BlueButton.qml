import QtQuick 2.3
import "js/UIValue.js" as UI

Rectangle {
    id: button;

    property alias text: btnText.text;
    signal btnPressed;
    signal btnReleased;
    signal btnClicked;
    width: mainWindow.width/2;
    height: mainWindow.height/14;
    radius: UI.buttonRadius;
    color: UI.blueButtonReleasedColor;

    Text {
        id: btnText;
        font.pixelSize: UI.buttonTextSize;
        color: "white";
        anchors.centerIn: parent;
    }
    MouseArea {
        anchors.fill: parent;
        onPressed: {
            parent.color = UI.blueButtonPressedColor;
            button.btnPressed();
        }
        onReleased: {
            parent.color = UI.blueButtonReleasedColor;
            button.btnReleased();
        }
        onClicked: {
            button.btnClicked();
        }
    }
}
