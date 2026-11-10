# Adobe Genuine Service AGS - Minimized English Repository

## Project Overview

Adobe Genuine Service (AGS) Minimized Repository - A minimal Git repository for documentation and file storage related to Adobe's Authentication Genuine Service (AGS) in Windows environments.

**Note:** This is a *minimized* repository containing only documentation and large file storage via Git LFS. It does not contain executable code or business logic.

## Problem Solved

Centralization of Adobe product installation paths, documentation, and blocking scripts for Adobe Genuine Service (AGS) and AdobeGCClient in Windows environments.

## Technological Scope

- **Large file storage** via Git LFS (exceeds GitHub's 100 MB per file limit)
- **Documentation** of Adobe product installation directories
- **PowerShell scripts** for blocking/disabling Adobe services (AGSService, AdobeGCClient)
- **No database**, concurrency mechanisms, real-time processing, or custom network protocols

## Key Features

- ✅ Git LFS for large file storage (AcrobatProfessional20.0-mul.rar)
- ✅ Consolidated installation path documentation
- ✅ Blocking scripts for Adobe services
- ✅ Minimized structure - only essential files tracked
- ✅ All text content in English

## Technology Stack

| Category | Technology |
|----------|-----------|
| Version Control | Git 2.0 or superior |
| Large File Storage | Git LFS (Large File Storage) |
| Scripts | PowerShell |
| Target OS | Windows |

## How to Use

### Clone the Repository

```bash
git lfs install
git clone https://github.com/Matthew-Garay/Adobe-Genuine-Service-AGS-Alert.git
cd Adobe-Genuine-Service-AGS-Alert
git lfs pull
```

### View Installation Paths

See `adobe-installation-paths.txt` for Adobe product directory information.

### Block Adobe Services

The `scripts/` directory contains PowerShell scripts for blocking Adobe services.

### Large Files

The `AcrobatProfessional20.0-mul.rar` file is stored via Git LFS. Use `git lfs pull` to download it.

## Repository Structure

```
Adobe-Genuine-Service-AGS-Alert/
├── .gitattributes          # Git LFS configuration
├── .gitignore              # Git ignore rules
├── ABOUT.md                # Additional project documentation
├── AcrobatProfessional20.0-mul.rar  # Large file (Git LFS)
├── adobe-installation-paths.txt  # Installation path documentation
├── README.md               # This file - minimized English overview
├── README.md               # Project overview (English)
├── Rutas-Adobe.txt         # Installation paths (Spanish original)
└── scripts/
    └── BloqueoAdobeDiario.ps1  # Adobe blocking script
```

## Author

**Matthew Ilveneff Garay Perez**  
Email: 1911.garay.perez@gmail.com

## Repository Status

- ✅ Minimized to essential files only
- ✅ All text in English
- ✅ Properly tracked on GitHub
- ✅ Git LFS configured for large files
