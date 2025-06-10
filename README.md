# challenge_tsoft

Challenge técnico para la posición **Frontend Flutter Senior** en Swiss Medical.  
Desarrollado por: **Axel Corbera**


# Descripción

Esta aplicación web fue desarrollada en Flutter, basada en el diseño provisto en Figma. El contenido se consume dinámicamente desde la API pública de [The Movie Database (TMDB)](https://www.themoviedb.org/documentation/api).


# Estructura del Proyecto

lib/
├── main.dart
├── app.dart                     # Configuración principal de la app
│
├── core/                        # Constantes, helpers, y configuraciones generales
│   ├── theme/
│   └── utils/
│
├── data/                        # Comunicación con API externa
│   ├── models/
│   ├── services/
│   └── repository/
│
├── ui/
│   ├── screens/                 # Pantallas principales
│   ├── widgets/                 # Componentes visuales reutilizables
│   └── storybook/              # Documentación visual de componentes
│
└── config/
    └── env.dart                 # Manejo seguro de la API Key
