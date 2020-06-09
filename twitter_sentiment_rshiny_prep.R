library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)
library(ggplot2)
library(shinythemes)
library(scales)

# Change the limit for scientific notation
options(scipen=999)

#Importing entity grouped sentiment files for shiny app prep
boris <- read_csv("data/sentimentals/boris_df.csv")
saveRDS(boris, file="data/shiny_data/boris.rds")
boris_orig <- read_csv("data/sentimentals_orig/boris_df.csv")
saveRDS(boris_orig, file="data/shiny_data/boris_orig.rds")

cdc <- read_csv("data/sentimentals/cdc_df.csv")
saveRDS(cdc, file="data/shiny_data/cdc.rds")
cdc_orig <- read_csv("data/sentimentals_orig/cdc_df.csv")
saveRDS(cdc_orig, file="data/shiny_data/cdc_orig.rds")

china <- read_csv("data/sentimentals/china_df.csv")
saveRDS(china, file="data/shiny_data/china.rds")
china_orig <- read_csv("data/sentimentals_orig/china_df.csv")
saveRDS(china_orig, file="data/shiny_data/china_orig.rds")

congress <- read_csv("data/sentimentals/congress_df.csv")
saveRDS(congress, file="data/shiny_data/congress.rds")
congress_orig <- read_csv("data/sentimentals_orig/congress_df.csv")
saveRDS(congress_orig, file="data/shiny_data/congress_orig.rds")

eu <- read_csv("data/sentimentals/eu_df.csv")
saveRDS(eu, file="data/shiny_data/eu.rds")
eu_orig <- read_csv("data/sentimentals_orig/eu_df.csv")
saveRDS(eu_orig, file="data/shiny_data/eu_orig.rds")

fauci <- read_csv("data/sentimentals/fauci_df.csv")
saveRDS(fauci, file="data/shiny_data/fauci.rds")
fauci_orig <- read_csv("data/sentimentals_orig/fauci_df.csv")
saveRDS(fauci_orig, file="data/shiny_data/fauci_orig.rds")

fifa <- read_csv("data/sentimentals/fifa_df.csv")
saveRDS(fifa, file="data/shiny_data/fifa.rds")
fifa_orig <- read_csv("data/sentimentals_orig/fifa_df.csv")
saveRDS(fifa_orig, file="data/shiny_data/fifa_orig.rds")

italy <- read_csv("data/sentimentals/italy_df.csv")
saveRDS(italy, file="data/shiny_data/italy.rds")
italy_orig <- read_csv("data/sentimentals_orig/italy_df.csv")
saveRDS(italy_orig, file="data/shiny_data/italy_orig.rds")

mlb <- read_csv("data/sentimentals/mlb_df.csv")
saveRDS(mlb, file="data/shiny_data/mlb.rds")
mlb_orig <- read_csv("data/sentimentals_orig/mlb_df.csv")
saveRDS(mlb_orig, file="data/shiny_data/mlb_orig.rds")

nba <- read_csv("data/sentimentals/nba_df.csv")
saveRDS(nba, file="data/shiny_data/nba.rds")
nba_orig <- read_csv("data/sentimentals_orig/nba_df.csv")
saveRDS(nba_orig, file="data/shiny_data/nba_orig.rds")

nfl <- read_csv("data/sentimentals/nfl_df.csv")
saveRDS(nfl, file="data/shiny_data/nfl.rds")
nfl_orig <- read_csv("data/sentimentals_orig/nfl_df.csv")
saveRDS(nfl_orig, file="data/shiny_data/nfl_orig.rds")

nhl <- read_csv("data/sentimentals/nhl_df.csv")
saveRDS(nhl, file="data/shiny_data/nhl.rds")
nhl_orig <- read_csv("data/sentimentals_orig/nhl_df.csv")
saveRDS(nhl_orig, file="data/shiny_data/nhl_orig.rds")

nhs <- read_csv("data/sentimentals/nhs_df.csv")
saveRDS(nhs, file="data/shiny_data/nhs.rds")
nhs_orig <- read_csv("data/sentimentals_orig/nhs_df.csv")
saveRDS(nhs_orig, file="data/shiny_data/nhs_orig.rds")

nyc <- read_csv("data/sentimentals/nyc_df.csv")
saveRDS(nyc, file="data/shiny_data/nyc.rds")
nyc_orig <- read_csv("data/sentimentals_orig/nyc_df.csv")
saveRDS(nyc_orig, file="data/shiny_data/nyc_orig.rds")

obama <- read_csv("data/sentimentals/obama_df.csv")
saveRDS(obama, file="data/shiny_data/obama.rds")
obama_orig <- read_csv("data/sentimentals_orig/obama_df.csv")
saveRDS(obama_orig, file="data/shiny_data/obama_orig.rds")

