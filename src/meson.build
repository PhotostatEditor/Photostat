executable (
    meson.project_name (),
    asresources,
    'Application.vala',
    'Window.vala',

    'Services/Settings.vala',
    'Services/ActionManager.vala',
    'Services/EventBus.vala',

    'Widgets/HeaderBarButton.vala',
    'Widgets/ButtonImage.vala',
    'Widgets/MenuButton.vala',

    'Layouts/HeaderBar.vala',
    'Layouts/MainWindow.vala',
    'Layouts/PropertiesBar.vala',
    'Layouts/RightSideBar.vala',
    'Layouts/MainCanvas.vala',
    'Layouts/ToolsBar.vala',

    'Dialogs/SettingsDialog.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('libhandy-1',version: '>=0.90.0')
    ],
    install: true
)
