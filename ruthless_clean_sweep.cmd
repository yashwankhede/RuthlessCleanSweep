@echo off
setlocal enabledelayedexpansion

rem Function to delete empty directories and files recursively
:delete_empty
for /r %%d in (.) do (
    rem Delete empty files
    for %%f in ("%%d\*") do (
        if exist "%%f" (
            set "file=%%f"
            if %%~zf equ 0 (
                del "%%f"
            )
        )
    )

    rem Delete empty directories
    for /d %%e in ("%%d\*") do (
        if exist "%%e\*" (
            set "dir=%%e"
            dir /a /b "!dir!\" >nul 2>nul
            if errorlevel 1 (
                rmdir "%%e"
            )
        )
    )
)

echo Empty files and directories deleted successfully.
exit /b
