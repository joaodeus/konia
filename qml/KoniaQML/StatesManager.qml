//StatesManager.qml
import QtQuick 1.1


//use this component to create different states and pages
// and associate each atate to each page

Item {
    id: root
    width: 360
    height: 420

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
                restoreEntryValues: true
            }
        },

        State {
            name: "levelSelect"
            PropertyChanges {
                target: levelSelectPage
                opacity: 1
                restoreEntryValues: true
            }
        },


        State {
            name: "state_level2"
            PropertyChanges {
                target: factoryLevel
                opacity: 1
                restoreEntryValues: true
            }
        },        

        State {
            name: "state_level3_sea"
            PropertyChanges {
                target: seaLevel
                opacity: 1
                restoreEntryValues: true
            }
        },


        State {
            name: "aboutState"
            PropertyChanges {
                target: about
                opacity: 1
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

        onAbout: root.state = "aboutState"
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
        onLevel_2_clicked: root.state = "state_level2"
        onLevel_3_clicked: root.state = "state_level3_sea"
        onLevel_quit: root.state = "menu"
    }

    FactoryPhoneLevel {
        id: factoryLevel
        opacity: 0
        onFactoryClicked: root.state = "levelSelect"
    }

    SeaLevel {
        id: seaLevel
        opacity: 0
    }

    PageAbout {
        id: about
        opacity: 0
        onAboutClicked: root.state = "menu"
    }



}
