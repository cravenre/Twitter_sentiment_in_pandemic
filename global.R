library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)
library(ggplot2)
library(shinythemes)
library(shinycssloaders)

# Change the limit for scientific notation
options(scipen=999)

#ent_group_list <- c("People", "Geo-political", "Organizations", "Sports")

trump <- readRDS('data/shiny_data/trump.rds')
obama <- readRDS('data/shiny_data/obama.rds')
boris <- readRDS('data/shiny_data/boris.rds')
pelosi <- readRDS('data/shiny_data/pelosi.rds')
fauci <- readRDS('data/shiny_data/fauci.rds')
spain <- readRDS('data/shiny_data/spain.rds')
nyc <- readRDS('data/shiny_data/nyc.rds')
china <- readRDS('data/shiny_data/china.rds')
eu <- readRDS('data/shiny_data/eu.rds')
italy <- readRDS('data/shiny_data/italy.rds')
usa <- readRDS('data/shiny_data/usa.rds')
whitehouse <- readRDS('data/shiny_data/whitehouse.rds')
cdc <- readRDS('data/shiny_data/cdc.rds')
congress <- readRDS('data/shiny_data/congress.rds')
nhs <- readRDS('data/shiny_data/nhs.rds')
who <- readRDS('data/shiny_data/who.rds')
baseball <- readRDS('data/shiny_data/mlb.rds')
hockey <- readRDS('data/shiny_data/nhl.rds')
basketball <- readRDS('data/shiny_data/nba.rds')
soccer <- readRDS('data/shiny_data/fifa.rds')
football <- readRDS('data/shiny_data/nfl.rds')

trump_orig <- readRDS('data/shiny_data/trump_orig.rds')
obama_orig <- readRDS('data/shiny_data/obama_orig.rds')
boris_orig <- readRDS('data/shiny_data/boris_orig.rds')
pelosi_orig <- readRDS('data/shiny_data/pelosi_orig.rds')
fauci_orig <- readRDS('data/shiny_data/fauci_orig.rds')
spain_orig <- readRDS('data/shiny_data/spain_orig.rds')
nyc_orig <- readRDS('data/shiny_data/nyc_orig.rds')
china_orig <- readRDS('data/shiny_data/china_orig.rds')
eu_orig <- readRDS('data/shiny_data/eu_orig.rds')
italy_orig <- readRDS('data/shiny_data/italy_orig.rds')
usa_orig <- readRDS('data/shiny_data/usa_orig.rds')
whitehouse_orig <- readRDS('data/shiny_data/whitehouse_orig.rds')
cdc_orig <- readRDS('data/shiny_data/cdc_orig.rds')
congress_orig <- readRDS('data/shiny_data/congress_orig.rds')
nhs_orig <- readRDS('data/shiny_data/nhs_orig.rds')
who_orig <- readRDS('data/shiny_data/who_orig.rds')
baseball_orig <- readRDS('data/shiny_data/mlb_orig.rds')
hockey_orig <- readRDS('data/shiny_data/nhl_orig.rds')
basketball_orig <- readRDS('data/shiny_data/nba_orig.rds')
soccer_orig <- readRDS('data/shiny_data/fifa_orig.rds')
football_orig <- readRDS('data/shiny_data/nfl_orig.rds')

trump_dates <- c("Jan 21: First confirmed US case",
                 "Jan 31: Trump declares public health emergency",
                 "Feb 6: First report of death in US",
                 "Mar 6: Trump says anybody can be tested while at CDC",
                 "Mar 11: Trump restricts travel with Europe",
                 "Mar 11: COVID-19 declared a pandemic",
                 "Mar 13: Trump declares national emergency",
                 "Mar 29: White House extends social distancing",
                 "Apr 3: CDC recommends face masks",
                 "Apr 16: White House reopening guidance",
                 "Apr 23: Small business funding passed",
                 "Apr 28: 1 million US cases")
obama_dates <- c("Jan 21: First confirmed US case",
                 "Jan 30: Public Health Emergency of International Concern declared",
                 "Jan 31: Trump declares public health emergency",
                 "Feb 6: First report of death in US",
                 "Feb 26: CDC reports community spread",
                 "Feb 28: CDC acknowledges flaws in test kits",
                 "Mar 6: Trump says anybody can be tested while at CDC",
                 "Mar 11: Trump restricts travel with Europe",
                 "Mar 11: COVID-19 declared a pandemic",
                 "Mar 13: Trump declares national emergency",
                 "Mar 27: Stimulus package signed")
