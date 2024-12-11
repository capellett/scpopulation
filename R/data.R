#' Population Data by Gender from 2019 Edition (pop19_gender)
#' This dataset came from the SC Office of Revenue and Fiscal Affairs. It contains data for the Total, Male, and Female populations for each county. Population estimates from year 2000 to 2018 and population projections from 2019 to 2035 are included.
#' @format A data frame with columns:
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

#' Total population data from 2019 Edition (pop19)
#' This dataset came from the SC Office of Revenue and Fiscal Affairs.
#' Estimate and projection totals
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


#' Population by cohort from the 2022 edition (pop22_cohort)
#' This dataset came from the SC Office of Revenue and Fiscal Affairs.
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


#' Population by gender from the 2022 edition (pop22_gender)
#' This dataset came from the SC Office of Revenue and Fiscal Affairs.
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


#' Population totals from the 2022 edition (pop22)
#' This dataset came from the SC Office of Revenue and Fiscal Affairs.
#' Estimate and projection totals
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
#' This dataset is extended from the 2022 SC RFA data using the methods described in the documentation.
#' This dataset provides relative growth projections for different counties under moderate and high growth scenarios. It includes calculations for growth rates and driver growth factors under each scenario.
#'
#' @format
#' The dataset is a data frame with the following columns:
#' \describe{
#'   \item{\code{County}}{Name of the county}
#'   \item{\code{Year}}{Year of Projection (2000-2070)}
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


#' pop_proj Results of extending the SC RFA projections
#' This table includes detailed results of the methods used to extend the projections (for both editions of the SC RFA projections).
#' @format A data frame with columns:
#' \describe{
#'  \item{\code{Period}}{Original (from SC RFA) or Extended (from the methods used to extend the projections)}
#'  \item{\code{Scenario}}{Estimate, Moderate, or High}
#'  \item{\code{Edition}}{2019 or 2022}
#'  \item{\code{County}}{Name of the county}
#'  \item{\code{Year}}{Year of Projection (2000-2070)}
#'  \item{\code{Type}}{Estimate, SC RFA Projection, or Extrapolated Projection}
#'  \item{\code{Population}}{Population number}
#'  \item{\code{T_0}}{Initial year for this "scenario"}
#'  \item{\code{T_1}}{Final year for this "scenario"}
#'  \item{\code{Pop_0}}{Initial population for this "scenario"}
#'  \item{\code{Pop_1}}{Final population for this "scenario"}
#'  \item{\code{Growth_linear}}{Population growth for this "scenario," annual change in population}
#'  \item{\code{Growth_exp}}{Exponential growth rate for this "scenario"}
#'  \item{\code{Growth_moderate}}{Annual change  in population under the moderate growth scenario (linear growth with minimum set to zero)}
#'  \item{\code{Growth_exp_floor}}{Minimum growth rate for the High scenario (the state-wide average*1.1)}
#'  \item{\code{Growth_hi}}{Exponential growth rate for this "scenario," floor set to at least the state average growth rate}
#'  \item{\code{Type2}}{Relative growth in population under the moderate growth scenario (2019 edition)}
#'
#' @examples
#' data(pop_proj)
#' head(pop_proj)
"pop_proj"
