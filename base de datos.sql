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
    Password NVARCHAR(255) NOT NULL, -- Almacenar siempre hash, no contrase�as en texto plano
    EsAdmin BIT DEFAULT 0,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de categor�as de amenazas
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

-- Tabla de art�culos
CREATE TABLE Articulos (
    ArticuloID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(200) NOT NULL,
    Contenido NVARCHAR(MAX) NOT NULL,
    FechaPublicacion DATETIME DEFAULT GETDATE(),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID)
);
GO

-- Insertar datos iniciales

-- Categor�as de amenazas
INSERT INTO CategoriasAmenazas (Nombre)
VALUES 
('Malware'),
('Phishing'),
('Ataques a infraestructura'),
('Ingenier�a social'),
('Vulnerabilidades de software');

-- Usuario administrador inicial
INSERT INTO Usuarios (Nombre, Email, Username, Password, EsAdmin)
VALUES ('Admin', 'admin@seguridadinformatica.com', 'admin', 'hashed_password_here', 1);

-- Amenazas
INSERT INTO Amenazas (CategoriaID, Titulo, Descripcion, NivelRiesgo) 
VALUES 
(1, 'Ransomware', 'Malware que cifra archivos y exige un rescate.', 5),
(2, 'Phishing por correo', 'Suplantaci�n de identidad a trav�s de correos electr�nicos falsos.', 4),
(3, 'DDoS', 'Ataque de denegaci�n de servicio para saturar recursos.', 5),
(4, 'Ingenier�a social en persona', 'Manipulaci�n psicol�gica para obtener informaci�n.', 3),
(5, 'Explotaci�n de vulnerabilidad', 'Uso de fallos de software no parcheados.', 4);

-- Recursos
INSERT INTO Recursos (Titulo, Descripcion, EnlaceURL) 
VALUES 
('Gu�a de protecci�n contra Ransomware', 'Instrucciones para prevenir y mitigar ransomware.', 'https://ejemplo.com/ransomware'),
('Detecci�n de Phishing', 'C�mo identificar correos electr�nicos de phishing.', 'https://ejemplo.com/phishing'),
('Protecci�n contra DDoS', 'Mejores pr�cticas para mitigar ataques DDoS.', 'https://ejemplo.com/ddos');

-- Art�culos

INSERT INTO Articulos (Titulo, Contenido, UsuarioID) 
VALUES 
('C�mo protegerse del ransomware', 'Este art�culo cubre estrategias para evitar ransomware.', 1),
('Identificando correos de phishing', 'C�mo reconocer intentos de phishing en el correo.', 1);
