{{ config(materialized='table') }}

SELECT
    IdTipoDocumento,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(TipoDocumento))), ''), 'VACÍO') AS TipoDocumento
FROM {{ ref('raw_TipoDocumento') }}
