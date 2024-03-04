<img width="254" alt="Defra logo" src="https://github.com/Defra-Data-Science-Centre-of-Excellence/sgapi/assets/126087299/1c7cfe02-87cd-407e-b245-991374cfc488">
# sgApi 



sgApi provides a simple wrapper around the nomis and Open Geography Portal APIs, aiding geospatial analysis of the population, labour market, and social measures. The authors thank ONS for their work in maintaining both NOMIS and Open Geography Portal, without them this work would not be possible.

More information on theses sources can be found here:

**ONS Open Geography Portal:** https://geoportal.statistics.gov.uk/

**nomis:** https://www.nomisweb.co.uk/

## Installation
     install.packages("sgapi")
     
### Install Development Version
    install.packages("remotes")
    remotes::install_github("https://github.com/Defra-Data-Science-Centre-of-Excellence/sgapi")

## Key Functions

1. **get_boundaries.R** - returns shapefile of areas in contact with a user selected rectangular area, at your chosen ONS resolution
2. **get_boundaries_areanames.R** - returns the shapefiles for all areas input into the function.
3. **extract_dimensions.R** - for a chosen Nomis table this function returns all of the parameters which can be filtered
4. **get_table.R** - extracts a dataframe from the chosen Nomis table for your selected area and selected filters
5. **get_table_link_lookup.R** - retrieves a dataframe with the lookup table between two resolutions, taken from 

## Exploratory Functions

1. **list_boundaries.R** - lists all boundary masks available on the ONS Open Geography
2. **list_tables.R** - lists all tables, including their name and reference code, from nomis
3. **available_scales.R** - provides list of available geographical resolutions for your chosen nomis table
4. **data_sources.R** - lists all available data sources on nomis

## Additional API Information

**ONS Open Geography Portal:** https://developers.arcgis.com/rest/services-reference/enterprise/query-feature-service-layer-.htm

**nomis:** https://www.nomisweb.co.uk/api/v01/help
           
