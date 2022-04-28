#' export_mapview
#'
#' Export mapview object to html and png
#'
#' @param map mapview object
#' @param string_filename string to name the output files
#' @return mapview object
#' @keywords internal

export_mapview <- function(map, string_filename = 'file_name'){

  # string today date
  my_date <- format(Sys.Date(), "%Y%m%d")

  # compose string filename with today date
  string_filename <- paste0(my_date, '_', string_filename)

  url_str <- paste0(string_filename, '.html')
  file_str <- paste0(string_filename, '.png')

  # export map as html and png files, and remove some controls
  mapview::mapshot(map,
                   url = url_str,
                   file = file_str,
                   remove_controls = c("zoomControl", "layersControl", "homeButton", "scaleBar"))

  map

}
