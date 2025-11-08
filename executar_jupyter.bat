@echo off
REM ============================================================================
REM Script Rápido: Executar Jupyter Notebook
REM (Use este após a primeira execução de executar_projeto.bat)
REM ============================================================================

cd /d "%~dp0"

echo.
echo ============================================================================
echo  Iniciando Jupyter Notebook...
echo ============================================================================
echo.

REM Ativar ambiente virtual
call venv\Scripts\activate.bat

REM Executar Jupyter
jupyter notebook analise_clustering.ipynb

pause
