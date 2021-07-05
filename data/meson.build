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
    rename: meson.project_name() + '.gschema.xml'
)

# Install our icons in all the required sizes
icon_sizes = ['16', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data(
        '@0@.svg'.format(i),
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i / 'apps',
        rename: meson.project_name() + '.svg'
    )
    install_data(
        '@0@.svg'.format(i),
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i + '@2' / 'apps',
        rename: meson.project_name() + '.svg'
    )
endforeach