{{ config(
    materialized='table'
) }}

SELECT
    NEWID() AS UidFuente,
    NombreFuente,
    TipoFuente,
    CanalContacto,
    idFuente as originalFu,
    CURRENT_TIMESTAMP AS FechaCarga
FROM {{ ref('stg_Fuente') }}
