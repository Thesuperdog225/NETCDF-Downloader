# NETCDF-Downloader
This code downloads Weather data from https://gdo-dcp.ucllnl.org/downscaled_cmip_projections/dcpInterface.html#Welcome

It will use a significant amount of space if you're doing large data sets. If you're looking to download a large [larger than a single hard drive] I would suggest another method.


## Features
- Changable download directory
- Checks if the file already downloaded.
- Customizable file downloader to save on hard drive space.
- Messages everytime a file is done so you can track how far along on the download you are.

## Contributers
- [Christopher Munoz](https://www.linkedin.com/in/christopher-munoz-036a2a187)
- [Maria Aranguren](https://www.linkedin.com/in/aranguren-maria)
- [TSERI](http://texasenergy.utsa.edu/)


## Usage

1. Go to FTP_Downloader in any text editor
2. Find User Inputs, Line 8
3. There you can put in the inputs as numbers.
   - To select indivial models use = [1,2,3,etc.] or [1,9,10,15]
   - To select range of models use = 1:5 or 6:15
   - You can find what the number ranges repersent below, in Model/Scenario/Variable List.
4. After you have Model, Scenario, Variables, and Year variables set you can simply run the program

## Model and Scenario Ranges

These are the what the numbers repesent in the User Inputs section of the FTP_Download.jl.

|Number|Model          |Scenario|Variable           |
|------|---------------|--------|-------------------|
|1     | ACCESS1-0     | rcp45  | participation (pr)|
|2     | ACCESS1-3     | rcp85  | Annual daily maximum (tasmax) Temperature|
|3     | CCSM4         |        | Annual daily minimum (tasmin) Temperature|
|4     | CESM1-BGC     |        |                   |
|5     | CESM1-CAM5    |        |                   |
|6     | CMCC-CM       |        |                   |
|7     | CMCC-CMS      |        |                   |
|8     | CNRM-CM5      |        |                   |
|9     | CSIRO-Mk3-6-0 |        |                   |
|10    | CanESM2       |        |                   |
|11    | EC-EARTH      |        |                   |
|12    | FGOALS-g2     |        |                   |
|13    | GFDL-CM3      |        |                   |
|14    | GFDL-ESM2G    |        |                   |
|15    | GFDL-ESM2M    |        |                   |
|16    | GISS-E2-H     |        |                   |
|17    | GISS-E2-R     |        |                   |
|18    | HadGEM2-AO    |        |                   |
|19    | HadGEM2-CC    |        |                   |
|20    | HadGEM2-ES    |        |                   |
|21    | IPSL-CM5A-LR  |        |                   |
|22    | IPSL-CM5A-MR  |        |                   |
|23    | MIROC-ESM     |        |                   |
|24    | MIROC-ESM-CHEM|        |                   |
|25    | MIROC5        |        |                   |
|26    | MPI-ESM-LR    |        |                   |
|27    | MPI-ESM-MR    |        |                   |
|28    | MRI-CGCM3     |        |                   |
|29    | NorESM1-M     |        |                   |
|30    | bcc-csm1-1    |        |                   |
|31    | bcc-csm1-1-m  |        |                   |
|32    | inmcm4        |        |                   |






