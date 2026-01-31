@echo off
REM Script para levantar Keycloak con Docker en Windows
REM Uso: start-keycloak.bat

echo.
echo Iniciando Keycloak con Docker...
echo.

REM Verificar si Docker está instalado
where docker >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Docker no esta instalado
    echo Por favor, instala Docker Desktop desde https://www.docker.com/
    pause
    exit /b 1
)

REM Verificar si Docker Compose está instalado
where docker-compose >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Docker Compose no esta instalado
    echo Por favor, instala Docker Compose
    pause
    exit /b 1
)

REM Levantar los contenedores
echo Levantando contenedores...
docker-compose up -d

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Keycloak se esta iniciando...
    echo.
    echo Espera unos segundos para que Keycloak termine de inicializar
    echo.
    echo Para ver los logs:
    echo    docker-compose logs -f keycloak
    echo.
    echo Accede a Keycloak en:
    echo    http://localhost:8080
    echo.
    echo Credenciales de administrador:
    echo    Usuario: admin
    echo    Contrasena: admin
    echo.
    echo Para detener Keycloak:
    echo    docker-compose down
    echo.
    echo Para mas informacion, consulta KEYCLOAK_SETUP.md
) else (
    echo.
    echo Error al levantar los contenedores
)

pause
