# Install our icons in all the required sizes
icon_sizes = ['16', '24', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data(
        'app/@0@.svg'.format(i),
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i / 'apps',
        rename: meson.project_name() + '.svg'
    )
    install_data(
        'app/@0@.svg'.format(i),
        install_dir: get_option('datadir') / 'icons' / 'hicolor' / i + 'x' + i + '@2' / 'apps',
        rename: meson.project_name() + '.svg'
    )
endforeach
