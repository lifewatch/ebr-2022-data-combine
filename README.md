
# Bringing together marine biodiversity, environmental and maritime boundaries data in R 

[![Funding](https://img.shields.io/static/v1?label=powered+by&message=lifewatch.be&labelColor=1a4e8a&color=f15922)](http://lifewatch.be)

Exercises and slides to be used during the workshop. More information in [this link](https://www.biodiversity.be/5147/).

## Initial set-up

You need to have R installed in your computer. We recommend to use the R version 4.0 or higher and RStudio.

```r
stopifnot(R.version$major >= 4)
stopifnot(rstudioapi::isAvailable())
```
Download this repository and open the `.Rproj` file. We recommend to use RStudio: 

1. Go to File -> New Project -> Version Control -> Git
2. Copy and paste this into _Repository URL_: https://github.com/vlizBE/ebr-2022-data-combine

This workshop uses virtual environments with `renv` to ensure every participant uses the same packages and has the same versions. Before starting the workshop please run this on the R console:

```r
renv::load()
```

This may take some minutes. A copy of all the packages needed for this exercise in their specific versions will be downloaded into your computer.

## Get started

Open the slides in this link: https://vlizbe.github.io/ebr-2022-data-combine

Then go to `src` and open the first exercise.


## Directory structure

```
ebr-2022-data-combine/
├── README.md
├── data/
├── docs/
└── src/
```

* *data*: directory to save data and read local files from
* *docs*: contains the slides and the infrastructure to deploy them online
* *src*: scripts with the exercises that will be used during the workshop