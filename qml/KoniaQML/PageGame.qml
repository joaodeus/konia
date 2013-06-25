//PageGame.qml
import QtQuick 1.1
import Qt.labs.particles 1.0
//import Qt.multimedia 1.0
//import QtMultimediaKit 1.2

Rectangle {
    id: game
    width: 360
    height: 420

  //  color: "darkblue"
   // ColorAnimation {from: "white"; to: "black"; duration: 6000; running: true }

    // flying bird
    AnimatedImage {
        id: bird
        x:50
        y:80
        z:1
        width: 25
        height: 25
        source: "qrc:/images/images/bird.gif"
        property bool flying: false
        PropertyAnimation  {
            id: animation
            target: bird; property: "x";
            from: 0 ;  to: 2*game.width ; running: bird.flying
            loops: Animation.Infinite; duration: 10000
        }
    }



    // jumping dolphin
    AnimatedImage {
        id: dolphin
        x: finalPositionX()
        y: finalPositionY()-dolphin.width
        z:1
        width: 80
        height: width*142/212
        source: "qrc:/images/images/dolphin.gif"
    }

    // jumping dolphin
    AnimatedImage {
        id: ligthning
        x: 0
        y: 0
        z: -2
        width: parent.width
        height: parent.height
        source: "qrc:/images/images/lightningstorm.gif"
    }




   //Sea
    Rectangle {
        id: sea
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height * 0.35
        color: "#B9EEFA"
    }

    // beach image
    Image {
        id: beach
        width: 188/2
        height: 256/2
        anchors.left: parent.left
        anchors.bottom: sea.top
        source: "qrc:/images/images/praia1.png"
    }

    //another beach image
    Image {
        id: beach2
        width: 128
        height: 128
        anchors.right: parent.right
        anchors.bottom: sea.top
        source: "qrc:/images/images/praia2.png"
    }

    //Plataform
    Image {
        id: plataform
        anchors.bottom: sea.top
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/images/images/plataform.png"
    }

    //Waves above the sea
    Image {
        id: waves
        width: parent.width
        anchors.bottom: sea.top
        source: "qrc:/images/images/waves.png"
    }


    signal sunClick2()
    Sun {
        id: sun
        anchors.right: parent.right
        anchors.top: parent.top


        onSunClick: {
            stop()
            sunClick2()
        }

        /*gradient: Gradient {
            GradientStop {position: 0; color:"white"}
            GradientStop {position: 0.5; color:"yellow"}
            GradientStop {position: 1; color:"white"}
        }*/
    }

    //update boat and dolphin position, and bird flying distance, when resizing window
    onWidthChanged: {
        //console.log("Rectangle width: ", width)
        boat.pos.x  = 0
        bird.flying = false
        bird.flying = true
        dolphin.x   = finalPositionX()
    }    
    onHeightChanged: {
        //console.log("Rectangle height: ", height)
        boat.pos.y  = height-boat.height
        dolphin.y   = finalPositionY()
    }

 /*   MouseArea {
        anchors.fill: parent
        drag.target: boat
        drag.minimumY: parent.height - boat.height - sea.height
        drag.maximumY: parent.height - boat.height
        drag.minimumX: 0
        drag.maximumX: parent.width - boat.width

    }*/



    ////////////////////////////////////////////////////////////////////

    // scores
    Scores {
        id: scoresboard
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 3
        anchors.leftMargin: 3
        scoreText: timerteste.score
        //anchors.horizontalCenter: parent.horizontalCenter
      //  x: 50
        //y: 50
        //anchors.verticalCenter:
    }


    // splash on water when phones fall
    Particles {
        id: waterSplash
        width: 1
        height: 1
        x: 120
        y: 300
        source: "qrc:/images/images/water_splash.png"
        lifeSpan: 200
        count: 20
        angle: 270
        angleDeviation: 80
        velocity: 50
        velocityDeviation: 30
        emissionRate: 20
        ParticleMotionGravity {
            yattractor: 1000
            xattractor: 0
            acceleration: 25
        }
    }



    // the Phone !!!
    PhoneMeego {
        id: phoneM       
        x: initialPositionX()//game.width / 2
        y: initialPositionY()//game.height - sea.height - plataform.height //50
        animationDuration: 1500
        finalPosition_x: finalPositionX()
        finalPosition_y: finalPositionY()
        falling: false
        numberLoops: 1
    }


    MouseArea {
        //anchors.fill: parent
        anchors.top: sun.bottom
        anchors. bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        drag.target: boat
        drag.minimumY: parent.height - boat.height - sea.height
        drag.maximumY: parent.height - boat.height
        drag.minimumX: 0
        drag.maximumX: parent.width - boat.width

    }


    //boat
    Boat {
        id:boat
        width: 88
        height: 96
        x: 0
        y: parent.height-boat.height

        drag.minimumY: parent.height - boat.height - sea.height
        drag.maximumY: parent.height - boat.height
        drag.minimumX: 0
        drag.maximumX: parent.width - boat.width
        drag.target: boat
        //onXChanged: console.log("x =", x)
        //onYChanged: console.log("y =", y)
    }




    property int gameDuration: 60000
    property int points: 0
    property int gameDurationCount: 0
    property bool gameRunning: false


    // stop the level
    function stop(){
        points = 0
        gameDurationCount = 0
        gameRunning = false
        phoneM.falling = false
        phoneM.x = phoneM.finalPosition_x = -50
        phoneM.x = phoneM.finalPosition_y = -50

    }

    // start the level
    function start(){
        points = 0
        gameDurationCount = 0
        gameRunning = true
        phoneM.falling = true
        timerteste.score = "0"
    }


    Timer {
        id: timerteste
        interval: phoneM.animationDuration; running: gameRunning; repeat: gameRunning
        //property string score: scoresboard.scoreText
        property string score: "0"


        onTriggered: {            
            gameDurationCount = gameDurationCount + phoneM.animationDuration            
            if (gameDurationCount > gameDuration)
            {
               gameRunning = false
                //stop()
                //sunClick2()
            }



            bird.flying = true
           // dolphin.x   = finalPositionX()
           // dolphin.y   = finalPositionY()

            //check for colisions between the boat and the the falling phones
            if (checkColision(phoneM.finalPosition_x+phoneM.width/2, phoneM.finalPosition_y+phoneM.height/2,
                              boat.x+boat.width/2,boat.y+boat.height/2))
            {
                if (phoneM.isMeego)                
                    points = points+10
                else                
                    points = points-5
            }
            else
            {
                waterSplash.lifeSpan = 500; waterSplash.count = 20; waterSplash.emissionRate = 20
            }

            //We will make it 70% chances of being a Meego Phone, 30% being a W Phone
            var phonecolor=Math.floor(Math.random()*5)
            if (Math.random() > 0.3)
            {
                phoneM.isMeego = true
                if (phonecolor == 0)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M.png"
                else if (phonecolor == 1)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M_Black.png"
                else if (phonecolor == 2)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M_Blue.png"
                else if (phonecolor == 3)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M_Green.png"
                else if (phonecolor == 4)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M_Orange.png"
                else
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_M_Yellow.png"
            }
            else
            {                
                phoneM.isMeego = false
                if (phonecolor == 0)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W.png"
                else if (phonecolor == 1)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W_Black.png"
                else if (phonecolor == 2)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W_Blue.png"
                else if (phonecolor == 3)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W_Green.png"
                else if (phonecolor == 4)
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W_Orange.png"
                else
                    phoneM.imageBackground = "qrc:/images/images/jolla_phone_W_Yellow.png"
            }

            phoneM.x = initialPositionX()//game.width / 2
            phoneM.y = initialPositionY()//50
            phoneM.finalPosition_x = finalPositionX()// Math.random()*parent.width
            phoneM.finalPosition_y = finalPositionY() //game.height-sea.height + Math.random()*sea.height//280+Math.random()*100

            waterSplash.x = phoneM.finalPosition_x
            waterSplash.y = phoneM.finalPosition_y

            //phone restart falling
            phoneM.falling = false
            phoneM.falling = true

            score = points.toString()
          //  console.log(newPhone(date1))
        }   
    }


    function checkColision(x1, y1, x2, y2)
    {
        //console.log(  Math.sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)  ) )
        var dist = Math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
        console.log(dist)

        if (dist < 10) {
            return true
        }
        else {
            return false
        }
        // Math.sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)  )
    }



    function finalPositionX (){
        return Math.random()*parent.width
    }

    function finalPositionY (){
        return game.height-sea.height + Math.random()*sea.height
    }

    function initialPositionX(){
        return game.width/2 - phoneM.width/2
        //return 0
    }

    function initialPositionY(){
        return game.height - sea.height - plataform.height + phoneM.height
    }




}

