i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

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
    'Widgets/WelcomeView.vala',
    'Widgets/TemplateRow.vala',

    'Layouts/HeaderBar.vala',
    'Layouts/MainWindow.vala',
    'Layouts/PropertiesBar.vala',
    'Layouts/RightSideBar.vala',
    'Layouts/MainCanvas.vala',
    'Layouts/ToolsBar.vala',

    'Dialogs/SettingsDialog.vala',
    'Dialogs/TemplateChooser.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('libhandy-1',version: '>=0.90.0'),
        meson.get_compiler('vala').find_library('posix')
    ],
    install: true
)
