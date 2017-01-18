## Getting Started

* Create a new organization (public) and then request to have private
  repositories through github classroom/educational discount  (may be
  as fast as an hour to a couple of days so plan accordingly)

* create a survey to obtain student github usernames (add more
  instructions next time on qualtrics, to reduce errors/confusion to
  avoid having emails, names, etc).  Save as
  `Accounts.csv`.   Github accounts should be in column `Accounts` for
  scripts to work.  Useful to collect netid or email, and names for
  communication. 

* Under user profile, go to settings, and create a secret token.  Save
  it in secret/github_token so that the R scripts can access the
  github API to add  users, teams, etc

* check_accounts.R:  on the command line run

 `Rscript check_accounts.R Accounts.csv`

to determine if all user accounts are valid github accounts.  This
script assumes that the survey had variables for first name (First),
last name (Last), Email, Account as columns.  Modify either
Accounts.csv or the script accordingly.   Once all user accounts are
verified issue invitations.

* invite_accounts.R:   on the command line run

  `Rscript invite_accounts.R Accounts.csv  <organization_name>`
  
  where `<organization_name>` is the github name for the class
  organization.   Currently if there are errors in any user names the
  script crashes.

  `Rscript invite_accounts.R Accounts.csv  STA521-S17`

* analyze_teams.R:  A script to read in survey data and create a score
  based on backgound to help with team creation.  Use this to assign a
  Team number for each student.  Add a colum for Team to Accounts.csv

* create_teams.R:  Run script to create and add Teams to github.


 `Rscript invite_accounts.R Accounts.csv  STA521-S17 Team`

or

 `Rscript invite_accounts.R <Accounts file> <organization> <Team_Prefix>
