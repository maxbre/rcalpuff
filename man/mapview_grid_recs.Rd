% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapview_calpuff_setup_qafiles.R
\name{mapview_grid_recs}
\alias{mapview_grid_recs}
\title{Mapview CALPUFF grid receptors}
\usage{
mapview_grid_recs(
  qarecg.dat,
  epsg = 32632,
  export = FALSE,
  string_filename = "file_name_grid_rescs",
  name_of_map_layer = "layer_name_grid_recs"
)
}
\arguments{
\item{qarecg.dat}{string path to Calpuff setup file grid receptors 'qarecg.dat'}

\item{epsg}{number epsg to set crs of the grid receptors}

\item{export}{logical, export mapview object as hmtl and png files? The default value is equal to FALSE}

\item{string_filename}{string to name the output files}

\item{name_of_map_layer}{string to name the mapview layer}
}
\value{
mapview object exported as html and png files
}
\description{
Create a mapview object from CALPUFF setup grid receptors file 'qarecg.dat' and eventually export it as html and png files
}
