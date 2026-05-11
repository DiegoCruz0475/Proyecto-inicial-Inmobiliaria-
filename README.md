# Proyecto-inicial-Inmobiliaria-
## Actúa como un administrador de base de datos: Proyecto Inmobiliaria, venta de casas, que entidades se necesitan pata su gestión

Como administrador de bases de datos, aquí te presento las entidades clave para un sistema de gestión de una inmobiliaria de venta de casas, junto con un diagrama entidad-relación:Aquí el desglose de cada entidad y su propósito dentro del sistema:

**Entidades principales:**

`CLIENTE` — persona física o moral interesada en comprar. El campo `tipo` distingue entre cliente individual, empresa o inversionista.

`AGENTE` — el vendedor/asesor de la inmobiliaria. Lleva su porcentaje de comisión y licencia de corredor.

`PROPIEDAD` — el corazón del sistema. Registra todas las características físicas, precio de lista y su estatus (disponible, en proceso, vendida, etc.).

`COLONIA` — catálogo geográfico separado para evitar duplicar información y facilitar búsquedas por zona.

**Entidades de proceso:**

`VISITA` — registra cada cita de recorrido. Permite saber cuántas visitas tuvo una propiedad antes de venderse y medir la efectividad de cada agente.

`VENTA` — el evento central del negocio. Registra precio final, forma de pago (contado, crédito bancario, INFONAVIT, etc.) y vincula las tres partes: cliente, agente y propiedad.

`CONTRATO` — formaliza la venta. Guarda datos del enganche, monto total y el tipo (promesa de compraventa, escritura definitiva, etc.).

`NOTARIO` — entidad separada para gestionar qué notaría formaliza cada escritura.

`IMAGEN_PROPIEDAD` — tabla de galería fotográfica para el portal/catálogo de propiedades.

**Decisiones de diseño importantes:**

Una propiedad solo puede tener una venta (relación 1:1), pero sí puede tener múltiples visitas. El agente se registra tanto en la propiedad (quién la administra) como en la venta (quién cerró el trato), porque pueden ser personas distintas. La colonia está normalizada en su propia tabla para no repetir datos geográficos en cada propiedad.

¿Quieres que profundice en alguna entidad, agregue módulos adicionales como inventario de documentos, comisiones desglosadas o integración con portales como Inmuebles24?

<img width="788" height="686" alt="image" src="https://github.com/user-attachments/assets/1551fa62-1695-4752-9fab-9276fd1b6707" />

## Las entidades con sus atributos y tipo de forma de la tabla para cada una de las entidades

<img width="797" height="462" alt="image" src="https://github.com/user-attachments/assets/b2655abe-91eb-4459-a22c-6423c9d2f1d8" />
<img width="783" height="655" alt="image" src="https://github.com/user-attachments/assets/2d4a9227-d54c-4f59-b2a1-8a95dca73682" />
<img width="786" height="699" alt="image" src="https://github.com/user-attachments/assets/cb02fa2d-ba33-4cf1-a56d-4c5e19129bbd" />
<img width="717" height="661" alt="image" src="https://github.com/user-attachments/assets/05fc230c-4cf2-44ea-a702-39989afd0737" />
<img width="617" height="671" alt="image" src="https://github.com/user-attachments/assets/080ddb4c-408e-4ff7-acaa-f8773a044bc1" />
<img width="601" height="254" alt="image" src="https://github.com/user-attachments/assets/c4ac4048-e5d8-4050-af94-326371f76084" />

Aquí tienes las 9 entidades con todos sus atributos, tipos de dato y restricciones. Algunos criterios de diseño importantes que vale la pena destacar:
Sobre los tipos de dato:
UUID en todas las llaves primarias en lugar de INT AUTO_INCREMENT, porque permite generar IDs desde la aplicación sin depender del motor de base de datos, útil si algún día se escala a múltiples servidores.
DECIMAL(14,2) para todos los montos monetarios — nunca FLOAT ni DOUBLE porque introducen errores de precisión en cálculos financieros.
DECIMAL(3,1) para baños permite registrar medios baños (ej. 2.5), práctica muy común en el sector inmobiliario mexicano.
ENUM en campos como estatus, tipo y forma_pago garantizan integridad de dominio directamente en la base de datos, sin depender de la aplicación.
Sobre las restricciones:
El campo id_propiedad en VENTA lleva UNIQUE para reforzar la regla de negocio de que una propiedad solo se vende una vez. Lo mismo aplica para id_venta en CONTRATO (relación 1:1).
CHECK > 0 en precios y comisiones evita registrar valores negativos o ceros erróneos.
¿Quieres que genere el script DDL en SQL p

## De acuerdo a tu respuesta anterior puedes generar un script en sql para descargar con el nombre de bdyeyodwelings.sql para las 10 entidades con sus relaciones
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

