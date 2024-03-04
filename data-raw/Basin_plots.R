counties <- list(
  c("Allendale"),
  c("Colleton"),
  c("Hampton", "Jasper"),
  c("Jasper", "Hampton"),
  c("Allendale", "Hampton"),
  c("Bamberg"),
  c("Hampton"),
  c("Barnwell"),
  c("Beaufort"),
  c("Beaufort", "Hampton"),
  c("Orangeburg"),
  c("Aiken"),
  c("Jasper"),
  c("Edgefield"),
  c("Colleton", "Bamberg"),
  c("Barnwell", "Aiken"),
  c("Charleston"),
  c("Chesterfield", "Kershaw", "Lancaster"),
  c("Beaufort", "Jasper"),
  c("Bamberg", "Barnwell")
)

# Flatten the list of lists into a single vector
all_counties <- unlist(counties)

# Find the unique counties
unique_counties <- unique(all_counties)


load("../data/pop_proj.rda")

  pop_proj %>%
       dplyr::mutate(County = stringr::str_to_title(County)) %>%
       dplyr::filter(County %in%  c('Allendale', 'Greenville', 'Horry', 'Spartanburg')) %>%
       simpler_plot() +
       ggplot2::theme(legend.position='bottom', legend.title=ggplot2::element_blank()) +
       ggplot2::ylab('Population (thousands)'))
