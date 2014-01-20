\name{SFM_metric}
\alias{SFM_metric}
\docType{data}
\title{
Standard fuel models (Albini 1976, Scott & Burgan 2005)
}
\description{
All values converted to metric format.
}
\usage{data(SFM_metric)}
\format{
  A data frame including standard fire behavior fuel models as in Albini (1976) and Scott and Burgan (2005) to be used as input of ros ( ) function. All values converted to metric format.
  \describe{
    \item{\code{Fuel_Model_Type}}{S(tatic), D(ynamic)}
    \item{\code{Load_1h}}{loading of 1h fuel class [t/ha]}
    \item{\code{Load_10h}}{loading of 10h fuel class [t/ha]}
    \item{\code{Load_100h}}{loading of 100h fuel class [t/ha]}
    \item{\code{Load_Live_Herb}}{loading of herbaceous fuels [t/ha]}
    \item{\code{Load_Live_Woody}}{loading of woody fuels [t/ha]}
    \item{\code{SA/V_1h}}{SAV of 1h fuel class [m2/m3]}
    \item{\code{SA/V_10h}}{SAV of 10h fuel class [m2/m3]}
    \item{\code{SA/V_100h}}{SAV of 100h fuel class [m2/m3]}
    \item{\code{SA/V_Live_Herb}}{SAV of herbaceous fuels [m2/m3]}
    \item{\code{SA/V_Live_Woody}}{SAV of woody fuels [m2/m3]}
    \item{\code{Fuel_Bed_Depth}}{fuel bed depth [cm]}
    \item{\code{Mx_dead}}{dead fuel moisture of extinction [percent]}
    \item{\code{Heat_1h}}{heat content of 1h fuel class [kJ/kg]}
    \item{\code{Heat_10h}}{heat content of 10h fuel class [kJ/kg]}
    \item{\code{Heat_100h}}{heat content of 100h fuel class [kJ/kg]}
    \item{\code{Heat_Live_Herb}}{heat content of herbaceous fuels [kJ/kg]}
    \item{\code{Heat_Live_Woody}}{heat content of woody fuels [kJ/kg]}}
  }
\source{
Albini, F. A. (1976). Computer-based models of wildland fire behavior: A users' manual. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Scott, J., & Burgan, R. E. (2005). A new set of standard fire behavior fuel models for use with Rothermel's surface fire spread model. Gen. Tech. Rep. RMRSGTR-153. Fort Collins, CO: US Department of Agriculture, Forest Service, Rocky Mountain Research Station.
}
\examples{
data(SFM_metric)

# ROS using Standard fuel models and Moisture scenarios
data (scenarios, SFM_metric)
modeltype <- SFM_metric ["GR1", "Fuel_Model_Type"]
w <- SFM_metric ["GR1", 2:6]
s <- SFM_metric ["GR1", 7:11]
delta <- SFM_metric ["GR1", "Fuel_Bed_Depth"]
mx.dead <- SFM_metric ["GR1", "Mx_dead"]
h <- SFM_metric ["GR1", 14:18]
m <- scenarios ["D2L2", 1:5]
u <- 8
slope <- 0

a <- ros (modeltype, w, s, delta, mx.dead, h, m, u, slope)
a
}
\keyword{datasets}
