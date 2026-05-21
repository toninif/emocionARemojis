# emocionARemojis

Datos normativos afectivos de emojis para investigacion en psicologia,
recogidos en poblacion argentina.

Forma parte de la familia de paquetes **emocionAR** de normas afectivas
para poblacion argentina.

La base incluye normas de valencia, activacion, dominancia, familiaridad
y claridad, con valores discriminados por submuestra (poblacion general,
mujeres, hombres).

## Instalacion

``` r

# install.packages("remotes")
remotes::install_github("toninif/emocionARemojis")
```

## Uso basico

``` r

library(emocionARemojis)

data(emojis)

# Seleccionar emojis por rango afectivo
seleccionar_emojis(valencia = c(1, 4), activacion = c(6, 9))

# Resumen normativo de una submuestra
resumen_afectivo(poblacion = "general")
```

## Documentacion

El sitio completo del paquete esta en
<https://toninif.github.io/emocionARemojis/>.

## Licencia

Datos y codigo bajo licencia CC BY 4.0. Si usas estos datos, por favor
citalos: `citation("emocionARemojis")`.
