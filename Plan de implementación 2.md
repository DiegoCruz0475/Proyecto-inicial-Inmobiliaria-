# FASE 1: Cimientos y Configuración — Proyecto “Yeyo Dwellings”

## Objetivo de esta fase

En esta primera etapa vamos a construir una base sólida y profesional para tu app inmobiliaria usando:

* Flutter
* Firebase
* Provider (manejo de estado)
* Arquitectura escalable por capas

La meta es que tu proyecto quede preparado como una aplicación real de producción, no solo un proyecto escolar.

---

# 1. Arquitectura Profesional del Proyecto

Desde el inicio debes trabajar con una estructura limpia.

## Estructura de Carpetas

```plaintext
lib/
│
├── main.dart
│
├── models/
│   ├── property_model.dart
│   ├── user_model.dart
│   └── appointment_model.dart
│
├── services/
│   ├── auth_service.dart
│   ├── property_service.dart
│   ├── appointment_service.dart
│   └── storage_service.dart
│
├── providers/
│   ├── auth_provider.dart
│   └── property_provider.dart
│
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   │
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── property_detail_screen.dart
│   │   └── search_screen.dart
│   │
│   ├── admin/
│   │   ├── admin_dashboard.dart
│   │   ├── add_property_screen.dart
│   │   └── edit_property_screen.dart
│   │
│   └── profile/
│       └── profile_screen.dart
│
├── widgets/
│   ├── property_card.dart
│   ├── custom_textfield.dart
│   ├── custom_button.dart
│   └── loading_widget.dart
│
└── utils/
    ├── app_colors.dart
    ├── validators.dart
    └── constants.dart
```

---

# 2. Crear el Proyecto Flutter

## Instalar Flutter

Descarga Flutter desde:

