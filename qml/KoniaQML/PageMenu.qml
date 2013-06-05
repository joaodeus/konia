//PageMenu.qml
import QtQuick 1.1

Rectangle {
    id: root
    width: 360
    height: 420



    Boat {
        id: boat
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }


    signal gameclick()
    signal levelSelect()

    Row {
        id: columnbuttons
        spacing: 20
        height: parent.height / 2
      //  width: parent.width
        anchors.bottom: parent.bottom
        //anchors.left: parent.left
        //anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: columnbuttons.spacing
        anchors.bottomMargin: columnbuttons.spacing

        Button {
            id:startGameBtn
            text: "Start Game"
           // anchors.leftMargin: 12
            anchors.bottom: parent.bottom
            onButtonClick: gameclick()
        }

        /*Button {
            id:settingsGameBtn
            text: "Levels"
            anchors.bottom: parent.bottom
            onButtonClick: levelSelect()
        }*/

        Button {
            id: gameExit
            text: "Exit"
            anchors.bottom: parent.bottom
            onButtonClick: Qt.quit()
        }
    }



    //property int showG: startGameBtn.show
}
