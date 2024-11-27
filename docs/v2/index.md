# tfsites.GenerateMotifDatabase v2

**Author(s):** Joe Solvason

**Contact:** Joe Solvason (solvason@ucsd.edu)

**Adapted as a GenePattern Module by:** Ted Liefeld (jliefeld@cloud.ucsd.edu)

**Task Type:** Transciption factor analysis

**LSID:**  urn:lsid:genepattern.org:module.analysis:00443


## Introduction

`GenerateMotifDatabase` can be used to obtain position weight matrix (PWM) data to score binding sites in other TFSites modules. This tool extracts the PFM(s) for one or more transcription factor(s) of interest and then converts each PFM to its respective PWM. 


## Methodology

Optionally, the user can provide keywords that are present in the matrix header to filter the input PFM data. This can include the transcription factor name and/or matrix ID. For every PFM, the header line of the matrix is screened for the keywords. All PFMs that contain the keywords will be returned, regardless of letter case or spaces. The user can also choose to use pseudocounts and add the nucleotide background frequency for A, T, G, and C. The output file will be formatted the same as the input, just replacing the position frequency matrix with the position weight matrix.


## Parameters

<span style="color: red;">*</span> indicates required parameter

- <span style="color: red;">*</span>**PFM input file (.txt)**
    - File containing multiple PFMs. It is formatted similar to a fasta file where the header line starts with ">" and is followed by that PFM. 
- **filter keywords (.tsv)**
    - `Default = None`
    - File containing a single column with a list of keywords. The keywords can be the transcription factor name and/or matrix ID. 
- **use pseudocounts to calculate score (boolean)**
    - `Default = False`
    - Choose if you want to use pseudocounts to calculate the PWM score for binding sites.
- **background nucleotide frequencies (boolean)**
    - `Default = 0.25,0.25,0.25,0.25`
    - Choose the nucleotide background frequencies in the order of A, T, G, and C.
- <span style="color: red;">*</span>**output filename (string)**
    - Base name of the output files.

## Input Files

1.  PFM input file (.txt)

```
>MA0002.1	RUNX1
A  [    10     12      4      1      2      2      0      0      0      8     13 ]
C  [     2      2      7      1      0      8      0      0      1      2      2 ]
G  [     3      1      1      0     23      0     26     26      0      0      4 ]
T  [    11     11     14     24      1     16      0      0     25     16      7 ]
>MA0098.1	ETS1
A  [     4     17      0      0      0      5 ]
C  [    16      0      1     39     39      3 ]
G  [     4      0      0      1      0     17 ]
T  [    16     23     39      0      1     15 ]
...
```

2.  filter keywords (.tsv)

```
Keyword
ETS
ETV
GABP
FLI
SPI
```
       
## Output Files

1.  PWM output (.txt)

```
>MA0098.1	ETS1
A [ -1.053145688775872 0.6820617990250051 -2.872741175013566 -2.8727411750135663 -2.8727411750135663 -0.8153679664067708 ]
C [ 0.6022513974791806 -2.8727411750135654 -2.1656974816113896 1.8090322245000712 1.8090322245000712 -1.337998938483863 ]
G [ -1.053145688775872 -2.8727411750135654 -2.872741175013566 -2.1656974816113896 -2.8727411750135663 0.6820617990250051 ]
T [ 0.6022513974791806 1.0857746289240513 1.8090322245000716 -2.8727411750135663 -2.1656974816113896 0.5177659702222613 ]
>MA0081.1	SPIB
A [ 1.2260680794798462 -1.2837929660005913 0.8791456051256142 -1.9004643264490857 -2.347923303420307 1.8292696984860446 1.7999753916920067 ]
C [ -3.0 0.16992500144231237 0.3423921974470779 -3.0 -3.0 -3.0 -3.0 ]
G [ -3.0 1.135159583281636 -0.6780719051126377 1.7999753916920067 1.7999753916920067 -3.0 -3.0 ]
T [ 0.4964258261194989 -1.9004643264490857 -1.9004643264490857 -3.0 -2.347923303420307 -2.347923303420307 -1.9004643264490857 ]
... 
```
    
## Example Data

Example input data is available [here](https://github.com/genepattern/tfsites.defineTFBindingSitesFromPFM/tree/develop/data).

    
## Version Comments

- **1.0.1** (2024-11-21): Updated for tfsites website.
- **1.0.0** (2024-11-7): Draft completed.
