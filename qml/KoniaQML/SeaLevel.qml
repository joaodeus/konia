import QtQuick 1.1

Rectangle {
    id: sealevel
    width: 360
    height: 420

    /*Rectangle {
        id: background
        anchors.fill: parent
    //    color: "black"
    }*/

    //Sky
    Rectangle {
        id: sky
        width: parent.width
        height: parent.height * 0.1
        anchors.top: parent.top
        color: "aliceblue"


    }

    Rectangle {
        id: sea
        color: "blue"
        opacity: 1
        width: parent.width
        height: parent.height * 0.9
        anchors.bottom: parent.bottom
    }

    Boat {
        id: boat
        anchors.bottom: sea.top
        //anchors.horizontalCenter: parent.Center
    }
}
