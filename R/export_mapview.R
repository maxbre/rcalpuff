#' export_mapview
#'
#' Export mapview object to html and png
#'
#' @param map mapview object
#' @param string_filename string to name the output files
#' @return export html and png files

export_mapview <- function(map, string_filename){

  # string today date
  my_date <- format(Sys.Date(), "%Y%m%d")

  # compose string filename with today date
  string_filename <- paste0(my_date, '_', string_filename)

  # export map as html and png files, and remove some controls
  mapview::mapshot(map,
                   url = paste0(string_filename, '.html'),
                   file = paste0(string_filename, '.png'),
                   remove_controls = c("zoomControl", "layersControl", "homeButton", "scaleBar"))

  map

}
