This is a collaborative project between [Jewon Woo](https://jewonwoo.github.io/jwooprofile/) and RRCHNM on visualizing Black Ohio newspapers.

## Dependencies

```
dependencies <- c("tidyverse", "readxl", "leaflet", "htmltools", "blogdown", "tidygeocoder", "plotly", "ggthemes")

install.packages(dependencies, repos = "http://cran.rstudio.com")
```

## Development

In the RStudio console, running the `blogdown::serve_site()` command launches a preview of the site at <http://localhost:4321>. 

To rebuild the entire site and recompile RMarkdown documents, run `blogdown::build_site(build_rmd = TRUE)`.

To stop the server, run `blogdown::stop_server()` from the RStudio console.

The `Makefile` handles the deployment of `public/` files to the server, and is limited to those who have the appropriate credentials to write files to the server. If you're not on the RRCHM wifi, you'll need to be on the university VPN.
