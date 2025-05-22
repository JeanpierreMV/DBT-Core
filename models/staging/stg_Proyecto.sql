{{ config(materialized='table') }}

WITH base AS (
    SELECT
        IdProyecto,
        idempresa,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(nombre))), ''), 'VACÍO') AS nombre,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(codigo_proyecto))), ''), 'VACÍO') AS codigo_proyecto,
        cupos,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(observacion))), ''), 'VACÍO') AS observacion,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(estado))), ''), 'VACÍO') AS estado,
        fechacreacion,
        fechamodificacion,
        idsituacion,
        areaterreno,
        softdelete,
        idubicacion
    FROM {{ ref('raw_Proyecto') }}
    WHERE softdelete = 0 OR softdelete IS NULL
)

SELECT *
FROM base