pelosi <- read_csv("data/sentimentals/pelosi_df.csv")
saveRDS(pelosi, file="data/shiny_data/pelosi.rds")
pelosi_orig <- read_csv("data/sentimentals_orig/pelosi_df.csv")
saveRDS(pelosi_orig, file="data/shiny_data/pelosi_orig.rds")

spain <- read_csv("data/sentimentals/spain_df.csv")
saveRDS(spain, file="data/shiny_data/spain.rds")
spain_orig <- read_csv("data/sentimentals_orig/spain_df.csv")
saveRDS(spain_orig, file="data/shiny_data/spain_orig.rds")

trump <- read_csv("data/sentimentals/trump_df.csv")
saveRDS(trump, file="data/shiny_data/trump.rds")
trump_orig <- read_csv("data/sentimentals_orig/trump_df.csv")
saveRDS(trump_orig, file="data/shiny_data/trump_orig.rds")

usa <- read_csv("data/sentimentals/usa_df.csv")
saveRDS(usa, file="data/shiny_data/usa.rds")
usa_orig <- read_csv("data/sentimentals_orig/usa_df.csv")
saveRDS(usa_orig, file="data/shiny_data/usa_orig.rds")

whitehouse <- read_csv("data/sentimentals/whitehouse_df.csv")
saveRDS(whitehouse, file="data/shiny_data/whitehouse.rds")
whitehouse_orig <- read_csv("data/sentimentals_orig/whitehouse_df.csv")
saveRDS(whitehouse_orig, file="data/shiny_data/whitehouse_orig.rds")

who <- read_csv("data/sentimentals/who_df.csv")
saveRDS(who, file="data/shiny_data/who.rds")
who_orig <- read_csv("data/sentimentals_orig/who_df.csv")
saveRDS(who_orig, file="data/shiny_data/who_orig.rds")

# Test to make sure I remember how to make a simple plot
fifa_orig_new <- fifa_orig %>% group_by(week)
ggplot(fifa_orig_new, aes(created_at, sentiment)) +
  geom_point(alpha=0.02, color='blue')

ggplot(fifa) +
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line") +
  geom_point(data=fifa, aes(x=week_set_day, y=sentiment), alpha=0.005)

ggplot(trump_orig, aes(created_at, sentiment)) +
  geom_point(alpha=0.005, color='blue')

ggplot(trump_orig, aes(x=created_at, y=sentiment) ) +
  geom_hex(bins = 500) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(fauci, aes(x=created_at, y=sentiment) ) +
  geom_hex(bins = 500) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()

