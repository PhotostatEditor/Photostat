<h1 align="center">
    <br>
    <img src="Photostat Logo.svg" alt="Photostat">
</h1>
<h3 align="center"> Open, powerful and accessible photo editing tool </h3>
<h3 align="center">
  <img src="https://github.com/PhotostatEditor/Photostat/actions/workflows/build.yml/badge.svg" />
  <img src="https://github.com/PhotostatEditor/Photostat/actions/workflows/lint.yml/badge.svg" />
  <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" />
</h3>

Photostat is a native image editor designed to provide an easy to use and modern interface. It is built with GTK and Vala. The goal is to provide an open source, fast, powerful and accessible alternative to other photo editing tools.

## :hammer_and_wrench: Compile

### With Flatpak (Recommended)

#### Make sure you have the elementary sdk
```sh
flatpak remote-add --if-not-exists --system appcenter https://flatpak.elementary.io/repo.flatpakrepo
flatpak install -y appcenter io.elementary.Platform io.elementary.Sdk
```

`flatpak-builder build com.github.photostat_editor.photostat.yml --user --install --force-clean`

Once the command above is complete, you'll be able to launch the app from your applications list.

Note: Since flatpak apps runs in a sandbox, some development operations will be different from how you would usually perform them. Please refer to the Flatpak documentation for help: https://docs.flatpak.org/en/latest/index.html

### Using Meson
#### Dependencies Required

- `libgtk-3-dev`
- `libgranite-dev`
- `libhandy-1-dev`
- `meson`
- `valac`
- if you are on elementary OS 5 you will need [elementary-stylesheet](https://github.com/elementary/stylesheet)

  > Note: for non elementary distros you will need to install [elementary-icons](https://github.com/elementary/icons) and [elementary-stylesheet](https://github.com/elementary/stylesheet)

Once the above mentioned dependencies are resolved, Photostat can be compiled and installed.

```sh
meson build --prefix=/usr
cd build
sudo ninja install
```


## :thinking: Questions

Feel free to join our public [Matrix Channel](https://app.element.io/#/room/#photostat:matrix.org), if you want to communicate.

## 👨‍💻 Contributing

Don't hesitate to contribute code, design, feature requests or bug reports to this project. If you are working on a new feature, please consider creating an issue about it before submitting a Pull Request.
It is highly recommended to read our [contributing guidelines](CONTRIBUTING.md) :page_with_curl: before contributing anything.

## 📜 License

#### GNU GPLv3 / Creative Commons BY-SA

Copyright © 2021 The Photostat Project.
