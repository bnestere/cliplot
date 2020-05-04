#' @export
rearrange <- function(data, col, order) {
  colsym <- rlang::sym(col)
  data %>%
    dplyr::mutate(!!colsym := fct_relevel(!!colsym, order)) 
}

#' Try to filter a column if a value is provided the the cmd line options
#'
#' This function filters a specified column within a dataset by a commnd line option.
#'
#' @param . The dataset
#' @param col The name of the column to filter
#' @param val The value to filter the column by
#' @return The dataset where all values in col are val
#' @export
try_filter <- function(., col, val) {
  if(!is.null(val))
    dplyr::filter(., UQ(sym(col)) == val)
  else .
}

#' Filters a dataset where all values in the column are not the specified value
#'
#' This function filters a specified column within a dataset where all values of the column 
#' are not the specified value from the command line.
#'
#' @param . The dataset
#' @param col The name of the column to filter
#' @param val The value to filter the column by
#' @return The dataset where rows with values of val in col are removed
#' @export
try_defilter <- function(., col, val) {
  if(!is.null(val))
    dplyr::filter(., UQ(sym(col)) != val)
  else .
}
