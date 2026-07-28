FitCIMM - Sistema de Gestión de Gimnasio

**Descripción del proyecto**

FitCIMM es una aplicación web desarrollada en Java Web como solución para la administración del gimnasio FitCIMM, 
ubicado en el municipio de Paipa. El sistema reemplaza el registro manual realizado en cuadernos y archivos de Excel, 
permitiendo una gestión eficiente de socios, planes de membresía, control de ingresos y generación de reportes.

Integrantes
- Kevinn Yessith Avendaño Rodríguez
- Shaila Mariana Aranguren Chaparro

**Objetivos del sistema**

El sistema permitirá:

Registrar y administrar socios.
Gestionar planes de membresía.
Registrar la compra y renovación de membresías.
Controlar el ingreso de los socios al gimnasio.
Consultar el historial de membresías.
Generar reportes administrativos.
Aplicar automáticamente las reglas de negocio establecidas en el taller.

**Arquitectura del proyecto**

La aplicación fue desarrollada siguiendo una arquitectura por capas, basada principalmente en MVC (Modelo, Vista, Controlador), 
separando las responsabilidades del sistema para facilitar su mantenimiento y escalabilidad.

**Las capas implementadas son:**

- Modelo (Model)
Contiene las entidades del sistema.
Socio
Plan
Membresía
Ingreso
- DAO (Data Access Object)
Encargada del acceso a la base de datos mediante JDBC.
- Servicio (Service)
Implementa toda la lógica del negocio.
Validaciones.
Cálculo de fechas.
Estados de membresías.
Restricciones del sistema.
- Controlador (Servlets)
Gestiona las peticiones HTTP.
Comunica las vistas con la lógica del sistema.
- Vista (JSP)
Interfaces gráficas para la interacción con el usuario.

**Tecnologías utilizadas**

Java Web (Servlets + JSP)
Apache Tomcat
JDBC
MySQL
XAMPP
phpMyAdmin
Apache NetBeans IDE
HTML5
Bootstrap 5
Git
GitHub

Requisitos previos

**Antes de ejecutar el proyecto es necesario tener instalado:**

Java JDK 17 o superior (preferiblemente 25)
Apache NetBeans IDE o cualquier IDE que sea capas de ejecutar proyectos JavaWeb.
XAMPP
Apache Tomcat
MySQL
phpMyAdmin
Git (Para clonar el proyecto)

**Instalación**

1. Clonar el proyecto a treves de la url https://github.com/THE-LEVITE/FitCIMM.git
2. Iniciar Xampp con las opciones Apache, TomCat y MySQl.
3. Crear e importar la base de datos con el nombre de fitcimm y el script que este en el proyecto.
4. Configurara la conexión que esta en la clase de la capa Util (Esto solo si es necesario o se tiene un puerto diferente para el MySql).
5. Abrir el proyecto en el IDE y descargar las dependencias del proyecto.
6. Ejecutar el proyecto para su uso.

**Módulos del sistema**
- Gestión de Socios
Permite:

Registrar socios.
Editar información.
Consultar historial.
Buscar socios.
Inactivar registros.
Visualizar el estado de la membresía.

- Gestión de Planes
  Permite:

Crear planes.
Editar planes.
Consultar planes.
Inactivar planes.
Definir duración y valor.

- Gestión de Membresías
  Permite:

Registrar ventas.
Renovar membresías.
Calcular automáticamente la fecha de vencimiento.
Mostrar el estado:
Vigente
Por vencer
Vencida

- Control de Ingresos
  Permite:

Registrar el ingreso de los socios.
Validar que la membresía se encuentre vigente.
Evitar múltiples ingresos el mismo día.
Mostrar los días restantes de la membresía.

- Reportes
  El sistema genera reportes como:

Socios activos.
Total recaudado por plan.
Plan más vendido.
Membresías próximas a vencer.
Historial de ingresos.

**Reglas de negocio implementadas**

- Entre las principales reglas implementadas se encuentran:

Documento único para cada socio.
Cálculo automático de la fecha de vencimiento.
Un socio no puede tener dos membresías vigentes.
Estado de la membresía calculado automáticamente.
Restricción de ingreso para socios vencidos o inactivos.
Un único ingreso por día.
Validación de duración y valor de los planes.
Inactivación de planes con historial.
Validación de edad mínima (15 años).
Conservación del historial de membresías e ingresos.

**Base de datos**

La base de datos está conformada por cuatro tablas principales:

Socio
Plan
Membresía
Ingreso

**Funcionalidades desarrolladas**

CRUD de Socios.
CRUD de Planes.
Registro de Membresías.
Renovación de Membresías.
Control de Ingresos.
Consultas SQL.
Reportes.
Validaciones del servidor.
Arquitectura por capas.
Manejo de errores.
Persistencia mediante JDBC.

