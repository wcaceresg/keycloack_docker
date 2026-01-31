# Tema Personalizado de Keycloak - mi-tema

Este tema personalizado permite modificar completamente el HTML y CSS de la página de login de Keycloak.

## Estructura del Tema

```
mi-tema/
├── login/
│   ├── login.ftl              # Template HTML personalizado (FreeMarker)
│   ├── theme.properties      # Configuración del tema
│   └── resources/
│       └── css/
│           └── style.css     # Estilos CSS personalizados
└── README.md
```

## Personalización del HTML

### 1. Modificar el Template (login.ftl)

El archivo `login.ftl` es un template FreeMarker que controla la estructura HTML de la página de login. Puedes modificar:

- **Header**: Título, logo, subtítulo
- **Formulario**: Campos de usuario y contraseña
- **Botones**: Botón de login, registro, etc.
- **Footer**: Información adicional

### 2. Ejemplos de Personalización

#### Agregar un Logo

1. Coloca tu logo en `login/resources/img/logo.png`
2. Edita `theme.properties` y descomenta:
   ```
   logo=resources/img/logo.png
   ```

#### Agregar un Subtítulo

Edita `theme.properties`:
```
subtitle=Bienvenido a nuestro sistema de autenticación
```

#### Agregar Texto en el Footer

Edita `theme.properties`:
```
footerText=© 2024 Tu Empresa. Todos los derechos reservados.
```

#### Modificar el HTML del Formulario

Edita `login.ftl` y modifica las secciones según necesites. Por ejemplo, para agregar un campo personalizado:

```ftl
<div class="custom-field">
    <label for="custom-input">Campo Personalizado</label>
    <input type="text" id="custom-input" name="custom" />
</div>
```

### 3. Variables Disponibles en el Template

El template tiene acceso a varias variables de Keycloak:

- `realm`: Información del realm
- `url`: URLs de Keycloak (login, registro, etc.)
- `messagesPerField`: Mensajes de error
- `properties`: Propiedades del tema
- `msg()`: Función para obtener mensajes traducidos

### 4. Personalización del CSS

Edita `resources/css/style.css` para personalizar los estilos. El archivo ya incluye:

- Variables CSS personalizables
- Estilos para el formulario
- Estilos para botones y inputs
- Diseño responsive
- Animaciones

### 5. Aplicar Cambios

Después de modificar los archivos:

1. Reinicia los contenedores:
   ```bash
   docker-compose restart keycloak
   ```

2. En Keycloak Admin Console:
   - Ve a **Realm Settings** → **Themes**
   - Selecciona **mi-tema** en **Login theme**
   - Guarda los cambios

3. Limpia la caché del navegador (Ctrl+F5) para ver los cambios

## Recursos Adicionales

- **Imágenes**: Colócalas en `login/resources/img/`
- **JavaScript**: Colócalo en `login/resources/js/`
- **Fuentes**: Colócalas en `login/resources/fonts/`

## Documentación de Keycloak

Para más información sobre la personalización de temas en Keycloak:
- [Keycloak Theme Development](https://www.keycloak.org/docs/latest/server_development/#_themes)
