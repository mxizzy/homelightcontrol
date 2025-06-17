import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
Kirigami.Page{
    title: "Bedside LED Strip"
    actions:[
        Kirigami.Action{
            icon.name: "configure"
            text: "Device settings"
            onTriggered:configDialog.open()
        }
    ]
    Kirigami.Dialog{
        id: configDialog
        title: "Device configuration"
        padding: Kirigami.Units.largeSpacing
        Kirigami.FormLayout{
            Controls.TextField{
                Kirigami.FormData.label: "Device name:"
            }
            Controls.TextField{
                Kirigami.FormData.label: "Device type:"
            }
            Controls.TextField{
                Kirigami.FormData.label: "Device address:"
            }
        }
        customFooterActions: Kirigami.Action{
                icon.name: "checkbox"
                text: "Apply"
                onTriggered: configDialog.close()
            }
    }
    GridLayout{
        id: controlPageGrid
        columns: 2
        height: parent.height
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top}
        Rectangle{
            id: standardPresets
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            // contains chips with different preset colors, in this case it will just show ROYGBIV as options
            GridLayout{
                columns: 2
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "red"
                        }
                        Text{
                            text: "Red"
                        }
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "orange"
                        }
                        Text{
                            text: "Orange"
                        }                    
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "yellow"
                        }
                        Text{
                            text: "Yellow"
                        }       
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "green"
                        }
                        Text{
                            text: "Green"
                        }       
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "blue"
                        }
                        Text{
                            text: "Blue"
                        }       
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "indigo"
                        }
                        Text{
                            text: "Indigo"
                        }       
                    }
                }
                Kirigami.Chip{
                    RowLayout{
                        Rectangle{
                            height: parent.height
                            width: parent.height
                            color: "violet"
                        }
                        Text{
                            text: "Violet"
                        }       
                    }
                }
            }
            
        }
        Rectangle{
            id: customColor
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.rowSpan: 2
            ColumnLayout{
                width: parent.width
                height: parent.height
                Rectangle{
                    width: parent.width
                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 100
                        height:100
                        radius: 50
                        color{r: customRed.value; g: customGreen.value; b: customBlue.value}
                    }
                }
                Controls.Label{
                    text: Math.round(customRed.value)
                }
                Controls.Slider{
                    id: customRed
                    to: 255
                    width: parent.width
                }
                 Controls.Label{
                    text: Math.round(customGreen.value)
                }
                Controls.Slider{
                    id: customGreen
                    to: 255
                    width: parent.width
                }
                 Controls.Label{
                    text: Math.round(customBlue.value)
                }
                Controls.Slider{
                    id:customBlue
                    to: 255
                    width: parent.width
                }
                
                Controls.TextField{
                    id: customName
                    Kirigami.FormData.label: "Name:"
                }
                RowLayout{
                    width: parent.width
                    Layout.alignment: parent.bottom
                    Controls.Button{
                        Layout.alignment: Qt.AlignLeft
                        text: "save as chip"
                        onClicked:{
                            customPresetsModel.append({id: customName, text: customName, red: customRed.value, green: customGreen.value, Blue: customBlue.value})
                            console.log(customPresetsModel.customName)
                        }
                    }
                    Controls.Button{
                        Layout.alignment: Qt.AlignRight
                        text: "Apply"
                        // onClicked:{
                            // coming soon, when interaction to send over wifi is set up
                        // }
                    }
                }
            }
        }
        Rectangle{
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            //contains chips which point to a custom color preset
            ListView{
                model: customPresetsModel
                delegate: customPresetsChips
            }
            ListModel{
                id: customPresetsModel
            }
            Repeater{
                model: customPresetsModel
                Component{
                    id: customPresetsChips
                    Kirigami.Chip{
                        RowLayout{
                            Rectangle{
                                height: parent.height
                                width: parent.height
                                color: {r: customRed.value; g: customGreen.value; b: customBlue.value}
                            }
                            Text{
                                text: customName
                            }       
                        }
                    }
                }
            }
        }
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
    // Rectangle{
    //     anchors.fill: parent
    //     Rectangle{
    //         anchors.bottom: parent.bottom
    //         width: parent.width
    //         height: 30
    //         Kirigami.FormLayout{
    //             anchors.fill: parent
    //             ColumnLayout{
    //                 Kirigami.FormData.label: "Preset settings"
    //             }
    //         }
    //     }
    // }
    // Kirigami.OverlayDrawer{
    //     id: bottomDrawer
    //     edge: Qt.Bottomedge
    //     modal: false
    //     Controls.Button{
    //         id: applyButton
    //         Kirigami.Icon{
    //             source: "checkbox"
    //         }
    //         text: "Apply"
    //     }
    // }