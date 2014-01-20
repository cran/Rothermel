\name{rosunc}
\alias{rosunc}
\title{
Function to carry out uncertainty propagation analysis on Rothermel's (1972) fire spread model
}
\description{
This function offers the user the possibility to perturb inputs to Rothermel's (1972) fire behavior model and propagate the uncertainty to the resulting estimate of Rate of spread [m/min] by means of Monte Carlo iterative sampling. Random values are extracted from Gaussian distributions with mean = observed values, and spread defined by a custom ratio of standard deviation to the mean defined by the user.}
\usage{
rosunc (modeltype, w, s, delta, mx.dead, h, m, u, slope, 
        sdu = 0, sdm = 0, sds = 0, sdw = 0, sdd = 0, 
        nsim = 1000)
}
\arguments{
  \item{modeltype}{
S(tatic), D(ynamic)}
  \item{w}{
a vector of fuel load [t/ha] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values; 0 if fuel class is absent).}
  \item{s}{
a vector of surface-to-volume ratio [m2/m3] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values; 0 if fuel class is absent).}
  \item{delta}{
atomic vector, fuel bed depth [cm]}
  \item{mx.dead}{
atomic vector, dead fuel moisture of extinction [percent]}
  \item{h}{
a vector of heat content [kJ/kg] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values; 0 if fuel class is absent).}
  \item{m}{
a vector of percent moisture on a dry weight basis [percent] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values; 0 if fuel class is absent).
}
  \item{u}{
atomic vector, midflame windspeed [km/h]}
  \item{slope}{
atomic vector, site slope [percent]
}
  \item{sdu}{
coefficient of variation for wind speed (ratio of standard deviation to the mean; default = no perturbation)}
  \item{sdm}{
coefficient of variation for fuel moistures (ratio of standard deviation to the mean; default = no perturbation)}
  \item{sds}{
coefficient of variation for slope (ratio of standard deviation to the mean; default = no perturbation)}
  \item{sdw}{
coefficient of variation for fuel loadings (ratio of standard deviation to the mean; default = no perturbation)}
  \item{sdd}{
coefficient of variation for fuel bed depth (ratio of standard deviation to the mean; default = no perturbation)}
  \item{nsim}{
number of Monte Carlo iterations (default =1000)}
}
\value{
A vector of predicted ROS [m/min] from Monte Carlo simulations.}
\references{
Cruz M. G. (2010). Monte Carlo-based ensemble method for prediction of grassland fire spread. International Journal of Wildland Fire 19: 521-530.

Jimenez E., Hussaini M. Y., Goodrick S. (2008). Quantifying parametric uncertainty in the Rothermel model. International Journal of Wildland Fire, 17: 638-649.

Rothermel, R. C. (1972). A mathematical model for fire spread predictions in wildland fires. Research Paper INT-115. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.}
\author{
Giorgio Vacchiano, Davide Ascoli (DISAFA, University of Torino, Italy)
}
\seealso{
\code{\link{ros}}, \code{\link{SFM_metric}}}
\examples{
data ("firexp")
varnames <- names (firexp)

# select only one observation and create a numeric vector for function input
firexp <- as.numeric (firexp [5,])

names (firexp) <- varnames

pred <- rosunc (
        modeltype = "D",
        w = firexp [1:5],
        s = firexp [6:10],
        delta = firexp ["Fuel_Bed_Depth"],
        mx.dead = firexp ["Mx_dead"],
        h = firexp [13:17],
        m = firexp [18:22],
        u = firexp ["u"],
        slope = firexp ["slope"],
        sdm = 0.3,
        nsim = 100)

summary (pred)

hist (pred, 
      xlab = "ROS [m/min]",
      freq = FALSE,
      xlim = c (0, max (pred)),
      breaks = 20)
lines (density (pred), lty=2, lwd=2)
abline (v = firexp ["ros"],col = "red")
text (firexp ["ros"], 
      max (density (pred)$y), 
      labels = "obs", 
      pos = 4)
}
\keyword{ models }