[Flutter SDK Oficial](https://flutter.dev?utm_source=chatgpt.com)

Verifica instalación:

```bash
flutter doctor
```

Debes tener:

* Flutter SDK
* Android Studio
* Android SDK
* Visual Studio Code (opcional)

---

# 3. Crear el Proyecto

Abre terminal:

```bash
flutter create yeyo_dwellings
```

Entrar al proyecto:

```bash
cd yeyo_dwellings
```

Abrir en VSCode:

```bash
code .
```

---

# 4. Crear Proyecto en Firebase

Ve a:

[Firebase Console](https://console.firebase.google.com?utm_source=chatgpt.com)

---

# 5. Crear Proyecto Firebase

## PASOS

### 1. Crear Proyecto

Nombre:

```plaintext
yeyo-dwellings
```

### 2. Desactivar Google Analytics (por ahora)

Puedes activarlo después.

---

# 6. Conectar Android con Firebase

## En Flutter

Agrega app Android.

### Android Package Name

Ve a:

```plaintext
android/app/src/main/AndroidManifest.xml
```

Busca:

```xml
package="com.example.yeyo_dwellings"
```

Usa ese package.

Ejemplo:

```plaintext
com.yeyo.dwellings
```

---

# 7. Descargar google-services.json

Firebase te dará:

```plaintext
google-services.json
```

Colócalo en:

```plaintext
android/app/
```

---

# 8. Configuración Gradle

## android/build.gradle

Agrega:

```gradle
classpath 'com.google.gms:google-services:4.4.2'
```

Dentro de:

```gradle
dependencies
```

---

## android/app/build.gradle

Agrega al final:

```gradle
apply plugin: 'com.google.gms.google-services'
```

---

# 9. Habilitar Firebase Authentication

En Firebase:

```plaintext
Build → Authentication → Get Started
```

Habilita:

```plaintext
Email/Password
```

Esto permitirá:

* Registro
* Login
* Persistencia de sesión

---

# 10. Configurar Cloud Firestore

Ve a:

```plaintext
Build → Firestore Database
```

## Crear Base de Datos

Modo:

```plaintext
Start in test mode
```

Región recomendada:

```plaintext
us-central1
```

Después ajustaremos reglas de seguridad.

---

# 11. Configurar Firebase Storage

Ve a:

```plaintext
Build → Storage
```

Presiona:

```plaintext
Get Started
```

Modo test inicialmente.

---

# 12. Dependencias Profesionales

## pubspec.yaml

Reemplaza dependencias por esto:

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8

  # FIREBASE
  firebase_core: ^3.13.0
  firebase_auth: ^5.5.2
  cloud_firestore: ^5.6.6
  firebase_storage: ^12.4.5

  # STATE MANAGEMENT
  provider: ^6.1.2

  # IMAGE PICKER
  image_picker: ^1.1.2

  # UTILIDADES
  intl: ^0.20.2
  uuid: ^4.5.1
```

---

# 13. Instalar Dependencias

En terminal:

```bash
flutter pub get
```

---

# 14. Configuración Firebase CLI (IMPORTANTE)

Instala FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
```

Verifica:

```bash
flutterfire --version
```

---

# 15. Configurar FlutterFire

En raíz del proyecto:

```bash
flutterfire configure
```

Selecciona:

* Firebase Project
* Android

Esto generará:

```plaintext
firebase_options.dart
```

MUY IMPORTANTE:
Ese archivo conecta automáticamente Flutter con Firebase.

---

# 16. main.dart Profesional

Ahora sí inicializamos Firebase correctamente.

## lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yeyo Dwellings',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Yeyo Dwellings',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
```

---

# 17. Explicación Profunda — ¿Qué Hace Cada Parte?

---

## WidgetsFlutterBinding.ensureInitialized()

```dart
WidgetsFlutterBinding.ensureInitialized();
```

Inicializa comunicación entre Flutter y el motor nativo.

SIN esto:
Firebase puede fallar antes de arrancar.

---

## Firebase.initializeApp()

```dart
await Firebase.initializeApp();
```

Conecta tu aplicación Flutter con Firebase.

Es literalmente el “encendido” del backend.

---

## MultiProvider

```dart
MultiProvider(
```

Permite inyectar estados globales.

Ejemplo:

* Usuario autenticado
* Lista de propiedades
* Favoritos
* Perfil admin

Provider evita:

* Código desordenado
* StatefulWidgets gigantes
* Variables globales peligrosas

---

# 18. StatefulWidget vs Provider (Explicación Profesional)

---

# StatefulWidget

Sirve para estados LOCALES.

Ejemplo:

* Mostrar password
* Animaciones
* Tabs
* Formularios temporales

---

## Ciclo de Vida Completo

### createState()

```dart
createState()
```

Crea el estado del widget.

---

### initState()

```dart
initState()
```

Se ejecuta UNA sola vez.

Perfecto para:

* Llamadas API
* Streams
* Inicializaciones

---

### build()

```dart
build()
```

Dibuja UI.

Cada `setState()` vuelve a ejecutar build.

---

### dispose()

```dart
dispose()
```

Limpia memoria:

* Controllers
* Streams
* Animaciones

MUY IMPORTANTE en apps grandes.

---

# Provider

Provider sirve para estados GLOBALES.

Ejemplos:

* Usuario logueado
* Propiedades
* Filtros
* Tema oscuro

---

## ¿Por qué Provider es mejor aquí?

Porque tendrás:

* Login global
* Catálogo dinámico
* Actualizaciones en tiempo real
* Panel admin

Sin Provider:
el proyecto se vuelve inmantenible rápidamente.

---

# 19. Firestore — Diseño Profesional de Base de Datos

Tu estructura NoSQL será así:

```plaintext
users/
    userId/
        name
        email
        role

properties/
    propertyId/
        title
        location
        price
        bedrooms
        squareMeters
        type
        operation
        imageUrl

appointments/
    appointmentId/
        userId
        propertyId
        visitDate
```

---

# 20. Roles de Usuario

MUY IMPORTANTE.

Usaremos:

```plaintext
admin
client
```

Admin:

* CRUD completo

Cliente:

* Ver propiedades
* Agendar visitas

---

# 21. Seguridad Recomendada Firestore

Más adelante haremos reglas avanzadas.

Por ahora:

```plaintext
allow read, write: if request.auth != null;
```

Esto evita acceso sin login.

---

# 22. Branding Profesional para “Yeyo Dwellings”

Como tu proyecto busca verse premium:

## Recomendaciones UI

### Colores

```plaintext
Azul Marino
Negro
Blanco
Cian elegante
```

### Estilo

Minimalista + lujo moderno.

Muy tipo:

* Zillow
* Airbnb
* Century 21

---

# 23. Errores Comunes que Debes Evitar

## ❌ NO meter lógica Firebase en screens

Mala práctica:

```dart
FirebaseFirestore.instance.collection(...)
```

directamente en UI.

---

## ✅ Usa Services

Correcto:

```dart
PropertyService()
```

---

## ❌ NO usar setState para toda la app

Escala horrible.

---

## ✅ Usa Provider

Más limpio y profesional.

---

# 24. Qué Tendrás al Final del Proyecto

Una app REAL con:

✅ Login y registro
✅ Catálogo inmobiliario
✅ CRUD admin
✅ Firebase Storage
✅ Firestore realtime
✅ Buscador y filtros
✅ Simulador hipotecario
✅ Agendamiento de visitas
✅ Arquitectura escalable
✅ Código profesional estilo industria

---

# 25. Checklist Final de la FASE 1

Antes de avanzar debes tener:

✅ Proyecto Flutter creado
✅ Firebase conectado
✅ Auth habilitado
✅ Firestore habilitado
✅ Storage habilitado
✅ Dependencias instaladas
✅ flutterfire configure ejecutado
✅ main.dart funcionando
✅ App abre correctamente

---

# Resultado Esperado

Cuando ejecutes:

```bash
flutter run
```

Debe aparecer:

```plaintext
Yeyo Dwellings
```

sin errores.

---

# FASE 2: Capa de Datos (Modelos + Servicios)

Ahora vamos a construir el núcleo profesional de la aplicación.

En esta fase crearás:

✅ Modelos tipados
✅ Conversión Firestore ↔ Dart
✅ Servicios centralizados
✅ CRUD completo
✅ Arquitectura limpia
✅ Queries y Streams en tiempo real
✅ Preparación para Provider

Esta es la fase más importante técnicamente.
Si la haces bien, todo lo demás será muchísimo más fácil.

---

# Objetivo Arquitectónico

Queremos evitar esto:

```dart id="n6w7c7"
FirebaseFirestore.instance.collection('properties')
```

repetido en todas partes.

Eso destruye:

* mantenimiento,
* escalabilidad,
* testing,
* orden.

---

# Arquitectura Correcta

```plaintext id="o0dz7g"
UI (Screens)
   ↓
Provider
   ↓
Services
   ↓
Firebase
```

---

# 1. MODELOS (Models)

Los modelos representan estructuras reales de datos.

En tu app tendrás:

```plaintext id="6eh7jd"
PropertyModel
UserModel
AppointmentModel
```

---

# 2. Crear property_model.dart

Ruta:

```plaintext id="42yykt"
lib/models/property_model.dart
```

---

## Código Completo

```dart id="20iwp6"
class PropertyModel {
  final String id;
  final String title;
  final String location;
  final double price;
  final int bedrooms;
  final double squareMeters;
  final String type;
  final String operation;
  final String imageUrl;

  PropertyModel({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.squareMeters,
    required this.type,
    required this.operation,
    required this.imageUrl,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map, String documentId) {
    return PropertyModel(
      id: documentId,
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      bedrooms: map['bedrooms'] ?? 0,
      squareMeters: (map['squareMeters'] ?? 0).toDouble(),
      type: map['type'] ?? '',
      operation: map['operation'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'price': price,
      'bedrooms': bedrooms,
      'squareMeters': squareMeters,
      'type': type,
      'operation': operation,
      'imageUrl': imageUrl,
    };
  }
}
```

---

# Explicación Profesional

---

## factory fromMap()

Convierte datos Firestore → Objeto Dart.

Firestore entrega:

```json id="3xgxtw"
{
  "title": "Casa Moderna",
  "price": 450000
}
```

y `fromMap()` lo transforma en:

```dart id="d1y92s"
PropertyModel(...)
```

---

## toMap()

Hace lo contrario:

Dart → Firestore.

---

# ¿Por qué usar modelos?

SIN modelos:

❌ caos
❌ dynamic everywhere
❌ errores difíciles
❌ código inseguro

CON modelos:

✅ tipado fuerte
✅ autocompletado
✅ escalabilidad
✅ mantenimiento profesional

---

# 3. Crear user_model.dart

Ruta:

```plaintext id="k8w2wv"
lib/models/user_model.dart
```

---

## Código

```dart id="d5kk3h"
class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return UserModel(
      uid: documentId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'client',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
```

---

# 4. Crear appointment_model.dart

Ruta:

```plaintext id="i50yhf"
lib/models/appointment_model.dart
```

---

## Código

```dart id="clojkn"
class AppointmentModel {
  final String id;
  final String userId;
  final String propertyId;
  final String visitDate;

  AppointmentModel({
    required this.id,
    required this.userId,
    required this.propertyId,
    required this.visitDate,
  });

  factory AppointmentModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return AppointmentModel(
      id: documentId,
      userId: map['userId'] ?? '',
      propertyId: map['propertyId'] ?? '',
      visitDate: map['visitDate'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'propertyId': propertyId,
      'visitDate': visitDate,
    };
  }
}
```

---

# 5. Servicios — La Parte MÁS Importante

Aquí centralizamos:

* Auth
* CRUD
* Queries
* Streams
* Uploads

---

# ¿Por qué Services?

Porque la UI NO debe saber cómo funciona Firebase.

La UI solo debería decir:

```dart id="xvxu4j"
crearPropiedad()
```

y el Service hace todo internamente.

---

# 6. Crear property_service.dart

Ruta:

```plaintext id="h53xft"
lib/services/property_service.dart
```

---

# Código Completo

```dart id="h1q7l7"
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/property_model.dart';

class PropertyService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseStorage _storage =
      FirebaseStorage.instance;

  final String collection = 'properties';

  // ==========================
  // CREAR PROPIEDAD
  // ==========================

  Future<void> addProperty({
    required PropertyModel property,
  }) async {
    await _firestore
        .collection(collection)
        .doc(property.id)
        .set(property.toMap());
  }

  // ==========================
  // OBTENER PROPIEDADES
  // ==========================

  Stream<List<PropertyModel>> getProperties() {
    return _firestore
        .collection(collection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PropertyModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }

  // ==========================
  // ACTUALIZAR PROPIEDAD
  // ==========================

  Future<void> updateProperty(
    PropertyModel property,
  ) async {
    await _firestore
        .collection(collection)
        .doc(property.id)
        .update(property.toMap());
  }

  // ==========================
  // ELIMINAR PROPIEDAD
  // ==========================

  Future<void> deleteProperty(
    String propertyId,
  ) async {
    await _firestore
        .collection(collection)
        .doc(propertyId)
        .delete();
  }

  // ==========================
  // SUBIR IMAGEN
  // ==========================

  Future<String> uploadImage(
    File imageFile,
  ) async {
    const uuid = Uuid();

    final fileName = uuid.v4();

    final ref = _storage
        .ref()
        .child('property_images')
        .child('$fileName.jpg');

    await ref.putFile(imageFile);

    return await ref.getDownloadURL();
  }
}
```

---

# Explicación Avanzada

---

# Stream<List<PropertyModel>>

ESTO es una de las mayores ventajas de Firebase.

La UI se actualiza automáticamente cuando:

* agregas,
* editas,
* eliminas.

SIN refrescar.

---

# snapshots()

```dart id="m2q2x6"
.snapshots()
```

Escucha cambios en tiempo real.

---

# map()

Transforma documentos Firestore → Lista Dart.

---

# uploadImage()

Sube imágenes a Firebase Storage y devuelve URL pública.

---

# 7. Crear auth_service.dart

Ruta:

```plaintext id="e9rlx7"
lib/services/auth_service.dart
```

---

# Código Completo

```dart id="tq32i2"
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // ==========================
  // REGISTRO
  // ==========================

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = UserModel(
      uid: credential.user!.uid,
      name: name,
      email: email,
      role: 'client',
    );

    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());

    return credential;
  }

  // ==========================
  // LOGIN
  // ==========================

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await _auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ==========================
  // LOGOUT
  // ==========================

  Future<void> logout() async {
    await _auth.signOut();
  }

  // ==========================
  // USUARIO ACTUAL
  // ==========================

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // ==========================
  // STREAM AUTH
  // ==========================

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
}
```

---

# ¿Qué es authStateChanges()?

Escucha automáticamente:

* login,
* logout,
* expiración de sesión.

Es la base para navegación inteligente.

---

# 8. Crear appointment_service.dart

Ruta:

```plaintext id="pv5ft4"
lib/services/appointment_service.dart
```

---

# Código

```dart id="8pfq2m"
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/appointment_model.dart';

class AppointmentService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final String collection = 'appointments';

  Future<void> createAppointment(
    AppointmentModel appointment,
  ) async {
    await _firestore
        .collection(collection)
        .doc(appointment.id)
        .set(appointment.toMap());
  }

  Stream<List<AppointmentModel>>
      getAppointments() {
    return _firestore
        .collection(collection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppointmentModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }
}
```

---

# 9. Queries Profesionales Firestore

Ahora vamos a hacer filtros reales.

---

# Propiedades en Venta

```dart id="79h3cl"
_firestore
.collection('properties')
.where('operation', isEqualTo: 'Venta')
```

---

# Casas

```dart id="4p7fmm"
.where('type', isEqualTo: 'Casa')
```

---

# Búsqueda Avanzada

Firestore NO funciona como SQL.

No puedes hacer:

* LIKE
* contains complejos

Para proyectos reales:

* Algolia
* ElasticSearch

Pero para preparatoria:
sí puedes usar búsqueda básica.

---

# 10. Método de Filtro Profesional

Agrega esto a PropertyService.

---

## Código

```dart id="4shjkx"
Stream<List<PropertyModel>>
getFilteredProperties({
  String? operation,
  String? type,
}) {
  Query query = _firestore.collection(collection);

  if (operation != null) {
    query = query.where(
      'operation',
      isEqualTo: operation,
    );
  }

  if (type != null) {
    query = query.where(
      'type',
      isEqualTo: type,
    );
  }

  return query.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return PropertyModel.fromMap(
        doc.data() as Map<String, dynamic>,
        doc.id,
      );
    }).toList();
  });
}
```

---

# Explicación Arquitectónica

---

# Query Dinámica

Esto permite:

* combinar filtros,
* escalar fácilmente,
* reutilizar código.

---

# ¿Por qué NO hacer filtros en UI?

Mala práctica:

* UI pesada
* lógica duplicada
* mantenimiento horrible

---

# 11. Preparación para Provider

Todavía no haremos Provider completo.

Pero debes entender esto:

---

# Service = conexión Firebase

# Provider = estado global

---

Ejemplo:

```plaintext id="1qnbmg"
AuthService
    ↓
