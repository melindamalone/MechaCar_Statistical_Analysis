library(dplyr)

MechaCar_mpg <- read.csv("MechaCar_mpg.csv")

?lm
Mechalm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)  
summary(Mechalm)

Suspension_Coil <- read.csv("Suspension_Coil.csv")
Suspension_Total <- Suspension_Coil %>% summarize(mean=mean(PSI), median=median(PSI), variance=var(PSI), std=sd(PSI))
Suspension_Lot <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(mean=mean(PSI), median=median(PSI), variance=var(PSI), std=sd(PSI))

write.csv(Suspension_Coil, "sc.csv", row.names = FALSE)
write.csv(Suspension_Total, "st.csv", row.names = FALSE)
write.csv(Suspension_Lot, "sl.csv", row.names = FALSE)

t.test(Suspension_Coil$PSI, mu=1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)