library(tidyverse)
library(ggthemes)
library(plotly)

# Chronological change of advertisements

# Small multiples
ggplot(advertisements, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~category, ncol = 6) +
  theme_minimal()

ggplotly(ggplot2::last_plot())

# Stacked
ggplot(advertisements, aes(x = decade, y = frequency, fill = category)) +
  geom_bar(stat="identity") 
