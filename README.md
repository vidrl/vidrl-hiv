# vidrl-hiv
HIV analysis pipeline using Micall

<img width="2292" height="991" alt="HIV-MiCall-analysis" src="https://github.com/user-attachments/assets/0daf05dc-531f-4a56-9d5d-4c682663e1b7" />

## requirement

conda / mamba 

> [!Tip]
> To install miniconda `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`

## install

### Option A -- From github

```
#download the source code from github
git clone https://github.com/vidrl/vidrl-hiv    
cd vidrl-hiv

#create a conda environment using conda configurationfile conda.yaml
conda env create -f conda.yaml

#activate the conda environment which just created
conda activate vidrl-hiv

#install vidrl-hiv using pip 
#error saying no pip? ^ have you install and activate the conda environment
pip install dist/vidrl_hiv-0.0.1.tar.gz
```

## Usage

> [!CAUTION]
> this pipeline only works on VIDRL dgx server

### Prepare your Input

vidrl-hiv accept a samplesheet.csv as input

samplesheet.csv

| #name | r1 | r2 | reference |
| :---: | :---: | :---:| :---:|
| sample1 | sample1_R1.fastq.gz | sample1_R2.fastq.gz | hxb2 |
| ... | ... | ... | ... |

There are example samplesheets inside the example folder

### Run Command

```
#Step 1 -- create a work folder under your home path of dgx
mkdir hiv-work-folder

#step 2 -- copy the fastq files to your work folder inside input folder
mkdir input
cp source/fastq* input

#step 3 -- prepare samplesheet.csv as the example template and put it into your work folder

#step 4 -- run vidrl-hiv command
conda activate vidrl-hiv
vidrl-hiv samplesheet.csv --cpu 20 -maxjob 10 
```

### Output

1. Micall Output 
```
hiv-work-folder/results/micall
```

2. Genome plots
```
hiv-work-folder/dirtypipeline/results/gene.pdf
hiv-work-folder/dirtypipeline/results/drm.pdf
```


