project ('com.github.PhotostatEditor.Photostat', 'vala', 'c')

executable (
    meson.project_name (),
    'src' / 'Application.vala',
    'src' / 'SetupWindow.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install: true
)

install_data(
    'data' / 'photostat.desktop',
    install_dir: get_option('datadir') / 'applications',
    rename: meson.project_name() + '.desktop'
)

install_data(
    'data' / 'photostat.appdata.xml',
    install_dir: get_option('datadir') / 'metainfo',
    rename: meson.project_name() + 'appdata.xml'
)
