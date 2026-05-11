CREATE DATABASE inmobiliaria;
USE inmobiliaria;

-- =========================
-- TABLA: clientes
-- =========================
CREATE TABLE clientes (
    id_cliente CHAR(36) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    rfc VARCHAR(20),
    tipo VARCHAR(50)
);

-- =========================
-- TABLA: colonias
-- =========================
CREATE TABLE colonias (
    id_colonia CHAR(36) PRIMARY KEY,
    nombre VARCHAR(100),
    municipio VARCHAR(100),
    estado VARCHAR(100),
    cp VARCHAR(10)
);

-- =========================
-- TABLA: agentes
-- =========================
CREATE TABLE agentes (
    id_agente CHAR(36) PRIMARY KEY,
    nombre VARCHAR(100),
    numero_patente VARCHAR(50),
    telefono VARCHAR(20)
);

-- =========================
-- TABLA: propiedades
-- =========================
CREATE TABLE propiedades (
    id_propiedad CHAR(36) PRIMARY KEY,
    tipo VARCHAR(50),
    direccion VARCHAR(255),
    precio_lista DECIMAL(12,2),
    m2_terreno INT,
    m2_construccion INT,
    habitaciones INT,
    banos INT,
    cajones INT,
    estatus VARCHAR(50),

    id_agente CHAR(36),
    id_colonia CHAR(36),

    FOREIGN KEY (id_agente) REFERENCES agentes(id_agente),
    FOREIGN KEY (id_colonia) REFERENCES colonias(id_colonia)
);

-- =========================
-- TABLA: ventas
-- =========================
CREATE TABLE ventas (
    id_venta CHAR(36) PRIMARY KEY,
    fecha_venta DATE,
    precio_final DECIMAL(12,2),
    forma_pago VARCHAR(50),

    id_propiedad CHAR(36),
    id_cliente CHAR(36),
    id_agente CHAR(36),

    FOREIGN KEY (id_propiedad) REFERENCES propiedades(id_propiedad),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_agente) REFERENCES agentes(id_agente)
);

-- =========================
-- TABLA: contratos
-- =========================
CREATE TABLE contratos (
    id_contrato CHAR(36) PRIMARY KEY,
    fecha_firma DATE,
    tipo VARCHAR(50),
    enganche DECIMAL(12,2),
    monto_total DECIMAL(12,2),

    id_venta CHAR(36),
    id_notario CHAR(36),

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_notario) REFERENCES agentes(id_agente)
);

-- =========================
-- TABLA: visitas
-- =========================
CREATE TABLE visitas (
    id_visita CHAR(36) PRIMARY KEY,
    fecha_hora DATETIME,
    notas TEXT,
    resultado VARCHAR(100),

    id_propiedad CHAR(36),
    id_cliente CHAR(36),
    id_agente CHAR(36),

    FOREIGN KEY (id_propiedad) REFERENCES propiedades(id_propiedad),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_agente) REFERENCES agentes(id_agente)
);

-- =========================
-- TABLA: imagenes_propiedad
-- =========================
CREATE TABLE imagenes_propiedad (
    id_imagen CHAR(36) PRIMARY KEY,
    url VARCHAR(255),
    descripcion VARCHAR(255),
    es_principal BOOLEAN,

    id_propiedad CHAR(36),

    FOREIGN KEY (id_propiedad) REFERENCES propiedades(id_propiedad)
);