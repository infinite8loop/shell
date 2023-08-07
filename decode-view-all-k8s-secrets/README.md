## !!!!Executing this script is not recommeded on production clusters!!!!!!

This script is to quickly review the secrets configured in a namespace before any release.

## Again I strongly recommend to not use default K8s secrets - go for other encrypted secret manager. (we have in our roadmap)

## Usage

Assuming Ubuntu is being used.
Make sure to give execute permission to command.sh file.

Give execute permission to command.sh :

``` bash
chmod +x decode.sh
```

## How to run?

The following command fetches the secrets present in a namespace:

``` bash
bash ./decode.sh <namespace>
```