#reads in the libaries and Data we need to run the program
using FTPClient
using DataFrames
using CSV
ModelData = CSV.read("Models.csv", silencewarnings=true)

#########Upload Test#########
#                   User Inputs
#-------------------------------------------------------
#Variables for FTP download
#Model Range{1 = Access-10, 2 = Access-13,...}
ModelRange = 1:10
# Loop in the Scenario Folders (1=rcp45 and 2=rcp85)
ScenarioRange = [1,2]
#Loop in the Variables (e.g. tasmax , tasmin , pr)
VariableRange = [1,3]
#Loop for Year
YearRange = 2021:2021
#Sets the directory path for download. Creates folder at current directory by default
Home = pwd()
#Home = "C:\\Users\\Breeze\\Documents\\Downloads\\Example_Path"
#--------------------------------------------------------


#loads the FTP to download Files
global Host = FTP(hostname="gdo-dcp.ucllnl.org",username="",password="")
cd(Host, "/pub/dcp/archive/cmip5/loca/LOCA_2016-04-02")
global BaseDir = pwd(Host)


#Model Loop
for X in ModelRange
    for Y in ScenarioRange
        #This if statement is to account for the change in directory naming depending on Variable rcp45 or rcp85
        if Y == 1
            for Z in VariableRange
                #Creates the Directory Paths for both the FTP and Local Computer
                Filepath = string(Home,"\\NETCDF\\",ModelData[X,4],"\\","16th\\",ModelData[Y,5],"\\",ModelData[X,6],"\\",ModelData[Z,3],"\\")
                ftppath = string(BaseDir,"/",ModelData[X,4],"/","16th/",ModelData[Y,5],"/",ModelData[X,6],"/",ModelData[Z,3],"/")

                #reconnects to FTP
                global Host = FTP(hostname="gdo-dcp.ucllnl.org",username="",password="")
                cd(Host, ftppath)

                #Creates Local Directory Path
                mkpath(Filepath)
                print("Downloading $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4])\r\n")

                for T in YearRange
                    #Creates File name to pull from FTP
                    Local_File_Name = string(ModelData[Z,3],"_day_",ModelData[X,4],"_",ModelData[Y,5],"_",ModelData[X,6],"_",T,"0101-",T,ModelData[1,7])
                    File_name = string(ModelData[Z,3],"_day_",ModelData[X,4],"_",ModelData[Y,5],"_",ModelData[X,6],"_",T,"0101-",T,ModelData[1,7])
                    End_File = string(Filepath,Local_File_Name)
                    print("Begining Download of Year $T\r\n")

                    #Checks if File is already on Local Drive, otherwise it starts the download
                    if isfile(End_File)
                        print("Download of $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4]) of Year $T. Already Completed.\r\n\r\n")
                    else
                        FTPClient.download(Host, File_name, End_File)
                        print("Completed Download of $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4]) of Year $T.\r\n\r\n")
                    end
                end
            end
        end
        if Y == 2
            for Z in VariableRange
                #Creates the Directory Paths for both the FTP and Local Computer
                Filepath = string(Home,"\\NETCDF\\",ModelData[X,4],"\\","16th\\",ModelData[Y,5],"\\",ModelData[X,8],"\\",ModelData[Z,3],"\\")
                ftppath = string(BaseDir,"/",ModelData[X,4],"/","16th/",ModelData[Y,5],"/",ModelData[X,8],"/",ModelData[Z,3],"/")

                #reconnects to FTP
                global Host = FTP(hostname="gdo-dcp.ucllnl.org",username="",password="")
                cd(Host, ftppath)

                #Creates Local Directory Path
                mkpath(Filepath)
                print("Downloading $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4])\r\n")

                for T in YearRange
                    #Creates File name to pull from FTP
                    Local_File_Name = string(ModelData[Z,3],"_day_",ModelData[X,4],"_",ModelData[Y,5],"_",ModelData[X,8],"_",T,"0101-",T,ModelData[1,7])
                    File_name = string(ModelData[Z,3],"_day_",ModelData[X,4],"_",ModelData[Y,5],"_",ModelData[X,8],"_",T,"0101-",T,ModelData[1,7])
                    End_File = string(Filepath,Local_File_Name)
                    print("Begining Download of Year $T\r\n")

                    #Checks if File is already on Local Drive, otherwise it starts the download
                    if isfile(End_File)
                        print("Download of $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4]) of Year $T. Already Completed.\r\n\r\n")
                    else
                        FTPClient.download(Host, File_name, End_File)
                        print("Completed Download of $(ModelData[Y,5]) $(ModelData[Z,3]) from $(ModelData[X,4]) of Year $T.\r\n\r\n")
                    end
                end
            end
        end
    end
end
close(Host)
cd(Home)

#print(BaseDir)