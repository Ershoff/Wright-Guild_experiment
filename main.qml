import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "black"

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        onWheel: {
            lightness += wheel.angleDelta.y / 120;
        }
        property real lightness: 50
        property real hue: Math.round(360*mouseX/width)
        property real sat: Math.round(100*mouseY/height)
    }

    Rectangle {
        id: canvas
        width: 200
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: Qt.hsla(ma.hue / 360, ma.sat / 255, ma.lightness / 255, 1)

        Text {
            color: "black"
            anchors.centerIn: parent
            text: ma.hue + ' ' + ma.sat + ' ' + ma.lightness
            font.pointSize: 12
        }
    }
}



/*##^## Designer {
    D{i:2;anchors_height:100;anchors_width:200;anchors_x:220;anchors_y:190}
}
 ##^##*/
