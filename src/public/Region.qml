import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Theme.js" as Theme

Rectangle {
    id:root;
    radius: Theme.primaryRadius;
    color: Theme.regionColor;
    border.color: Theme.regionBorderColor;
    border.width: 1;

    DropShadow {
        anchors.fill: root
        horizontalOffset: 0
        verticalOffset: 0
        radius: root.radius;
        samples: 20
        color: "#40000000"
        source: root
    }
}
