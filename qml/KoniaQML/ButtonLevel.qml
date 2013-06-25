//ButtonLevel.qml
import QtQuick 1.1

Rectangle {
    id: level
    border.color: "red"
    border.width: 2
    opacity: 1
    radius: 25
    width: 80
    height: 80


    property string textLevel
    Text {
        id: text_level
        anchors.centerIn: level
        //color: activePalette.buttonText
        text: textLevel
    }

    signal level_clicked()
    MouseArea {
        anchors.fill: level
        onClicked: {
            level_clicked()
        }

    }
}
