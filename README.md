
# Weather App

> Aplicación Flutter para consultar el clima actual y pronóstico semanal usando una API propia desplegada en Render.com.

## Características
- Consulta automática de ubicación y clima actual.
- Pronóstico por hora y semanal.
- Cambia entre tema claro y oscuro.
- Soporte para Android, iOS, Web, Windows, Linux y macOS.

## Configuración rápida

1. **Clona el repositorio:**
	```bash
	git clone https://github.com/SantiagoPizzico/Flutter.git
	cd ./weather_app
	```

2. **Instala dependencias:**
	```bash
	flutter pub get
	```

3. **Ejecuta la app:**
	```bash
	flutter run
	```

## Conexión con la API

La app consulta la API desplegada en Render.com:

```
https://api-express-blgs.onrender.com/api/v1/clima
```

Si quieres usar otra API, edita la variable `baseUrl` en `lib/services/weather_service.dart`.

> **Nota:** Render puede demorar la primera respuesta si la API está en modo gratuito (hasta 50 segundos).

## Dependencias principales
- [provider](https://pub.dev/packages/provider)
- [geolocator](https://pub.dev/packages/geolocator)
- [http](https://pub.dev/packages/http)

## Estructura del proyecto
- `lib/models/` - Modelos de datos
- `lib/services/` - Servicios de red/API
- `lib/providers/` - Gestión de estado
- `lib/screens/` - Pantallas principales
- `lib/widgets/` - Componentes reutilizables
- `lib/themes/` - Temas claro/oscuro

## Personalización
- Cambia los colores en `lib/themes/light_theme.dart` y `lib/themes/dark_theme.dart`.
- Agrega tus propios íconos en `assets/icons/`.

## Créditos
Desarrollado por Santiago Pizzico
