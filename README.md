# challenge_tsoft

Challenge técnico para la posición **Frontend Flutter Senior**.  
Desarrollado por: **Axel Corbera**


# Descripción

Esta aplicación web fue desarrollada en Flutter, basada en el diseño provisto en Figma. El contenido se consume dinámicamente desde la API pública de [The Movie Database (TMDB)](https://www.themoviedb.org/documentation/api).

# Tecnologías utilizadas

- Flutter 3.32.3
- Dart 3.8.1
- TMDB API – Fuente de datos de películas.
- flutter_dotenv – Para manejar variables de entorno.
- Storybook Flutter – Catálogo de componentes visuales.
- Provider – Gestión de estado

# Estructura del Proyecto

```bash
lib/
├── main.dart
├── app.dart                     # Configuración principal de la app
├── core/                        # Constantes, helpers, y configuraciones generales
│   ├── theme/
│   ├── utils/
│   ├── services/
│   ├── const/
│   └── widgets/
├── api/                         # Comunicación con API externa
│   └── api_tmdb/
├── data/                        # Datos de prueba
├── providers/                   # Providers
├── models/                      # Modelos
├── screens/                     # Pantallas principales
│   ├── widgets/                 # Componentes visuales reutilizables
│   └── storybook/               # Documentación visual de componentes
│
storybook/                       # Documentación visual de componentes
│   └── stories/
env.dart                         # Manejo seguro de la API Key
```

# Instalación

```bash
git clone https://github.com/AxelCorbera/challenge_tsoft.git
cd challenge_tsoft
flutter pub get
```

# Configuración de entorno

Esta app necesita una clave de acceso a la API pública de TMDB.

1. Copiá el archivo `.env.example` a `.env`.
2. Reemplazá el valor de `TMDB_ACCESS_TOKEN` con tu propio token y el valor `TMDB_API_KEY` (pueden obtenerse en [TMDB API](https://developer.themoviedb.org/docs/authentication)).

- ⚠️ También podés usar el siguiente token público si estás probando la app:

- ⚠️ IMPORTANTE: Solo se proporciona el token público en este 'caso particular' debido a que es un challenge de prueba:

TMDB_ACCESS_TOKEN > `eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyODJiZDRlZTFmYTdiOWUyZTVlYzcxNDkxNTlkMDU1YiIsIm5iZiI6MTc0OTUyOTUwMS42ODk5OTk4LCJzdWIiOiI2ODQ3YjM5ZGMxYjg4NTcyODUyMDY5N2IiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.j75NnqlFyRoaoA9uWcz5KRRx8Bpq-FK6akOaHTBR-8Y`

TMDB_API_KEY > `282bd4ee1fa7b9e2e5ec7149159d055b`

- Solo tiene permisos de lectura.

# Ejecutar la Aplicación


```bash
flutter run
```

# Ejecutar Storybook

```bash
flutter run -t lib/storybook.dart
```

- Para correr directamente en chrome

```bash
flutter run -d chrome -t lib/storybook.dart
```