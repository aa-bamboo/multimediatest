import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.Dialogs

import Qt.labs.platform //1.0
import Qt.labs.settings //1.1

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    header: ToolBar {
        Button {
            text: "Open media"
            onClicked: fileDialog.open()
        }
    }

    Item {
        id: container
        anchors.fill: parent
    }

    FileDialog {
        id: fileDialog
        onAccepted: {
            const Comp = Qt.createComponent("Preview.qml")

            if (Comp.status === Component.Ready) {
                const options = {
                    source: currentFile
                }

                const preview = Comp.createObject(container, options)

                preview.play()
            } else {
                console.log("Component not ready")
            }
        }
    }
}