boris_dates <- c("Jan 14: First case outside of China",
                 "Jan 22: Increased screening at Heathrow",
                 "Jan 30: Public Health Emergency of International Concern declared",
                 "Jan 31: First confirmed UK cases",
                 "Feb 6: Expansion of UK-bound travel restrictions",
                 "Feb 26/27: First cases in Scotland",
                 "Feb 27/28: First cases in Wales and Northern Ireland",
                 "Mar 3: Coronavirus Action Plan revealed",
                 "Mar 5: First UK death",
                 "Mar 17: NHS postpones non-essential procedures",
                 "Mar 23: Johnson announces 3-week stay at home period",
                 "Mar 27: Johnson tests positive",
                 "Apr 4: Johnson hopitalized",
                 "Apr 12: Johnson released from hospital",
                 "Apr 16: Restrictions extended")
pelosi_dates <- c("Jan 21: First confirmed US case",
                  "Jan 31: Trump declares public health emergency",
                  "Feb 6: First report of death in US",
                  "Mar 6: Trump says anybody can be tested while at CDC",
                  "Mar 11: Trump restricts travel with Europe",
                  "Mar 11: COVID-19 declared a pandemic",
                  "Mar 13: Trump declares national emergency",
                  "Mar 29: White House extends social distancing",
                  "Apr 3: CDC recommends face masks",
                  "Apr 16: White House reopening guidance",
                  "Apr 23: Small business funding passed",
                  "Apr 28: 1 million US cases")
fauci_dates <- c("Jan 21: First confirmed US case",
                 "Jan 29: Coronavirus Task Force established",
                 "Jan 31: Trump declares public health emergency",
                 "Feb 6: First report of death in US",
                 "Mar 6: Trump says anybody can be tested while at CDC",
                 "Mar 11: Trump restricts travel with Europe",
                 "Mar 11: COVID-19 declared a pandemic",
                 "Mar 13: Trump declares national emergency",
                 "Mar 29: White House extends social distancing",
                 "Apr 3: CDC recommends face masks",
                 "Apr 16: White House reopening guidance",
                 "Apr 23: Small business funding passed",
                 "Apr 28: 1 million US cases")
spain_dates <- c("Jan 30: Public Health Emergency of International Concern declared",
                 "Jan 31: Spain reports first case",
                 "Feb 13: First death in Spain",
                 "Feb 26: First community-acquired cases",
                 "Mar 10: All flights from Italy cancelled",
                 "Mar 13: State of Alarm declared",
                 "Mar 15: Lockdown begins",
                 "Mar 16: All borders closed",
                 "Mar 17: Financial support package announced",
                 "Mar 28: Non-essential activity banned",
                 "Apr 13: Some business sectors reopen",
                 "Apr 23: State of Alarm extended",
                 "Apr 26/27: Children allowed out on short walks")
nyc_dates <- c("Janu 17: CDC begins airport screening",
               "Jan 21: First confirmed US case",
               "Jan 31: Trump declares public health emergency",
               "Feb 6: First report of death in US",
               "Feb 21: CDC says pandemic possible",
               "Feb 26: CDC reports community spread",
               "Mar 7: State disaster emergency declared",
               "Mar 11: Trump restricts travel with Europe",
               "Mar 11: COVID-19 declared a pandemic",
               "Mar 12: de Blasio declares local state of emergency",
               "Mar 13: Trump declares national emergency",
               "Mar 15: City schools closed",
               "Mar 20: Non-essential businesses closed",
               "March 28: CDC issues travel advisory for NY area")
china_dates <- c("Dec 31: China informs WHO of patient cluster",
                 "Jan 1: Huanan Market closed",
                 "Jan 7: Virus identified as novel coronavirus",
                 "Jan 11: China reports first death",
                 "Jan 14: First case outside of China",
                 "Jan 23: Wuhan goes into lockdown",
                 "Jan 30: Public Health Emergency of International Concern declared",
                 "Jan 31: Trump bans travelers from China",
                 "Feb 7: Chinese doctor dies",
                 "Mar 11: COVID-19 declared a pandemic",
                 "Mar 19: China reports no new local spread",
                 "Mar 29: Wuhan trains reopen",
                 "Apr 8: Wuhan travel restrictions lifted")
eu_dates <- c("Jan 14: First case outside of China",
              "Jan 30: Public Health Emergency of International Concern declared",
              "Feb 14: First death outside of Asia occurs in France",
              "Feb 23: Italian towns go into lockdown",
              "Feb 24: Cases spike in Italy",
              "Mar 9: Italian lockdown nationwide",
              "Mar 11: Trump restricts travel with Europe",
              "Mar 11: COVID-19 declared a pandemic",
              "Mar 16: Germany seals borders",
              "Mar 17: EU closes borders to incoming traffic",
              "Mar 19: ECB announces 750 billion euro plant")
