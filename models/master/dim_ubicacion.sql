{{ config(materialized='table') }}

SELECT
    NEWID() AS UidDimUbicacion,
    'Perú' AS Pais,
    COALESCE(NULLIF(d.Departamento, ''), 'VACÍO') AS Departamento,
    COALESCE(NULLIF(p.Provincia, ''), 'VACÍO') AS Provincia,
    COALESCE(NULLIF(dist.Distrito, ''), 'VACÍO') AS Distrito,
    IdUbicacion as originalUb,
    CURRENT_TIMESTAMP AS FechaCarga
FROM {{ ref('stg_Ubicacion') }} u
JOIN {{ ref('stg_Departamento') }} d ON u.IdDepartamento = d.IdDepartamento
JOIN {{ ref('stg_Provincia') }} p ON u.IdProvincia = p.IdProvincia
JOIN {{ ref('stg_Distrito') }} dist ON u.IdDistrito = dist.IdDistrito
