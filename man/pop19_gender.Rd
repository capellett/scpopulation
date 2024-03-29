% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/doc.R
\docType{data}
\name{pop19_gender}
\alias{pop19_gender}
\title{pop19_gender}
\format{
A tidy data frame after reshaped to \emph{long form} by creating new columns for Year, Type (Estimate or Projection), Gender (Total, Male, or Female), and Population.
\describe{
\item{\code{FIPS}}{FIPS code of each county}
\item{\code{County}}{Name  of county}
\item{\code{Year}}{Year of Projection/Estimate (2000-2035)}
\item{\code{Type}}{Estimate or Projection}
\item{\code{Gender}}{Male , Female or Total}
\item{\code{Population}}{Population number}
}

A tidy data frame after reshaped to \emph{long form} by creating new columns for Year, Type (Estimate or Projection), Gender (Total, Male, or Female), and Population.
\describe{
\item{\code{FIPS}}{FIPS code of each county}
\item{\code{County}}{Name  of county}
\item{\code{Year}}{Year of Projection/Estimate (2010-2038)}
\item{\code{Type}}{Estimate or Projection}
\item{\code{Gender}}{Male , Female or Total}
\item{\code{Population}}{Population number}
}
}
\usage{
pop19_gender

pop19_gender
}
\description{
Tidy Format of Raw Data (Nov 2019 Data)

Tidy Format of (Nov 2022 Data)
}
\examples{
data(pop19_gender)
 head(pop19_gender)
data(pop22_gender )
 head(pop22_gender )
}
\keyword{datasets}
