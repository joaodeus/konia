import QtQuick 1.1

Image {
    id: sun
    x: 0
    y: 0
    width: 80
    height: 80
    source: "qrc:/images/images/sun.png"

   // property int show: 1
    signal sunClick()
    onSunClick: {
        console.log("sol clickado")
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent        
        onClicked: sunClick()
    }
}
