// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id: root
    width: 360
    height: 420

    MouseArea {
        anchors.fill: parent
    }

    function soma(a, b){
        return a+b
    }




    PagePanel {
        id: pagepanel
        state: "menu"
        width: parent.width
        height: parent.height
    }

    /*
    PageGame {
        id: game
        anchors.fill: parent
        //opacity: 1
        //opacity: game.showGamePage
    }

    PageMenu {
        id: menu
        anchors.fill: parent
        //opacity: 1
        //onGameclick: root.state = "pageGame"
        opacity: menu.showG

        //if (menu.showG)
          //  opacity: 0
        //else
          //  opacity: 1
    }*/




    onWidthChanged: {
        console.log("Rectangle width: ", width)
       // boat.pos.x: 0
    }
    onHeightChanged: {
        console.log("Rectangle height: ", height)
      //  boat.pos.y: height
    }
}

