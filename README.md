# Adobe Genuine Service (AGS) - Repositorio de Soporte

Repositorio interno para documentación, archivos de respaldo y notas de configuración relacionadas con el servicio de autenticación genuina de Adobe (Adobe Genuine Service, AGS) y la gestión de instalaciones de productos Adobe.

## Contenido actual

| Archivo | Descripción |
|---------|-------------|
| `Ruta.txt` | Información sobre rutas de instalación y directorios utilizados por los productos Adobe. |
| `Bloqueo adobe.txt` | Notas internas sobre procedimientos de control y bloqueo de servicios de Adobe. |
| `AcrobatProfessional20.0-mul.rar` | Instalador de Acrobat Professional 2020 (almacenado con Git LFS). |

## ⚠️ Limitación de GitHub

Debido a las reglas de GitHub, los archivos mayores a 100 MB no se pueden subir directamente a un repositorio.  
Archivos grandes como `AcrobatProfessional20.0-mul.rar` (aprox. 720 MB) se gestionan mediante **Git LFS (Large File Storage)**.

Las cuentas gratuitas de GitHub tienen un límite de **1 GB de almacenamiento LFS**.

## ⚖️ Aviso de uso

Este repositorio es de uso personal y tiene fines de documentación interna.  
**No distribuyas ni uses este contenido para eludir licencias, activación o autenticación de software de terceros.**  
El uso indebido puede violar los Términos de Servicio de Adobe y las políticas de GitHub.

## Cómo clonar este repositorio

Este repositorio utiliza Git LFS para archivos grandes. Asegúrate de tener Git LFS instalado antes de clonar:

```bash
# Instalar Git LFS (una sola vez)
git lfs install

# Clonar el repositorio
git clone https://github.com/Matthew-Garay/Adobe-Genuine-Service-AGS-Alert.git

# Si ya clonaste sin LFS, descarga los archivos LFS existentes:
git lfs pull
```

## Requisitos

- Git 2.0 o superior
- Git LFS instalado (`git lfs install`)
- Conexión a Internet para descargar archivos LFS

---

**Repositorio:** Adobe-Genuine-Service-AGS-Alert  
**Última actualización:** 23/10/2026
