:start
@echo off
echo ===================================================================================
echo                    PROGRAM UNTUK SHUTDOWN SERVER OTOMATIS
echo server otomatis dimatikan bila modem dimatikan, karena modem tidak terhubung ke UPS
echo ===================================================================================
ping -n 1 %1 | find "TTL=" >nul
if errorlevel 1 (
	shutdown -s -t %2
		:start2
		ping -n %1 | find "TTL=" >nul
		if errorlevel 1 (
			echo sedang proses shutdown
			SLEEP 5
			goto :start2
		) else (
			shutdown -a
			echo Shutdown dibatalkan
			goto :start
		)
		)
) else (
	echo ping ke modem lancar
	echo mohon tidak menutup jendela ini agar program tetap berjalan
	SLEEP 5
	cls
	goto :start
)
