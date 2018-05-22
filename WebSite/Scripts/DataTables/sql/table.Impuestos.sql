-- 
-- Editor SQL for DB table Impuestos
-- Created by http://editor.datatables.net/generator
-- 

IF object_id('Impuestos', 'U') is null
	CREATE TABLE Impuestos (
		[id_P] int not null identity,
		[concepto] nvarchar(255),
		[costo] numeric(9,2),
		PRIMARY KEY( [id_P] )
	);