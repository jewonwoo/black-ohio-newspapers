library(tidyverse)
library(plotly)
library(ggthemes)

# Chronological change of topics

# Small multiples
top <- ggplot(topics, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~topic, ncol = 7) +
  theme_minimal() 
top

top_plotly <- ggplotly(top)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(top_plotly), "html/topics.html")
ggsave(top, device = "png", dpi = 300, path = "png/topics.png")

# Stacked
top_stacked <- ggplot(topics, aes(x = decade, y = frequency, fill = topic)) +
  geom_bar(stat="identity", color="black") +
  scale_fill_brewer(type = "qual", palette = "Set3")
top_stacked

stacked_plotly <- ggplotly(top_stacked)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(stacked_plotly), "html/topics_stacked.html")
ggsave(top_stacked, device = "png", dpi = 300, path = "png/topics_stacked.png")
