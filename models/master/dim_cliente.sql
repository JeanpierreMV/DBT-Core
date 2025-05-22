{{ config(
    materialized='table'
) }}

SELECT
   
    NEWID() AS UidCliente,
    


    c.IdEmpresa,
    c.IdConsultor,
    c.IdEstadoCivil,
    c.IdNacionalidad,
    c.IdTipoDocumento,
    c.IdUbicacion,
    c.IdPrioridad,
    c.IdFranquicia,

 
    c.NumeroDocumento,
    c.NombreCompleto,
    c.Nombres,
    c.PrimerApellido,
    c.SegundoApellido,
    c.Direccion,
    c.Celular,
    c.Email,
    c.Fuente,

  
    c.FechaCliente,
    c.FechaCreacion,
    c.FechaModificacion,
    c.UsuarioCreador,
    c.UsuarioModificador,
    c.IdCliente as originalCl,
    CURRENT_TIMESTAMP AS FechaCarga

FROM {{ ref('stg_Cliente') }} c
