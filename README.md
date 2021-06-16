# Photostat

<h3 align="center">
  <img src="https://github.com/PhotostatEditor/Photostat/actions/workflows/build.yml/badge.svg" />
  <img src="https://github.com/PhotostatEditor/Photostat/actions/workflows/lint.yml/badge.svg" />
</h3>

The Linux Photo Editing tool

## Compile

### Dependencies Required

- `libgtk-3-dev`
- `libgranite-dev`
- `valac`

  > Note: for non elementary distros you will need to install [elementary-icons](https://github.com/elementary/icons) and [elementary-stylesheet](https://github.com/elementary/stylesheet)

### Compine and Run

Once the above mentioned dependencies are resolved, Photostat can be compiled and installed.

```sh
meson build --prefix=/usr
cd build
ninja
```

## Questions

Feel free to join our public [Matrix Channel](https://app.element.io/#/room/#photostat:matrix.org), if you want to communicate

## 📜 License

#### [GNU GPLv3 / Creative Commons BY-SA](./COPYING)

Copyright © 2021 The Photostat Project.
