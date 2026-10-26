# Adobe Genuine Service AGS - Repositorio de Soporte

## A. Titulo del Proyecto y Resumen Ejecutivo

Adobe Genuine Service AGS es un repositorio interno de documentacion y archivos de respaldo relacionados con el servicio de autenticacion genuina de Adobe (Adobe Genuine Service, AGS) y la gestion de instalaciones de productos Adobe en entornos Windows. El problema que resuelve es la centralizacion de rutas de instalacion, directorios de productos y scripts de configuracion para el bloqueo o deshabilitacion de servicios de Adobe como AGSService, AdobeGCClient y tareas programadas asociadas. Su alcance tecnologico se limita a documentacion interna y almacenamiento de archivos grandes mediante Git LFS, sin componentes de ejecucion ni logica de negocio.

## B. Arquitectura del Sistema

Este repositorio no implementa una arquitectura de software ejecutable. Funciona como repositorio de documentacion y almacenamiento de archivos binarios. El flujo de datos consiste en la clonacion del repositorio local, la descarga de archivos LFS mediante git lfs pull y la consulta de los archivos de texto y scripts para referencia interna. No hay componentes cliente-servidor, capas logicas ni interaccion entre modulos de software.

## C. Caracteristicas Tecnicas Clave

- Almacenamiento de archivos grandes mediante Git LFS (Large File Storage) para superar el limite de 100 MB por archivo en GitHub.
- Scripts de PowerShell para bloquear o deshabilitar servicios de Adobe (AGSService, AdobeGCClient) y tareas programadas asociadas.
- Documentacion de rutas de instalacion y directorios de productos Adobe.
- No utiliza base de datos, ni mecanismos de concurrencia, ni procesamiento en tiempo real, ni protocolos de red propios.
- Seguridad basada en el control de acceso del repositorio y en el aviso de uso interno; no hay autenticacion de aplicacion ni cifrado de datos en reposo.

## D. Especificacion del Stack Tecnologico

| Categoria | Tecnologia / Libreria |
|-----------|----------------------|
| Control de versiones | Git 2.0 o superior |
| Almacenamiento de archivos grandes | Git LFS (Large File Storage) |
| Scripts | PowerShell |
| Sistema operativo objetivo | Windows |

## E. Guia de Instalacion, Configuracion y Despliegue

### Requisitos previos del sistema

- Git 2.0 o superior instalado.
- Git LFS instalado (git lfs install).
- Conexion a Internet para descargar archivos LFS.
- Sistema operativo Windows para ejecucion de scripts de PowerShell.

### Secuencia de comandos para clonacion e instalacion

git lfs install
git clone https://github.com/Matthew-Garay/Adobe-Genuine-Service-AGS-Alert.git
cd Adobe-Genuine-Service-AGS-Alert
git lfs pull

### Configuracion de variables de entorno

Este proyecto no requiere archivo .env ni variables de entorno.

### Comandos para ejecucion en entorno de Desarrollo

No aplica; es un repositorio de documentacion y respaldo de archivos.

### Comandos para ejecucion en entorno de Produccion

No aplica; es un repositorio de documentacion y respaldo de archivos.

## F. Creditos de Autoría

Desarrollado por: Matthew Ilveneff Garay Perez
Correo Electronico: 1911.garay.perez@gmail.com
