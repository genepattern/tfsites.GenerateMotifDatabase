# tfsites.DefineTFbindingSites.from.PFM v1

**Author(s):** Joe Solvason

**Contact:** Joe Solvason (solvason@eng.ucsd.edu)

**Adapted as a GenePattern Module by:** Ted Liefeld (jliefeld@cloud.ucsd.edu)

**Task Type:** Transciption factor analysis

**LSID:**  urn:lsid:genepattern.org:module.analysis:00459


## Introduction

`defineTFBindingSites.from.PFM` normalizes the median fluorescence intensity (MFI) values in a Position Frequency Matrix(PFM) from JASPAR data file for a transcription factor of interest. The k-mer with the maximum MFI that conforms to the IUPAC definition of a binding site is normalized to 1.0 and all other k-mers are normalized relative to that MFI value. For example, a normalized value of 0.1 is 10% of the maximum MFI. 

## Methodology

The raw PBM dataset for a transcription factor is downloaded from [uniPROBE](http://the_brain.bwh.harvard.edu/uniprobe/) and the user indicates the columns of the forward k-mer and the MFI. The user defines the minimal binding site using IUPAC nomenclature (ie, N = ATGC, W = AT, [etc](https://genome.ucsc.edu/goldenPath/help/iupac.html)). The tool searches for the k-mer with the largest MFI signal that conforms to the minimal IUPAC binding site. For all other k-mers, the MFI signal will be normalized relative to the MFI signal of the maximum k-mer and the resulting value is called the relative affinity. Therefore, the k-mer with the maximum MFI signal will have a relative affinity of 1.0. The normalization calculation for each k-mer is: relative affinity = (MFI signal) / (MFI signal of the maximum IUPAC k-mer). 

## Parameters

<span style="color: red;">*</span> indicates required parameter

### Inputs and Outputs

- <span style="color: red;">*</span> **Raw JASPAR PFM (.tsv)** 
    -Position Frequency Matrix from JASPAR. 
- <span style="color: red;">*</span>**Reference Relative Score Output filename (.tsv)**
    - Name of the output file containing the normalized PBM data. 
- <span style="color: red;">*</span>**Histograms of Relative Scores (.png)** 
    - Name of the output graph containing 3 histogram plots of the normalized affinity values.
      
### Other Parameters
- <span style="color: red;">*</span>**Binding Site Definition (string)**
    - Normalize relative PWM scores by the k-mer with the highest score that follows the IUPAC definition of the core binding site for a transcription factor (see [here](https://www.bioinformatics.org/sms/iupac.html)). 

- <span style="color: red;">*</span>**Background Frequency of A,C,G,T (comma-separated string)**
    - Default = [0.25, 0.25, 0.25, 0.25]
Frequencies defining the background model, containing the probability that each nucleotide is randomly generated. 

- <span style="color: red;">*</span>**Pseudocount Values (comma-separated string)**
    - Default = None
    - Increase each value in the matrix by a certain value to avoid null values.
- **Report Sites Only (boolean)**
    - `default = False`
    - If `True`, only report k-mers abiding by the IUPAC definition. If `False`, report all k-mers.
- **Enforce Minimum Relative Affinity (boolean)**
    - `default = False`
    - If `True`, normalize the data so the minimum affinity value is set to 0.001. The normalized affinity values will range between 0.001 and 1.0. If `False`, the values will range between 0 and 1.0.
- **Define Highest Relative Affinity Sequence (string)**
    - `default = None`
    - The k-mer sequence whose MFI will be used to normalize the MFI values of all other k-mers. The relative affinity for this k-mer will be 1.0. 

## Warnings Printed:

1. If there exists another k-mer that conforms to the IUPAC definition and has a higher MFI than one provided by the user as the **Max K-mer to Normalize**.
2. If there are any k-mers that do not conform to the IUPAC definition but have a MFI greater than the k-mer provided by the user. The affinities of all non-IUPAC kmers with a higher MFI will be capped at 1.0.

## Input Files

1.  JASPAR PFM Input (.tsv)
- Columns **THIS NEEDS UPDATING -- BELOW IS PBM DEFINITION**
  - `8-mer:` every possible forward k-mer sequence with length k
  - `8-mer:` the reverse complement of the forward k-mer
  - `E-score:` the enrichment score of the k-mer
  - `Median:` the median fluorescence intensity of the k-mer
  - `Z-score:` the z-score of the k-mer

```
8-mer        8-mer        E-score     Median      Z-score
AAAAAAAA     TTTTTTTT     0.29130     2871.60     3.5965
AAAAAAAC     TTTTTTTG     0.10748     2086.00     0.3958
AAAAAAAG     TTTTTTTC     0.23656     2539.91     2.3673
AAAAAAAT     TTTTTTTA     0.21760     2434.82     1.9442
AAAAAACA     TTTTTTGT     0.19839     2407.46     1.8310
```
       
## Output Files

1. Normalized PBM data (.tsv)
- Columns
  - `Seq:` the sequence of every possible k-mer
  - `Rel_aff:` the relative affinity of the k-mer normalized to the max IUPAC k-mer

```
seq          rel_aff
AAAAAAAA     0.147
AAAAAAAC     0.107
AAAAAAAG     0.13
AAAAAAAT     0.125
AAAAAACA     0.123
```

2. Histograms of Relative Affinities (.png) 
- Histogram plots
  - All relative affinity values
  - Affinity values for the sequences that follow the IUPAC minimal binding site
  - Affinity values for the sequences that don't follow the IUPAC minimal binding site

   <img src="./01-output_aff-histograms.png"/>
    
  
## Example Data

[Example input data is available on github](https://github.com/genepattern/tfsites.DefineTfSites/data)
    
    
## Version Comments

- **1.0.0** (2023-01-12): Initial draft of document scaffold.
- **1.0.1** (2024-02-02): Draft completed.
