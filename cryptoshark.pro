TEMPLATE = app

QT += qml quick widgets

QTPLUGIN.bearer = -
QTPLUGIN.imageformats = -
QTPLUGIN.qmltooling = -

SOURCES += \
    main.cpp \
    nativepointer.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

QMAKE_INFO_PLIST = Info.plist

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    nativepointer.h

unix {
    PARTS = $$[QT_INSTALL_LIBS] libQt5Core.prl
    COREPRL = $$join(PARTS, "/")
}
win32 {
    PARTS = $$[QT_INSTALL_LIBS] Qt5Core.prl
    COREPRL = $$join(PARTS, "\\")
}
exists($$COREPRL) {
    include($$COREPRL)
    !contains(QMAKE_PRL_CONFIG, shared) {
        CONFIG += cryptoshark_static_qt
    }
}

win32 {
    QMAKE_LFLAGS += /SAFESEH:NO
}