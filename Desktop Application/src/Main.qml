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
        ListView{
            width:200;
            delegate: sidebarDelegate
            model: sidebarModel
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
            

        }
        Component{
            id:sidebarDelegate
            Kirigami.AbstractCard{
                Kirigami.Heading{
                    Layout.fillWidth: true
                    level: 2
                    text: name
                }
                Kirigami.Separator{
                    Layout.fillWidth: true
                    visible: name.length > 0
                }
                Controls.Button {
                    text: "open page"
                    onClicked: pageStack.push(palettePage)
                }
            }

    }
    Component{
        id: palettePage
        Kirigami.Page{
            Rectangle{
                anchors.fill:parent
                color:"lightgreen"
            }
        }
    }
}
