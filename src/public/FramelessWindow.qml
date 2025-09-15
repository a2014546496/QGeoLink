import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import Hepler 1.0
import "../Theme.js" as Theme

ApplicationWindow {
    id:root;


    property color backgroundColor:Theme.primaryColor;
    readonly property int radius:Theme.primaryRadius;
    readonly property int backMargin:Theme.primaryMargin;
    readonly property int moveSizeRegion:backMargin;

    title:  "Frameless Window";
    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint;
    color: "transparent";



    Item{
        id:stateItem;
        states: [
            State {
                name: "normal"
                when: root.visibility == Window.Windowed;
                PropertyChanges {target: shadowRoot ; anchors.margins: 8;}
                PropertyChanges {target: normalandMaxBtn; text:"□"}
            },
            State {
                name: "max";
                when:root.visibility === Window.Maximized;
                PropertyChanges {target: shadowRoot ; anchors.margins: 0}
                PropertyChanges {target: normalandMaxBtn; text:"❐"}

            }
        ]

        onStateChanged: {
            console.log(state);
        }
    }
    //背景
    background:Item{
        anchors.fill: parent;
        Rectangle{
            id:shadowRoot;
            anchors.fill: parent;
            anchors.margins: root.backMargin;
            color: root.backgroundColor;
            radius: root.radius;

        }
        DropShadow {
            anchors.fill: shadowRoot
            horizontalOffset: 0
            verticalOffset: 0
            radius: root.radius;
            samples: 10
            color: "#40000000"
            source: shadowRoot
        }

        //底部边
        Item{
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            height: moveSizeRegion;
            MouseArea{
                anchors.fill: parent;
                cursorShape: Qt.SizeVerCursor;
                onPressed: root.startSystemResize(Qt.BottomEdge);
            }
        }

        // 顶部边
        Item {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: moveSizeRegion;
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeVerCursor
                onPressed: root.startSystemResize(Qt.TopEdge)
            }
        }

        //左边
        Item{
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            width: moveSizeRegion;
            MouseArea{
                anchors.fill: parent;
                cursorShape: Qt.SizeHorCursor;
                onPressed: root.startSystemResize(Qt.LeftEdge);
            }
        }

        //右边
        Item{
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.right: parent.right;
            width: moveSizeRegion;
            MouseArea{
                anchors.fill: parent;
                cursorShape: Qt.SizeHorCursor;
                onPressed:root.startSystemResize(Qt.RightEdge);
            }
        }

        // 左上角
        Item {
            anchors.top: parent.top
            anchors.left: parent.left
            width: moveSizeRegion;
            height: moveSizeRegion;
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                onPressed: root.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
            }
        }

        // 右上角
        Item {
            anchors.top: parent.top
            anchors.right: parent.right
            width: moveSizeRegion;
            height: moveSizeRegion;
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeBDiagCursor
                onPressed: root.startSystemResize(Qt.TopEdge | Qt.RightEdge)
            }
        }

        // 左下角
        Item {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: moveSizeRegion;
            height: moveSizeRegion;
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeBDiagCursor
                onPressed: root.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
        }

        // 右下角
        Item {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: moveSizeRegion;
            height: moveSizeRegion;
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                onPressed: root.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
        }
    }


    header: Item{
            height: 35;
            width:root.width;
            Item{
                id:titlebar;
                anchors.fill: parent;
                anchors.topMargin: 12;
                anchors.leftMargin: 14;
                anchors.rightMargin: 14;
                Row{
                     anchors.verticalCenter: parent.verticalCenter;
                     Text {
                         text: root.title;
                         font.pixelSize: 14;
                         color:Theme.textColor;
                     }
                 }

                MouseArea{
                    anchors.fill: parent;
                    cursorShape: Qt.SizeAllCursor;
                    onPressed: {
                            root.startSystemMove();
                    }
                }

                //右上角
                Row{
                    anchors.right: parent.right;
                    spacing: 6;
                    height: parent.height;

                    CircleButton{
                        text: "—";
                        onClicked: root.showMinimized();
                        height: parent.height;
                        width: height;
                    }

                    CircleButton{
                        id:normalandMaxBtn;
                        height: parent.height;
                        width: height;
                        onClicked: {
                            if(root.visibility === Window.Maximized)
                                root.showNormal();
                            else
                                root.showMaximized();
                        }
                    }

                    CircleButton{
                        text: "✕"
                        onClicked: Qt.quit();
                        height: parent.height;
                        width: height;
                        hoveredColor: "red";
                    }
                }

            }
       }

}
