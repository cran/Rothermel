\name{Rothermel}
\alias{Rothermel}
\docType{package}
\title{
Rothermel surface fire spread model for R
}
\description{
R build of Rothermel's (1972) model for surface head fire rate of spread with some additional utilities (best standard fuel model selection, uncertainty propagation, optimization of fuel models by genetic algorithms) and sample datasets.
}
\details{
\tabular{ll}{
Package: \tab Rothermel\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-01-13\cr
License: \tab GPL-2\cr
}
Arguments to functions ros ( ), rosunc ( ), and bestFM ( ) should be provided by the user from standard or custom fire behavior fuel models, standard or custom moisture scenarios and desired wind speed and slope. rosunc ( ) only works with individual observations, ros ( ) and bestFM ( ) work with individual or multiple observations.
}
\author{
Giorgio Vacchiano, Davide Ascoli (DISAFA, University of Torino, Italy) <giorgio.vacchiano@unito.it>
}
\seealso{
\code{\link{ros}}, \code{\link{rosunc}}, \code{\link{bestFM}},\code{\link{gaRoth}}
}
\references{
Rothermel, R. C. (1972). A mathematical model for fire spread predictions in wildland fires. Research Paper INT-115. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Vacchiano, G., Ascoli, D. (2014) An implementation of the Rothermel fire spread model in the R programming language. Fire Technology, in press. DOI 10.1007/s10694-014-0405-6.}
\keyword{ package }

