#!/usr/bin/env Rscript

library(gh)
library(magrittr)

args = commandArgs(trailingOnly=TRUE)


if(length(args)!=3)
{
  cat("Usage: create_teams.R <account file> <organization> <prefix>\n")
  stop()
}

account_file = args[1]
org = args[2]
prefix = args[3]

stopifnot(file.exists(account_file))
team_info = read.csv(account_file, stringsAsFactors=FALSE)

stopifnot(all(c("Account","Team") %in% names(team_info)))
team_info$Team = paste(prefix, team_info$Team, sep="_")
teams = team_info$Team %>%
        unique() %>%
        sort()
        

token = readLines("secret/github_token")


for(team in teams)
{
  Sys.sleep(0.2)

  cat("Adding ", team, "...\n", sep="")
  gh("POST /orgs/:org/teams", 
     org=org, 
     name=team, privacy="closed",
     .token=token)
}

teams = gh("/orgs/:org/teams", org=org, .token=token)
team_ids = sapply(teams, function(x) x$id)
names(team_ids) = sapply(teams, function(x) x$name)

teams

