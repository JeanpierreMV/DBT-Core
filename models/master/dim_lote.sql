{{ config(
    materialized='table'
) }}

SELECT
    NEWID() AS UidLote,
    Mz,
    Codigo,
    Area,
    Precio,
    EstadoVenta,
    UsuarioCreador,
    FechaCreacion,
    UsuarioModificador,
    FechaModificacion,
    IdProyecto,
    NombreLote,
    idLote as originalLo,
    CURRENT_TIMESTAMP AS FechaCarga
FROM {{ ref('stg_Lote') }}
