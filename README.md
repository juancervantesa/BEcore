# Backend de Proyecto - .NET Core 9

## 📋 Descripción del Proyecto
Proyecto realizao para el modulo 1 de la Maestria de Ingenieria de SW.

## 🚀 Tecnologías Utilizadas
- .NET Core 9
- Entity Framework Core
- SQL Server
  

## 🔧 Requisitos Previos
- [Versión] de .NET Core SDK
- SQL Server 2019 o superior
- Visual Studio 2022 o Visual Studio Code

## 📦 Instalación

### Clonar Repositorio
```bash
git clone https://github.tu-usuario/tu-repositorio.git](https://github.com/juancervantesa/BEcore.git
cd BEseguridad
```

### Configurar Base de Datos
1. Ejecutar script de creación de base de datos
2. Configurar cadena de conexión en `appsettings.json`

## 📄 Estructura del Proyecto
```
proyecto-backend/
│
├── Controllers/
├── Dtos/
├── Models/
├── Utilidades/
├──base de datos.sql
├── appsettings.json
└── Program.cs
```

## 🗄️ Script de Creación de Base de Datos
Ejecuta el script SQL para crear la base de datos y tablas necesarias.

## 🔐 Configuración de Conexión
Ejemplo de configuración en `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "SeguridadInformatica": "Data Source=PC-Jota\\SQLEXPRESS;Database=SeguridadInformatica;Trusted_Connection=True;TrustServerCertificate=True;"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning"
    }
  }
}
```

## 🛠️ Configuración y Ejecución

### Restaurar Paquetes
```bash
dotnet restore
```

### Crear Migraciones (Entity Framework)
```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
este paso en caso de que sea necesario de actulizar algunos campos en la base de datos
```

### Ejecutar Proyecto
```bash
dotnet run
```

## 🤝 Contribuciones
Guías para contribuir al proyecto en desarrollo


## 🔍 Notas Importantes
- Mantener actualizado el README

