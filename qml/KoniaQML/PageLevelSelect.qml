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
    signal level_2_clicked()
    signal level_3_clicked()
    signal level_quit()

    Grid {
        id: grid
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 20
        columns: 3
        spacing: 20


        ButtonLevel {
            id: level1
            textLevel: "Level 1"
            onLevel_clicked: level_1_clicked()
        }

        ButtonLevel {
            id: level2
            textLevel: "Level 2"
            onLevel_clicked: level_2_clicked()
        }

        ButtonLevel {
            id: level3
            textLevel: "Level 3"
            onLevel_clicked: level_3_clicked()
        }

        ButtonLevel {
            id: level4
            textLevel: "Back"
            onLevel_clicked: level_quit()
        }


    }

}
