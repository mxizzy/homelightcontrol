import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

// Kirigami.ContextDrawer{
//     header: home
// }
Kirigami.Page{
    title: "Home"
    Rectangle {
        id: bottomField
        border.width: 1
        border.color: "darkgray"
        width: parent.width
        anchors.bottom: parent.bottom
        // height: Kirigami.Units.largeSpacing
        color: "blue"
        Controls.Button{
            anchors.right: parent.right
            text: "Close"
            Kirigami.Icon{
                source: "dialog-close"
            }
        }
    }
}