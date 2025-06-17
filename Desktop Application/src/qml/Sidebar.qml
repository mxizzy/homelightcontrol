import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage{
        ListView{
            delegate: sidebarDelegate
            model: sidebarModel
            anchors.fill: parent
        }
        ListModel{
            id: sidebarModel
            ListElement{
                name: "Home"
                targetPage: "Home.qml"
                color: "red"
            }
            ListElement{
                name: "Office LED strip"
                targetPage: "OfficeSettings.qml"
                color: "green"
                }
            ListElement{
                name: "Bedside LED strip"
                targetPage: "BedsideSettings.qml"
                color: "blue"
            }
        }
        Component{
            id: sidebarDelegate
            Controls.AbstractButton{
                height: 20
                width: sidebar.width
                onClicked: pageNav.trigger()
                Kirigami.PagePoolAction{
                    id: pageNav
                    pagePool: mainPagePool
                    basePage: sidebar
                    page: targetPage
                }
                Row{
                    Text{text: name}
                    // width: sidebar.width
                    // height: Kirigami.Units.largeSpacing
                }
            }
            // RowLayout{
            //     Controls.AbstractButton{
            //         height: 40;
            //         width: parent.width;
            //         text: name
            //         id: sidebarItemRow
                    // Kirigami.Heading {
                    //     text: name
                    // }
                    
                // }
                
            // }
            
        }
    
}
