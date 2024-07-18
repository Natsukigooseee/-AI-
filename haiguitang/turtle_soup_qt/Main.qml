import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 500
    height: 600

    flags: Qt.Window | Qt.MSWindowsFixedSizeDialogHint

    visible: true
    title: "海龟汤游戏"

    // 定义夜间/日间模式切换
    property bool darkMode: false

    // 定义主页组件
    Rectangle {
        id: mainPage
        width: parent.width
        height: parent.height
        color: darkMode ? "#2E2E2E" : "#77CFFF"

        Text {
            id: name
            text: "海龟汤游戏"
            font.bold: true
            font.family: "宋体"
            font.pointSize: 46
            anchors.horizontalCenter: parent.horizontalCenter
            y: 140
            color: darkMode ? "white" : "white" // 首页字体颜色为白色
        }

        Button {
            width: 250
            height: 50
            background: Rectangle {
                anchors.fill: parent
                color: darkMode ? "#7F7F7F" : "#1DA4FF"
                radius: 10
            }

            Text {
                text: "游戏规则"
                font.pointSize: 16
                anchors.centerIn: parent // 居中显示文本
                color: darkMode ? "white" : "black"
            }
            y:270
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: stackView.push(gameRulesComponent.createObject()) // 推入开始游戏页面组件
            anchors.verticalCenterOffset: 100 // 垂直偏移量
        }


        Button {
            width: 250
            height: 50
            background: Rectangle {
                anchors.fill: parent
                color: darkMode ? "#7F7F7F" : "#1DA4FF"
                radius: 10
            }

            Text {
                text: "开始游戏"
                font.pointSize: 16
                anchors.centerIn: parent // 居中显示文本
                color: darkMode ? "white" : "black"
            }
            y:340
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: stackView.push(startGameComponent.createObject()) // 推入开始游戏页面组件
            anchors.verticalCenterOffset: 100 // 垂直偏移量
        }

        Button {
            width: 250
            height: 50
            background: Rectangle {
                anchors.fill: parent
                color: darkMode ? "#7F7F7F" : "#1DA4FF"
                radius: 10
            }

            Text {
                text: "制作游戏成员名单"
                font.pointSize: 16
                anchors.centerIn: parent // 居中显示文本
                color: darkMode ? "white" : "black"
            }
            y:410
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: stackView.push(membersListComponent.createObject()) // 推入开始游戏页面组件
            anchors.verticalCenterOffset: 100 // 垂直偏移量
        }

        // 退出游戏按钮
        Button {
            width: 250
            height: 50
            background: Rectangle {
                anchors.fill: parent
                color: darkMode ? "#7F7F7F" : "#FF7C91"
                radius: 10
            }

            Text {
                text: "退出游戏"
                font.pointSize: 16
                anchors.centerIn: parent // 居中显示文本
                color: darkMode ? "white" : "black"
            }
            y:480
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: Qt.quit()
            anchors.verticalCenterOffset: 100
        }
    }

    // 定义游戏规则页面组件
    Component {
        id: gameRulesComponent
        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                width: mainPage.width
                height: mainPage.height
                color: darkMode ? "#2E2E2E" : "#77CFFF"
            }


            Rectangle {
                width: 400
                height: 400
                color: darkMode ? "#2E2E2E" : "lightgreen"
                radius: 10
                anchors.centerIn: parent

                Text {
                    width: parent.width * 0.8
                    wrapMode: Text.Wrap
                    text: "     海龟汤游戏是一种推理游戏，其玩法大致如下：出题者：给出一个不完整的故事（汤面），这个故事中通常包含一些难以直接理解的元素或情节。答题者：通过“xxx是yyyy吗”的形式提问来试图还原故事的完整内容（汤底）。答题者可以提出任何问题，而出题者只能回答“是”、“不是”或“与此无关”来提供线索。目标：答题者需要通过不断提问和收集线索，最终揭示出故事的完整内容和背后的真相。"
                    anchors.centerIn: parent
                    font.family: "宋体"
                    font.pixelSize: 17
                    lineHeight: 1.5
                    color: darkMode ? "#DDDDDD" : "black"
                }

                Button {
                    width: 80
                    height: 18
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "white"
                        radius: 10
                    }
                    Text {
                        text: "返回"
                        font.pixelSize: 12
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                        }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                        topMargin: 20
                    }
                    onClicked: {
                        stackView.pop()
                    }
                }
            }
        }
    }

    // 定义开始游戏页面组件
    Component {
        id: startGameComponent
        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                width: mainPage.width
                height: mainPage.height
                color: darkMode ? "#2E2E2E" : "#77CFFF"
            }

            Rectangle {
                width: 400
                height: 400
                color: darkMode ? "#2E2E2E" : "lightblue"
                radius: 10
                anchors.centerIn: parent

                Text {
                    text: "选择模式"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 36
                    font.bold: true
                    y: parent.y - 60
                    color: darkMode ? "white" : "black"
                }

                Button {
                    width: 250
                    height: 50
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "#1DA4FF"
                        radius: 10
                    }
                    Text {
                        text: "模式1：AI出题，玩家猜答案"
                        font.pixelSize: 18
                        anchors.centerIn: parent // 居中显示文本
                        color: darkMode ? "white" : "black"
                        }
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + 20
                    onClicked: stackView.push(mode1Component.createObject())
                }

                Button {
                    width: 250
                    height: 50
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "#1DA4FF"
                        radius: 10
                    }
                    Text {
                        text: "模式2：玩家出题，AI猜答案"
                        font.pixelSize: 18
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                        }
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + 100
                    onClicked: stackView.push(mode2Component.createObject())
                }

                Button {
                    width: 250
                    height: 50
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "#1DA4FF"
                        radius: 10
                    }
                    Text {
                        text: "敬请期待……"
                        font.pixelSize: 18
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                        }
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y + 180
                }

                Button {
                    width: 80
                    height: 18
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "white"
                        radius: 10
                    }
                    Text {
                        text: "返回"
                        font.pixelSize: 12
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                        }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                        topMargin: 20
                    }
                    onClicked: {
                        stackView.pop()
                    }
                }
            }
        }
    }

    // 定义制作游戏成员名单页面组件
    Component {
        id: membersListComponent
        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                width: mainPage.width
                height: mainPage.height
                color: darkMode ? "#2E2E2E" : "#77CFFF"
            }

            Rectangle {
                width: 400
                height: 400
                color: darkMode ? "#2E2E2E" : "#FFD2F0"
                radius: 10
                anchors.centerIn: parent

                Text {
                    text: "组长：王驰宇\n组员：张琪暄、田佳慧、罗月\n指导：余容山老师、梅龙飞助教"
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.bold: true
                    lineHeight: 1.75
                    color: darkMode ? "#DDDDDD" : "black"
                }

                Button {
                    width: 80
                    height: 18
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "white"
                        radius: 10
                    }
                    Text {
                        text: "返回"
                        font.pixelSize: 12
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                        }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                        topMargin: 20
                    }
                    onClicked: {
                        stackView.pop()
                    }
                }
            }
        }
    }

    // 定义模式1页面组件
    Component {
        id: mode1Component

        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                width: mainPage.width
                height: mainPage.height
                color: darkMode ? "#2E2E2E" : "lightyellow"
                Column {
                    anchors.fill: parent

                    ListView {
                        id: chatListView
                        width: parent.width
                        height: parent.height - 120 // Adjusted height for input area and return button
                        model: chatModel
                        delegate: Item {
                            width: parent.width
                            height: 40
                            Text {
                                text: model.message
                                font.pixelSize: 18
                                color: darkMode ? "white" : "black"
                            }
                        }
                    }

                    Row {
                        width: parent.width
                        height: 60 // Increased height for input area and return button
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: 500
                        spacing: 10

                        TextField {
                            id: messageInput
                            width: parent.width - 100
                            placeholderText: "输入消息..."
                            font.pixelSize: 18
                        }

                        Button {
                            text: "发送"
                            width: 80
                            onClicked: {
                                if (messageInput.text !== "") {
                                    chatModel.append({ message: messageInput.text })
                                    messageInput.text = ""
                                    chatListView.positionViewAtEnd()
                                }
                            }
                        }
                    }

                    Button {
                        width: 80
                        height: 30 // Adjusted button height
                        background: Rectangle {
                            anchors.fill: parent
                            color: darkMode ? "#7F7F7F" : "white"
                            radius: 10
                        }
                        Text {
                            text: "返回"
                            font.pixelSize: 14 // Adjusted text size
                            anchors.centerIn: parent
                            color: darkMode ? "white" : "black"
                        }
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            bottom: parent.bottom // Positioned at the bottom of the parent
                            bottomMargin: 20 // Margin from the bottom
                        }
                        onClicked: {
                            stackView.pop()
                        }
                    }
                }
            }

            ListModel {
                id: chatModel
            }
        }
    }



    // 定义模式2页面组件
    Component {
        id: mode2Component
        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                width: mainPage.width
                height: mainPage.height
                color: darkMode ? "#2E2E2E" : "lightpink"
            }

            Rectangle {
                width: 400
                height: 400
                color: darkMode ? "#2E2E2E" : "lightpink"
                radius: 10
                anchors.centerIn: parent

                Text {
                    text: "模式2：玩家出题，AI猜答案"
                    anchors.centerIn: parent
                    font.pixelSize: 24
                    color: darkMode ? "#DDDDDD" : "black"
                }

                Button {
                    width: 80
                    height: 18
                    background: Rectangle {
                        anchors.fill: parent
                        color: darkMode ? "#7F7F7F" : "white"
                        radius: 10
                    }
                    Text {
                        text: "返回"
                        font.pixelSize: 12
                        anchors.centerIn: parent
                        color: darkMode ? "white" : "black"
                    }
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.bottom
                        topMargin: 20
                    }
                    onClicked: {
                        stackView.pop()
                    }
                }
            }
        }
    }

    // StackView 用来管理页面切换
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
    }

    Button {
        width: 40
        height: 40
        background: Rectangle {
            anchors.fill: parent
            color: darkMode ? "#444444" : "#2492FF"
            radius: 20
        }
        text: darkMode ? "🌜" : "🌞"
        font.pixelSize: 20
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 10
            rightMargin: 10
        }
        onClicked: darkMode = !darkMode
    }
}
