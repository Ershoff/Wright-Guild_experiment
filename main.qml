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
        onPositionChanged: canvas.requestPaint()
    }

    Canvas {
        id: canvas
        width: 200
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
//        color: "red"

        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "hsl("+Math.round(360*ma.mouseX/ma.width)+"," + Math.round(100*ma.mouseY/ma.height) +"%, 30%)";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
        }

        Text {
            color: "black"
            anchors.centerIn: parent
            text: Math.round(360*ma.mouseX/ma.width) +
                  ' ' + Math.round(100*ma.mouseY/ma.height)
            font.pointSize: 12
        }
    }
}



/*##^## Designer {
    D{i:2;anchors_height:100;anchors_width:200;anchors_x:220;anchors_y:190}
}
 ##^##*/
