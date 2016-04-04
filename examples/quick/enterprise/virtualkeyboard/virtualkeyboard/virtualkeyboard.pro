TEMPLATE = app
TARGET = virtualkeyboard
QT += qml quick
SOURCES += main.cpp
CONFIG += link_pkgconfig
static {
    QT += svg
    QTPLUGIN += qtvirtualkeyboardplugin
}

target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
INSTALLS += target

RESOURCES += \
    demo.qrc

OTHER_FILES += \
    VirtualKeyboard.qml \
    VirtualKeyboard-b2qt.qml \
    content/AutoScroller.qml \
    content/HandwritingModeButton.qml \
    content/ScrollBar.qml \
    content/TextArea.qml \
    content/TextBase.qml \
    content/TextField.qml \

disable-xcb {
    message("The disable-xcb option has been deprecated. Please use disable-desktop instead.")
    CONFIG += disable-desktop
}

disable-desktop|android-no-sdk|!isEmpty(CROSS_COMPILE)|qnx {
    DEFINES += MAIN_QML=\\\"VirtualKeyboard-b2qt.qml\\\"
} else {
    DEFINES += MAIN_QML=\\\"VirtualKeyboard.qml\\\"
}
