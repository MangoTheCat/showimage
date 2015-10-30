


# showimage

> Show an Image on an R Graphics Device

[![Linux Build Status](https://travis-ci.org/MangoTheCat/showimage.svg?branch=master)](https://travis-ci.org/MangoTheCat/showimage)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/MangoTheCat/showimage?svg=true)](https://ci.appveyor.com/project/gaborcsardi/showimage)
[![](http://www.r-pkg.org/badges/version/showimage)](http://www.r-pkg.org/pkg/showimage)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/showimage)](http://www.r-pkg.org/pkg/showimage)


Sometimes it is handy to be able to view an image file on an
R graphics device. This package just does that. Currently it supports
PNG files.

## Installation


```r
devtools::install_github("mangothecat/showimage")
```

## Usage


```r
library(showimage)
png(tmp <- tempfile(fileext = ".png"))
pairs(iris)
dev.off()
show_image(tmp)
```

![plot of chunk unnamed-chunk-2](inst/unnamed-chunk-2-1.png) 

## License

GPL-2 | GPL-3 © [Mango Solutions](https://github.com/mangothecat), Simon Urbanek
