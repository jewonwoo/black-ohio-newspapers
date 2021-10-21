library(tidyverse)
library(plotly)
library(ggthemes)

# Chronological change of topics

ggplot(topics, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~topic) +
  theme_wsj()

ggplotly(ggplot2::last_plot())
