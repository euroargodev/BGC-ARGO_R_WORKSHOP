show_time_series<- function(float_ids=Setting$demo_float, 
                          variables="DOXY",
                          float_profs=NULL,
                          plot_depth=20, 
                          raw="no", 
                          qc_flags=0:9) {
  # DESCRIPTION:
  #  This an intermediary function that  downloads profile(s) for the given
  #  float(s) and calls plot_sections to create the plot(s).
  #
  # PREREQUISITE:
  #   Require to install the "xquartz" for macOS system for figure plot 
  #   ("https://www.xquartz.org/")
  #
  #  INPUTS:
  #    float_ids  : WMO ID(s) of one or more floats 
  #                (if not set: Setting$demo_float is used as a demo)
  #    variables  : cell array of variable(s) (i.e., sensor(s)) to show 
  #                (if not set: {'DOXY'} (=O2) is used)
  #
  # OPTIONAL INPUTS:
  #   float_profs : float profile is an array with the per-float indices 
  #                 as returned by function "select_profiles";  
  #   plot_depth          : the desired depth to plot the time series (default: 20m)
  #   raw = 'yes'/'no'   : plot raw, i.e., unadjusted data if set to 'yes';
  #                        default: 'no' (i.e., plot adjusted data if available)
  #   obs = 'on' / 'off  : if 'on', add dots at the depths of observations
  #                        default: 'on'; use 'off' to turn off this behavior
  #   qc_flags                 : show only values with the given QC flags (as an array)
  #                        0: no QC was performed; 
  #                        1: good data; 
  #                        2: probably good data;
  #                        3: probably bad data that are potentially correctable;
  #                        4: bad data; 
  #                        5: value changed; 
  #                        6,7: not used;
  #                        8: estimated value; 
  #                        9: missing value
  #                        default setting: [1,2]
  #                        See Table 7 in Bittig et al.:
  #                        https://www.frontiersin.org/files/Articles/460352/fmars-06-00502-HTML-r1/image_m/fmars-06-00502-t007.jpg
  # OUTPUT:
  #   good_float_ids : array of the float IDs whose Sprof files were
  #                    successfully downloaded or existed already
  # UPDATE RECORD: 
  #   Version 3: May 2022 
  #
  # CITATION:
  #   M. Cornec (LOV, now at NOAA-PMEL), Y. Huang (NOAA-PMEL), Q. Jutard (OSU ECCE TERRA), R. Sauzede (IMEV) and 
  #   C. Schmechtig (OSU ECCE TERRA), 2021.
  #   BGC-Argo-R: A R toolbox for accessing and visualizing Biogeochemical Argo data. 
  #   Zenodo. http://doi.org/10.5281/zenodo.5028138
  
  
  
  
  
  
  # make sure Setting is initialized
  if (exists("Setting")==F) {
    initialize_argo()
  }
  
  # download Sprof files if necessary
  good_float_ids = download_multi_floats(float_ids)

  if ( length(good_float_ids) == 0 ) {
    warning('no valid floats found')
  } else {
    
    nvars = length(variables)
    # add the necessary variables now, but don't plot their profiles
    
    if (!any(variables == 'TEMP')) {
      variables = c(variables, 'TEMP')            
    }
    if (!any(variables == 'PSAL')) {
      variables = c(variables, 'PSAL')            
    }
    
    loaded = load_float_data(good_float_ids, variables,float_profs)
    Data = loaded$Data
    Mdata = loaded$Mdata
  
    plot_time_series(Data=Data, 
                  Mdata=Mdata, 
                  variables=variables, 
                  nvars=nvars, 
                  plot_depth=plot_depth,
                  raw=raw, 
                  qc_flags=qc_flags)
  } # end for "if ( length(good_float_ids) == 0 )"
  
  return(good_float_ids)
} # end for "show_sections"