# DonaYa

Proyecto orientado a ser un medio para la comunicación de la donación hacia ONGs o instituciones similares en la que se puedan compartir los datos de las donaciones y los resultados de las mismas.

## Getting Started

Para compilar el proyecto es necesario tener instalado en el sistema el SDK de Flutter. https://docs.flutter.dev/get-started/install
```bash
flutter pub get
```

Este proyecto es principalmente una aplicación móvil solo para android, pero por temas de desarrollo se ha incluido soporte para Linux y Web por temas de visualización rápida de la interfaz.

Para Windows, se recomienda habilitar el proyecto para dicho sistema operativo, de la siguiente manera:
```bash
flutter create --platforms=windows .
```

## Arquitectura

Se esta siguiendo una arquitectura hexagonal con ciertos agregados.
Las bibliotecas y tecnologías utilizadas son:
- Bloc: https://bloclibrary.dev/
- ...

```
.
├── constants/
│   ├── app_constants.dart
│   └── [some_constants].dart
├── themes/
│   └── app_theme.dart
│   └── [more_stuffs_about_themes].dart
├── ui/
│   └── [feature_name]/
│       ├── cubits/
│       │   └── [some_cubit].dart
│       │   └── [some_state].dart
│       │   └── [some_events].dart
│       ├── widgets/
│       │   └── [some_widget].dart
│       └── [feature_name]_screen.dart
│    └── shared/
│        └── [some_shared_widget].dart
```