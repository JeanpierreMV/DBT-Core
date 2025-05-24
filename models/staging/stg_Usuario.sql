{{ config(materialized='table') }}

WITH base AS (
    SELECT TOP 300
        IdUsuario,
        IdEmpresa,
        IdCeo,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(Nombres))), ''), 'VACÍO') AS Nombres,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(PrimerApellido))), ''), 'VACÍO') AS PrimerApellido,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(SegundoApellido))), ''), 'VACÍO') AS SegundoApellido,
        COALESCE(NULLIF(LOWER(LTRIM(RTRIM(Email))), ''), 'VACÍO') AS Email,
        COALESCE(NULLIF(LTRIM(RTRIM(Celular)), ''), 'VACÍO') AS Celular,
        COALESCE(NULLIF(LOWER(LTRIM(RTRIM(Username))), ''), 'VACÍO') AS Username,
        Estado,
        FechaCreacion,
        FechaModificacion,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(UsuarioCreador))), ''), 'VACÍO') AS UsuarioCreador,
        COALESCE(NULLIF(UPPER(LTRIM(RTRIM(UsuarioModificador))), ''), 'VACÍO') AS UsuarioModificador,
        CambioClavePedido,
        IdFranquicia,
        COALESCE(NULLIF(LTRIM(RTRIM(Documento)), ''), 'VACÍO') AS Documento,
        COALESCE(NULLIF(LTRIM(RTRIM(Foto)), ''), 'VACÍO') AS Foto,
        SoftDelete,
        IdUbicacion,
        IdTipoDocumento
    FROM {{ ref('raw_Usuario') }}
    WHERE (SoftDelete = 0 OR SoftDelete IS NULL)
      AND (Estado = 1)
)

SELECT
    *,
    CONCAT_WS(' ', Nombres, PrimerApellido, SegundoApellido) AS NombreCompleto
FROM base
