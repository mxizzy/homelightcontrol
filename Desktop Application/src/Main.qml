import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kirigami.delegates as KD

Kirigami.ApplicationWindow{
    id: root
    width: 700
    height: 500

    pageStack.initialPage: Kirigami.ScrollablePage{
        Kirigami.ListView{
            id:sidebar
            model: sidebarModel
            delegate: sidebarItem
        }
        ListModel{
            id: sidebarModel
            ListElement{
                name: "Office LED strip"
            }
            ListElement{
                name: "Bedside LED strip"
            }
        }
        Component{
            id: sidebarItem
            Controls.ItemDelegate {
                width: Listview.view.width
                text: `${model.name}`
            }
        }
    }
}
