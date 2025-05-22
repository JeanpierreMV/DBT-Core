{{ config(
    materialized='table'
) }}

SELECT
    NEWID() AS UidUsuario,
    IdEmpresa,
    IdCeo,
    Nombres,
    PrimerApellido,
    SegundoApellido,
    NombreCompleto,
    Email,
    Celular,
    Username,
    CambioClavePedido,
    IdFranquicia,
    Documento,
    Foto,
    IdUbicacion,
    IdTipoDocumento,
    FechaCreacion,
    FechaModificacion,
    UsuarioCreador,
    UsuarioModificador,
    idUsuario as originalUs,
    CURRENT_TIMESTAMP AS FechaCarga
FROM {{ ref('stg_Usuario') }}
