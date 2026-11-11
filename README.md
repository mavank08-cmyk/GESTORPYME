# GestorPyme

Prototipo local para administrar negocio, proveedores, productos, inventario y reportes. Se estructura a partir de `Plan_desarrollo_GestorPyme_SQLite.md` con React + Vite, Express y SQLite. La base de datos se crea al iniciar el servidor en `data/gestorpyme.db`.

## Requisitos

- fnm (Fast Node Manager), Node.js 22.x y npm.
- Windows, macOS o Linux. En Windows, instalar las herramientas de compilación de módulos nativos si `better-sqlite3` las solicita.

## Instalar fnm y Node.js 22

En Windows, instala fnm con WinGet desde PowerShell:

```powershell
winget install Schniz.fnm
```

Cierra y vuelve a abrir PowerShell. Para que fnm configure Node.js automáticamente en cada sesión, agrega esta línea al perfil de PowerShell (`notepad $PROFILE`):

```powershell
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
```

Instala y activa Node.js 22:

```powershell
fnm install 22
fnm use 22
node -v
npm -v
```

`node -v` debe mostrar una versión `v22.x`. En macOS y Linux, instala fnm con el gestor de paquetes de tu sistema siguiendo la [guía oficial de fnm](https://github.com/Schniz/fnm#installation), luego ejecuta `fnm install 22` y `fnm use 22`.

## Instalación y ejecución

Desde la carpeta raíz del proyecto:

```bash
npm install
npm install --prefix client
npm install --prefix server
npm run dev
```

Abre `http://localhost:5173`. El servidor API utiliza `http://localhost:3001`.

Para generar la versión compilada del cliente, ejecuta `npm run build`. Para ejecutar solo el servidor con `npm start`.

## Acceso demostrativo

- Usuario: `admin`
- Contraseña: `gestorpyme`

Este acceso local es demostrativo, no constituye autenticación segura para producción.

## Módulos incluidos

- Inicio de sesión y panel principal.
- Datos del negocio, proveedores y productos.
- Registro de entradas y salidas, con bloqueo de salidas superiores al inventario calculado.
- Selección de reportes, reporte de inventario y reporte gráfico de movimientos.

El inventario se obtiene de la existencia inicial más entradas menos salidas. Los movimientos se registran en una transacción SQLite; proveedores y productos se desactivan conservando el historial.

## Referencia visual

El plan indica que Figma es la referencia prioritaria, pero el documento disponible no incluye un enlace ni capturas del diseño. La interfaz inicial conserva los módulos y navegación del plan; debe compararse con las nueve pantallas originales para ajustar colores, textos y composición visual.
