import QtQuick 1.1

Rectangle {
    id: phone
    width: 24
    height: 36
    color: "green"

    Rectangle {
        id: phoneMiddle
        width: 18
        height: 30
        //anchors.centerIn: phone.Center
        anchors.horizontalCenter: phone.horizontalCenter
        anchors.verticalCenter: phone.verticalCenter
        color: "white"

        Rectangle {
            id: phoneCenter
            width: 14
            height: 24
            anchors.horizontalCenter: phoneMiddle.horizontalCenter
            anchors.verticalCenter: phoneMiddle.verticalCenter
            color: "white"
            border.color: "black"

            Text {
                id: phoneText
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: "w"
            }

        }
    }


    property bool isMeego: true

    property string imageBackground: "qrc:/images/images/jolla_phone_M_Green.png"
    /*Image {
        id: phoneImage
        source: imageBackground

    }*/

    property int finalPosition_x
    property int finalPosition_y
    property bool falling: false
    property int numberLoops: 5
    property int animationDuration: 1000

    property ParallelAnimation animation
    ParallelAnimation {
        id: phonefalling
        running: falling
        NumberAnimation { target: phone; property: "x";
            from: x;  to: finalPosition_x ;
            loops: numberLoops; duration: animationDuration }
        //loops: Animation.Infinite; duration: 1000 }
        NumberAnimation { target: phone; property: "y";
            from: y; to: finalPosition_y;
             //loops: Animation.Infinite; duration: 1000
            loops: numberLoops; duration: animationDuration
            easing {
                type: Easing.InCubic
            }
        }
    }

}
