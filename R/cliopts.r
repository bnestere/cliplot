#' Initialize the Command Line Interface options
#'
#' This function initializes a set of options that are used in generating 
#' the graph.
#'
#' @param default_infile Default value for the name of the dataset file to load
#' @param default_outfile Default value for the name of the output graph to export
#' @param default_x Default field to use for the x axis
#' @param default_y Default field to use for the y axis
#' @param default_groupby Default field to group the data into
#' @return A list of options available
#' @export
init_opts <- function(default_infile, default_outfile, default_x, default_y, default_groupby, default_facetvar) {
  list(
       optparse::make_option(c("-i", "--infile"), type="character", default=default_infile,
                             help="dataset file name", metavar="character"),
       optparse::make_option(c("-o", "--outfile"), type="character", default=default_outfile,
                             help="name of output graph", metavar="character"),
       optparse::make_option(c("-x", "--xaxis"), type="character", default=default_x,
                             help="variable for the x-axis", metavar="character"),
       optparse::make_option(c("-y", "--yaxis"), type="character", default=default_y,
                             help="variable for the y-axis", metavar="character"),
       optparse::make_option(c("-g", "--groupby"), type="character", default=default_groupby,
                             help="field to group the data by in the output graph", 
                             metavar="character"),
       optparse::make_option(c("-d", "--digits"), type="integer", default=2,
                             help="number of digits after the decimal point to display"),
       optparse::make_option(c("-f", "--facetvar"), type="character", default=default_facetvar,
                             help="variable for segmenting facets", metavar="character"),
       optparse::make_option(c("--facetcols"), type="integer", default=2,
                             help="number of columns per row for facets")
       )
}

#' Parse the provided Command Line Interface arguments
#'
#' This function parses the command line interface arguments as values provided
#' by the init_opts function as well as any user-specified values
#'
#' @param option_list The list of potential command line arguments
#' @return The list of provided arguments
#' @export
finalize_opts <- function(option_list) {
  opt_parser <- optparse::OptionParser(option_list=option_list)
  optparse::parse_args(opt_parser)
}

#'  Initialize the Command Line Interface options
#'
#' This function processes the command line interface options entered by a user 
#' and returns their input.
#'
#' @param domain_opts The list of potential command line arguments
#' @param default_infile Default value for the name of the dataset file to load
#' @param default_outfile Default value for the name of the output graph to export
#' @param default_x Default field to use for the x axis
#' @param default_y Default field to use for the y axis
#' @param default_groupby Default field to group the data into
#' @return The list of arguments provided on the cmd line by the user
#' @export
cli_process <- function(domain_opts, default_infile, default_outfile, default_x, default_y, default_groupby) {
  init_opts(default_infile, default_outfile, default_x, default_y, default_groupby) %>%
    c(domain_opts) %>%
    finalize_opts()
}