italy_dates <- c("Jan 30: Public Health Emergency of International Concern declared",
                 "Jan 31: First cases confirmed in Rome and flights with China suspended",
                 "Feb 14: Cases first seen in Lombardy",
                 "Feb 23: Italian towns go into lockdown",
                 "Mar 4: Schools closed",
                 "Mar 9: Italian lockdown nationwide",
                 "Mar 11: COVID-19 declared a pandemic",
                 "Mar 31: Peak in Italy announced",
                 "Apr 8: All ports closed")
usa_dates <- c("Jan 17: CDC begins airport screening",
               "Jan 21: First confirmed US case",
               "Jan 30: Public Health Emergency of International Concern declared",
               "Jan 31: Trump declares public health emergency",
               "Feb 6: First report of death in US",
               "Feb 26: CDC reports community spread",
               "Feb 28: CDC acknowledges flaws in test kits",
               "Mar 6: Trump says anybody can be tested while at CDC",
               "Mar 11: Trump restricts travel with Europe",
               "Mar 11: COVID-19 declared a pandemic",
               "Mar 13: Trump declares national emergency",
               "Mar 27: Stimulus package signed",
               "Mar 28: CDC issues travel advisory for NY area",
               "Mar 29: White House extends social distancing",
               "Apr 3: CDC recommends face masks",
               "Apr 16: White House reopening guidance",
               "Apr 23: Small business funding passed",
               "Apr 28: 1 million US cases")
whitehouse_dates <- c("Jan 17: CDC begins airport screening",
                      "Jan 21: First confirmed US case",
                      "Jan 30: Public Health Emergency of International Concern declared",
                      "Jan 31: Trump declares public health emergency",
                      "Feb 6: First report of death in US",
                      "Feb 21: CDC says pandemic possible",
                      "Feb 26: CDC reports community spread",
                      "Feb28: CDC acknowledges flaws in test kits",
                      "Mar 6: Trump says anybody can be tested while at CDC",
                      "Mar 11: Trump restricts travel with Europe",
                      "Mar 11: COVID-19 declared a pandemic",
                      "Mar 13: Trump declares national emergency",
                      "Mar 27: Stimulus package signed",
                      "Mar 29: White House extends social distancing",
                      "Apr 3: CDC recommends face masks",
                      "Apr 16: White House reopening guidance",
                      "Apr 23: Small business funding passed",
                      "Apr 28: 1 million US cases")
cdc_dates <- c("Jan 17: CDC begins airport screening",
               "Jan 21: First confirmed US case",
               "Jan 22: Evidence of human-to-human transmission",
               "Jan 30: Public Health Emergency of International Concern declared",
               "Jan 31: Trump declares public health emergency",
               "Feb 6: First report of death in US",
               "Feb 21: CDC says pandemic possible",
               "Feb 26: CDC reports community spread",
               "Feb 28: CDC acknowledges flaws in test kits",
               "Mar 6: Trump says anybody can be tested while at CDC",
               "Mar 11: Trump restricts travel with Europe",
               "Mar 11: COVID-19 declared a pandemic",
               "Mar 13: Trump declares national emergency",
               "Mar 28: CDC issues travel advisory for NY area",
               "Mar 29: White House extends social distancing",
               "Apr 3: CDC recommends face masks",
               "Apr 16: White House reopening guidance",
               "Apr 23: Small business funding passed",
               "Apr 28: 1 million US cases")
congress_dates <- c("Jan 17: CDC begins airport screening",
                    "Jan 21: First confirmed US case",
                    "Jan 30: Public Health Emergency of International Concern declared",
                    "Jan 31: Trump declares public health emergency",
                    "Feb 6: First report of death in US",
                    "Feb 26: CDC reports community spread",
                    "Feb 28: CDC acknowledges flaws in test kits",
                    "Mar 6: Trump says anybody can be tested while at CDC",
                    "Mar 11: Trump restricts travel with Europe",
                    "Mar 11: COVID-19 declared a pandemic",
                    "Mar 13: Trump declares national emergency",
                    "Mar 27: Stimulus package signed",
                    "Mar 29: White House extends social distancing",
                    "Apr 3: CDC recommends face masks",
                    "Apr 16: White House reopening guidance",
                    "Apr 23: Small business funding passed",
                    "Apr 28: 1 million US cases")
nhs_dates <- c("Jan 14: First case outside of China",
               "Jan 22: Increased screening at Heathrow",
               "Jan 30: Public Health Emergency of International Concern declared",
               "Jan 31: First confirmed UK cases",
               "Feb 6: Expansion of UK-bound travel restrictions",
               "Feb 26/27: First cases in Scotland",
               "Feb 27/28: First cases in Wales and Northern Ireland",
               "Mar 3: Coronavirus Action Plan revealed",
               "Mar 5: First UK death",
               "Mar 17: NHS postpones non-essential procedures",
               "Mar 23: Johnson announces 3-week stay at home period",
               "Mar 27: Johnson tests positive",
               "Apr 4: Johnson hopitalized",
               "Apr 12: Johnson released from hospital",
               "Apr 16: Restrictions extended")
