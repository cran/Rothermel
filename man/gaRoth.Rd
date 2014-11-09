\name{gaRoth}
\alias{gaRoth}

\title{
Function to carry out optimization of fuel model by genetic algorithms}
\description{
Genetic algorithms (GA) are a technique of machine-based mathematical optimization. The algorithm searches, within user-defined ranges, for values that minimize or maximize a target function. Here, fuel model parameters are searched that minimize root mean square error (RMSE) of forward fire rate of spread predicted by Rothermel (1972) model against observed data. Depends on package "GA" (Scrucca 2013) for the execution of the genetic algorithm; refer to this publication for a full explanation of GA parameters and settings.}
\usage{
gaRoth (
  w_1h = range(SFM_metric[,-1][,1]),
  w_10h = range(SFM_metric[,-1][,2]) ,
  w_100h = range(SFM_metric[,-1][,3]) , 
  w_Live_Herb = range(SFM_metric[,-1][,4])  ,
  w_Live_Woody = range(SFM_metric[,-1][,5])  ,
  s_1h = range(SFM_metric[,-1][,6])  ,
  s_10h = range(SFM_metric[,-1][,7])  ,
  s_100h = range(SFM_metric[,-1][,8])  ,
  s_Live_Herb = range(SFM_metric[,-1][,9]) , 
  s_Live_Woody = range(SFM_metric[,-1][,10]) , 
  delta = range(SFM_metric[,-1][,11])  ,
  mx.dead = range(SFM_metric[,-1][,12])  ,
  h_1h = range(SFM_metric[,-1][,13])  ,
  h_10h = range(SFM_metric[,-1][,14])  ,
  h_100h = range(SFM_metric[,-1][,15]) , 
  h_Live_Herb = range(SFM_metric[,-1][,16]) , 
  h_Live_Woody = range(SFM_metric[,-1][,17])  ,
  m, u, slope, modeltype, obs,
  method="rmse", maxiter=50, popSize = 20, pcrossover = 0.8, 
  pmutation = 0.1, elitism = base::max(1, round(popSize * 0.05)), 
  ...)
}
\arguments{
   \item{w_1h}{a vector of minimum and maximum fuel load [t/ha] for fuel class 1-hour; (0,0) if fuel class is absent.}
    \item{w_10h}{a vector of minimum and maximum fuel load [t/ha] for fuel class 10-hour; (0,0) if fuel class is absent.}
    \item{w_100h}{a vector of minimum and maximum fuel load [t/ha] for fuel class 100-hour; (0,0) if fuel class is absent.}
    \item{w_Live_Herb}{a vector of minimum and maximum fuel load [t/ha] for live herbs; (0,0) if fuel class is absent.}
    \item{w_Live_Woody}{a vector of minimum and maximum fuel load [t/ha] for live woody fuels; (0,0) if fuel class is absent.}
    \item{s_1h}{a vector of minimum and maximum surface-to-volume ratio [m2/m3] for fuel class 1-hour; (0,0) if fuel class is absent.}
    \item{s_10h}{a vector of minimum and maximum surface-to-volume ratio [m2/m3] for fuel class 10-hour; (0,0) if fuel class is absent.}
    \item{s_100h}{a vector of minimum and maximum surface-to-volume ratio [m2/m3] for fuel class 100-hour; (0,0) if fuel class is absent.}
    \item{s_Live_Herb}{a vector of minimum and maximum surface-to-volume ratio [m2/m3] for live herbs; (0,0) if fuel class is absent.}
    \item{s_Live_Woody}{a vector of minimum and maximum surface-to-volume ratio [m2/m3] for live woody fuels; (0,0) if fuel class is absent.}
    \item{delta}{a vector of minimum and maximum fuel bed depth [cm].}  
    \item{mx.dead}{a vector of minimum and maximum dead fuel moisture of extinction [percent].} 
    \item{h_1h}{a vector of minimum and maximum heat content [kJ/kg] for fuel class 1-hour; (0,0) if fuel class is absent.}
    \item{h_10h}{a vector of minimum and maximum heat content [kJ/kg] for fuel class 10-hour; (0,0) if fuel class is absent.}
    \item{h_100h}{a vector of minimum and maximum heat content [kJ/kg] for fuel class 100-hour; (0,0) if fuel class is absent.}
    \item{h_Live_Herb}{a vector of minimum and maximum heat content [kJ/kg] for live herbs; (0,0) if fuel class is absent.}
    \item{h_Live_Woody}{a vector of minimum and maximum heat content [kJ/kg] for live woody fuels; (0,0) if fuel class is absent.}
    \item{modeltype}{select S(tatic) or D(ynamic) Rothermel model.}
    \item{obs}{a vector of observed ROS [m/min].}
  \item{m}{a data frame of percent moisture on a dry weight basis [percent] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).}
  \item{u}{a vector of midflame windspeed [km/h].}
  \item{slope}{a vector of percent site slope [percent].}
    \item{method}{method of forecast error measure, see \code{\link{error}}.}
    \item{maxiter}{the maximum number of iterations to run before the GA search is halted.}
    \item{popSize}{the population size.}
    \item{pcrossover}{the probability of crossover between pairs of chromosomes. Typically this is a large value and by default is set to 0.8.}
    \item{pmutation}{the probability of mutation in a parent chromosome. Usually mutation occurs with a small probability, and by default is set to 0.1.}
    \item{elitism}{the number of best fitness individuals to survive at each generation. By default the top 5/100 individuals will survive at each iteration.}
    \item{...}{additional arguments to be passed to \code{\link{ga}}.}
  
}
\details{
The function defaults to a real-valued coded GA. 
Default values for fuel models are currently extracted from the standard Fuel Models table by Anderson (1982) and Scott and Burgan (2005).
GA optimization is calculated from a vector of predicted vs. observed data; therefore, vectors of two or more values must be entered for observations, wind speed, and slope, and a data frame with 5 columns and two or more lines must be entered for fuel moisture (see \code{\link{ros}}). 
Since  \code{\link{ga}} defaults to maximizing the fitness function, the opposite of the error metric is computed (i.e., with a negative sign).
}
\value{
Returns an object of class \code{\link{ga-class}}. The best solution is reported by the S4 slot "solution". The opposite of the fitness value is reported by the slot "fitnessValue".
}
\references{
Rothermel, R. C. (1972). A mathematical model for fire spread predictions in wildland fires. Research Paper INT-115. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Scrucca, L. (2013). GA: A Package for Genetic Algorithms in R. Journal of Statistical Software, 53(4), 1-37. URL http://www.jstatsoft.org/v53/i04/.}
\author{
Giorgio Vacchiano, Davide Ascoli (DISAFA, University of Torino, Italy)}

\seealso{
\code{\link{ros}}, \code{\link{firexp}}, \code{\link{SFM_metric}}}

\examples{
library (Rothermel)

# Observed site variables and ROS
data (firexp) 
m <- firexp [, 18:22]
u <- firexp [, "u"]
slope <- firexp [, "slope"]
obs <- firexp [, "ros"]
modeltype <- "S"

# GA optimization using minimization of Root mean square error ("rmse")
# Ranges for fuel model parameters after Ascoli et al. (2015)

ga.model <- gaRoth (m=m, u=u, slope=slope, obs=obs, modeltype=modeltype, 
            method="rmse", popSize=20, maxiter=5,
            w_1h = c(1.5,7.24),
            w_10h = c(0,0),
            w_100h = c(0,0), 
            w_Live_Herb = c(0,0),
            w_Live_Woody = c(2.9,10.4),
            s_1h = c(6640,10036),
            s_10h = c(0,0),
            s_100h = c(0,0),
            s_Live_Herb = c(0,0), 
            s_Live_Woody = c(8810,10560), 
            delta = c(19,70),
            mx.dead = c(25,50),
            h_1h = c(18719,19919),
            h_10h = c(0,0),
            h_100h = c(0,0), 
            h_Live_Herb = c(0,0), 
            h_Live_Woody = c(20000,22504)
            )

summary(ga.model)
}

\keyword{model}
