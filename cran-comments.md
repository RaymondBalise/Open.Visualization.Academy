## R CMD check results local Mac

0 errors | 0 warnings | 0 notes

## On win-builder

```
New submission

Possibly misspelled words in DESCRIPTION:
  github (36:250)
  gradethis (36:185)

Suggests or Enhances not in mainstream repositories:
  gradethis
  
Package suggested but not available for checking: 'gradethis'  
```    

These are not mistakes.  The package suggests `gradethis` which is only on github. The `gradethis` package is used by a `learnr` tutorial that is included with the package. The DESCRIPTION file includes: **"Description: This contains functions and data used by the Open Visualization Academy classes on data processing and visualization. The tutorial included with this package requires the gradethis package which can be installed using `remotes::install_github('rstudio/gradethis')`."**

### Using R-devel with win-builder.r-project.org

0 errors | 0 warnings | 1 notes

### Using R-oldrelease with win-builder.r-project.org

0 errors | 0 warnings | 3 notes

```
Author field differs from that derived from Authors@R
  Author:    'Raymond Balise [aut, cre] (ORCID: <https://orcid.org/0000-0002-9856-5901>), Kyle Grealis [aut] (ORCID: <https://orcid.org/0000-0002-9223-8854>), Ricky Lei [ctb] (ORCID: <https://orcid.org/0000-0003-1953-9236>), Gabriel Odom [ctb] (ORCID: <https://orcid.org/0000-0003-1341-4555>)'
  Authors@R: 'Raymond Balise [aut, cre] (<https://orcid.org/0000-0002-9856-5901>), Kyle Grealis [aut] (<https://orcid.org/0000-0002-9223-8854>), Ricky Lei [ctb] (<https://orcid.org/0000-0003-1953-9236>), Gabriel Odom [ctb] (<https://orcid.org/0000-0003-1341-4555>)'
```

```
Package suggested but not available for checking: 'gradethis'
```
### Using R-release with win-builder.r-project.org

0 errors | 0 warnings | 1 notes

