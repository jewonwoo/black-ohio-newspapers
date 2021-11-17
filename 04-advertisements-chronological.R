library(tidyverse)
library(ggthemes)
library(plotly)
library(viridis)
library(treemap)
library(d3Tree)

# Chronological change of advertisements

# Small multiples
ads_multiple <- ggplot(advertisements, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~category, ncol = 6) +
  theme_minimal() +
  theme(legend.position="none") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
ads_multiple

ads_plotly <- ggplotly(ads_multiple, width = 800, height = 800)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(ads_plotly), "html/ads.html")
ggsave(ads_multiple, device = "png", dpi = 300, path = "png/ads.png")

# Stacked
ads_stacked <- ggplot(advertisements, aes(x = decade, y = frequency, fill = category)) +
  geom_bar(stat="identity") +
  theme(legend.position="none")
ads_stacked

ads_stacked_plotly <- ggplotly(ads_stacked, width = 800, height = 800)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(ads_stacked_plotly), "html/ads_stacked.html")
ggsave(ads_stacked, device = "png", dpi = 300, path = "png/ads_stacked.png")

# Treemap
ads_tree <- treemap(
  advertisements, 
  index=c("decade","category"),
  vSize="frequency",
  type="index",
  palette = "Set2",
  bg.labels=c("white"),
  align.labels=list(
    c("left", "top"),
    c("right", "bottom")
  )
) 
ads_tree
