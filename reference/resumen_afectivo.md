# Resumen normativo de los emojis

Calcula medias de las dimensiones afectivas para una submuestra, util
para describir rapidamente la base normativa.

## Usage

``` r
resumen_afectivo(poblacion = "general")
```

## Arguments

- poblacion:

  Submuestra a resumir. Por defecto `"general"`.

## Value

Un data frame de una fila con las medias de valencia, activacion y
dominancia.

## Examples

``` r
resumen_afectivo()
#>   poblacion  n valencia activacion dominancia
#> 1   general 60     5.11       5.01       5.18
resumen_afectivo(poblacion = "Mujeres")
#>   poblacion  n valencia activacion dominancia
#> 1   Mujeres 60     5.08       5.07       5.18
```
