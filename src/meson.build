executable (
    meson.project_name (),
    'Application.vala',
    'Window.vala',
    'Services/Settings.vala',
    'Services/ActionManager.vala',
    'Services/EventBus.vala',
    'Widgets/HeaderBarButton.vala',
    'Widgets/ButtonImage.vala',
    'Widgets/MenuButton.vala',
    'Widgets/WelcomeView.vala',
    'Widgets/TemplateRow.vala',
    'Layouts/HeaderBar.vala',
    'Layouts/MainWindow.vala',
    'Dialogs/SettingsDialog.vala',
    'Dialogs/TemplateChooser.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('libhandy-1',version: '>=0.90.0')
    ],
    install: true
)
