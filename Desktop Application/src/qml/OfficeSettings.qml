import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
Kirigami.Page{
    title: "Office LED Strip"
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: Kirigami.Units.largeSpacing
        color: "black"
        Controls.Button{
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: "button"
            onClicked: pageStack.pop()
        }
    }
}