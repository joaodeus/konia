//FactoryPhoneLevel.qml
import QtQuick 1.1
//import QtMultimediaKit 1.1


Rectangle {
    id: factoryLevel
    width: 360
    height: 420



    Rectangle {
        id: treadmill       
        width: parent.width
        height: parent.width / 3.7
        anchors.bottom: parent.bottom
        Image {
            id: factory
            anchors.fill: parent
            source: "qrc:/images/images/treadmill.png"
        }
    }

    signal factoryClicked()
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        //onClicked:  { playMusic.play() }
        onClicked: factoryClicked()   
    }

    /*
    Audio {
        id: playMusic
        //source: "music.wav"
        source: "qrc:/sound/sound/s1.wav"
    }

    MouseArea {
        id: playArea
        anchors.fill: parent
        onPressed:  { playMusic.play() }
    }*/
}
