{{ config(materialized='table') }}

SELECT
    IdFuente,
    UPPER(LTRIM(RTRIM(NombreFuente))) AS NombreFuente,
    UPPER(LTRIM(RTRIM(TipoFuente))) AS TipoFuente,
    UPPER(LTRIM(RTRIM(CanalContacto))) AS CanalContacto
FROM {{ ref('raw_Fuente') }}