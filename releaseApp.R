### how to release app: http://shiny.rstudio.com/articles/shinyapps.html

library(rsconnect)

rsconnect::setAccountInfo(name = "gangwug", token = "34E3FE44CE2ACFB62643C1B476925584", secret = "AY+LhSmwQqL01pVSf2xVSczNf7NBTRRtC5RDEiHD")

setwd("./SkinPhaserApp/")

deployApp()

#rsconnect::appDependencies()    ##check the dependency of installed packages
#devtools::session_info()        ##some error reports associated with packages are here: https://groups.google.com/forum/#!topic/shinyapps-users/zaUay_lM-lY
## need to re-install some packages from CRAN github mirror for fixing the issue