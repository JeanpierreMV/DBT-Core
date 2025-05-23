{{ config(materialized='table') }}

WITH base AS (
    SELECT TOP 300
        IdLote,
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