AuthProvider
    ↓
LoginScreen
```

---

# 12. Diferencia IMPORTANTÍSIMA

---

# Services

Responsabilidad:

* Firebase
* APIs
* lógica externa

---

# Providers

Responsabilidad:

* estado UI
* loading
* errores
* listas actuales

---

# 13. Error MUY Común

❌ meter lógica Firebase en Provider

Incorrecto:

```dart id="62a5en"
FirebaseFirestore.instance...
```

dentro del provider.

---

# Correcto

Provider usa Service.

---

# 14. Flujo Profesional Completo

```plaintext id="pd2q8d"
Pantalla
   ↓
Provider
   ↓
Service
   ↓
Firebase
```

---

# 15. ¿Qué Lograste Ya?

Ahora tu app tiene:

✅ arquitectura escalable
✅ modelos profesionales
✅ CRUD completo
✅ streams realtime
✅ uploads de imágenes
✅ auth service
✅ appointment service
✅ queries dinámicas

Ya parece estructura de app real.

---

# 16. Prueba Recomendada

Antes de avanzar:
crea manualmente un documento en Firestore.

Colección:

```plaintext id="2c95wf"
properties
```

Documento:

```json id="zofklh"
{
  "title": "Casa Moderna",
  "location": "Ciudad Juárez",
  "price": 450000,
  "bedrooms": 3,
  "squareMeters": 240,
  "type": "Casa",
  "operation": "Venta",
  "imageUrl": ""
}
```

Si Firestore lo guarda correctamente:
todo va perfecto.

---

# 17. Qué Viene en la FASE 3

La siguiente fase será MUY importante visualmente.

Construiremos:

✅ Login profesional
✅ Registro
✅ Validaciones reales
✅ Manejo de errores Firebase
✅ Navegación automática
✅ Provider real
✅ Formularios modernos
✅ Persistencia de sesión
✅ Seguridad básica

Ahí tu app ya comenzará a sentirse completamente funcional.

---

# Checklist Antes de Avanzar

Debes tener:

✅ models funcionando
✅ services funcionando
✅ Firestore conectado
✅ Storage conectado
✅ CRUD compilando sin errores
✅ imports correctos
✅ estructura limpia

# FASE 3: Autenticación y Seguridad — Login + Registro Profesional

Ahora vamos a construir el sistema de autenticación REAL de tu aplicación.

Al terminar esta fase tendrás:

✅ Registro de usuarios
✅ Inicio de sesión
✅ Persistencia automática
✅ Manejo de errores Firebase
✅ Provider real funcionando
✅ Validaciones profesionales
✅ Navegación inteligente
✅ Logout
✅ Arquitectura limpia
✅ UI moderna

Aquí es donde tu proyecto deja de verse “escolar” y empieza a sentirse como una app real.

---

# Arquitectura que Vamos a Construir

```plaintext id="72t9hc"
UI
 ↓
