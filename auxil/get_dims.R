get_dims<- function(filename) {

  # DESCRIPTION:
  #   This function determines the number of profiles, parameters,
  #   and depth levels in an Sprof netcdf file.
  #
  # INPUTS:
  #   filename    : the name of the Sprof file
  #
  # OUTPUT:
  #   n_prof      : number of profiles (integer)
  #   n_param     : number of parameters (integer)
  #   n_levels    : number of depth levels (integers)
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
  
  
  
  
    
  nc = nc_open(filename) # open ncdf  
  
  
  # Find 'number of profiles', 'number of parameters',
  # and 'number of depth levels'
  n_prof = nc$dim$N_PROF$len
  n_param = nc$dim$N_PARAM$len
  n_levels = nc$dim$N_LEVELS$len
  
  nc_close(nc) # close ncdf  
  
  return(list(n_prof=n_prof,n_param=n_param,n_levels=n_levels))

}
