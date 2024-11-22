
#' Simple plot to compare the different editions.
#' @export
plot_editions_simple <- function(pop){
  ggplot2::ggplot(
    data=pop,
    ggplot2::aes(
      x=Year, y=Population/1000, group=Scenario,
      color=Scenario)) +
    ggplot2::geom_line(linewidth=1) +
    ggplot2::scale_color_manual(
      values=c(Moderate='blue', High='red', Estimate='black')) +
    ggplot2::scale_y_continuous(limits=c(0,NA)) +
    ggplot2::theme_bw() +
    ggplot2::facet_grid(County~Edition, scales='free_y')}
#' Example
#'
# pop_proj %>%
#   dplyr::filter(County == 'SOUTH CAROLINA') %>%
#   plot_editions_simple()


## Organizing the data like this makes it possible to create a plot,
## which I like, but it probably isn't great for display purposes.
## Maybe it is too complex or difficult to interpret.
format_pop_editions <- function(pop) {
  pop_proj |> dplyr::filter(
    !(Type=='Estimate' & Edition == '2021' & Year > 2009)) |>
    dplyr::mutate(Type = dplyr::if_else(!is.na(Type2), Type2, Type)) |>
    dplyr::mutate(Type = dplyr::if_else(
      Type == 'Estimate', "Estimate",
      dplyr::if_else(
        Type == 'SC RFA Projection' & Edition == '2019', '2019 RFA Projection',
        dplyr::if_else(
          Type == 'SC RFA Projection' & Edition == '2022', '2022 RFA Projection',
          dplyr::if_else(
            Scenario == 'High' & Edition == '2019', '2019 High Extrapolation',
            dplyr::if_else(
              Scenario == 'High' & Edition == '2022', '2022 High Extrapolation',
              dplyr::if_else(
                Scenario == 'Moderate' & Edition == '2019', '2019 Moderate Extrapolation',
                dplyr::if_else(
                  Scenario == 'Moderate' & Edition == '2022', '2022 Moderate Extrapolation', 'NA')
              )))))))
}

## This plot uses alpha (transparency) to designate the older edition.
plot_editions_alpha <- function(pop) {
  format_pop_editions(pop) |>
    ggplot2::ggplot(
      data=pop,
      ggplot2::aes(
        x=Year, y=Population, group=interaction(
          Period, Scenario, Edition, Type),
        color=Scenario, linetype=Type, size=Period, alpha=Edition)) +
      ggplot2::geom_line() +
      ggplot2::scale_color_manual(
        values=c(Moderate='blue', High='red')) +
      ggplot2::scale_linetype_manual(
        values=c(Estimate='solid', Projection='dashed')) +
      ggplot2::scale_alpha_manual(
        values=c(`2019`=0.35, `2022`=1)) +
      ggplot2::scale_size_manual(
        values=c(Original=1, Extended=0.5)) +
      # ggplot2::scale_y_log10()
      ggplot2::theme_bw() +
      ggplot2::scale_y_continuous(
        limits=c(0,NA), labels=scales::comma_format()
      )} ## make the estimated data line black

#' Example
# pop_proj %>%
#   dplyr::filter(County == 'SOUTH CAROLINA') %>%
#   plot_editions_alpha()

#' Example
## Save a plot for each county
# pop_proj %>%
#   dplyr::group_by(County) %>%
#   dplyr::group_walk(.f=function(.x, .y){
#     ggplot2::ggsave(
#       filename=paste0(.y$County, '.png'),
#       plot=alpha_plot(.x),
#       path='plots',
#       device='png')})