ggplot(fifa, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=fifa[sample(nrow(fifa), 10000), ], aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b %d",
               limits=as.Date(c("2020-01-01 00:00", "2020-05-01 00:00"))) +
  theme(axis.text.x=element_text(angle=90,hjust=1)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')

ggplot(fauci, aes(x = week)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume') +
  xlim(2,18)

# Making the individual plots so I don't overwhelm R Shiny memory when I publish
ggplot(fifa, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=fifa, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/soccer_sent.png')

ggplot(mlb, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=mlb, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/baseball_sent.png')

ggplot(nba, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nba, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/basketball_sent.png')

ggplot(boris, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=boris, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/boris_sent.png')

ggplot(cdc, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=cdc, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/cdc_sent.png')

ggplot(china, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=china, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/china_sent.png')

ggplot(congress, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=congress, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/congress_sent.png')

ggplot(eu, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=eu, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/eu_sent.png')

ggplot(fauci, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=fauci, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/fauci_sent.png')

ggplot(nfl, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nfl, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/football_sent.png')

ggplot(nhl, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nhl, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/hockey_sent.png')

ggplot(italy, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=italy, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/italy_sent.png')

ggplot(nhs, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nhs, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/nhs_sent.png')

ggplot(nyc, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nyc, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/nyc_sent.png')

ggplot(obama, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=obama, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/obama_sent.png')

ggplot(pelosi, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=pelosi, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/pelosi_sent.png')

ggplot(spain, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=spain, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/spain_sent.png')

ggplot(trump, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=trump, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/trump_sent.png')

ggplot(usa, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=usa, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/usa_sent.png')

ggplot(whitehouse, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=whitehouse, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/whitehouse_sent.png')

ggplot(who, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=who, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/who_sent.png')

ggplot(mlb, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/baseball_vol.png')

ggplot(nba, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/basketball_vol.png')

ggplot(boris, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/boris_vol.png')

ggplot(cdc, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/cdc_vol.png')

ggplot(china, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/china_vol.png')

ggplot(congress, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/congress_vol.png')

ggplot(eu, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/eu_vol.png')

ggplot(fauci, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/fauci_vol.png')

ggplot(nfl, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/football_vol.png')

ggplot(nhl, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/hockey_vol.png')

ggplot(italy, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/italy_vol.png')

ggplot(nhs, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/nhs_vol.png')

ggplot(nyc, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/nyc_vol.png')

ggplot(obama, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/obama_vol.png')

ggplot(pelosi, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/pelosi_vol.png')

ggplot(fifa, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/soccer_vol.png')

ggplot(spain, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/spain_vol.png')

ggplot(trump, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/trump_vol.png')

ggplot(usa, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/usa_vol.png')

ggplot(whitehouse, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/whitehouse_vol.png')

ggplot(who, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/who_vol.png')

ggplot(fifa_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=fifa_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/soccer_orig_sent.png')

ggplot(mlb_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=mlb_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/baseball_orig_sent.png')

ggplot(nba_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nba_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/basketball_orig_sent.png')

ggplot(boris_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=boris_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/boris_orig_sent.png')

ggplot(cdc_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=cdc_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/cdc_orig_sent.png')

ggplot(china_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=china_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/china_orig_sent.png')

ggplot(congress_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=congress_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/congress_orig_sent.png')

ggplot(eu_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=eu_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/eu_orig_sent.png')

ggplot(fauci_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=fauci_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/fauci_orig_sent.png')

ggplot(nfl_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nfl_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/football_orig_sent.png')

ggplot(nhl_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nhl_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/hockey_orig_sent.png')

ggplot(italy_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=italy_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/italy_orig_sent.png')

ggplot(nhs_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nhs_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/nhs_orig_sent.png')

ggplot(nyc_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=nyc_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/nyc_orig_sent.png')

ggplot(obama_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=obama_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/obama_orig_sent.png')

ggplot(pelosi_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=pelosi_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/pelosi_orig_sent.png')

ggplot(spain_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=spain_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/spain_orig_sent.png')

ggplot(trump_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=trump_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/trump_orig_sent.png')

ggplot(usa_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=usa_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/usa_orig_sent.png')

ggplot(whitehouse_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=whitehouse_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/whitehouse_orig_sent.png')

ggplot(who_orig, aes(x=as.Date(created_at), y=sentiment) ) +
  stat_density_2d(data=who_orig, aes(fill = ..level..), geom = "polygon")+
  stat_summary(aes(x = week_set_day, y = sentiment), 
               fun.x = function(y) length(y) / length(unique(y)), 
               geom = "line", color='darkblue', size=1) +
  scale_fill_distiller(palette=4, direction=1) +
  labs(fill='Density of Tweets')+
  ylim(-10, 10) +
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Sentiment Score')
ggsave(file='twitter_sent_app/plots/who_orig_sent.png')

ggplot(mlb_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/baseball_orig_vol.png')

ggplot(nba_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/basketball_orig_vol.png')

ggplot(boris_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/boris_orig_vol.png')

ggplot(cdc_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/cdc_orig_vol.png')

ggplot(china_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/china_orig_vol.png')

ggplot(congress_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/congress_orig_vol.png')

ggplot(eu_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/eu_orig_vol.png')

ggplot(fauci_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/fauci_orig_vol.png')

ggplot(nfl_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/football_orig_vol.png')

ggplot(nhl_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/hockey_orig_vol.png')

ggplot(italy_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/italy_orig_vol.png')

ggplot(nhs_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/nhs_orig_vol.png')

ggplot(nyc_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/nyc_orig_vol.png')

ggplot(obama_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/obama_orig_vol.png')

ggplot(pelosi_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/pelosi_orig_vol.png')

ggplot(fifa_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/soccer_orig_vol.png')

ggplot(spain_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/spain_orig_vol.png')

ggplot(trump_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/trump_orig_vol.png')

ggplot(usa_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/usa_orig_vol.png')

ggplot(whitehouse_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/whitehouse_orig_vol.png')

ggplot(who_orig, aes(x = week_set_day)) +
  geom_bar(fill = 'darkgreen') +
  labs(x='Week (2020)', y='Tweet Volume')+
  scale_x_date(date_breaks = "1 week", date_labels = "%b-%d",
               limits=as.Date(c("2020-01-06 00:00", "2020-05-01 00:00")))+
  theme(axis.text.x=element_text(angle=90,hjust=1, size=12),
        axis.text.y=element_text(size=12),
        axis.title.x=element_text(size=16),
        axis.title.y=element_text(size=16)) +
  labs(x='Date of Tweet (2020)', y='Number of Tweets')
ggsave(file='twitter_sent_app/plots/who_orig_vol.png')

