# WINDOWS-LAUNCHER-SYSTEM
This is a Windows launcher system that you can set to run on Logon with a task scheduler task. This application is useful so you can aggregate a list of startup applications, and have them start with or without a delay on Windows logon.


Inside 'winlauncher.cfg', enable a launcher target by turning the desired one ON in the '[LAUNCH_SWITCHES]' section.
Example: Change 'App001=0' TO 'App001=1'  (Without quotes or apostrophes). This turns App Target 001 to ON
Then under the '[LAUNCH_DELAYS]' section, configure the number of miliseconds you want the desired target to execute after.
Example: Change 'App001=550' TO 'App001=8000'  (Without quotes or apostrophes). This changes App Target 001's launch delay from the default 550 miliseconds (half of a second) to 8000 miliseconds (8 seconds).
Then under the '[LAUNCH_TARGETS]' section, configure the Executable and Directory for your desired program target.
Example (for foobar2000 music player which I use and have installed already):
Change 'LauncherExecutable001=UNDEFINED_001' TO 'LauncherExecutable001=foobar2000.exe'  (Without quotes or apostrophes). This must be the exact name of the application file for your desired target program, including the .exe file extension!
Change 'LauncherDirectory001=UNDEFINED_001' TO 'LauncherDirectory001=C:\Program Files (x86)\PdaNet for Android'  (Without quotes or apostrophes). This must be the exact directory of the application file for your desired target program, the folder that the above .exe file is inside of!
