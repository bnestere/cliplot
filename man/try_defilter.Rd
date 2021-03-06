% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/organization.r
\name{try_defilter}
\alias{try_defilter}
\title{Filters a dataset where all values in the column are not the specified value}
\usage{
try_defilter(., col, val)
}
\arguments{
\item{.}{The dataset}

\item{col}{The name of the column to filter}

\item{val}{The value to filter the column by}
}
\value{
The dataset where rows with values of val in col are removed
}
\description{
This function filters a specified column within a dataset where all values of the column
are not the specified value from the command line.
}
