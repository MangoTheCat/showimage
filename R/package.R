
#' Show an Image on an R Graphics Device
#'
#' @param file Name of the image file to show.
#'
#' @importFrom png readPNG
#' @importFrom tools file_ext
#' @export

show_image <- function(file) {

  if (!file.exists(file)) stop("File does not exist: ", file)
  
  ext <- tolower(file_ext(file))

  if (ext == "png") {
    show_image_png(file)
  } else {
    stop("Unknown image type")
  }
}

show_image_png <- function(file) {
  
}
