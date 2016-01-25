import QtQuick 2.3
import "js/UIValue.js" as UI

Image {
    property alias winnerArrow: winnerArrow;
    property alias winnerRotation: winnerRotation;
    visible: true;
    id: winnerArrow;
    source: "Images/arrow.png"
    transform: Rotation {
        id: winnerRotation
        angle: 0;
        Behavior on angle {
            NumberAnimation {
                easing.type: Easing.InCurve
            }
        }
    }
}
