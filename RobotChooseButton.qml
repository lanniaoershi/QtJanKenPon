import QtQuick 2.3
import "js/UIValue.js" as UI
Rectangle {
    property alias text: robotChoose.text;
    width: 300;
    height: mainWindow.height/18;
    color: "white";
    radius: UI.buttonRadius;

    Text {
        id: robotChoose;
        font.pixelSize: UI.buttonTextSize;
        color: "black";
        text: "sleeping..."
        anchors.centerIn: parent;
    }
}
