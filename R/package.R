
#' Show an Image on an R Graphics Device
#'
#' @param file Name of the image file to show.
#' @param mar Margin, the \code{mar} parameter, see \code{par}.
#' @param axes Whether to show the axes. You need to increase the
#'   margin to see the axis labels.
#' @param frame.plot Whether to draw a frame around the plot.
#' @param ... Additonal arguments are passed to \code{plot}.
#' @return Nothing.
#'
#' @importFrom png readPNG
#' @importFrom tools file_ext
#' @export

show_image <- function(file, mar = c(0.1, 0.1, 0.1, 0.1),
                       axes = FALSE, frame.plot = TRUE, ...) {

  if (!file.exists(file)) stop("File does not exist: ", file)

  ext <- tolower(file_ext(file))

  if (ext == "png") {
    show_image_png(file, mar = mar, axes = axes, frame.plot = frame.plot, ...)

  } else {
    stop("Unknown image type")
  }

  invisible()
}

## This is mostly from the png::readPNG manual page example,
## by Simon Urbanek

show_image_png <- function(file, mar, ...) {

  img <- readPNG(file)

  on.exit(par(oldpar))
  oldpar <- par(mar = mar)

  plot(1:2, type = "n", ...)

  if (names(dev.cur()) == "windows") {
    ## windows device doesn't support semi-transparency so we'll need
    ## to flatten the image
    transparent <- img[,,4] == 0
    img <- as.raster(img[,,1:3])
    img[transparent] <- NA

    ## interpolate must be FALSE on Windows, otherwise R will
    ## try to interpolate transparency and fail
    rasterImage(img, 1.2, 1.27, 1.8, 1.73, interpolate=FALSE)

  } else {
    ## any reasonable device will be fine using alpha
    rasterImage(img, 1.2, 1.27, 1.8, 1.73)
  }
}
