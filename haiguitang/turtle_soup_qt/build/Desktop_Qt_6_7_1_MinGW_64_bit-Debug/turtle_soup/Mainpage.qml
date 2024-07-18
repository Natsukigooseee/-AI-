import QtQuick

Item {
    width: 400
    height: 400

    Rectangle {
        width: 200
        height: 200
        color: "lightblue"
        radius: 10
        anchors.centerIn: parent

        Text {
            text: "首页"
            anchors.centerIn: parent
            font.pixelSize: 24
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stackView.push(page2Component.createObject())
            }
        }
    }
}
