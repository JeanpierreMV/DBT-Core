{{ config(materialized='table') }}

SELECT
    IdProvincia,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Provincia))), ''), 'VACÍO') AS Provincia
FROM {{ ref('raw_Provincia') }}
