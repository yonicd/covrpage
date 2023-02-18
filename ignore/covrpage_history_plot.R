library(magrittr)
x <- covrpage::covr_log()
  
xx <- x%>%
  dplyr::mutate(
    file_fac =  factor(file,levels = rev(unique(file)))  
  )%>%
  dplyr::filter(!is.na(date))

p <- xx%>%
  ggplot2::ggplot(
    ggplot2::aes(
      x    = factor(date),
      y    = file_fac,
      fill = percent)
    )+
  ggplot2::geom_tile(
    colour = 'white',
    width  = .95,
    alpha  = 0.75
    ) +
  ggplot2::geom_text(data = xx%>%
                       dplyr::filter(date==max(date,na.rm = TRUE)),
                     colour = 'black',
                     size=2,
                     ggplot2::aes(label = floor(percent))) +
  ggplot2::geom_hline(
    yintercept = c(0,(1:length(unique(x$file)))+0.5),
    colour     = 'grey90'
    ) +
  viridis::scale_fill_viridis(
    name = 'Coverage (%)',direction = -1
    ) +
  ggplot2::theme_minimal() +
  ggplot2::labs(
    title = sprintf('History of code coverage results for: %s/%s',
                    gsub('\\s(.*?)$','',unique(grep('Package',xx$file,value = TRUE))),
                    attr(x,'branch')),
    subtitle = 'Source: git log',
    caption = 'Created using covrpage'
  ) +
  ggplot2::theme(
    legend.position   = 'bottom',
    panel.grid.major  = ggplot2::element_blank(),
    axis.text.x       = ggplot2::element_text(
      angle = 90
      ),
    panel.grid.minor  = ggplot2::element_blank(),
    axis.title        = ggplot2::element_blank()
    )

p
