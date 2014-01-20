\name{bestFM}
\alias{bestFM}

\title{
Function to select best standard fuel model for observed fire rate of spread
}
\description{
The function preloads the 13 fire behavior fuel models by Albini (1976) and the 40 fuel models by Scott & Burgan (2005), computes rate of spread using Rothermel's (1972) model for a vector or data frame of fire experiment data, and computes root mean square error and mean bias of each fuel model to observed rate of spread.
}
\usage{
bestFM(obs, m, u, slope)
}
\arguments{
  \item{obs}{
a single value, or vector, of observed ROS [m/min].
}
  \item{m}{
a vector, or data frame, of percent moisture on a dry weight basis [percent] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).
}
  \item{u}{
a single value, or vector, of midflame windspeed [km/h]
}
  \item{slope}{
a single value, or vector, of percent site slope [percent]}
}
\value{
If a single observation of rate of spread is analyzed (length of obs =1), a vector of bias values, computed as (predicted - observed ROS) for every standard fire behavior fuel model. If more observations are analyzed (length of obs >1), a data.frame of root mean square error and mean bias computed from observed and predicted ROS using every standard fire behavior fuel model.}
\references{
Albini, F. A. (1976). Estimating wildfire behavior and effects. Gen. Tech. Rep. INT-30. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Rothermel, R. C. (1972). A mathematical model for fire spread predictions in wildland fires. Research Paper INT-115. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Scott, J., Burgan, R. E. (2005). A new set of standard fire behavior fuel models for use with Rothermel's surface fire spread model. Gen. Tech. Rep. RMRS-GTR-153. Fort Collins, CO: US Department of Agriculture, Forest Service, Rocky Mountain Research Station.}
\author{
Giorgio Vacchiano, Davide Ascoli (DISAFA, University of Torino, Italy)
}
\seealso{
\code{\link{ros}}, \code{\link{SFM_metric}}
}
\examples{
data ("firexp")
a <- bestFM (obs = firexp$ros,
            m = firexp[,18:22],
            u = firexp[,"u"],
            slope = firexp[,"slope"])  
a      

# plot results
barplot (a$error,
        cex.names = 0.7,
        las = 2,
        ylab = "rmse",
        col = sign (a$bias) + 3,
        names.arg = rownames (a))
          
legend (1, max (a [, 1]), 
        c ("Overprediction", "Underprediction"),
        col = c ("blue", "red"),
        pch = 15)
}
\keyword{models}
