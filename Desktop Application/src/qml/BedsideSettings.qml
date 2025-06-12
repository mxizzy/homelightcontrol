import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Rectangle {
    anchors.fill: parent
    color: "lightblue"
    Controls.Button{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        text: "button"
        onClicked: pageStack.pop()
    }
}
// Kirigami.Page{
//     id: bedsideSettings
    // GridLayout{
    //     id: contentGrid
    //     columns: 2
    //     Rectangle{
    //         color: "lightgreen"
    //     }
    // }
    // footer{
    //     Rectangle{
    //     id: bottomRow
    //     anchors.bottomMargin: real
    //     height: Kirigami.Units.largeSpacing
    //     text: "feet"
    //     }
        // Controls.Button{

        //     Kirigami.Icon{
        //         source: "checkbox"
        //     }
        //     text: "Apply"
        // }
    // }

    
// }