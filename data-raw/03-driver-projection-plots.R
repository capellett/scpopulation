#' @export
county_population_projection_plot <- function(df) {
  ggplot2::ggplot(df, ggplot2::aes(
    x=Year, y=Population, linetype=Type, color=Type)) +
    ggplot2::labs(title='Population projections 2020 to 2070') +
    ggplot2::geom_line(size=1) + ggplot2::theme_bw() +
    ggplot2::scale_linetype_manual(
      breaks = c('SC ORFA projection', 'extended moderate growth',
                 'high growth'),
      values = c(`SC ORFA projection`='solid',
                 `extended moderate growth`='dashed',
                 `high growth` = 'dotted'),
      labels = c('SC ORFA Projection', 'Extended Moderate Growth',
                 'High Growth')) +
    ggplot2::scale_y_continuous(name='Population',
                                limits=c(0,NA),
                                labels=scales::comma_format(
                                  accuracy = 1)) +
    ggplot2::scale_x_continuous(
      breaks=c(2020, 2030, 2040, 2050, 2060, 2070),
      labels=c("'20", "'30", "'40", "'50", "'60", "'70")) +
    ggplot2::scale_color_manual(
      breaks = c('SC ORFA projection', 'extended moderate growth',
                 'high growth'),
      values = c(`SC ORFA projection`='blue',
                 `extended moderate growth`='blue',
                 `high growth` = 'red'),
      labels = c('SC ORFA Projection', 'Extended Moderate Growth',
                 'High Growth')) +
    ggplot2::theme(legend.position='bottom',
                   legend.title=ggplot2::element_blank(),
                   legend.spacing.x=grid::unit(1.0, 'cm'),
                   axis.text=ggplot2::element_text(color='black')) +
    ggplot2::guides(linetype = ggplot2::guide_legend(
      label.position='bottom',
      keywidth=0.5, default.unit='cm')) +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5)) +
    ggplot2::facet_wrap(County~., scales='free_y')}
