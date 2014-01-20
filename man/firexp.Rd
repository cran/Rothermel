\name{firexp}
\alias{firexp}
\docType{data}
\title{
field fire experiments in Vauda Nature Reserve, Italy}
\description{
The dataset include observations of surface head fire rate of spread (ROS) measured during field fire experiments in heathland fuels (mixed grass-shrub) carried out on flat terrain under differing fire weather conditions (Ascoli et al. 2009). For each ROS values of Rothermel's fire behavior fuel models parameters and environmental conditions are provided. Some ranges in the dataset are: ROS <- 0.9 - 26.3 m/min;  wind speed <- 0.4 - 7.9 km/h; 1h fuels moisture: 10 - 27 percent.
}
\usage{data (firexp)}
\format{
  A data frame with 40 observations on the following 25 variables.
  \describe{
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
    \item{\code{Heat_Live_Woody}}{heat content of woody fuels [kJ/kg]}
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
    \item{\code{u}}{midflame windspeed [km/h]}
    \item{\code{slope}}{site slope [%]
    }
    \item{\code{ros}}{observed rate of spread [m/min]]}
}
}
\source{
Ascoli, D.,  Marzano, R., and Bovio, G. (2006). Experimental fires for heather moorland management in north-western Italy. Forest Ecology and Management 234S: 258. http://dx.doi.org/10.1016/j.foreco.2006.08.287.}
\references{
Ascoli, D., Beghin, R., Ceccato, R., Gorlier, A., Lombardi, G., Lonati, M., Marzano, R., Bovio, G., and Cavallero, A. (2009). Developing an adaptive management approach to prescribed burning: a long-term heathland conservation experiment in north-west Italy. International Journal of Wildland Fire 18(6): 727-735. http://dx.doi.org/10.1071/WF07114.
}
\examples{
data (firexp) 
boxplot (firexp$ros)}
\keyword{datasets}
