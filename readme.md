# Conception d'une architecture Serverless avec AWS Lambda et API Gateway

## Version 1
Les actions que j'ai mené sont :
- Création de `main.js` à la racine du dossier mini-projet, et à l'intérieur du quel je mets le contenu suivant:
````
'use strict';

exports.handler = function (event, context, callback) {
    var response = {
        statusCode: 200,
        headers: {
            'Content-Type': 'text/html; charset=utf-8',
        },
        body: "<p>Hello world!</p>",
    };
    callback(null, response);
};
````
- `zip example/example.zip main.js`
- Puis je crée manuelle le bucket à l'aide `AWS CLI` puis je copie le fichier `example.zip` dans ce bucket
````
aws s3api create-bucket --bucket=terraform-serverless-example-francis --region=us-east-1
aws s3 cp example/example.zip s3://terraform-serverless-example-francis/v1.0.0/example.zip
````
- puis je crée le fichier `lambda.tf`
- `terraform init` puis `terraform plan` et/ou `terraform apply`
- Une fois les ressources crées, on va y accéder grâce à AWS CLI: `aws lambda invoke --region=us-east-1 --function-name=ServerlessExample output.txt`
- `cat output.txt`
````
{
    "statusCode":200,
    "headers": {
        "Content-Type":"text/html; 
        charset=utf-8"
    },
    "body":"<p>Hello world!</p>"
}% 
````

## Version 2
On variabilise au maximum puis on reteste en se rassurant que tout fonctionne normalement

## Version 3 : API Gateway
Nous allons créer une nouvelle ressource `api_gateway.tf`.
Et nous allons également mettre à jour la ressource `lambda.tf`. Et enfin nous passons au test de notre solution