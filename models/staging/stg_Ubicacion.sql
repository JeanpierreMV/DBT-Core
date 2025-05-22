{{ config(materialized='table') }}

SELECT
    IdUbicacion,
    IdDepartamento,
    IdProvincia,
    IdDistrito
FROM {{ ref('raw_Ubicacion') }}
WHERE 
    IdDepartamento IS NOT NULL
    AND IdProvincia IS NOT NULL
    AND IdDistrito IS NOT NULL
