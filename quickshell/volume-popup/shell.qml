import QtQuick 6.10
import QtQuick.Layouts 6.10
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

// Simple Volume Control Popup
PanelWindow {
    id: popupWindow
    
    property bool shouldShow: false
    
    // Monitor toggle file to show/hide popup
    Process {
        id: checkToggle
        command: ["test", "-f", "/tmp/quickshell-volume-popup-toggle"]
        running: false
        onFinished: {
            if (exitCode === 0) {
                // Toggle file exists, toggle the popup
                popupWindow.shouldShow = !popupWindow.shouldShow
                // Remove the toggle file
                removeToggle.running = true
            }
        }
    }
    
    Process {
        id: removeToggle
        command: ["rm", "-f", "/tmp/quickshell-volume-popup-toggle"]
        running: false
    }
    
    // Monitor the toggle file periodically
    Timer {
        interval: 300
        running: true
        repeat: true
        onTriggered: {
            checkToggle.running = true
        }
    }
    
    screen: Quickshell.screens[0]
    
    anchors {
        top: true
        right: true
    }
    
    margins {
        right: 12
        top: 12
    }
    
    implicitWidth: 320
    implicitHeight: 200
    color: "transparent"
    visible: shouldShow
    
    WlrLayershell.keyboardFocus: shouldShow ? WlrKeyboardFocus.OnDemand : WlrKeyboardFocus.None
    
    FocusScope {
        id: container
        anchors.fill: parent
        focus: true
        
        Keys.onEscapePressed: popupWindow.shouldShow = false
        
        // Track if mouse has entered at least once
        property bool mouseHasEntered: false
        property bool mouseInside: hoverHandler.hovered
        
        // Timer to delay close when mouse leaves
        Timer {
            id: closeTimer
            interval: 400
            onTriggered: {
                if (!container.mouseInside && container.mouseHasEntered && popupWindow.shouldShow) {
                    popupWindow.shouldShow = false
                }
            }
        }
        
        // HoverHandler detects when mouse enters/leaves
        HoverHandler {
            id: hoverHandler
            onHoveredChanged: {
                if (hovered) {
                    container.mouseHasEntered = true
                    closeTimer.stop()
                } else if (container.mouseHasEntered && popupWindow.shouldShow) {
                    closeTimer.restart()
                }
            }
        }
        
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            radius: 16
            border.color: "#9929EA"
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12
                
                // Header with title and close button
                RowLayout {
                    Layout.fillWidth: true
                    
                    Text {
                        text: "Volume Control"
                        font.family: "Inter"
                        font.pixelSize: 18
                        font.weight: Font.Bold
                        color: "#9929EA"
                        Layout.fillWidth: true
                    }
                    
                    // Close button
                    Rectangle {
                        width: 28
                        height: 28
                        radius: 6
                        color: closeArea.containsMouse ? Qt.rgba(0x99, 0x29, 0xEA, 0.2) : "transparent"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "󰅖"
                            font.family: "Material Design Icons"
                            font.pixelSize: 16
                            color: "#CC66DA"
                        }
                        
                        MouseArea {
                            id: closeArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: popupWindow.shouldShow = false
                        }
                    }
                }
                
                Text {
                    text: "This is a test popup"
                    font.family: "Inter"
                    font.pixelSize: 12
                    color: "#CC66DA"
                }
            }
        }
    }
}