Provider
 ↓
AuthService
 ↓
Firebase Auth
 ↓
Firestore
```

---

# 1. Crear AuthProvider

Ruta:

```plaintext id="jlwmzj"
lib/providers/auth_provider.dart
```

---

# ¿Qué hará?

El Provider controlará:

* loading
* usuario actual
* login
* registro
* logout
* errores

La UI NO debe manejar lógica Firebase directamente.

---

# Código Completo

```dart id="7m4yn7"
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  User? get currentUser =>
      _authService.getCurrentUser();

  // ==========================
  // LOGIN
  // ==========================

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService.login(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseError(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ==========================
  // REGISTER
  // ==========================

  Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseError(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ==========================
  // LOGOUT
  // ==========================

  Future<void> logout() async {
    await _authService.logout();
  }

  // ==========================
  // STREAM AUTH
  // ==========================

  Stream<User?> authStateChanges() {
    return _authService.authStateChanges();
  }

  // ==========================
  // FIREBASE ERRORS
  // ==========================

  String _handleFirebaseError(
    FirebaseAuthException e,
  ) {
    switch (e.code) {
      case 'user-not-found':
        return 'Usuario no encontrado';

      case 'wrong-password':
        return 'Contraseña incorrecta';

      case 'email-already-in-use':
        return 'Ese correo ya está registrado';

      case 'weak-password':
        return 'La contraseña es demasiado débil';

      case 'invalid-email':
        return 'Correo inválido';

      default:
        return 'Ocurrió un error';
    }
  }
}
```

---

# Explicación Profesional

---

# notifyListeners()

```dart id="1gw4z0"
notifyListeners();
```

Le dice a toda la UI:

> “Hubo cambios, reconstruyan.”

---

# finally

```dart id="jmd3b3"
finally
```

Se ejecuta SIEMPRE:

* éxito
* error
* excepción

Muy importante para loading states.

---

# ¿Por qué devolver String?

Porque:

* `null` = éxito
* texto = error

Esto simplifica muchísimo la UI.

---

# 2. Registrar Provider Globalmente

Ve a:

```plaintext id="5v5o1s"
main.dart
```

---

# Reemplaza MultiProvider

```dart id="6wfx5k"
MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
    ),
  ],
```

---

# Import necesario

```dart id="qzj0e1"
import 'providers/auth_provider.dart';
```

---

# 3. Crear Validators

Ruta:

```plaintext id="n1pdij"
lib/utils/validators.dart
```

---

# Código

```dart id="r8s4vc"
class Validators {
  static String? validateEmail(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Ingresa un correo';
    }

    if (!value.contains('@')) {
      return 'Correo inválido';
    }

    return null;
  }

  static String? validatePassword(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Ingresa una contraseña';
    }

    if (value.length < 6) {
      return 'Mínimo 6 caracteres';
    }

    return null;
  }

  static String? validateName(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu nombre';
    }

    return null;
  }
}
```

---

# ¿Por qué NO validar directamente en UI?

Porque:

* duplicas lógica
* difícil mantenimiento
* mala escalabilidad

---

# 4. Custom Widgets Reutilizables

Ahora vamos a hacer UI profesional.

---

# Crear custom_textfield.dart

Ruta:

```plaintext id="mjlwmr"
lib/widgets/custom_textfield.dart
```

---

# Código

```dart id="nd4j5j"
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
```

---

# Crear custom_button.dart

Ruta:

```plaintext id="szy6nq"
lib/widgets/custom_button.dart
```

---

# Código

```dart id="a48l3f"
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(text),
      ),
    );
  }
}
```

---

# ¿Por qué Widgets Reutilizables?

Porque si mañana cambias diseño:

* cambias UNA sola vez,
* toda la app se actualiza.

Eso es desarrollo profesional.

---

# 5. Crear LoginScreen

Ruta:

```plaintext id="y5uk3s"
lib/screens/auth/login_screen.dart
```

---

# Código Completo

```dart id="gb1ezc"
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

