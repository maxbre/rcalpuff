#' Mapview CALPUFF meteorological domain
#'
#' Create a mapview object from CALPUFF setup meteorological domain file 'qagrid.bna' and eventually export it as html and png files
#'
#' @param qagrid.bna string path to Calpuff setup file 'qagrid.bna'
#' @param epsg number epsg to set crs of the file domain
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_met_domain <- function(qagrid.bna,
                               epsg = 32632,
                               export = FALSE,
                               string_filename = 'file_name_met_domain',
                               name_of_map_layer = 'layer_name_met_domain'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 1, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="green", layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map

}

#' Mapview CALPUFF computational domain
#'
#' Create a mapview object from CALPUFF setup computational domain file 'qagrid.bna' and eventually export it as html and png files
#'
#' @param qagrid.bna string path to Calpuff setup file 'qagrid.bna'
#' @param epsg number epsg to set crs of the file domain
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_comp_domain <- function(qagrid.bna,
                                epsg = 32632,
                                export = FALSE,
                                string_filename = 'file_name_comp_domain',
                                name_of_map_layer = 'layer_name_comp_domain'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 7, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="yellow", layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map
}

#' Mapview CALPUFF sampling domain
#'
#' Create a mapview object from CALPUFF setup sampling domain file 'qagrid.bna' and eventually export it as html and png files
#'
#' @param qagrid.bna string path to Calpuff setup file qagrid.bna
#' @param epsg number epsg to set crs of the file domain
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_samp_domain <- function(qagrid.bna,
                                epsg = 32632,
                                export = FALSE,
                                string_filename = 'file_name_samp_domain',
                                name_of_map_layer = 'layer_name_samp_domain'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  domain <- read_qagrid_bna(qagrid.bna, epsg = epsg, skip = 13, n_max = 5)

  # mapview
  map <- mapview::mapview(domain, color="red", layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map
}

#' Mapview CALPUFF emission points
#'
#' Create a mapview object from CALPUFF setup emission points file 'qapnts.dat' and eventually export it as html and png files
#'
#' @param qapnts.dat string path to Calpuff setup file emission points 'qapnts.dat'
#' @param epsg number epsg to set crs of the emission points
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_emi_points <- function(qapnts.dat,
                               epsg = 32632,
                               export = FALSE,
                               string_filename = 'file_name_emi_points',
                               name_of_map_layer = 'layer_name_emi_points'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  emi_pts_sf <- read_qapnts_dat(qapnts.dat, epsg = epsg)

  # mapview
  map <- mapview::mapview(emi_pts_sf, layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map
}

#' Mapview CALPUFF discrete receptors
#'
#' Create a mapview object from CALPUFF setup discrete receptors file 'qarecd.dat' and eventually export it as html and png files
#'
#' @param qarecd.dat string path to Calpuff setup file discrete receptors 'qarecd.dat'
#' @param epsg number epsg to set crs of the discrete receptors
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_disc_recs <- function(qarecd.dat,
                              epsg = 32632,
                              export = FALSE,
                              string_filename = 'file_name_disc_rescs',
                              name_of_map_layer = 'layer_name_disc_recs'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  # note here suppressing warning of parsing failure number of columns expected
  # it is something related to the function read_qarecd.dat
  disc_recs_sf <- suppressWarnings(read_qarecd_dat(qarecd.dat, epsg = epsg))

  # mapview
  map <- mapview::mapview(disc_recs_sf, layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map
}

#' Mapview CALPUFF grid receptors
#'
#' Create a mapview object from CALPUFF setup grid receptors file 'qarecg.dat' and eventually export it as html and png files
#'
#' @param qarecg.dat string path to Calpuff setup file grid receptors 'qarecg.dat'
#' @param epsg number epsg to set crs of the grid receptors
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_grid_recs <- function(qarecg.dat,
                              epsg = 32632,
                              export = FALSE,
                              string_filename = 'file_name_grid_rescs',
                              name_of_map_layer = 'layer_name_grid_recs'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  # note here suppressing warning of parsing failure number of columns expected
  # it is something related to the function read_qarecg.dat
  grid_recs_sf <- suppressWarnings(read_qarecg_dat(qarecg.dat, epsg = epsg))

  # mapview
  map <- mapview::mapview(grid_recs_sf, layer.name = name_of_map_layer)

  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map
}

#' Mapview CALPUFF terrain
#'
#' Create a mapview object from CALPUFF setup grid file 'qaterr.grd' and eventually export it as html and png files
#'
#' @param qaterr.grd string path to the Calpuff setup grid file 'qaterr.grd'
#' @param epsg number epsg to set crs in the raster object
#' @param export logical, export mapview object as hmtl and png files? The default value is equal to FALSE
#' @param name_of_map_layer string to name the mapview layer
#' @param string_filename string to name the output files
#' @return mapview object exported as html and png files
#' @export

mapview_terr_grd <- function(qaterr.grd,
                                 epsg = 32632,
                                 export = FALSE,
                                 name_of_map_layer = 'layer_name_grid_terr',
                                 string_filename = ' file_name_grid_terr'){

  # get rid of mapview warning message
  withr::with_options(rgdal_show_exportToProj4_warnings = "none")

  # read grid
  grd <- read_qaterr_grd(qaterr.grd, epsg)

  # eventually to hardcode the binning in mapview
  #my_bins<-c(0, 1, 2, 3, 4, 5, 10, 100, round(max(raster::values(grd)),0))
  #my_bins<-pretty(range(raster::values(grd)))

  # get rid of mapview warning message
  #options(rgdal_show_exportToProj4_warnings = "none")

  # mapview
  map <- mapview::mapview(grd,
                          # define the palette
                          col.regions = grDevices::colorRampPalette(rev(RColorBrewer::brewer.pal(8, 'RdYlBu'))),
                          # here eventually define the binning
                          #at = my_bins,
                          na.color ='transparent',
                          alpha.region= 0.5,
                          legend.opacity=0.5,
                          layer.name = name_of_map_layer)


  # eventually export the map to hml and png
  if(export) rfunctions::export_mapview(map, string_filename)

  map

}


