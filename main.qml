import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window
{
    id: window
    width: 330
    height: 330
    visible: true
    title: qsTr("Homework_3_part_1")

    RectWithItems {
        id: rect
        anchors.fill: parent
        onButton_clicked: {
                if(auth_is_OK && state === "not_authenticated")
                    state = "ready_to_search"
                if(state === "ready_to_search" && searching_word !== "")
                {
                    state = "searching"
                    return
                }
                if(state === "searching")
                    state = "ready_to_search"
        }

        state: "not_authenticated"

        states: [
            State {
                name: "ready_to_search"
                PropertyChanges {
                    target: rect
                    color: "lightgreen"
                    show_busy_indicator: false
                    show_edit_box: true
                    auth_btn_caption: "Start searching"
                    auth_mode: false
                }
            },
            State {
                name: "not_authenticated"
                PropertyChanges {
                    target: rect
                    color: "lavender"
                    show_busy_indicator: false
                    show_edit_box: true
                    auth_btn_caption: "Authenticate"
                    auth_mode: true

                }
            },
            State {
                name: "searching"
                PropertyChanges {
                    target: rect
                    color: "powderblue"
                    show_busy_indicator: true
                    show_edit_box: false
                    auth_btn_caption: "Stop searching"
                    auth_mode: false
                }
            }

        ]
    }

}
