
## Paso 1:

Posicionarse en el directorio de proyectos de Ionic en mi caso: `cd Documents/desarrollo/proyectos/ionic/...`

## Paso 2:

Crear un proyecto de Ionic: `ionic start nombreProyecto blank`
Seleccionar proyecto: `cd nombreProyecto/`

## Paso 3:

Instalar Plugin: `ionic cordova plugin add https://github.com/efby/cl-efby-copec.git`


## home.ts:

```

          //Realiza el llamado al plugin e invoca segun el resultado la funcion correspondiente
(<any>window).EfbyPlugin.getInfoApp(
        (data) => {
          console.log(data)
        },
        (error) => {
          console.log(error)
        }
      );
  



## Autor

* **@EFBY** 