@echo off
setlocal EnableDelayedExpansion

for /D %%i in (*) do (
    pushd "%%i"
    for /r %%j in (*) do move "%%j" ".."
    popd
)
