// // "BasicPage.qml"
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
    height: parent.height
    Rectangle{
        width: 150;
        height: parent.height
        ListView{
            delegate: sidebarDelegate
            model: sidebarModel
            width: 50;
            height: parent.height
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
        Component{
            id:sidebarDelegate
            RowLayout{
                Rectangle{
                    height: 40;
                    width: sidebar.width;
                    id: sidebarItemRow
                    // Kirigami.Heading {
                    //     text: name
                    // }
                    Controls.Button {
                        text: name
                        onClicked: pageNav.trigger()
                    }
                }
                // onClicked: pageNav.trigger()
                Kirigami.PagePoolAction{
                    id: pageNav
                    pagePool: mainPagePool
                    basePage: sidebar
                    page: targetPage
                }
            }
        }
    }
}