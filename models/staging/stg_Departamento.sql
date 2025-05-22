{{ config(materialized='table') }}

SELECT
    IdDepartamento,
    COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Departamento))), ''), 'VACÍO') AS Departamento
FROM {{ ref('raw_Departamento') }}