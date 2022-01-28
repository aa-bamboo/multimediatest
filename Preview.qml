import QtQuick
import QtMultimedia

Rectangle {
    anchors.fill: parent
    color: "black"

    property alias source: player.source

    function play() {
        player.play()
    }

    MediaPlayer {
        id: player
        videoOutput: videoOutput
        audioOutput: audioOutput
    }

    AudioOutput {
        id: audioOutput
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        visible: player.hasVideo
    }
}
