{{ config(materialized='table') }}

SELECT
    IdPrioridad,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Descripcion))), ''), 'VACÍO') AS Descripcion
FROM {{ ref('raw_Prioridad') }}
