## README ##

## Objective ##
This repository is using to verify CAMP Back-office site. 
The following promotion types on Wemall can be managed by CAMP:
- Freebie (Buy X Get Y Free)
- Bundle (Buy mobile phone with sim card and price plan package)

## Pre-Requisite(s) ##
1. Excel Library for Robot Framework need to be installed
Command:   pip install robotframework-excellibrary
Reference: http://navinet.github.io/robotframework-excellibrary/

2. VPN Connection for WM_Centralized is needed

## Test Execution ##
Using the below command for running this test suite:
Command:   pybot -v ENV:<TEST_ENVIRONMENT> <FILE_PATH>
		- TEST_ENVIRONMENT: Alpha
		- FILE_PATH: File path on your local machine
Example:   pybot -v ENV:Alpha /Users/sareerak.chu/Documents/work/MC_Automate/MerchantCenter/CAMP/testcases/campaign/campaign_create.robot