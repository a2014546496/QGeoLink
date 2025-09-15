import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./public" as Public
import "Theme.js" as Theme

Public.FramelessWindow {
    id: mainWindow
    width: 1600
    height: 900
    visible: true
    title: "GNSS Dashboard"


    minimumWidth: Screen.width * 0.5;
    minimumHeight: Screen.height * 0.6;


    SplitView {
        anchors.fill: parent;
        anchors.topMargin: backMargin;
        anchors.leftMargin: backMargin*2;
        anchors.rightMargin: backMargin*2;
        anchors.bottomMargin: backMargin*2;
        orientation: Qt.Horizontal;

        handle: Item{
            implicitWidth: 6;

        }

        Public.Region{
            SplitView.minimumWidth: 20;
            SplitView.preferredWidth: parent.width * 0.2;
            SplitView.maximumWidth: parent.width * 0.2;
        }

        Public.Region{
            SplitView.fillWidth: true;
        }

        Public.Region{
            SplitView.minimumWidth: 20;
            SplitView.preferredWidth: parent.width * 0.2;
            SplitView.maximumWidth: parent.width * 0.2;
        }

        // ...
    }

}
