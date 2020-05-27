library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)
library(ggplot2)
library(shinythemes)

# Change the limit for scientific notation
options(scipen=999)

#Importing entity grouped sentiment files for shiny app prep
boris <- read_csv("data/sentimentals/boris_df.csv")
saveRDS(boris, file="data/shiny_data/boris.rds")
boris_orig <- read_csv("data/sentimentals_orig/orig_boris_df.csv")
saveRDS(boris_orig, file="data/shiny_data/boris_orig.rds")

cdc <- read_csv("data/sentimentals/cdc_df.csv")
saveRDS(cdc, file="data/shiny_data/cdc.rds")
cdc_orig <- read_csv("data/sentimentals_orig/orig_cdc_df.csv")
saveRDS(cdc_orig, file="data/shiny_data/cdc_orig.rds")

china <- read_csv("data/sentimentals/china_df.csv")
saveRDS(china, file="data/shiny_data/china.rds")
china_orig <- read_csv("data/sentimentals_orig/orig_china_df.csv")
saveRDS(china_orig, file="data/shiny_data/china_orig.rds")

congress <- read_csv("data/sentimentals/congress_df.csv")
saveRDS(congress, file="data/shiny_data/congress.rds")
congress_orig <- read_csv("data/sentimentals_orig/orig_congress_df.csv")
saveRDS(congress_orig, file="data/shiny_data/congress_orig.rds")

eu <- read_csv("data/sentimentals/eu_df.csv")
saveRDS(eu, file="data/shiny_data/eu.rds")
eu_orig <- read_csv("data/sentimentals_orig/orig_eu_df.csv")
saveRDS(eu_orig, file="data/shiny_data/eu_orig.rds")

fauci <- read_csv("data/sentimentals/fauci_df.csv")
saveRDS(fauci, file="data/shiny_data/fauci.rds")
fauci_orig <- read_csv("data/sentimentals_orig/orig_fauci_df.csv")
saveRDS(fauci_orig, file="data/shiny_data/fauci_orig.rds")

fifa <- read_csv("data/sentimentals/fifa_df.csv")
saveRDS(fifa, file="data/shiny_data/fifa.rds")
fifa_orig <- read_csv("data/sentimentals_orig/orig_fifa_df.csv")
saveRDS(fifa_orig, file="data/shiny_data/fifa_orig.rds")

italy <- read_csv("data/sentimentals/italy_df.csv")
saveRDS(italy, file="data/shiny_data/italy.rds")
italy_orig <- read_csv("data/sentimentals_orig/orig_italy_df.csv")
saveRDS(italy_orig, file="data/shiny_data/italy_orig.rds")

mlb <- read_csv("data/sentimentals/mlb_df.csv")
saveRDS(mlb, file="data/shiny_data/mlb.rds")
mlb_orig <- read_csv("data/sentimentals_orig/orig_mlb_df.csv")
saveRDS(mlb_orig, file="data/shiny_data/mlb_orig.rds")

nba <- read_csv("data/sentimentals/nba_df.csv")
saveRDS(nba, file="data/shiny_data/nba.rds")
nba_orig <- read_csv("data/sentimentals_orig/orig_nba_df.csv")
saveRDS(nba_orig, file="data/shiny_data/nba_orig.rds")

nfl <- read_csv("data/sentimentals/nfl_df.csv")
saveRDS(nfl, file="data/shiny_data/nfl.rds")
nfl_orig <- read_csv("data/sentimentals_orig/orig_nfl_df.csv")
saveRDS(nfl_orig, file="data/shiny_data/nfl_orig.rds")

nhl <- read_csv("data/sentimentals/nhl_df.csv")
saveRDS(nhl, file="data/shiny_data/nhl.rds")
nhl_orig <- read_csv("data/sentimentals_orig/orig_nhl_df.csv")
saveRDS(nhl_orig, file="data/shiny_data/nhl_orig.rds")

nhs <- read_csv("data/sentimentals/nhs_df.csv")
saveRDS(nhs, file="data/shiny_data/nhs.rds")
nhs_orig <- read_csv("data/sentimentals_orig/orig_nhs_df.csv")
saveRDS(nhs_orig, file="data/shiny_data/nhs_orig.rds")

nyc <- read_csv("data/sentimentals/nyc_df.csv")
saveRDS(nyc, file="data/shiny_data/nyc.rds")
nyc_orig <- read_csv("data/sentimentals_orig/orig_nyc_df.csv")
saveRDS(nyc_orig, file="data/shiny_data/nyc_orig.rds")

obama <- read_csv("data/sentimentals/obama_df.csv")
saveRDS(obama, file="data/shiny_data/obama.rds")
obama_orig <- read_csv("data/sentimentals_orig/orig_obama_df.csv")
saveRDS(obama_orig, file="data/shiny_data/obama_orig.rds")

pelosi <- read_csv("data/sentimentals/pelosi_df.csv")
saveRDS(pelosi, file="data/shiny_data/pelosi.rds")
pelosi_orig <- read_csv("data/sentimentals_orig/orig_pelosi_df.csv")
saveRDS(pelosi_orig, file="data/shiny_data/pelosi_orig.rds")

spain <- read_csv("data/sentimentals/spain_df.csv")
saveRDS(spain, file="data/shiny_data/spain.rds")
spain_orig <- read_csv("data/sentimentals_orig/orig_spain_df.csv")
saveRDS(spain_orig, file="data/shiny_data/spain_orig.rds")

trump <- read_csv("data/sentimentals/trump_df.csv")
saveRDS(trump, file="data/shiny_data/trump.rds")
trump_orig <- read_csv("data/sentimentals_orig/orig_trump_df.csv")
saveRDS(trump_orig, file="data/shiny_data/trump_orig.rds")

usa <- read_csv("data/sentimentals/usa_df.csv")
saveRDS(usa, file="data/shiny_data/usa.rds")
usa_orig <- read_csv("data/sentimentals_orig/orig_usa_df.csv")
saveRDS(usa_orig, file="data/shiny_data/usa_orig.rds")

whitehouse <- read_csv("data/sentimentals/whitehouse_df.csv")
saveRDS(whitehouse, file="data/shiny_data/whitehouse.rds")
whitehouse_orig <- read_csv("data/sentimentals_orig/orig_whitehouse_df.csv")
saveRDS(whitehouse_orig, file="data/shiny_data/whitehouse_orig.rds")

who <- read_csv("data/sentimentals/who_df.csv")
saveRDS(who, file="data/shiny_data/who.rds")
who_orig <- read_csv("data/sentimentals_orig/orig_who_df.csv")
saveRDS(who_orig, file="data/shiny_data/who_orig.rds")

# Test to make sure I remember how to make a simple plot
fifa_orig_new <- fifa_orig %>% group_by(week)
ggplot(fifa_orig_new, aes(created_at, sentiment)) +
  geom_point(alpha=0.02, color='blue')

ggplot(fifa) +
  stat_summary(aes(x = week, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line") +
  geom_point(data=fifa_orig, aes(x=week, y=sentiment), alpha=0.005)

ggplot(trump_orig, aes(created_at, sentiment)) +
  geom_point(alpha=0.005, color='blue')

ggplot(trump_orig, aes(x=created_at, y=sentiment) ) +
  geom_hex(bins = 500) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(fauci_orig, aes(x=created_at, y=sentiment) ) +
  geom_hex(bins = 500) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(trump_orig, aes(x=created_at, y=sentiment) ) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon")

ggplot(nyc_orig, aes(x = week)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume') +
  xlim(2,18)

