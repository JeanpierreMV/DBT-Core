{{ config(
    materialized='table'
) }}

WITH base AS (
    SELECT
        IdCliente,
        IdConsultor,
        IdEmpresa,
        UPPER(LTRIM(RTRIM(NumeroDocumento))) AS NumeroDocumento,
        UPPER(LTRIM(RTRIM(Nombres))) AS Nombres,
        UPPER(LTRIM(RTRIM(PrimerApellido))) AS PrimerApellido,
        UPPER(LTRIM(RTRIM(SegundoApellido))) AS SegundoApellido,
        UPPER(LTRIM(RTRIM(Direccion))) AS Direccion,
        IdEstadoCivil,
        Celular,
        LOWER(Email) AS Email,
        IdNacionalidad,
        Estado,
        FechaCreacion,
        FechaModificacion,
        UsuarioCreador,
        UsuarioModificador,
        SoftDelete,
        IdPrioridad,
        Fuente,
        IdFranquicia,
        FechaCliente,
        IdTipoDocumento,
        IdUbicacion
    FROM {{ ref('raw_Cliente') }}
   
)

SELECT
    IdCliente,
    IdConsultor,
    IdEmpresa,
    NumeroDocumento,
    Nombres,
    PrimerApellido,
    SegundoApellido,
    CONCAT_WS(' ', Nombres, PrimerApellido, SegundoApellido) AS NombreCompleto,
    Direccion,
    IdEstadoCivil,
    Celular,
    Email,
    IdNacionalidad,
    FechaCreacion,
    FechaModificacion,
    UsuarioCreador,
    UsuarioModificador,
    IdPrioridad,
    Fuente,
    IdFranquicia,
    FechaCliente,
    IdTipoDocumento,
    IdUbicacion
FROM base