import '../home/home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider =
        context.read<AuthProvider>();

    final error = await authProvider.login(
      email: emailController.text.trim(),
      password:
          passwordController.text.trim(),
    );

    if (error != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(error),
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),

              CustomTextField(
                controller: emailController,
                hint: 'Correo',
                validator:
                    Validators.validateEmail,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller:
                    passwordController,
                hint: 'Contraseña',
                obscureText: true,
                validator:
                    Validators.validatePassword,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: 'Ingresar',
                isLoading:
                    authProvider.isLoading,
                onPressed: login,
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const RegisterScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Crear Cuenta',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

# Explicación Avanzada StatefulWidget

---

# ¿Por qué Login usa StatefulWidget?

Porque:

* controla controllers,
* formularios,
* validaciones,
* estados temporales.

---

# dispose()

```dart id="jlwmcg"
dispose()
```

Libera memoria.

MUY importante en apps reales.

---

# context.read()

```dart id="ey4q2k"
context.read<AuthProvider>()
```

Obtiene provider SIN reconstruir widget.

Perfecto para acciones:

* login
* logout
* submit

---

# context.watch()

```dart id="1u0g4l"
context.watch<AuthProvider>()
```

Escucha cambios y reconstruye UI.

Perfecto para:

* loading
* estados visuales

---

# 6. Crear RegisterScreen

Ruta:

```plaintext id="c8h35u"
lib/screens/auth/register_screen.dart
```

---

# Código Completo

```dart id="x31m9u"
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

import '../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider =
        context.read<AuthProvider>();

    final error =
        await authProvider.register(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password:
          passwordController.text.trim(),
    );

    if (error != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: Text(error),
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),

              CustomTextField(
                controller: nameController,
                hint: 'Nombre',
                validator:
                    Validators.validateName,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: emailController,
                hint: 'Correo',
                validator:
                    Validators.validateEmail,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller:
                    passwordController,
                hint: 'Contraseña',
                obscureText: true,
                validator:
                    Validators.validatePassword,
              ),

              const SizedBox(height: 30),

              CustomButton(
                text: 'Registrarse',
                isLoading:
                    authProvider.isLoading,
                onPressed: register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

# 7. Crear HomeScreen Temporal

Ruta:

```plaintext id="r08n9r"
lib/screens/home/home_screen.dart
```

---

# Código

```dart id="9wnm0c"
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
        context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeyo Dwellings'),
        actions: [
          IconButton(
            onPressed: () async {
              await authProvider.logout();

              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Bienvenido a Yeyo Dwellings',
        ),
      ),
    );
  }
}
```

---

# 8. Navegación Inteligente Automática

Ahora vamos a detectar:

* si usuario ya inició sesión,
* y evitar login innecesario.

---

# Modifica main.dart

---

# Importaciones

```dart id="cwml8u"
import 'providers/auth_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';
```

---

# Reemplaza home:

```dart id="qv67gi"
home: const AuthWrapper(),
```

---

# Crear AuthWrapper

Debajo de MyApp:

```dart id="zjlwmf"
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
        context.read<AuthProvider>();

    return StreamBuilder(
      stream:
          authProvider.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child:
                  CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
```

---

# ¿Qué Hace Esto?

Si el usuario:

* ya inició sesión → Home
* no ha iniciado sesión → Login

Automáticamente.

Así funcionan apps reales:

* Netflix
* Airbnb
* Uber

---

# 9. Reglas de Seguridad Firestore

MUY IMPORTANTE.

Ve a Firestore Rules.

---

# Reglas Básicas Seguras

```javascript id="m7wqca"
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {

    match /users/{userId} {
      allow read, write:
      if request.auth != null;
    }

    match /properties/{propertyId} {
      allow read:
      if true;

      allow write:
      if request.auth != null;
    }

    match /appointments/{appointmentId} {
      allow read, write:
      if request.auth != null;
    }
  }
}
```

---

# Explicación

---

# properties → lectura pública

Todos pueden ver propiedades.

---

# write → requiere auth

Solo usuarios autenticados editan.

---

# Más adelante

Podrías hacer:

* admins solamente,
* reglas avanzadas,
* validaciones server-side.

---

# 10. Errores MUY Comunes

---

# ❌ NO usar Navigator.push constantemente

Usa:

* pushReplacement
* wrappers automáticos

---

# ❌ NO guardar passwords en Firestore

Firebase Auth maneja eso.

---

# ❌ NO dejar controllers sin dispose()

Memory leaks.

---

# ❌ NO usar setState para auth global

Usa Provider.

---

# 11. Resultado Profesional Actual

Tu app YA tiene:

✅ Firebase Auth
✅ Registro
✅ Login
✅ Logout
✅ Persistencia de sesión
✅ Validaciones
✅ Arquitectura limpia
✅ Provider real
✅ Manejo de errores
✅ Seguridad Firestore
✅ Navegación inteligente

Ya parece MVP real.

---

# 12. Qué Viene en FASE 4

Aquí empieza lo visualmente impresionante.

Construiremos:

✅ Catálogo inmobiliario realtime
✅ StreamBuilder profesional
✅ Tarjetas modernas
✅ Pantalla detalle premium
✅ Filtros
✅ Buscador
✅ Diseño responsive
✅ Imágenes desde Firebase Storage
✅ Navegación avanzada
✅ Simulador hipotecario

Ahí tu app empezará a verse MUY seria.

---

# Checklist Antes de Avanzar

Debes poder:

✅ Registrarte
✅ Iniciar sesión
✅ Cerrar sesión
✅ Ver usuarios en Firebase Auth
✅ Ver documentos en Firestore
✅ Mantener sesión iniciada
✅ Navegar automáticamente

---

# Prueba Recomendada

Crea:

* 2 cuentas distintas,
* inicia/cierra sesión,
* revisa Firestore.

Debes ver:

```plaintext id="1gq0es"
users/
```

con datos guardados correctamente.

# FASE 4: Catálogo Inmobiliario Profesional (UI + StreamBuilder + Detalles + Filtros + Hipoteca)

Aquí es donde tu aplicación comenzará a verse como una app inmobiliaria real.

Al terminar esta fase tendrás:

✅ Catálogo en tiempo real
✅ Tarjetas modernas
✅ Pantalla de detalles premium
✅ StreamBuilder profesional
✅ Búsqueda y filtros
✅ Navegación avanzada
✅ Simulador hipotecario
✅ Imágenes desde Firebase Storage
✅ Diseño limpio y escalable

Tu app ya empezará a verse tipo:

* Zillow
* Airbnb
* Inmuebles24

---

# Arquitectura Visual

```plaintext id="f1p3mb"
Firestore
   ↓
PropertyService
   ↓
Provider (después)
   ↓
StreamBuilder
   ↓
PropertyCard
   ↓
PropertyDetailScreen
```

---

# 1. Crear PropertyCard

Ruta:

```plaintext id="mq7t7g"
lib/widgets/property_card.dart
```

---

# ¿Por qué un Widget separado?

Porque una tarjeta:

* se reutiliza,
* mantiene UI limpia,
* escala mejor.

---

# Código Completo

```dart id="dy4f9v"
import 'package:flutter/material.dart';

