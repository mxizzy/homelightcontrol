// "BasicPage.qml"
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
    id: sidebar
    width: 150;
    Rectangle{
        width: 150;
        ListView{
            delegate: sidebarDelegate
            model: sidebarModel
            width: 50;
        }
        ListModel{
            id: sidebarModel
            ListElement{
                name: "Office LED strip"
                page: "officeSettings"
                }
            ListElement{
                name: "Bedside LED strip"
                page: "bedsideSettings"
            }
        }
        Component{
            id:sidebarDelegate
            RowLayout{
                height: 40;
                width: sidebar.width;
                id: sidebarItemRow
                spacing: 30
                Kirigami.Heading {
                    text: name
                    
                }
                Controls.Button {
                    text: name
                    onClicked: {
                        applicationWindow().pageStack.push(bedsideSettings)
                    }
                }
                
                }
                

        }
        Component{
            id: bedsideSettings
            Kirigami.Page{BedsideSettings{}}
            // Kirigami.Page{
            //     id: bedsideSettings
            //     height: parent.height

            //     Rectangle{
            //         anchors.bottomMargin: real
            //         height: Kirigami.Units.largeSpacing

            //         Controls.Button{
            //             anchors.right: parent.right
            //             anchors.left: undefined
            //             Kirigami.Icon{
            //                 source: "checkbox"
            //             }
            //             text: "Apply"
            //         }
            //     }
            //     GridLayout{
            //         id: settingsLayout
            //         anchors{
            //             left: parent.left
            //             top: parent.top
            //             right:parent.right
            //         }
            //     }
            // }
        }
    }
}