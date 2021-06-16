install_data(
    'photostat.desktop',
    install_dir: get_option('datadir') / 'applications',
    rename: meson.project_name() + '.desktop'
)

install_data(
    'photostat.appdata.xml',
    install_dir: get_option('datadir') / 'metainfo',
    rename: meson.project_name() + 'appdata.xml'
)

install_data(
    'gschema.xml',
    install_dir: join_paths (get_option('datadir'), 'glib-2.0', 'schemas'),
    rename: meson.project_name() + 'gschema.xml'
)