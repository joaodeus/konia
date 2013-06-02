import QtQuick 1.1

Item {
    id: boat
    width: 88
    height: 96

    property alias drag: mousearea.drag

    Image {
        id: sailfishBoat
        source: "qrc:/images/images/jolla_boat.png"
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
    }

}
