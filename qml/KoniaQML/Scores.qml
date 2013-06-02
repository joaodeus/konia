import QtQuick 1.1

Rectangle {
    id: score
    width: 45
    height: 25

    property string scoreText

    Text {
        id: text1
        anchors.centerIn: parent
        text: scoreText
        font.family: "Arial"
        font.bold: true
        color: "peru"
    }

    radius: 10
    border.width: 2
    border.color: "black"
}
