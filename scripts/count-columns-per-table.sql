SELECT
	SYSTEM_TABLE_SCHEMA,
     SYSTEM_TABLE_NAME,
     COUNT(*) AS COLUMNS_COUNT
FROM 
	QSYS2.SYSCOLUMNS
WHERE 
	(1=1) 
	AND UPPER(SYSTEM_TABLE_SCHEMA) = 'IKGFFIC'
	AND UPPER(SYSTEM_TABLE_NAME) in ('KINTIOP',
'KINTEOP',
'KPGROPP',
'KPROGRP',
'KTYOPEP',
'KPLNPVP',
'KPARCEP',
'KLPJOPP',
'KBUOPEP',
'KRCBIIP',
'KFILOTP',
'KHISBDP',
'KHISVDP',
'KVTBUTP',
'KTYTRCP',
'KHISBOP',
'KHISTYP',
'KFINPRP',
'KTYFINP',
'KHISBFP',
'KVTFITP',
'KHISVFP',
'KPGOPTP',
'KEFICTP',
'KEDFNDP',
'KRFONDP',
'KDFONDP',
'KDCFINP',
'KEVFINP',
'KEFIPVP',
'KDMFINP',
'KFINCTP',
'KDMGARP',
'KTYGARP',
'KGARFPP',
'KGARFCP',
'KDFFPVP',
'KBUDPOP',
'KFACTUP',
'KCOMDEP',
'KLGFACP',
'KLGCDEP',
'KMASLSP',
'KEVCSTP',
'KSEVPOP',
'KTYEVTP',
'KDSFINP',
'KSCHEMP')
GROUP BY
	SYSTEM_TABLE_SCHEMA,
     SYSTEM_TABLE_NAME
ORDER BY  
	1 ASC, 
	2 ASC;