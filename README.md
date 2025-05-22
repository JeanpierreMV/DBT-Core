# Proyecto DBT-Core

Este proyecto implementa una arquitectura en 3 capas usando **DBT-core** con conexión a **SQL Server** mediante autenticación de Windows.

## 📁 Estructura del Proyecto

- `raw/`: Capa de ingestión, donde se replica el modelo transaccional original.
- `staging/`: Capa de limpieza, donde se transforman y estandarizan los datos.
- `master/`: Capa dimensional, con los datos organizados para análisis.

---

## ⚙️ Requisitos

- Python 3.8+
- Visual Studio Code con la extensión **DBT Power User**
- SQL Server (localhost, puerto 1433)
- Driver: **ODBC Driver 17 for SQL Server**
- DBT-core

---

## 🚀 Instalación y Configuración

### 1. Crear y activar entorno virtual

```powershell
python -m venv dbt_venv
.\dbt_venv\Scripts\Activate.ps1

## 🧩 Instalación de DBT para SQL Server

```bash
pip install dbt-sqlserver
```

## 🛠️ Inicialización del Proyecto DBT

Si aún no has creado tu proyecto DBT, ejecuta:

```bash
dbt init PruebaGeek
```

Luego crea o edita tu archivo `profiles.yml` ubicado en:

```plaintext
C:\Users\<TU_USUARIO>\.dbt\profiles.yml
```

### Ejemplo de configuración (`profiles.yml`):

```yaml
PruebaGeek:
  outputs:
    dev:
      type: sqlserver
      driver: "ODBC Driver 17 for SQL Server"
      server: localhost
      database: PrimerBD
      schema: dbo
      windows_login: true
      authentication: windows
      trust_cert: true
      encrypt: true
      threads: 1
      port: 1433
  target: dev
```

## 🧪 Comandos Comunes

### Compilar modelos

```bash
dbt run --threads 1
```
> Se recomienda `--threads 1` si estás en una laptop con recursos limitados.

### Limpiar archivos temporales de DBT

```bash
dbt clean
```

### Verificar dependencias (si usas paquetes)

```bash
dbt deps
```

### Probar modelos

```bash
dbt test
```

## 📚 Documentación

### Generar documentación

```bash
dbt docs generate
```

### Servir documentación en navegador

```bash
dbt docs serve
```
> Esto abrirá una interfaz web donde podrás navegar el DAG y la documentación de los modelos.
