import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

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
