@set CURDATE=%date:~10,4%-%date:~7,2%-%date:~4,2%
@set ZIPFOLDER=c:\Program Files\7-Zip
@set FTPUSER=MY_FTP_USER
@set FTPPASS=MY_FTP_PASS
@set FTPADDRESS=MYFTPADDRESS
@set SOURCEFOLDER=C:\SOURCE_FOLDER
@set BKPFOLDER=C:\DESTINATION_FOLDER_FOR_BACKUPS
@set BKPNAME=Backup-%CURDATE%.7z


@"%ZIPFOLDER%\7z.exe" a "%BKPFOLDER%\%BKPNAME%" "%SOURCEFOLDER%"


(
echo user %FTPUSER% %FTPPASS%
echo binary
echo put "%BKPFOLDER%\%BKPNAME%"
echo quit
)>push.txt
ftp -s:push.txt -n %FTPADDRESS%
del push.txt /q >nul
