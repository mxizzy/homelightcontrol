import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

// Kirigami.Page {
//     width: 200;
//     Controls.Button {
//         anchors.centerIn: parent
//         text: "This pushes page1 from BasicPage\ninto the pageStack from Main.qml!"
//         onClicked: {
//             applicationWindow().pageStack.push(page1) // pageStack pushes component which contains a page into the application window
//         }
//         Component {
//             id: page1
//             Kirigami.Page {
//                 Controls.Label {
//                     anchors.centerIn: parent
//                     text: "page1 was pushed!"
//                 }
//             }
//         }
//     }
// }
Kirigami.ScrollablePage{
        ListView{
            delegate: sidebarDelegate
            model: sidebarModel
            height: parent.height
            Layout.margins: 0
        }
        ListModel{
            id: sidebarModel
            ListElement{
                name: "Home"
                targetPage: "Home.qml"
            }
            ListElement{
                name: "Office LED strip"
                targetPage: "OfficeSettings.qml"
                }
            ListElement{
                name: "Bedside LED strip"
                targetPage: "BedsideSettings.qml"
            }
        }
        Controls.ItemDelegate{
            id:sidebarDelegate
            width: sidebar.width
            text: name
            // RowLayout{
            //     Controls.AbstractButton{
            //         height: 40;
            //         width: parent.width;
            //         text: name
            //         id: sidebarItemRow
                    // Kirigami.Heading {
                    //     text: name
                    // }
                    onClicked: pageNav.trigger()
                // }
                // onClicked: pageNav.trigger()
                Kirigami.PagePoolAction{
                    id: pageNav
                    pagePool: mainPagePool
                    basePage: sidebar
                    page: targetPage
                }
            // }
        }
}
