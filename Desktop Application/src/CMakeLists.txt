add_executable(hlc-desktop)

ecm_add_qml_module(hlc-desktop
    URI
    org.kde.homelightcontrol
)

target_sources(hlc-desktop
    PRIVATE
    main.cpp
)

ecm_target_qml_sources(hlc-desktop
    SOURCES
    qml/Main.qml
    qml/BedsideSettings.qml
    qml/Sidebar.qml
    qml/Home.qml
    qml/OfficeSettings.qml
)

target_link_libraries(hlc-desktop
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::QuickControls2
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::IconThemes
)

install(TARGETS hlc-desktop ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
