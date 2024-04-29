-- Génère une ordre CREATE pour SQL Server à partir des tables systèmes
SELECT CREATE_ORDER
FROM (
        SELECT 0 AS ORDRE ,'CREATE TABLE DHB_ACQ.IKO_' || UPPER('MATABLE') ||'(' AS CREATE_ORDER
        FROM SYSIBM.SYSDUMMY1
    UNION ALL
        SELECT ORDINAL_POSITION AS ORDRE, '    ' || UPPER(COLUMN_NAME) || '    ' 
                || CASE WHEN (DATA_TYPE IN ('CHAR') ) THEN 'VARCHAR('
                        WHEN (DATA_TYPE = 'DECIMAL' ) THEN 'NUMERIC('
                        ELSE DATA_TYPE || '('
                END
                || TRIM(CAST(LENGTH AS CHAR(8)))
                || CASE WHEN (DATA_TYPE IN ('NUMERIC','DECIMAL'))
                        THEN ',' || NUMERIC_SCALE || ')'
                        ELSE ')'
                END
                || CASE WHEN (ORDINAL_POSITION=(SELECT MAX(ORDINAL_POSITION)
                                                FROM QSYS2.SYSCOLUMNS
                                                WHERE TABLE_NAME='MATABLE' AND TABLE_SCHEMA='MONSCHEMA' ) )
                        THEN ' '
                        ELSE ','
                END
                || '        -- ' || COLUMN_TEXT
        FROM QSYS2.SYSCOLUMNS
        WHERE TABLE_NAME='MATABLE' AND TABLE_SCHEMA='MONSCHEMA'
    UNION ALL
        SELECT 999 AS ORDRE,');'
        FROM SYSIBM.SYSDUMMY1
) AS T
ORDER BY ORDRE