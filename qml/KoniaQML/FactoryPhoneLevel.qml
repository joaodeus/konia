import QtQuick 1.1

Rectangle {
    id: factoryLevel
    width: 360
    height: 420


    Rectangle {
        id: treadmill
        width: parent.width
        height: parent.height

        anchors.bottom: parent.bottom
        anchors.top: parent.height / 4
    }
}
