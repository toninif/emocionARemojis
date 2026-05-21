# Seleccionar emojis por rango afectivo

Filtra los datos normativos devolviendo solo los emojis cuyas medias
caen dentro de los rangos indicados. Es util para seleccionar estimulos
al disenar un experimento (por ejemplo, emojis de valencia negativa y
activacion alta).

## Usage

``` r
seleccionar_emojis(poblacion = "general", valencia = NULL, activacion = NULL)
```

## Arguments

- poblacion:

  Submuestra a usar. Por defecto `"general"`.

- valencia:

  Vector numerico de longitud 2 con el rango `c(min, max)` de
  `val_media`. Si es `NULL`, no filtra por valencia.

- activacion:

  Vector numerico de longitud 2 con el rango de `aro_media`. Si es
  `NULL`, no filtra por activacion.

## Value

Un data frame con las filas que cumplen los criterios.

## Examples

``` r
# Emojis negativos y activantes en la norma general
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
