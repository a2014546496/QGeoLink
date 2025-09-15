import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Theme.js" as Theme

ToolButton {
    id:root;
    width: 20;
    height: 20;
    font.pixelSize: Theme.fontSize1;

    property color normalColor:Theme.primaryColor;
    property color hoveredColor:"gray";

    contentItem: Text {
        text: root.text;
        color: Theme.textColor;
        anchors.fill: parent;
        verticalAlignment: Text.AlignVCenter;
        horizontalAlignment: Text.AlignHCenter;
    }

    hoverEnabled:true;

    states: [
        State {
            name: "hovered"
            when: root.hovered;
            PropertyChanges {target: backRect; color:hoveredColor}
        },
        State {
            name: "normal"
            when:!root.hovered;
            PropertyChanges {target: backRect; color:normalColor}
        }
    ]

    background: Rectangle{
        id:backRect;
        anchors.fill: parent;
        radius: parent.height * 0.5;
    }

}
