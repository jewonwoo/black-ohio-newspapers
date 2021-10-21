library(tidyverse)
library(plotly)
library(ggthemes)

# Chronological change of topics

# Small multiples
ggplot(topics, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~topic, ncol = 7) +
  theme_minimal() 

ggplotly(ggplot2::last_plot())

# Stacked
ggplot(topics, aes(x = decade, y = frequency, fill = topic)) +
  geom_bar(stat="identity", color="black") +
  scale_fill_brewer(type = "qual", palette = "Set3")
