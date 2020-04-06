Zencart
====================

Módulo de pago de pagantis.com para ZenCart (v.1.5.x)

## Instrucciones de Instalación

1. Crea tu cuenta en pagantis.com si aún no la tienes [desde aquí](https://bo.pagantis.com/users/sign_up)
2. Descarga el módulo de [aquí](https://github.com/pagantis/pagantis-zencart/releases)
3. Instala el módulo en tu tienda ZenCart. Para ello sube los ficheros de la carpeta con tu version de este módulo a la carpeta de tu instalación de ZenCart, manteniendo la estructura de directorios existente
  - ext/modules/payment/pagantis/callback.php
  - includes/modules/payment/pagantis.php
  - includes/languages/english/modules/payment/pagantis.php
4. Si tu tienda tiene más idiomas, copia el fichero de idiomas en la carpeta correspondiente y edítalo para ajustar los textos
  - includes/languages/OTRO_IDIOMA/modules/payment/pagantis.php
5. Desde el panel de ZenCart de tu tienda, accede a Modulos > Pago. Pulsa el botón Instalar Módulo y selecciona el módulo PagaMasTarde.
6. Una vez instalado, selecciona el módulo pagantis de la lista de módulos disponibles y pulsa Editar.
7. Configura el código de cuenta y la clave de firma con la información de tu cuenta que encontrarás en [el panel de gestión de Pagamastarde](https://bo.pagantis.com/shop). Ten en cuenta que para hacer cobros reales deberás activar tu cuenta de pagantis.com.

### Soporte

Si tienes alguna duda o pregunta no tienes más que escribirnos un email a soporte@pagantis.com.


### Release notes

#### 2.0.0

- Elimina necesidad de editar ficheros del template.
- Solución de Bugs.
- mejora de la compatibilidad con Zen cart.
- manda más información a la página de Pagantis para augmentar la conversión.

#### 1.0.0

- Versión inicial
