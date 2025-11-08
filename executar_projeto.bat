@echo off
REM ============================================================================
REM Script de Automação: Instalar Jupyter, Dependências e Executar Projeto
REM Projeto: Análise de Clusterização de Países
REM ============================================================================

setlocal enabledelayedexpansion
cd /d "%~dp0"

echo.
echo ============================================================================
echo  ANÁLISE DE CLUSTERIZAÇÃO DE PAÍSES
echo  Script de Instalação e Execução Automática
echo ============================================================================
echo.

REM ============================================================================
REM PASSO 1: Verificar se Python está instalado
REM ============================================================================
echo [1/5] Verificando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERRO: Python não encontrado!
    echo Por favor, instale Python 3.8+ em: https://www.python.org/
    echo Certifique-se de marcar "Add Python to PATH" durante a instalação.
    echo.
    pause
    exit /b 1
)
python --version
echo ✓ Python encontrado!
echo.

REM ============================================================================
REM PASSO 2: Criar ambiente virtual
REM ============================================================================
echo [2/5] Criando ambiente virtual...
if exist venv (
    echo ✓ Ambiente virtual já existe
) else (
    python -m venv venv
    if errorlevel 1 (
        echo ERRO ao criar ambiente virtual!
        pause
        exit /b 1
    )
    echo ✓ Ambiente virtual criado
)
echo.

REM ============================================================================
REM PASSO 3: Ativar ambiente virtual e instalar dependências
REM ============================================================================
echo [3/5] Ativando ambiente virtual e instalando dependências...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ERRO ao ativar ambiente virtual!
    pause
    exit /b 1
)
echo ✓ Ambiente virtual ativado
echo.

echo Instalando Jupyter...
pip install jupyter --quiet
if errorlevel 1 (
    echo ERRO ao instalar Jupyter!
    pause
    exit /b 1
)
echo ✓ Jupyter instalado
echo.

echo Instalando dependências do projeto (requirements.txt)...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    echo ERRO ao instalar dependências!
    pause
    exit /b 1
)
echo ✓ Dependências instaladas
echo.

REM ============================================================================
REM PASSO 4: Criar pasta de gráficos se não existir
REM ============================================================================
echo [4/5] Preparando ambiente...
if not exist graficos (
    mkdir graficos
    echo ✓ Pasta 'graficos' criada
) else (
    echo ✓ Pasta 'graficos' já existe
)
echo.

REM ============================================================================
REM PASSO 5: Executar Jupyter Notebook
REM ============================================================================
echo [5/5] Iniciando Jupyter Notebook...
echo.
echo ============================================================================
echo  INSTRUÇÕES:
echo  1. O Jupyter abrirá no navegador padrão
echo  2. Clique em 'analise_clustering.ipynb'
echo  3. Vá em Kernel → Restart & Run All para executar tudo
echo  4. Os gráficos serão salvos em 'graficos/'
echo  5. Consulte 'LEIA_PRIMEIRO.txt' para mais informações
echo ============================================================================
echo.
timeout /t 3

jupyter notebook analise_clustering.ipynb

echo.
echo ============================================================================
echo  Projeto finalizado!
echo  Verifique a pasta 'graficos/' para os gráficos gerados.
echo ============================================================================
echo.
pause
