{{ config(materialized='table') }}

SELECT
    IdEstadoCivil,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Estado))), ''), 'VACÍO') AS Estado
FROM {{ ref('raw_EstadoCivil') }}