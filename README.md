
# Bringing together marine biodiversity, environmental and maritime boundaries data in R 

[![Funding](https://img.shields.io/static/v1?label=powered+by&message=lifewatch.be&labelColor=1a4e8a&color=f15922)](http://lifewatch.be) [![renv check](https://github.com/lifewatch/ebr-2022-data-combine/workflows/renv-check/badge.svg)](https://github.com/lifewatch/ebr-2022-data-combine/actions) [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/lifewatch/ebr-2022-data-combine/HEAD?labpath=rstudio)

Exercises and slides to be used during the Workshop *Bringing together marine biodiversity, environmental and maritime boudnaries data in R* in the framework of the Empowering Biodiversity Research Conference II (EBRII). You can find practical information about the workshop and the EBRII conference [here](https://www.biodiversity.be/5147/).

This is an hybrid workshop in which we will use zoom to meet online and the platform hackmd.io to share our solutions of the exercises.

## Set-up 🖥️ 

* We will use [R v4.0](https://www.r-project.org/) or higher and [RStudio](https://www.rstudio.com/). This workshop has been tested using the latest R, RStudio and package versions available at the moment (2022-05-23).

* Download this repository and open the `ebr-2022-data-combine.Rproj` file with RStudio

* This workshop uses [`renv`](https://rstudio.github.io/renv/index.html) to ensure we have the same packages. Run this code on your RStudio session to fetch an isolated library with the packages we will use:

```r
# install.packages("renv@0.15.4")
renv::restore()
```

## Get started 🚀

The exercises are in the 📁 folder: `./src/exercises/`. These are R scripts where the exercises are explained with comments. We chose this format to promote the reuse of this code for your own purposes. You are welcome to apply the tools explained in this workshop to your data.

Open the slides of the workshop in your web browser and keep them at hand. The slides are in this link: https://lifewatch.github.io/ebr-2022-data-combine

🌟 **Now we can start the workshop!** 🌟

## Extra Information

### Directory structure 📁 

```
ebr-2022-data-combine/
├── data/ - directory to save data and read local files from
├── docs/ - contains the slides and the infrastructure to deploy them online
├── save/ - it has a few data files in .rds with the results of the exercises
└── src/  - and the slides
	├── exercises/ - scripts with the exercises that will be used during the workshop
		└── solutions/ - scripts with the exercises already solved
	└── slides/ - RMarkdown that renders the slides into html and save in docs/
├── .Rprofile
├── .gitignore
├── Dockerfile - requirement to open the project on binder, uses rocker/binder image
├── install.R - scripts to be run by binder to set up the dependencies of the project
├── README.md
├── ebr-2022-data-combine.Rproj - open this file to start the project
└── renv.lock - this file is used by renv to record the dependencies used by the project
```



### Acknowledgements 🙏

This workshop is inspired on the [INBO Coding Club sessions](https://inbo.github.io/coding-club/).

