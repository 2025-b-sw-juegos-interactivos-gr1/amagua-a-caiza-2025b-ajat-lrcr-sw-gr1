# Cat Game - Juego de Recolección de Monedas

Un juego 2D en Godot donde controlas un gato que debe recolectar 6 monedas antes de que se acabe el tiempo.

## 🎮 Descripción del Juego

- **Objetivo**: Recolectar 6 monedas antes de que termine el tiempo
- **Personaje**: Gato con animaciones de idle, correr, saltar y caer
- **Tiempo límite**: 30 segundos
- **Victoria**: Cuando recolectas las 6 monedas, aparece un menú con opciones para reiniciar o salir
- **Derrota**: Si el tiempo se agota sin recolectar todas las monedas, el juego se reinicia automáticamente

## 📋 Requisitos Previos

- **Sistema Operativo**: Windows, macOS o Linux
- **Godot Engine**: Versión 4.x (recomendado 4.2 o superior)
- **Espacio en disco**: ~200 MB para Godot + proyecto

## 🔧 Instalación de Godot Engine

### Opción 1: Descarga Directa (Recomendada)

1. Visita la página oficial de descargas: [https://godotengine.org/download/](https://godotengine.org/download/)

2. Descarga la versión **Godot 4.x Standard** para tu sistema operativo:
   - **Windows**: Descarga `Godot_v4.x_win64.exe.zip`
   - **macOS**: Descarga `Godot_v4.x_macos.universal.zip`
   - **Linux**: Descarga `Godot_v4.x_linux.x86_64.zip`

3. Extrae el archivo ZIP en una carpeta de tu elección

4. (Opcional) En Windows, crea un acceso directo al ejecutable para fácil acceso

### Opción 2: Descarga mediante Steam

1. Abre Steam
2. Busca "Godot Engine"
3. Descarga e instala desde la tienda (versión gratuita)

### Opción 3: Gestor de Paquetes (Linux)

```bash
# Ubuntu/Debian
sudo snap install godot-4

# Arch Linux
sudo pacman -S godot

# Flatpak (cualquier distribución)
flatpak install flathub org.godotengine.Godot
```

## 🚀 Compilar y Ejecutar el Proyecto

### Paso 1: Clonar o Descargar el Proyecto

Si tienes el proyecto en un repositorio Git:
```bash
git clone <url-del-repositorio>
cd cat-game
```

O simplemente extrae el proyecto en una carpeta.

### Paso 2: Abrir el Proyecto en Godot

1. Abre **Godot Engine**
2. En el gestor de proyectos, haz clic en **"Importar"**
3. Navega hasta la carpeta del proyecto `cat-game`
4. Selecciona el archivo `project.godot`
5. Haz clic en **"Importar y Editar"**

### Paso 3: Ejecutar el Juego

Una vez abierto el proyecto en Godot:

1. **Método 1**: Presiona `F5` o haz clic en el botón ▶️ (Play) en la esquina superior derecha
2. **Método 2**: Ve al menú `Proyecto > Ejecutar Proyecto`

El juego se iniciará en una ventana nueva.

## 🎯 Controles del Juego

- **Flechas ← →** o **A/D**: Mover al gato izquierda/derecha
- **Espacio** o **W**: Saltar
- **ESC**: Pausar (si está implementado)

## 📦 Exportar el Juego (Crear Ejecutable)

### Para Windows

1. Ve a `Proyecto > Exportar`
2. Haz clic en **"Agregar..."** y selecciona **"Windows Desktop"**
3. En "Plantillas de Exportación", si no están instaladas, haz clic en **"Administrar plantillas de exportación"** y descárgalas
4. Configura las opciones:
   - **Nombre del archivo**: `cat-game.exe`
   - **Ruta de exportación**: Elige dónde guardar el ejecutable
5. Haz clic en **"Exportar Proyecto"**

### Para Linux

1. Ve a `Proyecto > Exportar`
2. Haz clic en **"Agregar..."** y selecciona **"Linux/X11"**
3. Descarga las plantillas si es necesario
4. Configura el nombre y ruta de exportación
5. Haz clic en **"Exportar Proyecto"**

### Para macOS

1. Ve a `Proyecto > Exportar`
2. Haz clic en **"Agregar..."** y selecciona **"macOS"**
3. Descarga las plantillas si es necesario
4. Configura el nombre y ruta de exportación
5. Haz clic en **"Exportar Proyecto"**

### Para Web (HTML5)

1. Ve a `Proyecto > Exportar`
2. Haz clic en **"Agregar..."** y selecciona **"Web"**
3. Descarga las plantillas si es necesario
4. Marca la opción **"Exportar con depuración desactivada"**
5. Haz clic en **"Exportar Proyecto"**
6. Sube los archivos generados a un servidor web

## 📁 Estructura del Proyecto

```
cat-game/
├── Assets/              # Recursos visuales
│   ├── Buildings/       # Edificios y estructuras
│   ├── Cat/            # Sprites del gato (idle, run, jump, fall)
│   ├── Coin/           # Sprites de monedas
│   └── Texture/        # Fondos y texturas
├── Scenes/             # Escenas de Godot
│   ├── Map.tscn        # Escena principal del juego
│   ├── coin.tscn       # Prefab de moneda
│   ├── menu.tscn       # Menú de derrota
│   └── menu_victoria.tscn  # Menú de victoria
├── Scripts/            # Scripts GDScript
│   ├── PlayerMov.gd    # Movimiento del jugador
│   ├── Coin2D.gd       # Lógica de recolección de monedas
│   ├── UI.gd           # Interfaz de usuario (puntuación)
│   ├── UI_Time.gd      # Cronómetro
│   ├── menu.gd         # Menú de derrota
│   ├── menu_victoria.gd    # Menú de victoria
│   └── ZonaCaida.gd    # Detección de caídas
├── project.godot       # Archivo de configuración del proyecto
└── icon.svg           # Icono del proyecto
```

## 🐛 Solución de Problemas

### El proyecto no abre
- Asegúrate de tener **Godot 4.x** instalado (no Godot 3.x)
- Verifica que el archivo `project.godot` esté en la raíz de la carpeta

### Texturas no se ven
- Espera a que Godot termine de importar todos los recursos (primera vez puede tardar)
- Revisa la consola de Godot por errores de importación

### El juego va lento
- Ve a `Proyecto > Configuración del Proyecto > Renderizado`
- Cambia el modo de renderizado a "Forward+" si está en "Mobile"

### Errores de script
- Abre la consola de salida en Godot (parte inferior)
- Los errores mostrarán la línea específica del problema

## 👨‍💻 Desarrollo

### Modificar el Juego

1. **Cambiar tiempo límite**: Edita `UI_Time.gd` línea 3, modifica `@export var time = 30`
2. **Cambiar monedas requeridas**: Edita `UI.gd` línea 4, modifica `@export var coins_required: int = 6`
3. **Agregar más monedas**: Arrastra `coin.tscn` a la escena `Map.tscn`
4. **Modificar velocidad del gato**: Edita `PlayerMov.gd`, ajusta las variables de velocidad

### Agregar Nuevas Funcionalidades

El proyecto usa **GDScript** (lenguaje de Godot similar a Python). Para agregar nuevas características:

1. Crea un nuevo script en `Scripts/`
2. Añádelo a un nodo en tu escena
3. Usa señales para comunicación entre nodos

## 📝 Créditos

- **Sprites del gato**: [Ver License.txt en Assets/Cat/]
- **Engine**: Godot Engine 4.x
- **Desarrollador**: USUARIO

## 📄 Licencia

Este proyecto es de código abierto. Puedes modificarlo y distribuirlo libremente.

## 🔗 Enlaces Útiles

- [Documentación de Godot 4](https://docs.godotengine.org/en/stable/)
- [Comunidad de Godot en Español](https://godotengine.org/community/)
- [Tutoriales de Godot](https://docs.godotengine.org/en/stable/community/tutorials.html)

---

**¡Disfruta del juego! 🐱💰**
