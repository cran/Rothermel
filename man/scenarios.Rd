\name{scenarios}
\alias{scenarios}
\docType{data}
\title{
Moisture scenarios by Scott & Burgan (2005)
}
\description{
A fuel Moisture Scenario is a set of fuel moisture values representing moisture condition of the surface fuel. Fuel Moisture Scenarios are useful for testing custom Fuel Models or developing fire prescriptions. For example, a moisture Scenario might be developed to represent a location's 90th-, 95th-, and 97th-percentile fire weather conditions (Andrews 2009)}
\usage{data(scenarios)}
\format{
  A data frame with 16 observations on the following 12 variables.
  \describe{
    \item{\code{Moist_1h}}{moisture of 1h fuel class on a dry weight basis [percent]
    }
    \item{\code{Moist_10h}}{moisture of 10h fuel class on a dry weight basis [percent]
    }
    \item{\code{Moist_100h}}{moisture of 100h fuel class on a dry weight basis [percent]
    }
    \item{\code{Moist_Live_Herb}}{moisture of herbaceous fuels on a dry weight basis [percent]
    }
    \item{\code{Moist_Live_Woody}}{moisture of woody fuels on a dry weight basis [percent]
    }
    \item{\code{Description}}{Scenario description}
  }
  }
\source{
Andrews, P. L. (2009). BehavePlus fire modeling system, version 5.0: Variables. Gen. Tech. Rep. RMRS-GTR-213WWW Revised. Fort Collins, CO: US Department of Agriculture, Forest Service, Rocky Mountain Research Station. http://www.fs.fed.us/rm/pubs/rmrs_gtr213.pdf

Scott, J., & Burgan, R. E. (2005). A new set of standard fire behavior fuel models for use with Rothermel's surface fire spread model. Gen. Tech. Rep. RMRS-GTR-153. Fort Collins, CO: US Department of Agriculture, Forest Service, Rocky Mountain Research Station.}
\examples{
data (scenarios)
barplot (as.matrix (scenarios [1, 1:5]),
        cex.names = .6,
        main = rownames (scenarios)[1])
        
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
