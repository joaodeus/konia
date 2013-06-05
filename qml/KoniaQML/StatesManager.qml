//StatesManager.qml
import QtQuick 1.1


//use this component to create different states and pages
// and associate each atate to each page

Item {
    id: root
    width: 360
    height: 420


    //property string activeState: "levelSelectPage"

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menuPage
                opacity: 1
                restoreEntryValues: true
            }
        },

        State {
            name: "game"
            PropertyChanges {
                target: gamePage
                opacity: 1
                //numberPhones: 5
                restoreEntryValues: true
            }

        },

        State {
            name: "levelSelect"
            PropertyChanges {
                target: levelSelectPage
                opacity: 1
                //numberPhones: 5
                restoreEntryValues: true
            }
        }
    ]


    PageMenu {
        id: menuPage
        anchors.fill: parent
        opacity: 0
        onGameclick: {
            root.state = "levelSelect"
           // gamePage.start()
        }

        onLevelSelect: {
            root.state = "levelSelect"
        }
    }


    PageGame {
        id: gamePage
        anchors.fill: parent
        opacity: 0
        onSunClick2: {
            root.state = "menu"
            console.log("sol clikado")
        }
    }


    PageLevelSelect {
        id: levelSelectPage
        anchors.fill: parent
        opacity: 0
        onLevel_1_clicked: {
            root.state = "game"
            gamePage.start()
        }

    }

}