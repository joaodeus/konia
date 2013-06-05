import QtQuick 1.1

Rectangle {
    id: button
    width: 100
    height: 62
    border.color: "aqua"
    radius: 25

    property string text: "Button"
    property int show: 1

    Text {
        id: buttonLabel
        anchors.centerIn: button
        //color: activePalette.buttonText
        text: button.text
    }

    signal buttonClick()
    onButtonClick: {
        //console.log("botao clickado")
    }

    MouseArea {
             id: mouseArea
             anchors.fill: parent
             onClicked: buttonClick()
         }
}
