# Introduccion a emocionARemojis

El paquete `emocionARemojis` provee datos normativos afectivos de emojis
recogidos en poblacion argentina. Forma parte de la familia de paquetes
`emocionAR` de normas afectivas para poblacion argentina.

La base trae normas de valencia, activacion, dominancia, familiaridad y
claridad, discriminadas por submuestra (general, mujeres, hombres).

## Cargar los datos

``` r

library(emocionARemojis)

data(emojis)
head(emojis)
#>   emoji poblacion val_media val_desvio aro_media aro_desvio dom_media
#> 1    😠   general      3.60       2.13      5.81       2.28      4.89
#> 2    😧   general      3.53       2.18      5.32       2.07      4.19
#> 3    😰   general      3.47       2.21      5.12       2.06      3.99
#> 4    😲   general      5.39       1.66      5.08       2.11      5.18
#> 5    😖   general      3.51       2.04      5.21       2.06      4.41
#> 6    😕   general      4.15       1.48      4.34       2.04      4.86
#>   dom_desvio fam_media fam_desvio cla_media cla_desvio
#> 1       2.22      3.82       2.03      6.43       1.17
#> 2       2.05      2.84       1.84      5.02       1.81
#> 3       2.02      3.07       1.76      4.78       1.83
#> 4       2.04      3.42       2.01      5.47       1.81
#> 5       2.04      3.26       1.93      4.57       1.96
#> 6       2.00      4.07       2.08      5.20       1.80
```

Cada emoji aparece en tres filas, una por submuestra normativa. Este
formato largo facilita comparar normas entre grupos.

## Seleccionar emojis para un experimento

La funcion
[`seleccionar_emojis()`](https://toninif.github.io/emocionARemojis/reference/seleccionar_emojis.md)
filtra por rango afectivo. Por ejemplo, para un estudio que necesita
emojis negativos y activantes:

``` r

seleccionar_emojis(valencia = c(1, 4), activacion = c(6, 9))
#>    emoji poblacion val_media val_desvio aro_media aro_desvio dom_media
#> 13    🤮   general      2.91       2.52      6.05       2.47      3.60
#> 21    😤   general      3.42       2.14      6.49       2.35      5.06
#> 22    🤬   general      3.42       2.40      6.76       2.56      5.09
#> 33    😭   general      2.78       2.66      6.09       2.64      3.23
#> 40    😡   general      3.07       2.55      6.97       2.64      4.31
#>    dom_desvio fam_media fam_desvio cla_media cla_desvio
#> 13       2.09      3.77       2.18      6.44       1.31
#> 21       2.54      3.91       2.08      5.75       1.53
#> 22       2.78      3.87       2.30      6.56       1.14
#> 33       2.37      5.62       1.82      6.62       1.22
#> 40       2.90      4.57       2.22      6.71       1.01
```

## Resumen normativo

``` r

resumen_afectivo()
#>   poblacion  n valencia activacion dominancia
#> 1   general 60     5.11       5.01       5.18
resumen_afectivo(poblacion = "Mujeres")
#>   poblacion  n valencia activacion dominancia
#> 1   Mujeres 60     5.08       5.07       5.18
```

## Citar los datos

Si usas estos datos en una investigacion, por favor citalos:

``` r

citation("emocionARemojis")
```