who_dates <- c("Dec 31: China informs WHO of patient cluster",
               "Jan 7: Virus identified as novel coronavirus","Jan 11: China reports first death",
               "Jan 14: First case outside of China",
               "Jan 22: Evidence of human-to-human transmission",
               "Jan 30: Public Health Emergency of International Concern declared",
               "Feb 11: WHO announces COVID-19 name",
               "Mar 11: COVID-19 declared a pandemic",
               "Mar 18: Trials begin for effective treatment",
               "Mar 25: WHO warns US could be new epicenter",
               "Apr 24: Trump plans to halt WHO funding")
baseball_dates <- c("Jan 21: First confirmed US case",
                    "Jan 31: Trump declares public health emergency",
                    "Feb 10: Players begin reporting for spring training",
                    "Mar 9: Announcement to continue spring training",
                    "Mar 11: COVID-19 declared a pandemic",
                    "Mar 12: MLB season postponed and NCAA season cancelled",
                    "Mar 13: Trump declares national emergency",
                    "Mar 15: Minor League player tests positive",
                    "Mar 24: Olympics postponed",
                    "Apr 7: MLB discusses playing all games in Phoenix",
                    "Apr 12: Taiwan plays first professional game")
hockey_dates <- c("Jan 21: First confirmed US case",
                  "Jan 31: Trump declares public health emergency",
                  "Mar 11: COVID-19 declared a pandemic",
                  "Mar 11: Some teams announce no spectators",
                  "Mar 12: NHL pauses season",
                  "Mar 13: Trump declares national emergency",
                  "Mar 16: Players return home to quarantine for 11 days",
                  "Mar 17: First player tests positive",
                  "Mar 25: NHL postpones combine, draft, and awards")
basketball_dates <- c("Jan 21: First confirmed US case",
                      "Jan 31: Trump declares public health emergency",
                      "Mar 11: COVID-19 declared a pandemic",
                      "Mar 11: NBA postpones season",
                      "Mar 12: March Madness and conference tournaments cancelled",
                      "Mar 13: Trump declares national emergency",
                      "Mar 24: Olympics postponed")
soccer_dates <- c("Jan 21: First confirmed US case",
                  "Jan 30: Public Health Emergency of International Concern declared",
                  "Jan 31: Trump declares public health emergency",
                  "Mar 11: COVID-19 declared a pandemic",
                  "Mar 12: MLS suspends season",
                  "Mar 13: FIFA recommends postponing all matches",
                  "Mar 13: Premier League postpones matches",
                  "Mar 13: Trump declares national emergency",
                  "Mar 17: Euro 2020 postponed to 2021",
                  "Mar 23: UEFA postpones finals",
                  "Mar 24: Olympics postponed")
football_dates <- c("Jan 21: First confirmed US case",
                    "Jan 30: Public Health Emergency of International Concern declared",
                    "Jan 31: Trump declares public health emergency",
                    "Mar 11: COVID-19 declared a pandemic",
                    "Mar 13: Trump declares national emergency",
                    "Mar 16: NFL postpones offseason training",
                    "Mar 24: All NFL facilities close",
                    "Apr 23: NFL draft starts remotely")


dates <- c("Jan 11: China reports first death",
           "Jan 14: First case outside of China",
           "Jan 17: CDC begins airport screening",
           "Jan 21: First confirmed US case",
           "Jan 22: Evidence of human-to-human transmission",
           "Jan 23: Wuhan goes into lockdown",
           "Jan 30: Public Health Emergency of International Concern declared",
           "Jan 31: Trump declares public health emergency",
           "Feb 6: First report of death in US",
           "Feb 7: Chinese doctor dies",
           "Feb 21: CDC says pandemic possible",
           "Feb 23: Italy goes into lockdown",
           "Feb 26: CDC reports community spread",
           "Feb 28: CDC acknowledges flaws in test kits",
           "Mar 6: Trump says anybody can be tested while at CDC",
           "Mar 11: Trump restricts travel with Europe",
           "Mar 11: COVID-19 declared a pandemic",
           "Mar 13: Trump declares national emergency",
           "Mar 24: Olympics postponed",
           "Mar 27: Stimulus package signed",
           "Mar 28: CDC issues travel advisory for NY area",
           "Mar 29: White House extends social distancing",
           "Apr 2: Over 1 million global cases",
           "Apr 3: CDC recommends face masks",
           "Apr 8: Wuhan lifts lockdown",
           "Apr 15: Stay-at-home protests start",
           "Apr 16: White House reopening guidance",
           "Apr 21: At-home test approved",
           "Apr 23: Small business funding passed",
           "Apr 24: GA begins reopening",
           "Apr 28: 1 million US cases"
           )

print(obama_dates)
print(trump_dates)
