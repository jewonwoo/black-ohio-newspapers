library(tidyverse)
library(ggthemes)
library(plotly)

# Chronological change of advertisements

# Small multiples
ads_multiple <- ggplot(advertisements, aes(x = decade, y = frequency)) +
  geom_bar(stat="identity") +
  facet_wrap(~category, ncol = 6) +
  theme_minimal()
ads_multiple

ads_plotly <- ggplotly(ads_multiple)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(ads_plotly), "html/ads.html")
ggsave(ads_multiple, device = "png", dpi = 300, path = "png/ads.png")

# Stacked
ads_stacked <- ggplot(advertisements, aes(x = decade, y = frequency, fill = category)) +
  geom_bar(stat="identity") 
ads_stacked

ads_stacked_plotly <- ggplotly(ads_stacked)

## Export as HTML and PNG
htmlwidgets::saveWidget(as_widget(ads_stacked_plotly), "html/ads_stacked.html")
ggsave(ads_stacked, device = "png", dpi = 300, path = "png/ads_stacked.png")

