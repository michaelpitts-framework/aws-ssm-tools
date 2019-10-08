#!/bin/bash

read -p 'Project Name: ' projectnamevar
read -p 'Firebase API Key: ' projectapikeyvar
read -p 'Firebase Project ID: ' projectidvar
read -p 'Firebase Messageing Sender ID: ' messageidvar
read -p 'Environment (dev, test, stg, or prod): ' envvar

printf "is the following correct?\n\n"

echo Project Name:  $projectnamevar 
echo Firebase API Key: $projectapikeyvar
echo Firebase Project ID:  $projectidvar 
echo Firebase Messaging Sender ID:  $messageidvar 
echo Environment: $envvar
echo 

read -p 'correct?:' correct

if [[ $correct = "yes" ]]; then
    echo input is correct 
    echo creating paramstore entries now....
    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/apikey --value $projectapikeyvar --type SecureString
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/apikey --value $projectapikeyvar --type SecureString

    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/authDomain --value ${projectidvar}.firebaseio.com --type String
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/authDomain --value ${projectidvar}.firebaseio.com --type String

    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/projectId --value $projectidvar --type String
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/projectId --value $projectidvar --type String

    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/databaseURL --value https://${projectidvar}.firebaseio.com --type String
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/databaseURL --value https://${projectidvar}.firebaseio.com --type String

    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/storageBucket --value ${projectidvar}.appspot.com --type String
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/storageBucket --value ${projectidvar}.appspot.com --type String

    echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/messagingSenderId --value $messageidvar --type String
    aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/messagingSenderId --value $messageidvar --type String

    if [[ $envvar = "prod" ]]; then

        echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/API_BASE_URL --value https://api.frameworkhomeownership.org --type String
        aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/API_BASE_URL --value https://api.frameworkhomeownership.org --type String

        echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/APP_S3_URL --value https://api.frameworkhomeownership.org/media/v1/s3/storage --type String
        aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/APP_S3_URL --value https://api.frameworkhomeownership.org/media/v1/s3/storage --type String

    else

        echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/API_BASE_URL --value https://${envvar}-api.frameworkhomeownership.org --type String
        aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/API_BASE_URL --value https://${envvar}-api.frameworkhomeownership.org --type String

        echo aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/APP_S3_URL --value https://${envvar}-api.frameworkhomeownership.org/media/v1/s3/storage --type String
        aws ssm put-parameter --name /codebuild/$projectnamevar/firebase/APP_S3_URL --value https://${envvar}-api.frameworkhomeownership.org/media/v1/s3/storage --type String
        
    fi
else
    echo input is incorrect, terminating
fi


