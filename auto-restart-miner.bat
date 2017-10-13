@echo off
echo -------------------------------------------------------------------
echo EthMiner with restart every 2.5 hrs
echo -------------------------------------------------------------------
echo:
set executable=ethminer.exe
set commandline= --farm-recheck 200 -G -S eth-eu1.nanopool.org:9999 -O ***your wallet**.**miner* --opencl-device 0
set runforseconds=9000
set restartinseconds=10
set /a counter=0
timeout 15
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100
:start
start "ETHMiner" %executable% %commandline%
echo:
echo The software will run for %runforseconds% seconds
timeout %runforseconds%
taskkill /f /im %executable%
echo:
echo Restarting the software in %restartinseconds% seconds (%counter%)
timeout %restartinseconds%
set /a counter+=1
echo:
echo:
goto start