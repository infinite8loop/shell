# filter duplicates

This has all the instructions to get result of scanned docker image in ECR. 

---------------------------------------------

## Usage

Assuming Ubuntu is being used.
Make sure to give execute permission to command.sh file.

Give execute permission to command.sh :

``` bash
chmod +x image-scan.sh
```

## How to run?

The following command fetches the ouput from the ECR after the image being scanned:

``` bash
bash ./image-scan.sh <repo-name> <image-tag>
```

