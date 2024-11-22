#' Create Population Pyramid Plot
#' @param df Data frame containing population data
#' @details See https://rfortherestofus.com/2024/07/population-pyramid-part-1 for inspiration.
#' @export
pyramid_plot <- function(df) {
  dplyr::filter(df, Gender %in% c("Male", "Female")) |>
    dplyr::mutate(Population = if_else(
      Gender == 'Male', Population, -Population)) |>
    ggplot2::ggplot(
      ggplot2::aes(x=Population, y=`Age`, fill=Gender)) +
    ggplot2::geom_col() +
    ggplot2::scale_x_continuous(
      labels = function(x) scales::label_comma()(abs(x)),
      breaks = scales::breaks_pretty()
    ) +
    ggplot2::theme_bw()
}

#' Example
pop22_cohort |>
  dplyr::filter(County == 'SOUTH CAROLINA' & Year == 2021) |>
  pyramid_plot()

## animate for all years.
## add filter for counties.
