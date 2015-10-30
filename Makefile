
all: README.md

README.md: inst/README.Rmd
	cd inst && Rscript -e "library(knitr); knit('README.Rmd', output = '$@', quiet = TRUE)"
