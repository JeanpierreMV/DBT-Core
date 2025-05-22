{{ config(materialized='view', schema='e_raw') }}

SELECT * FROM CoreTransaccional_RAW.dbo.Proyecto;