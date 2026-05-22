# Módulo 5: Frontend - Acortador de URLs y Redirección

Este repositorio contiene el código fuente y la infraestructura como código (IaC) del **Módulo 5: Frontend para formulario y redirección**, parte del proyecto integrador **Acortador de URLs con AWS + Terraform**.

##  Objetivo del Módulo
El objetivo de este módulo es proporcionar la interfaz de usuario (UI) principal del sistema. Permite a los usuarios interactuar con los servicios backend para acortar URLs y maneja la experiencia de usuario (UX) durante el proceso de redirección.

### Características Clave:
* **Generación de Enlaces:** Interfaz para enviar una URL larga al backend y mostrar el enlace corto generado.
* **Copiado Rápido:** Botón integrado para copiar el enlace generado al portapapeles.
* **Flujo de Redirección (`/short/{codigo}`):** Pantalla de transición visual con un temporizador de 5 segundos antes de redirigir al usuario al destino final.
* **Manejo de Errores:** Despliegue de un banner visual de error en caso de que la URL solicitada no exista en la base de datos de DynamoDB.
* **Despliegue Continuo (CI/CD):** Pipeline configurado para actualizar el frontend automáticamente en AWS tras cada cambio en el código.

##  Tecnologías Utilizadas
* **AWS S3:** Alojamiento de los archivos estáticos del frontend (HTML, CSS, JS).
* **AWS CloudFront:** Red de Distribución de Contenido (CDN) para entrega rápida, segura (HTTPS) y manejo de caché.
* **Terraform:** Orquestación e Infraestructura como Código (IaC) para la creación del bucket y la distribución.
* **GitHub Actions:** Automatización de flujos de trabajo (CI/CD) para desplegar actualizaciones directamente a AWS S3.
* **HTML / CSS / JavaScript:** Lógica nativa del cliente y peticiones asíncronas (Fetch API) hacia los API Gateways.

##  Estructura del Proyecto

acortador-modulo5/
├── fronteend/
│   ├── index.html         # Interfaz principal, estilos y lógica JS del frontend
├── terraform/
│   ├── main.tf           # Definición de recursos AWS (Bucket S3, CloudFront, Políticas)
│   ├── variables.tf      # Variables de configuración (Nombres de buckets, orígenes)
│   └── outputs.tf        # Enlaces generados (URL de CloudFront)
├── .github/
│   └── workflows/
│       └── deploy.yml    # Pipeline de CI/CD para GitHub Actions
└── README.md             # Documentación formal del módulo

Instrucciones de Despliegue
1. Despliegue de Infraestructura (Terraform)
Este paso crea la base (S3 y CloudFront) y solo se ejecuta localmente cuando hay cambios de arquitectura:

Navega al directorio de infraestructura:

Bash
cd terraform
Inicializa y aplica los cambios:

Bash
terraform init
terraform plan
terraform apply --auto-approve
2. Despliegue Continuo (Frontend)
El código fuente (index.html) se despliega de manera totalmente automatizada gracias a GitHub Actions. Al hacer un git push a la rama main, el pipeline se activa y actualiza los archivos directamente en el bucket de S3.

Integración de Microservicios
Este frontend se integra de forma asíncrona con los siguientes módulos del equipo mediante llamadas REST:

Módulo 1 (Acortamiento): Petición POST /shorten para generar los códigos.

Módulo 2 (Redirección): Petición GET /{codigo} para validar la existencia del enlace antes de la redirección.

Autoría
Desarrollador Responsable: Anderson1221xd
