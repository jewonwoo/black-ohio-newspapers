library(tidyverse)
library(ggthemes)
library(plotly)

# Chronological change of advertisements

ggplot(advertisements, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~category) +
  theme_wsj()

ggplotly(ggplot2::last_plot())
