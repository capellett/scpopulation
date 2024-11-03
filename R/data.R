#' Population Data from 2019 Edition
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{FIPS}{FIPS code}
#'   \item{County}{County name}
#'   \item{Year}{Year}
#'   \item{Type}{Estimate or Projection}
#'   \item{Gender}{Total, Male, or Female}
#'   \item{Population}{Population count}
#' }
"pop19_gender"

# ... (your other dataset documentation) #' pop19_gender
#'
#' Tidy Format of Raw Data (Nov 2019 Data)
#'
#' @format A tidy data frame after reshaped to _long form_ by creating new columns for Year, Type (Estimate or Projection), Gender (Total, Male, or Female), and Population.
#' \describe{
#'   \item{\code{FIPS}}{FIPS code of each county}
#'   \item{\code{County}}{Name  of county}
#'   \item{\code{Year}}{Year of Projection/Estimate (2000-2035)}
#'   \item{\code{Type}}{Estimate or Projection}
#'   \item{\code{Gender}}{Male , Female or Total}
#'   \item{\code{Population}}{Population number}
#' }
#'
#' @examples
#' data(pop19_gender)
#' head(pop19_gender)
"pop19_gender"

#'pop19
#'
#'Estimate and projection totals
#'
#' @format A data frame with columns including FIPS, County, Year, Type(Total), and Population.
#' \describe{#'
#'   \item{\code{FIPS}}{FIPS code of each county}
#'   \item{\code{County}}{Name  of county}
#'   \item{\code{Year}}{Year of Projection (2000-2035)}
#'   \item{\code{Type}}{Estimate or Projection}
#'   \item{\code{Population}}{Population number}
#' }
#' @examples
#' data(pop19)
#' head(pop19)
"pop19"


#'pop22_cohort
#'
#' A transformed and summarized population data, distinguishing between Estimate and Projections, reformatted for clarity, and adding a state-wide summary.
#' @format Data frame including FIPS, County, Year, Type, Gender and Population.
#' \describe{
#'   \item{\code{AGE GROUP}}{Age Group of Population,  "0 TO 4"   "5 TO 9"   "10 TO 14" "15 To 19" "20 TO 24" "25 TO 29" "30 TO 34" "35 TO 39" "40 TO 44" "45 TO 49" "50 TO 54" "55 TO 59" "60 TO 54"
#'  "65 TO 69" "70 TO 74" "75 TO 79" "80 TO 84" "85+" }
#'   \item{\code{FIPS}}{FIPS code of each county}
#'   \item{\code{County}}{Name  of county}
#'   \item{\code{Year}}{Year of Projection/Estimate (2010-2038)}
#'   \item{\code{Type}}{Estimate or Projection}
#'   \item{\code{Gender}}{Male , Female or Total}
#'   \item{\code{Population}}{Population number}
#' }
#' @examples
#' data(pop22_cohort)
#' head(pop22_cohort)
"pop22_cohort"


#' pop22_gender
#'
#' Tidy Format of (Nov 2022 Data)
#'
#' @format A tidy data frame after reshaped to _long form_ by creating new columns for Year, Type (Estimate or Projection), Gender (Total, Male, or Female), and Population.
#' \describe{
#'   \item{\code{FIPS}}{FIPS code of each county}
#'   \item{\code{County}}{Name  of county}
#'   \item{\code{Year}}{Year of Projection/Estimate (2010-2038)}
#'   \item{\code{Type}}{Estimate or Projection}
#'   \item{\code{Gender}}{Male , Female or Total}
#'   \item{\code{Population}}{Population number}
#' }
#'
#' @examples
#' data(pop22_gender )
#'  head(pop22_gender )
"pop22_gender"


#'pop22
#'
#'Estimate and projection totals
#'
#' @format A data frame with columns including FIPS, County, Year, Type(Total), and Population.
#' \describe{#'
#'   \item{\code{FIPS}}{FIPS code of each county}
#'   \item{\code{County}}{Name  of county}
#'   \item{\code{Year}}{Year of Projection (2000-2038)}
#'   \item{\code{Type}}{Estimate or Projection}
#'   \item{\code{Population}}{Population number}
#' }
#' @examples
#' data(pop22)
#' head(pop22)
"pop22"

#' pop_proj_relative: Relative Growth Projections for Different Counties
#'
#' This dataset provides relative growth projections for different counties under moderate and high growth scenarios. It includes calculations for growth rates and driver growth factors under each scenario.
#'
#' @format
#' The dataset is a data frame with the following columns:
#' \describe{
#'   \item{\code{County}}{Name of the county}
#'   \item{\code{Year}}{Year of Projection (2000-2038)}
#'   \item{\code{High}}{Population in the high growth scenario}
#'   \item{\code{Moderate}}{Population in the moderate growth scenario}
#'   \item{\code{Driver_growth_mod}}{Relative growth in population under the moderate growth scenario}
#'   \item{\code{Driver_growth_hi}}{Relative growth in population under the high growth scenario}
#' }
#'
#' The formulas used in the dataset are as follows:
#' \itemize{
#'   \item Moderate Growth Scenario (Moderate):
#'     \deqn{Growth\_{moderate} = \max(Growth\_{linear}, 0)}
#'     Here, \eqn{Growth\_{linear}} represents the average annual increase in population.
#'
#'   \item High Growth Scenario (High):
#'     \deqn{Growth\_{hi} = Growth\_{exp\_floor} \times 1.10}
#'     \eqn{Growth\_{exp}} is the exponential growth rate. \eqn{Growth\_{exp\_floor}} is set to at least the state average growth rate.
#'
#'   \item Driver Growth Factors:
#'     \deqn{Driver\_{growth\_mod} = \frac{Moderate Population\ in\ Year\ X}{Moderate Population\ in\ 2021}}
#'     \deqn{Driver\_{growth\_hi} = \frac{High Population\ in\ Year\ X}{High Population\ in\ 2021}}
#' }
#'
#' @examples
#' data(pop_proj_relative)
#' head(pop_proj_relative)
"pop_proj_relative"
