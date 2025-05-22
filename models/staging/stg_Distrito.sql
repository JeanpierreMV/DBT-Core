{{ config(materialized='table') }}

SELECT
    IdDistrito,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Distrito))), ''), 'VACÍO') AS Distrito
FROM {{ ref('raw_Distrito') }}
