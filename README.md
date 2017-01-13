## Getting Started

* Create a new organization (public) and then request to have private
  repositories through github classroom/educational discount

* create a survey to obtain student github usernames (add more
  instructions next time on qulatrics, to reduce errors).  Save as
  `Accounts.csv`.   Github accounts should be in column `Accounts` for
  scripts to work. 

* Under user profile, go to settings, and create a secret token.  Save
  it in secret/github_token so that the R scripts can access the
  github API to add  users, teams, etc

* invite_accounts.R:   on the command line run
  `Rscript invite_accounts.R Accounts.csv  <organization_name>`
  where `<organization_name>` is the github name for the class
  organization.   Currently if there are errors in any user names the
  script crashes.


  
