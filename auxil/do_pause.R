
do_pause <-function() {
  
  # DESCRIPTION:
  #   It asks the user to hit ENTER if Settings.use_pause is 1.
  #   Otherwise, flow control returns the caller.
  #
  # UPDATE RECORD: 
  #   Version 1 & 2:   June 2021 
  #   Version 2.1: January 2022 
  #   Version 3.0: May 2022
  #
  # CITATION:
  #   M. Cornec (LOV, now at NOAA-PMEL), Y. Huang (NOAA-PMEL), Q. Jutard (OSU ECCE TERRA), R. Sauzede (IMEV) and 
  #   C. Schmechtig (OSU ECCE TERRA), 2021.
  #   BGC-Argo-R: A R toolbox for accessing and visualizing Biogeochemical Argo data. 
  #   Zenodo. http://doi.org/10.5281/zenodo.5028138
  
  
    if(Setting$use_pause==1) {
    cat ("Please hit ENTER to continue")
    line <- readline()
    }
}








