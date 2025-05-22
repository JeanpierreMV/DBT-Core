{{ config(materialized='table') }}

WITH cliente_base AS (
    SELECT
        dc.UidCliente,
        dc.Fuente,
        dc.IdUbicacion,
        dc.FechaCliente
    FROM {{ ref('dim_cliente') }} dc
),

cliente_con_fuente AS (
    SELECT
        cb.*,
        df.UidFuente
    FROM cliente_base cb
    LEFT JOIN {{ ref('dim_fuente') }} df
        ON cb.Fuente LIKE '%' + df.NombreFuente + '%'
),

cliente_con_ubicacion AS (
    SELECT
        cf.*,
        du.UidDimUbicacion
    FROM cliente_con_fuente cf
    LEFT JOIN {{ ref('dim_ubicacion') }} du
        ON cf.IdUbicacion = du.origenUb
),

cliente_con_aleatorios AS (
    SELECT
        *,
        (SELECT TOP 1 UidLote FROM {{ ref('dim_lote') }} ORDER BY NEWID()) AS UidDimLote,
        (SELECT TOP 1 UidUsuario FROM {{ ref('dim_usuario') }} ORDER BY NEWID()) AS UidDimUsuario
    FROM cliente_con_ubicacion
),

final_con_proyecto AS (
    SELECT
        cca.*,
        dp.UidProyecto
    FROM cliente_con_aleatorios cca
    LEFT JOIN {{ ref('dim_lote') }} dl
        ON cca.UidDimLote = dl.UidLote
    LEFT JOIN {{ ref('dim_proyecto') }} dp
        ON dl.origenProy = dp.origenProy
)

SELECT
    NEWID() AS UidLead,
    UidCliente AS UidDimCliente,
    UidFuente AS UidDimFuente,
    UidDimUsuario,
    UidDimLote,
    UidDimUbicacion,
    FechaCliente AS Fecha,
    UidProyecto AS UidDimProyecto,
    CURRENT_TIMESTAMP AS FechaCarga

FROM final_con_proyecto
