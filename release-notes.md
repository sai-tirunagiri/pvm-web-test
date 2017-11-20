# pvm-web CHANGELOG

This file is used to list changes made in each version of the pvm-web cookbook.

# Release 1.1.1
- Changed the location that the ACM Addin will be stored, now is stored together with IIVT application
- Changed the share folder for ACM Addin to use the new location
- How when we do a deploy of IIVT app the ACM Addin will be lost, we are forcing to delete the last package of that and install again

# Release 1.1.0
First production deployment. This cookbook was enhanced with support for (major features listed only):
- Maintenance Mode
- Setting SQL Server options
- ephemeral drives: scheduled task to start SQL services only when drives become available
- DB restore of full and incremental backups
- DB Refresh
- Move/split tempdb
- Upload of backups to S3
- Netwrix monitoring tool
- Updating CNAMEs to the machine name
- SQL Broker

# Pre-Release 0.1.0
- This cookbook was initially developed for the Investran 7 upgrade
- configurations were made based on the Analisys Excel File located on Sharepoint:
http://home.gcmlp.com/Departments/IT/Private-Markets-Technology/IT-FIS/Documents/Projects/Investran%207%20Upgrade/AutoDeploy/PVM%20Web%20Server%20Analysis.xlsx