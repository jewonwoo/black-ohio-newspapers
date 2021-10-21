library(tidyverse)
library(readxl)

# Agents data
agents <- read_xlsx("data-raw/PL agents.xlsx")

agents_tidy <- agents %>% 
  gather(key = pubdate, value, -City, -State, -Country, -`First Name`, -`Last Name`, -Agent) %>% 
  select(-pubdate) %>% 
  rename(publication_date = value, 
         agent = Agent, 
         city = City,
         state = State,
         country = Country,
         first_name = `First Name`,
         last_name = `Last Name`)

write_csv(agents_tidy, "data/agents.csv")

# Advertisements
ad_1840s <- read_xlsx("data-raw/Advertisements - 1840s.xlsx")
ad_1850s <- read_xlsx("data-raw/Advertisements - 1850s.xlsx")
ad_1860s <- read_xlsx("data-raw/Advertisements - 1860s.xlsx")
ad_1870s <- read_xlsx("data-raw/Advertisements - 1870s.xlsx")
ad_1880s <- read_xlsx("data-raw/Advertisements - 1880s.xlsx")
ad_1890s <- read_xlsx("data-raw/Advertisements - 1890s.xlsx")

ad_1840s$decade <- paste0("1840")
ad_1850s$decade <- paste0("1850")
ad_1860s$decade <- paste0("1860")
ad_1870s$decade <- paste0("1870")
ad_1880s$decade <- paste0("1880")
ad_1890s$decade <- paste0("1890")

ad_1880s <- ad_1880s %>% rename(frequency = Frequency)

advertisements <- rbind(ad_1840s, ad_1860s, ad_1870s, ad_1880s, ad_1890s)

write_csv(advertisements, "data/advertisements_by_decade.csv")

# Topics
topic_1840s <- read_xlsx("data-raw/Topics - 1840s.xlsx")
topic_1850s <- read_xlsx("data-raw/Topics - 1850s.xlsx")
topic_1860s <- read_xlsx("data-raw/Topics - 1860s.xlsx")
topic_1870s <- read_xlsx("data-raw/Topics - 1870s.xlsx")
topic_1880s <- read_xlsx("data-raw/Topics - 1880s.xlsx")
topic_1890s <- read_xlsx("data-raw/Topics - 1890s.xlsx")

topic_1840s$decade <- paste0("1840")
topic_1850s$decade <- paste0("1850")
topic_1860s$decade <- paste0("1860")
topic_1870s$decade <- paste0("1870")
topic_1880s$decade <- paste0("1880")
topic_1890s$decade <- paste0("1890")

topics <- rbind(topic_1840s, topic_1850s, topic_1860s, topic_1870s, topic_1880s, topic_1890s)
names(topics) <- tolower(names(topics))

write_csv(topics, "data/topics.csv")

# Periodical locations
locations <- read_xlsx("data-raw/Total Data - Combined Quoted Periodicals.xlsx")
names(locations) <- tolower(names(locations))
names(locations) <- gsub(" ", "_", names(locations))

write_csv(locations, "data/locations.csv")
