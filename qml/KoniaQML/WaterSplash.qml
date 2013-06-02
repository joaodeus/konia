//WaterSplash.qml
import QtQuick 1.1
import Qt.labs.particles 1.0

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
