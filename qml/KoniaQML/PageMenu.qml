//PageMenu.qml
import QtQuick 1.1

Rectangle {
    id: root
    width: 360
    height: 420

    signal gameclick()


    Boat {
        id: boat
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }


    Column {
        id: columnbuttons
        spacing: 10
        height: parent.height
        width: parent.width / 2

        anchors.right: parent.right



        Button {
            id:startGameBtn
            text: "Start Game"
            anchors.topMargin: 10
            anchors.right: parent.right

            onButtonClick: gameclick()
        }

        Button {
            id:settingsGameBtn
            text: "Levels"
            anchors.right: parent.right
           // onButtonClick: gameclick()
        }

        Button {
            id: gameExit
            text: "Exit"
            anchors.right: parent.right
            onButtonClick: Qt.quit()
        }
    }



    property int showG: startGameBtn.show
}
