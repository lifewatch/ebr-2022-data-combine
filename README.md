
# Bringing together marine biodiversity, environmental and maritime boundaries data in R 

[![Funding](https://img.shields.io/static/v1?label=powered+by&message=lifewatch.be&labelColor=1a4e8a&color=f15922)](http://lifewatch.be)

Exercises and slides to be used during the Workshop *Bringing together marine biodiversity, environmental and maritime boudnaries data in R* in the framework of the Empowering Biodiversity Research Conference II (EBRII). You can find practical information about the workshop and the EBRII conference [here](https://www.biodiversity.be/5147/).

## Set-up 🖥️ 

* We will use [R v4.0](https://www.r-project.org/) or higher and [RStudio](https://www.rstudio.com/)
* Download this repository and open the `.Rproj` file with RStudio

* This workshop uses  [`renv`](https://rstudio.github.io/renv/index.html) to ensure we use the same packages. Run this snippet on your RStudio session to fetch an isolated library with the dependencies we will use:

```r
# install.packages("renv@0.15.4")
renv::load()
```



## Get started 🚀

Open the slides in this link: https://vlizbe.github.io/ebr-2022-data-combine

The exercises are in: `./src/exercises/`. These are plain R scripts where the exercises are explained with comments. We chose this format to promote the reuse of this code for your own purposes. You are welcome to apply the tools explained in this workshop to your data.

This is an hybrid workshop in which we will use zoom to meet online and hackmd.io to share our solutions to each exercises:

* Zoom: https://us06web.zoom.us/j/84158030131
* Hackmd.io: https://hackmd.io/yOf5vGvvT5GN9X5EGkoeIw?view



## Directory structure 📁 

```
ebr-2022-data-combine/
├── data/
├── docs/
└── src/
	├── exercises/
	└── slides/
├── .Rprofile
├── .gitignore
├── README.md
├── ebr-2022-data-combine.Rproj
└── renv.lock 
```

* `data` directory to save data and read local files from
* `docs` contains the slides and the infrastructure to deploy them online
* `src` scripts with the exercises that will be used during the workshop and the slides
* `ebr-2022-data-combine.Rproj` open this file to start the project
* `renv.lock` this file is used by `renv` to record the dependencies used by the project



## Acknowledgments 🙏

This workshop is inspired on the INBO Coding Club sessions. You can find more info here: https://inbo.github.io/coding-club/
