#!/bin/bash

read -p 'Project Name: ' projectname
read -p 'Environment: (dev, test, stage or prod) ' env

echo "Is the following correct? "
echo Project Name: $projectname
echo Environment: $env
echo Parameters:
echo /$env/$projectname/env-vars/DB_URL
echo /$env/$projectname/env-vars/DB_USERNAME
echo /$env/$projectname/env-vars/DB_PASSWORD
read -p ' if the above is correct, then type yes:  ' correct

if [[ $correct = "yes" ]]; then
    echo input is correct, creating parameters. 

    if [[ $env = "dev" ]]; then 
        echo dev env

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://dev-address-rds-rdscluster-1w9lmyfr24ilr.cluster-cudzyn3ektkg.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://dev-address-rds-rdscluster-1w9lmyfr24ilr.cluster-cudzyn3ektkg.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value h2JdbTvuRJTq --type SecureString
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value h2JdbTvuRJTq --type SecureString
    fi
    if [[ $env = "test" ]]; then
        echo test env

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://test-rds-rdscluster-pzol01b4rco5.cluster-cdppya06zz1n.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://test-rds-rdscluster-pzol01b4rco5.cluster-cdppya06zz1n.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value aqpYGexGptELDyryzY8pwCJNmtk6eCHQ --type SecureString
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value aqpYGexGptELDyryzY8pwCJNmtk6eCHQ --type SecureString
    fi
    if [[ $env = "stg" ]]; then
        echo stg env

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://stg-rds-rdscluster-14b4t2hrynyeu.cluster-chh3aouwnzmq.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://stg-rds-rdscluster-14b4t2hrynyeu.cluster-chh3aouwnzmq.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value Happy123 --type SecureString
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value Happy123 --type SecureString
    fi
    if [[ $env = "prod" ]]; then
        echo stg env

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://prod-rds-rdscluster-1vu1xatqbb21r.cluster-c2xlxjesco7k.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_URL --value "jdbc:postgresql://prod-rds-rdscluster-1vu1xatqbb21r.cluster-c2xlxjesco7k.us-east-1.rds.amazonaws.com:5432/postgres?sslmode=require&amp;sslfactory=org.postgresql.ssl.NonValidatingFactory" --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_USERNAME --value postgres --type String

        echo aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value Happy123 --type SecureString
        aws ssm put-parameter --name /$env/$projectname/env-vars/DB_PASSWORD --value Happy123 --type SecureString

    fi
else
    echo input is incorrect, terminating
fi
