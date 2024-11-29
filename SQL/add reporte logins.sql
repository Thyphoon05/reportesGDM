--insert into Labels values ('500008','Reporte de Accesos HRC','es-MX','Reporte de Accesos HRC')
update Configuracion set valorConfiguracion = valorConfiguracion + ',500008'where valorConfiguracion like '%500007%' and valorConfiguracion not like '%500008%'
