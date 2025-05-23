{{ config(materialized='incremental') }}

WITH base AS (
    SELECT
        UPPER(LTRIM(RTRIM(Mz))) AS Mz,
        Codigo,
        Area,
        Precio,
        EstadoVenta,
        UPPER(LTRIM(RTRIM(UsuarioCreador))) AS UsuarioCreador,
        FechaCreacion,
        UPPER(LTRIM(RTRIM(UsuarioModificador))) AS UsuarioModificador,
        FechaModificacion,
        SoftDelete,
        IdProyecto,
        UPPER(LTRIM(RTRIM(NombreLote))) AS NombreLote
    FROM {{ ref('raw_Lote') }}
    WHERE (SoftDelete = 0 OR SoftDelete IS NULL)
)

SELECT *
FROM base
