import org.kde.kirigami as Kirigami

Kirigami.ApplicationWindow {
    title: "Pushing a Page from a different QML file"
    width: 900
    height: 400
    pageStack.initialPage: [ sidebar, Qt.resolvedUrl("Home.qml") ]
        Kirigami.PagePool{
            id:mainPagePool
        }
        Kirigami.ScrollablePage{
            id: sidebar
            title: "HomeLightControl"
            Sidebar{}
        }
        // Kirigami.Page{
        //     id: home
        //     title: "Home"
        //     Home{}
        // }
}

// import QtQuick
// import QtQuick.Layouts
// import QtQuick.Controls as Controls
// import org.kde.kirigami as Kirigami
// import org.kde.kirigami.delegates as KD

// Kirigami.ApplicationWindow{
//     id: root
//     width: 700
//     height: 500
//     title: "HomeLightControl"
//     PageStack.initialPage: Sidebar {}
// }

    // Kirigami.PageRow{
    //     id: bodyRow
    //     anchors.fill(parent)
        // initialPage: Kirigami.ScrollablePage{
        //     id: sidebar
        //     width:200;
        //     ListView{
        //         width:200;
        //         delegate: sidebarDelegate
        //         model: sidebarModel
        //     }
        //     ListModel{
        //         id: sidebarModel
        //         ListElement{
        //             name: "Office LED strip"
        //             page: "officeSettings"
        //             }
        //         ListElement{
        //             name: "Bedside LED strip"
        //             page: "bedsideSettings"
        //         }
        // }
                

        //     }
            // Component{
            //     id:sidebarDelegate
            //     Kirigami.AbstractCard{
            //         Kirigami.Heading{
            //             Layout.fillWidth: true
            //             level: 2
            //             text: name
            //         }
            //         Kirigami.Separator{
            //             Layout.fillWidth: true
            //             visible: name.length > 0
            //         }
            //         Controls.Button {
            //             text: "open page"
            //             onClicked: bodyRow.push(bedsideSettings)
            //         }
            //     }

            // }
    // }