// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id: root
    width: 360
    height: 420

    MouseArea {
        anchors.fill: parent
    }

    StatesManager {
        id: pagepanel
        state: "menu"
        width: parent.width
        height: parent.height
    }


    onWidthChanged: {
        console.log("Rectangle width: ", width)
       // boat.pos.x: 0
    }
    onHeightChanged: {
        console.log("Rectangle height: ", height)
      //  boat.pos.y: height
    }
}