import '../models/property_model.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback onTap;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // IMAGEN
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.network(
                property.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) =>
                        Container(
                  height: 220,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image,
                    size: 60,
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 4),

                      Expanded(
                        child: Text(
                          property.location,
                          style:
                              const TextStyle(
                            color:
                                Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        '\$${property.price.toStringAsFixed(0)} MXN',
                        style:
                            const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Colors.blue,
                        ),
                      ),

                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration:
                            BoxDecoration(
                          color: Colors
                              .blue[100],
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),
                        child: Text(
                          property.operation,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      const Icon(
                        Icons.bed,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        '${property.bedrooms} Habitaciones',
                      ),

                      const SizedBox(width: 20),

                      const Icon(
                        Icons.square_foot,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        '${property.squareMeters} m²',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# Explicación Profesional

---

# GestureDetector

Permite detectar taps sin convertir toda la tarjeta en botón.

---

# ClipRRect

Recorta imagen con bordes redondeados.

---

# BoxShadow

Da sensación premium.

MUY usado en diseño moderno.

---

# Image.network()

Carga imágenes desde Firebase Storage.

---

# errorBuilder

Evita crashes si imagen falla.

Muy importante.

---

# 2. Crear HomeScreen REAL

Ahora sí construiremos el catálogo.

---

# Ruta

```plaintext id="eahw6z"
lib/screens/home/home_screen.dart
```

---

# Código Completo

```dart id="3u2d2m"
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/property_model.dart';
import '../../providers/auth_provider.dart';
import '../../services/property_service.dart';
import '../../widgets/property_card.dart';

import 'property_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  final PropertyService _propertyService =
      PropertyService();

  final searchController =
      TextEditingController();

  String selectedOperation = 'Todos';

  String selectedType = 'Todos';

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yeyo Dwellings',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await authProvider.logout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // =====================
            // BUSCADOR
            // =====================

            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText:
                    'Buscar propiedad...',
                prefixIcon:
                    const Icon(Icons.search),
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                          14),
                ),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),

            const SizedBox(height: 16),

            // =====================
            // FILTROS
            // =====================

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedOperation,
                    items: [
                      'Todos',
                      'Venta',
                      'Renta',
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOperation =
                            value!;
                      });
                    },
                    decoration:
                        const InputDecoration(
                      labelText:
                          'Operación',
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: DropdownButtonFormField(
                    value: selectedType,
                    items: [
                      'Todos',
                      'Casa',
                      'Departamento',
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType =
                            value!;
                      });
                    },
                    decoration:
                        const InputDecoration(
                      labelText: 'Tipo',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =====================
            // STREAM BUILDER
            // =====================

            Expanded(
              child: StreamBuilder<
                  List<PropertyModel>>(
                stream: _propertyService
                    .getProperties(),
                builder:
                    (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState
                          .waiting) {
                    return const Center(
                      child:
                          CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No hay propiedades',
                      ),
                    );
                  }

                  List<PropertyModel>
                      properties =
                      snapshot.data!;

                  // =====================
                  // FILTROS LOCALES
                  // =====================

                  properties =
                      properties.where(
                    (property) {
                      final matchesSearch =
                          property.title
                              .toLowerCase()
                              .contains(
                                searchController
                                    .text
                                    .toLowerCase(),
                              );

                      final matchesOperation =
                          selectedOperation ==
                                  'Todos' ||
                              property
                                      .operation ==
                                  selectedOperation;

                      final matchesType =
                          selectedType ==
                                  'Todos' ||
                              property.type ==
                                  selectedType;

                      return matchesSearch &&
                          matchesOperation &&
                          matchesType;
                    },
                  ).toList();

                  return ListView.builder(
                    itemCount:
                        properties.length,
                    itemBuilder:
                        (context, index) {
                      final property =
                          properties[index];

                      return PropertyCard(
                        property: property,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PropertyDetailScreen(
                                property:
                                    property,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# Explicación Profunda StreamBuilder

---

# ¿Qué hace?

Escucha streams en tiempo real.

Cada vez que Firestore cambia:

* se reconstruye automáticamente.

---

# snapshot.connectionState

Detecta:

* loading,
* activo,
* error.

---

# snapshot.data

Contiene datos del stream.

---

# ¿Por qué StreamBuilder es PERFECTO para Firebase?

Porque Firebase es realtime.

No necesitas:

* refresh manual,
* recargar pantalla,
* pull-to-refresh.

---

# 3. Crear PropertyDetailScreen

Ruta:

```plaintext id="y4e3a8"
lib/screens/home/property_detail_screen.dart
```

---

# Código Completo

```dart id="qzcs50"
import 'package:flutter/material.dart';

import '../../models/property_model.dart';

class PropertyDetailScreen
    extends StatefulWidget {
  final PropertyModel property;

  const PropertyDetailScreen({
    super.key,
    required this.property,
  });

  @override
  State<PropertyDetailScreen>
      createState() =>
          _PropertyDetailScreenState();
}

class _PropertyDetailScreenState
    extends State<PropertyDetailScreen> {
  final amountController =
      TextEditingController();

  final yearsController =
      TextEditingController();

  double monthlyPayment = 0;

  void calculateMortgage() {
    final amount =
        double.tryParse(
              amountController.text,
            ) ??
            0;

    final years =
        int.tryParse(
              yearsController.text,
            ) ??
            1;

    const annualRate = 0.10;

    final monthlyRate =
        annualRate / 12;

    final totalPayments =
        years * 12;

    monthlyPayment =
        (amount *
                monthlyRate) /
            (1 -
                (1 /
                    (pow(
                      1 + monthlyRate,
                      totalPayments,
                    ))));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ======================
            // IMAGEN
            // ======================

            Stack(
              children: [
                Image.network(
                  property.imageUrl,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor:
                        Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                            context);
                      },
                      icon:
                          const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style:
                        const TextStyle(
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    property.location,
                    style:
                        const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '\$${property.price.toStringAsFixed(0)} MXN',
                    style:
                        const TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceAround,
                    children: [
                      _infoCard(
                        Icons.bed,
                        '${property.bedrooms}',
                        'Habitaciones',
                      ),

                      _infoCard(
                        Icons.square_foot,
                        '${property.squareMeters}',
                        'm²',
                      ),

                      _infoCard(
                        Icons.home,
                        property.type,
                        'Tipo',
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    'Simulador Hipotecario',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller:
                        amountController,
                    keyboardType:
                        TextInputType
                            .number,
                    decoration:
                        const InputDecoration(
                      labelText:
                          'Monto',
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller:
                        yearsController,
                    keyboardType:
                        TextInputType
                            .number,
                    decoration:
                        const InputDecoration(
                      labelText:
                          'Años',
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed:
                          calculateMortgage,
                      child: const Text(
                        'Calcular',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Pago mensual aproximado: \$${monthlyPayment.toStringAsFixed(2)}',
                    style:
                        const TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                      label: const Text(
                        'Agendar Visita',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String value,
    String label,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(label),
        ],
      ),
    );
  }
}
```

---

# IMPORTANTE

Debes agregar este import:

```dart id="k6hzw1"
import 'dart:math';
```

---

# Explicación del Simulador Hipotecario

Usa fórmula de amortización mensual.

---

# ¿Por qué esto IMPACTA mucho?

Porque:

* da sensación premium,
* parece app real,
* demuestra lógica matemática,
* impresiona muchísimo en proyectos escolares.

---

# 4. Flujo Completo Actual

Tu app ya funciona así:

```plaintext id="qhugkz"
Login
 ↓
HomeScreen
 ↓
StreamBuilder
 ↓
PropertyCard
 ↓
PropertyDetailScreen
 ↓
Hipoteca
```

---

# 5. Diseño Profesional Recomendado

---

# Colores

Crea:

```plaintext id="7ce0rd"
lib/utils/app_colors.dart
```

---

# Código

```dart id="7u2dk4"
import 'package:flutter/material.dart';

class AppColors {
  static const primary =
      Color(0xFF0A2342);

  static const secondary =
      Color(0xFF00A8E8);

  static const background =
      Color(0xFFF5F7FA);
}
```

---

# ¿Por qué?

Evita colores hardcodeados.

---

# 6. Error MUY IMPORTANTE

Si imageUrl está vacío:
Image.network puede verse raro.

Recomendación:
siempre subir imágenes reales.

---

# 7. Cómo Probar TODO

Ve a Firestore:

```plaintext id="0d1gq7"
properties
```

Agrega varios documentos.

---

# Ejemplo

```json id="65mwn8"
{
  "title": "Casa de Lujo",
  "location": "Ciudad Juárez",
  "price": 850000,
  "bedrooms": 4,
  "squareMeters": 420,
  "type": "Casa",
  "operation": "Venta",
  "imageUrl": "URL_DE_FIREBASE_STORAGE"
}
```

---

# Resultado

Tu catálogo se actualizará automáticamente.

SIN reiniciar app.

---

# 8. Qué Lograste REALMENTE

Ya construiste:

✅ arquitectura escalable
✅ realtime database
✅ catálogo profesional
✅ filtros
✅ búsqueda
✅ detalles premium
✅ simulador hipotecario
✅ navegación moderna
✅ Firebase Storage
✅ StreamBuilder realtime

Tu app ya parece startup real.

---

# 9. Qué Viene en FASE 5

La última fase será brutal.

Construiremos:

✅ Panel admin completo
✅ CRUD visual
✅ Subida de imágenes real
✅ Editar propiedades
✅ Eliminar propiedades
✅ Agendar visitas REAL
✅ Firestore appointments
✅ Dashboard admin
✅ Formularios avanzados
✅ UX mucho más profesional

Ahí tu app quedará COMPLETAMENTE funcional.

---

# Checklist Antes de Avanzar

Debes poder:

✅ Ver propiedades
✅ Navegar a detalles
✅ Filtrar
✅ Buscar
✅ Ver imágenes
✅ Calcular hipoteca
✅ Cerrar sesión

---

# MUY IMPORTANTE

Tu app ya tiene suficiente nivel para impresionarle muchísimo a un maestro de preparatoria.

Pero la FASE 5 es la que realmente hará que se vea como producto comercial.

---
# FASE 5: Panel Administrativo + CRUD Completo + Citas Reales

Esta es la fase donde “Yeyo Dwellings” se convierte en una aplicación inmobiliaria COMPLETA.

Al terminar tendrás:

✅ Panel administrativo
✅ Agregar propiedades
✅ Editar propiedades
✅ Eliminar propiedades
✅ Subida REAL de imágenes
✅ Firebase Storage integrado
✅ Agenda de visitas
✅ Colección appointments funcionando
✅ Dashboard admin
✅ Formularios avanzados
✅ UX profesional

Aquí ya estás construyendo algo MUY cercano a un MVP comercial real.

---

# Arquitectura Final

```plaintext id="of4mzr"
Admin UI
   ↓
Provider
   ↓
Services
   ↓
Firestore + Storage
```

---

# 1. Crear PropertyProvider

Hasta ahora usamos directamente services.

Ahora sí haremos manejo profesional de estado.

---

# Ruta

```plaintext id="pfj2m9"
lib/providers/property_provider.dart
```

---

# Código Completo

```dart id="e75i8h"
import 'package:flutter/material.dart';

import '../models/property_model.dart';
import '../services/property_service.dart';

class PropertyProvider extends ChangeNotifier {
  final PropertyService _propertyService =
      PropertyService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // ==========================
  // AGREGAR
  // ==========================

  Future<void> addProperty(
    PropertyModel property,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _propertyService.addProperty(
        property: property,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ==========================
  // EDITAR
  // ==========================

  Future<void> updateProperty(
    PropertyModel property,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _propertyService
          .updateProperty(property);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ==========================
  // ELIMINAR
  // ==========================

  Future<void> deleteProperty(
    String propertyId,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _propertyService
          .deleteProperty(propertyId);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
```

---

# 2. Registrar Provider en main.dart

Dentro de providers:

```dart id="x0os9u"
ChangeNotifierProvider(
  create: (_) => PropertyProvider(),
),
```

---

# Resultado

Ahora toda la app puede:

* crear propiedades,
* editar,
* eliminar,
* escuchar loading states.

---

# 3. Crear AdminDashboard

Ruta:

```plaintext id="m5d47j"
lib/screens/admin/admin_dashboard.dart
```

---

# Código Completo

```dart id="7vw5lq"
import 'package:flutter/material.dart';

import 'add_property_screen.dart';

class AdminDashboard
    extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Panel Administrativo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _dashboardCard(
              context,
              title: 'Agregar Propiedad',
              icon: Icons.add_home,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const AddPropertyScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius:
              BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),

            const SizedBox(width: 20),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# ¿Por qué Dashboard?

Porque apps reales:

* separan usuarios,
* separan administración,
* separan permisos.

---

# 4. Agregar Rol Admin

En Firestore:

```plaintext id="uqgg8o"
users/
```

Busca tu usuario y cambia:

```json id="pjr06s"
"role": "admin"
```

---

# Más adelante podrías hacer:

```dart id="1v9dnp"
if(user.role == 'admin')
```

para acceso restringido.

---

# 5. Crear AddPropertyScreen

Aquí construiremos el formulario REAL.

---

# Ruta

```plaintext id="9szvrl"
lib/screens/admin/add_property_screen.dart
```

---

# Dependencia IMPORTANTE

Agrega:

```yaml id="px9g52"
image_picker: ^1.1.2
```

Ya la tienes desde Fase 1.

---

# Código Completo

```dart id="d8c8qm"
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../models/property_model.dart';
import '../../providers/property_provider.dart';
import '../../services/property_service.dart';

class AddPropertyScreen
    extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen>
      createState() =>
          _AddPropertyScreenState();
}

class _AddPropertyScreenState
    extends State<AddPropertyScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController =
      TextEditingController();

  final locationController =
      TextEditingController();

  final priceController =
      TextEditingController();

  final bedroomsController =
      TextEditingController();

  final metersController =
      TextEditingController();

  String operation = 'Venta';

  String type = 'Casa';

  File? selectedImage;

  bool isUploading = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage =
            File(pickedFile.path);
      });
    }
  }

  Future<void> saveProperty() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content:
              Text('Selecciona una imagen'),
        ),
      );

      return;
    }

    try {
      setState(() {
        isUploading = true;
      });

      final propertyService =
          PropertyService();

      final imageUrl =
          await propertyService.uploadImage(
        selectedImage!,
      );

      const uuid = Uuid();

      final property = PropertyModel(
        id: uuid.v4(),
        title: titleController.text,
        location: locationController.text,
        price: double.parse(
          priceController.text,
        ),
        bedrooms: int.parse(
          bedroomsController.text,
        ),
        squareMeters: double.parse(
          metersController.text,
        ),
        type: type,
        operation: operation,
        imageUrl: imageUrl,
      );

      await context
          .read<PropertyProvider>()
          .addProperty(property);

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
          ),
        ),
      );
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    priceController.dispose();
    bedroomsController.dispose();
    metersController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Agregar Propiedad'),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        BorderRadius.circular(
                            16),
                  ),
                  child: selectedImage == null
                      ? const Icon(
                          Icons.image,
                          size: 80,
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      16),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller:
                    titleController,
                decoration:
                    const InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Campo requerido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    locationController,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Ubicación',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    priceController,
                keyboardType:
                    TextInputType.number,
                decoration:
                    const InputDecoration(
                  labelText: 'Precio',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    bedroomsController,
                keyboardType:
                    TextInputType.number,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Habitaciones',
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    metersController,
                keyboardType:
                    TextInputType.number,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Metros cuadrados',
                ),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                value: operation,
                items: [
                  'Venta',
                  'Renta',
                ]
                    .map(
                      (e) =>
                          DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    operation = value!;
                  });
                },
                decoration:
                    const InputDecoration(
                  labelText:
                      'Operación',
                ),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                value: type,
                items: [
                  'Casa',
                  'Departamento',
                ]
                    .map(
                      (e) =>
                          DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    type = value!;
                  });
                },
                decoration:
                    const InputDecoration(
                  labelText: 'Tipo',
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isUploading
                      ? null
                      : saveProperty,
                  child: isUploading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Guardar',
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

# ¿Qué Hace REALMENTE Esta Pantalla?

✅ selecciona imagen
✅ sube imagen a Firebase Storage
✅ obtiene URL
✅ crea PropertyModel
✅ guarda en Firestore
✅ actualiza StreamBuilder automáticamente

Eso ya es flujo de producción real.

---

# 6. Agendar Visitas REAL

Ahora conectaremos el botón “Agendar Visita”.

---

# Ve a property_detail_screen.dart

Importa:

```dart id="lnst53"
import 'package:uuid/uuid.dart';

import '../../models/appointment_model.dart';
import '../../services/appointment_service.dart';
```

---

# Reemplaza el botón Agendar

```dart id="d3jz55"
onPressed: () async {
  const uuid = Uuid();

  final appointment =
      AppointmentModel(
    id: uuid.v4(),
    userId: 'USER_ID',
    propertyId: property.id,
    visitDate:
        DateTime.now().toString(),
  );

  await AppointmentService()
      .createAppointment(
    appointment,
  );

  ScaffoldMessenger.of(context)
      .showSnackBar(
    const SnackBar(
      content: Text(
        'Visita agendada',
      ),
    ),
  );
},
```

---

# IMPORTANTE

Más adelante deberías usar:

```dart id="ksq45x"
FirebaseAuth.instance.currentUser!.uid
```

para obtener usuario real.

---

# 7. Crear EditPropertyScreen (Opcional Profesional)

La lógica es casi idéntica a AddPropertyScreen.

La diferencia:

* cargas datos existentes,
* haces updateProperty().

---

# Recomendación REAL

Duplica AddPropertyScreen y:

* cambia controllers iniciales,
* usa updateProperty(),
* conserva imageUrl si no cambia.

---

# 8. Eliminar Propiedades

Dentro de HomeScreen o AdminDashboard:

```dart id="44p6ku"
await context
    .read<PropertyProvider>()
    .deleteProperty(property.id);
```

---

# Recomendación UX

Siempre usa confirmación:

```dart id="szp98x"
showDialog(
```

antes de borrar.

---

# 9. Reglas Firebase Storage

MUY IMPORTANTE.

Ve a Storage Rules.

---

# Reglas Básicas

```javascript id="64rh5e"
rules_version = '2';

service firebase.storage {
  match /b/{bucket}/o {

    match /property_images/{allPaths=**} {
      allow read;

      allow write:
      if request.auth != null;
    }
  }
}
```

---

# ¿Por qué?

Evita:

* uploads anónimos,
* abuso,
* spam.

---

# 10. Mejoras MUY Profesionales

---

# Hero Animations

Para transición elegante entre cards y detalle.

---

# CachedNetworkImage

Evita recargar imágenes.

---

# Shimmer Loading

Pantallas skeleton premium.

---

# Roles Reales

Admins separados en Firestore Rules.

---

# Search Debounce

Evita reconstrucciones excesivas.

---

# Cloud Functions

Para lógica server-side.

---

# 11. Cómo Se Vería una Arquitectura REAL Enterprise

```plaintext id="jw0gch"
lib/
 ├── core/
 ├── data/
 ├── domain/
 ├── presentation/
 ├── providers/
 ├── services/
 └── shared/
```

Pero para preparatoria:
tu arquitectura actual está PERFECTA.

---

# 12. Resultado Final REAL

Ya construiste:

✅ Firebase Auth
✅ Firestore
✅ Firebase Storage
✅ CRUD completo
✅ Streams realtime
✅ Provider
✅ Login/Register
✅ Dashboard admin
✅ Filtros
✅ Búsqueda
✅ Hipoteca
✅ Citas
✅ Arquitectura limpia
✅ Uploads reales
✅ Navegación moderna

Tu proyecto ya tiene muchísimo nivel para preparatoria.

---

# 13. Cómo Impresionar MUCHÍSIMO al Maestro

---

# Presentación

NO muestres solo código.

Muestra:

* arquitectura,
* Firebase,
* realtime,
* Storage,
* Provider,
* seguridad,
* escalabilidad.

---

# Habla de:

✅ NoSQL
✅ Streams
✅ arquitectura desacoplada
✅ manejo de estado
✅ escalabilidad cloud
✅ Firebase ecosystem

Eso cambia completamente cómo perciben el proyecto.

---

# 14. Recomendación FINAL MUY Importante

No intentes meter:

* demasiadas animaciones,
* demasiadas features,
* demasiadas pantallas.

Mejor:

* pocas funciones,
* PERO muy bien hechas.

Eso se siente muchísimo más profesional.

---

# 15. Próximos Pasos Opcionales (Nivel MUY Alto)

Si quieres llevarlo aún más lejos:

✅ Google Maps
✅ Favoritos
✅ Dark Mode
✅ Push Notifications
✅ Chat en tiempo real
✅ IA para recomendaciones
✅ Geolocalización
✅ Publicación automática
✅ Panel web admin
✅ Firebase Analytics

---

# Conclusión

Ya tienes la estructura de una app inmobiliaria moderna usando:

* Flutter
* Firebase
* Provider
* Firestore realtime
* Storage
* Arquitectura escalable
