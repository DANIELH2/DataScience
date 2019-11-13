nasa1<-as_data_frame(nasa)
library(dplyr)

nasa2 <- nasa1 %>%
  filter(lat>=29.56 & lat <=33.09 & long <= -90.55 & long >= -110.93) %>%
  mutate(tempsurf_ratio=temperature/surftemp) %>%
  group_by(year) %>%
  summarise(pressure_mean=mean(pressure,na.rm=T),
           pressure_sd=sd(pressure,na.rm=T),
           ozone_mean=mean(ozone,na.rm=T),
           ozone_sd=sd(ozone,na.rm=T),
           tempsurf_ratio_mean=mean(tempsurf_ratio,na.rm=T),
           tempsurf_ratio_sd=mean(tempsurf_ratio,na.rm=T)) %>%
  arrange(desc(ozone_mean))


