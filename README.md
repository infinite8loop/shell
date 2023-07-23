# filter duplicates

This has all the instructions to filter duplicates using the single bash command. 

---------------------------------------------

## Usage

Assuming Ubuntu is being used.
Make sure to give execute permission to command.sh file.

Give execute permission to command.sh :

``` bash
chmod +x command.sh
```

Use the following command to filter the duplicates:

``` bash
cat ./inputs/sample-input.txt | ./command.sh
```
Expected Response:

``` string
double toil and trouble
fire burn and cauldron bubble
tomorrow and tomorrow and tomorrow
creeps in this petty pace from day toto day
to the last syllable of recorded time
```

## How it works?

The following command replaces new line with " , " this acts as a place holder for new lines.

``` bash
sed -z 's/\n/ , /g' duplicate.txt
```
Expected Response:

``` string
double double toil and trouble , fire burn and cauldron bubble bubble , tomorrow tomorrow and tomorrow and tomorrow , creeps in this this petty pace from day toto day , to the last syllable of recorded time time , 
```

Then the ouput of above command is sent as input to the following command which replaces " " with new line to make all words in new lines.

``` bash
sed -z 's/\n/ , /g' duplicate.txt | tr " " "\n" 
```
Expected Response:

``` string
double
double
toil
and
trouble
,
fire
burn
and
cauldron
bubble
bubble
,
tomorrow
tomorrow
and
tomorrow
and
tomorrow
,
creeps
in
this
this
petty
pace
from
day
toto
day
,
to
the
last
syllable
of
recorded
time
time
,
```

Then the ouput of above command is sent as input to the following command which then "uniq" commands removes the CONSECUTIVE duplicate words in the file.

``` bash
sed -z 's/\n/ , /g' duplicate.txt | tr " " "\n" | uniq  
```
Expected Response:

``` string
double
toil
and
trouble
,
fire
burn
and
cauldron
bubble
,
tomorrow
and
tomorrow
and
tomorrow
,
creeps
in
this
petty
pace
from
day
toto
day
,
to
the
last
syllable
of
recorded
time
,
```

Then the ouput of above command is sent as input to the following command which replaces new line with " " to make all words into one new.

``` bash
sed -z 's/\n/ , /g' duplicate.txt | tr " " "\n" | uniq  | tr "\n" " "
```
Expected Response:

``` string
double toil and trouble , fire burn and cauldron bubble , tomorrow and tomorrow and tomorrow , creeps in this petty pace from day toto day , to the last syllable of recorded time , 
```

Then the ouput of above command is sent as input to the following command which replaces " , " with new line to make the one line into smaller lines as the input.

``` bash
sed -z 's/\n/ , /g' duplicate.txt | tr " " "\n" | uniq  | tr "\n" " " | sed -z 's/ , /\n/g'
```
Expected Response:

``` string
double toil and trouble
fire burn and cauldron bubble
tomorrow and tomorrow and tomorrow
creeps in this petty pace from day toto day
to the last syllable of recorded time
```

