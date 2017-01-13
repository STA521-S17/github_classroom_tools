#!/usr/bin/env Rscript

library(gh)

args = commandArgs(trailingOnly=TRUE)

if(length(args)!=1)
{
  cat("Usage: check_accounts.R <account file>\n")
  stop()
}

account_file = args[1]


stopifnot(file.exists(account_file))

token = readLines("secret/github_token")

stopifnot(file.exists(account_file))
team_info = read.csv(account_file, stringsAsFactors=FALSE)

stopifnot(all(c("First","Last","Email","Account") %in% names(team_info)))
accounts = team_info$Account

res = lapply(
  accounts, 
  function(acc)
  {
    Sys.sleep(0.2)
    try( gh("/users/:username", username=acc, .token=token), silent=TRUE)
  } 
)

invalid = sapply(res, function(x) any(class(x) == "try-error"))

if (sum(invalid) > 0) {
    print(team_info[invalid, c("First", "Last", "Email", "Account")])
} else {
  cat("All accounts are valid!\n")
}
