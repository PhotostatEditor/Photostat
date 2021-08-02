project ('com.github.photostat_editor.photostat', 'vala', 'c')

gnome = import ('gnome')
asresources = gnome.compile_resources(
    'as-resources', 'data/gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

subdir('src')
subdir('data')
subdir('po')

meson.add_install_script('build-aux/meson/post_install.py')
