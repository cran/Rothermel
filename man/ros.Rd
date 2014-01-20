\name{ros}
\alias{ros}
\title{
Function to predict Rothermel's (1972) rate of spread [m/min] for surface headfires
}
\description{
Include corrections to the orginal model by Frandsen (1973), Albini (1976), and Andrews et al. (2013).}
\usage{
ros (modeltype, w, s, delta, mx.dead, h, m, u, slope)
}
\arguments{
  \item{modeltype}{
S(tatic), D(ynamic)}
  \item{w}{
a vector or data frame of fuel load [t/ha] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).}
  \item{s}{
a vector or data frame of surface-to-volume ratio [m2/m3] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).}
  \item{delta}{
a value or vector of fuel bed depth [cm]}
  \item{mx.dead}{
a value or vector of dead fuel moisture of extinction [percent]}
  \item{h}{
a vector or data frame of heat content [kJ/kg] for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).}
  \item{m}{
a vector or data frame of percent moisture on a dry weight basis (percent) for fuel classes 1-hour, 10-hour, 100-hour, live herbs and live woody, respectively (5 values or columns; 0 if fuel class is absent).
}
  \item{u}{
a value or vector of midflame windspeed [km/h]}
  \item{slope}{
a value or vector of site slope [percent]
}
}
\value{
A list of values or vectors for the following variables:
 [1] Characteristic dead fuel moisture [percent], 
 [2] Characteristic live fuel moisture [percent], 
 [3] Live fuel moisture of extiction [percent], 
 [4] Characteristic SAV [m2/m3]
 [5] Bulk density [kg/m3], 
 [6] Packing ratio [dimensionless], 
 [7] Relative packing ratio [dimensionless], 
 [8] Dead fuel Reaction intensity [kW/m2], 
 [9] Live fuel Reaction intensity [kW/m2], 
 [10] Reaction intensity [kW/m2], 
 [11] Wind factor [0-100], 
 [12] Slope factor [0-1], 
 [13] Heat source [kW/m2], 
 [14] Heat sink [kJ/m3], 
 [15] ROS [m/min].
}
\references{
Albini, F. A. (1976). Computer-based models of wildland fire behavior: A users' manual. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Andrews, P. L., Cruz, M. G., and Rothermel, R. C. (2013). Examination of the wind speed limit function in the Rothermel surface fire spread model. International Journal of Wildland Fire 22 (7): 959-969. http://dx.doi.org/10.1071/WF12122.

Frandsen, W. H. (1973). Using the effective heating number as a weighting factor in Rothermel's fire spread model. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.

Rothermel, R. C. (1972). A mathematical model for fire spread predictions in wildland fires. Research Paper INT-115. Ogden, UT: US Department of Agriculture, Forest Service, Intermountain Forest and Range Experiment Station.
}
\author{
Giorgio Vacchiano, Davide Ascoli (DISAFA, University of Torino, Italy)
}
\seealso{
\code{\link{rosunc}}, \code{\link{SFM_metric}}, \code{\link{scenarios}}}
\examples{
# Example 1: ROS using vectors of input values 

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)
u <- 5
slope <- 10

ros(modeltype, w, s, delta, mx.dead, h, m, u, slope)

# Example 2: variable wind input
# Only rate of spread is reported here (i.e., element [15] of ros ( ) output)

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)
slope <- 10

df <- data.frame ("windspeed" = seq (3, 15, 1), ROS=NA)

for (i in 1:nrow (df)) {
  df [i,2] <- 
  ros (modeltype, w, s, delta, mx.dead, h, m, u=df[i,1], slope) [15]
}
df

# Example 3: variable wind and slope input
# A two-entry table of rates of spread is created 

modeltype <- "D"
w <-c (2, 1, 0.5, 3, 8)
s <- c (5600, 358, 98, 6200, 8000)
delta <- 50
mx.dead <- 30
h <- c (18622, 18622, 18622, 19500, 20000)
m <- c (7, 8, 9, 40, 60)

u <- seq (3, 15, 1)
slope <- seq (0, 45, 15)

df <- matrix (rep (NA, length (u) * length (slope)), 
      length (u),
      length (slope)
      )
      
df <- data.frame (u, df)
colnames (df) <- c ("windspeed", 
  paste ("slope_", as.character (slope))
  )

for (i in 1:length (u)) {
  for (j in 1:length (slope)) {
    df [i, j+1] <- ros (
      modeltype, w, s, delta, mx.dead, h, m, u[i], slope[j])[15]
 }
}

df
}
\keyword{ model }
