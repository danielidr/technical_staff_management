# Techstaff Management

Techstaff Management es un aplicación dirigida a empresas que deseen tener un gestor de ordenes de trabajo para técnicos en terreno, donde se tendran 2 tipos de usuario: coordinador y técnico, estos serán gestionados por un 3er tipo de usuario quien es el administrador de la aplicación. 
Techstaff Management tiene estas funcionalidades:

- Gestión de ordenes: Desde coordinación se podran crear y asignar ordenes para los técnicos en terreno. Los técnicos podran ver todos los datos de las ordenes que tienen asignadas y modificar el status de las mismas.
- Enviar ubicación: Cuando el técnico marque su llegada al lugar, desde coordinación podran saber su ubicación.
- Enviar reporte a cliente: Cuando el técnico termina un servicio, se genera un reporte que le llegara al cliente via email.

## Pre-requisitos
Ruby `2.5.3`<br/>
Rails `5.2.6`<br/>
Postgres

## Deployment:

### Clonar repositorio:
```
git clone https://github.com/danielidr/technical_staff_management
```

### Instalar dependencias
```
cd technical_staff_management
bundle
yarn install
```

### Correr migraciones
Asegurandose que el servidor de postgres este corriendo
```
rails db:create
rails db:migrate
```
### Correr seed
```
rails db:seed
```
### Iniciar el servidor
```
rails s
```

## Para iniciar

Se debe iniciar sesión como administrador con los siguientes datos:

email: admin@techstaff.com<br/>
password: tech1234

Nota: El usuario administrador se creo al momento de cargar la información inicial en la base de datos


## Sitio Web
http://localhost:3000/

### Heroku
https://techstaff-management.herokuapp.com/