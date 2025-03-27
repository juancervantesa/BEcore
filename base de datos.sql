-- Crear la base de datos
CREATE DATABASE SeguridadInformatica;
GO

-- Usar la base de datos creada
USE SeguridadInformatica;
GO

-- Tabla de usuarios
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL, -- Almacenar siempre hash, no contraseñas en texto plano
    EsAdmin BIT DEFAULT 0,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de categorías de amenazas
CREATE TABLE CategoriasAmenazas (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Tabla de amenazas
CREATE TABLE Amenazas (
    AmenazaID INT IDENTITY(1,1) PRIMARY KEY,
    CategoriaID INT FOREIGN KEY REFERENCES CategoriasAmenazas(CategoriaID),
    Titulo NVARCHAR(200) NOT NULL,
    Descripcion NVARCHAR(MAX) NOT NULL,
    NivelRiesgo INT NOT NULL, -- 1-5
    FechaPublicacion DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de recursos
CREATE TABLE Recursos (
    RecursoID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(200) NOT NULL,
    Descripcion NVARCHAR(MAX) NOT NULL,
    EnlaceURL NVARCHAR(255) NULL
);
GO

-- Tabla de artículos
CREATE TABLE Articulos (
    ArticuloID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(200) NOT NULL,
    Contenido NVARCHAR(MAX) NOT NULL,
    FechaPublicacion DATETIME DEFAULT GETDATE(),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID)
);
GO

-- Insertar datos iniciales

-- Categorías de amenazas
INSERT INTO CategoriasAmenazas (Nombre)
VALUES 
('Malware'),
('Phishing'),
('Ataques a infraestructura'),
('Ingeniería social'),
('Vulnerabilidades de software');

-- Usuario administrador inicial
INSERT INTO Usuarios (Nombre, Email, Username, Password, EsAdmin)
VALUES ('Admin', 'admin@seguridadinformatica.com', 'admin', 'hashed_password_here', 1);

-- Amenazas
INSERT INTO Amenazas (CategoriaID, Titulo, Descripcion, NivelRiesgo) 
VALUES 
(1, 'Ransomware', 'Malware que cifra archivos y exige un rescate.', 5),
(2, 'Phishing por correo', 'Suplantación de identidad a través de correos electrónicos falsos.', 4),
(3, 'DDoS', 'Ataque de denegación de servicio para saturar recursos.', 5),
(4, 'Ingeniería social en persona', 'Manipulación psicológica para obtener información.', 3),
(5, 'Explotación de vulnerabilidad', 'Uso de fallos de software no parcheados.', 4);

-- Recursos
INSERT INTO Recursos (Titulo, Descripcion, EnlaceURL) 
VALUES 
('Guía de protección contra Ransomware', 'Instrucciones para prevenir y mitigar ransomware.', 'https://ejemplo.com/ransomware'),
('Detección de Phishing', 'Cómo identificar correos electrónicos de phishing.', 'https://ejemplo.com/phishing'),
('Protección contra DDoS', 'Mejores prácticas para mitigar ataques DDoS.', 'https://ejemplo.com/ddos');

-- Artículos
INSERT INTO Articulos (Titulo, Contenido, UsuarioID) 
VALUES 
('Cómo protegerse del ransomware', 'Este artículo cubre estrategias para evitar ransomware.', 1),
('Identificando correos de phishing', 'Cómo reconocer intentos de phishing en el correo.', 1);
