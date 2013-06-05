import QtQuick 1.1

Rectangle {
    id: root
    width: 360
    height: 420

    signal levelSelectClick()
    MouseArea {
        anchors.fill: parent
        onClicked: {
            levelSelectClick()
        }
    }


    signal level_1_clicked()

    Grid {
        id: grid
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 20
        columns: 3
        spacing: 20


        property int w: 80
        property int h: 80



        Rectangle {
            id: level_1
            color: "white"
            border.color: "red"
            border.width: 2
            opacity: 1
            radius: 25
            width: grid.w; height: grid.h


            Text {
                id: text_level_1
                anchors.centerIn: level_1
                //color: activePalette.buttonText
                text: "Level 1"
            }

            MouseArea {
                anchors.fill: level_1
                onClicked: {
                    console.log("level 1")
                    level_1_clicked()
                }

            }
        }


        Rectangle { color: "green"; width: grid.w; height: grid.h }
        Rectangle { color: "blue"; width: grid.w; height: grid.h }
        Rectangle { color: "cyan"; width: grid.w; height: grid.h }
        Rectangle { color: "magenta"; width: grid.w; height: grid.h }
        Rectangle { color: "yellow"; width: grid.w; height: grid.h }



     }

}
