# templateflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<!-- # <APP_NAME>

# Документация к платформе Flutter проекта <APP_NAME>

## Технологический стек
- dart: <DART_VERSION>
- flutter: <FLUTTER_VERSION>
- минимальная версия IOS - <MINIMUM_IOS_VERSION>
- минимальная версия Android SDK - <MINIMUM_ANDROID_SDK_VERSION>

## Postman-коллекция
[Postman](<POSTMAN_URL>)

## Информация по развертыванию

### Контуры проекта
- **dev** - для разработки;
- **stage** - для тестирования;
- **prod** - для релиза в сторах.

Для каждого контура настроена соотвествующая схема `lib/app/<название_схемы>.dart`. В файле `main.dart` по-умолчанию запускается схема с `dev` конфигурцией.

### CI/CD (блок только для AppCraft)
[Проект в Bitrise](<BITRISE_URL>).

Для каждого конутра проекта настроено своё `workflow`. Для запуска `workflow` необходимо в `git` отправить соотвествующий `tag`[^1].
- tag: `deploy_android_v*.*.*.*`
  workflow: **deploy_release_android**
- tag: `staging_android_v*.*.*.*`
  workflow: **build_staging_android**
- tag: `release_android_v*.*.*.*`
  workflow: **build_release_android**
- tag: `release_ios_v*.*.*.*`
  workflow: **deploy_release_ios**
- tag: `staging_ios_v*.*.*.*`
  workflow: **deploy_staging_ios**

[^1]: `*.*.*.*` - версия приложения и номер билда.

## Команды

Для обновления всех зависимостей
```flutter pub upgrade --major-versions```

### Генерация ресурсов
Для генерации файлов ресурсов (изображений, шрифтов и т.д.) используется пакет `FlutterGen`.
Для генерации выполните команду:
```console
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Локализация
Для локалиции и генерации файлов со строками используются встроенные средства `flutter` и пакет `intl` ([Подробнее](https://docs.flutter.dev/accessibility-and-localization/internationalization)).
Для генерации выполните команду:
```console
flutter gen-l10n
``` -->