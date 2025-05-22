{{ config(materialized='table') }}

SELECT
    NEWID() AS UidProyecto,    
    IdEmpresa,
    COALESCE(NULLIF(nombre, ''), 'VACÍO') AS Nombre,
    COALESCE(NULLIF(codigo_proyecto, ''), 'VACÍO') AS CodigoProyecto,
    cupos,
    COALESCE(NULLIF(observacion, ''), 'VACÍO') AS Observacion,
    COALESCE(NULLIF(estado, ''), 'VACÍO') AS Estado,
    fechacreacion,
    fechamodificacion,
    idsituacion,
    areaterreno,
    idubicacion,
    softdelete,  
    IdProyecto AS origenPr,
    CURRENT_TIMESTAMP AS FechaCarga
FROM {{ ref('stg_Proyecto') }}
WHERE softdelete = 0 OR softdelete IS NULL
