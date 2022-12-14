create database presupuesto
go

use presupuesto
go

-- crea la tabla tipo_transaccion
create table tipo_transaccion
(
	id int identity(1,1),
	Descripcion varchar(50) not null,
	tipoContable varchar(10) not null,
	constraint Ck_tipocontable check (tipoContable = 'Activo' or tipoContable = 'Pasivo'), --control valida campo
	constraint pk_idtipotransaccion primary key (id)
)
select * from tipo_transaccion
--******Procedimientos almacenados******
create proc agregarTipoTrans
	@Descripcion varchar(50),
	@tipoContable varchar(10)
	as
	begin
	insert into tipo_transaccion values (@Descripcion,@tipoContable)
	end

create proc borrarTipoTrans
    @id int
	as
	begin
	delete tipo_transaccion where id =@id 
	end

create proc actualizarTipoTrans
	@id int,
	@Descripcion varchar(50),
	@tipoContable varchar(10)
	as
	begin
	update tipo_transaccion set Descripcion = @Descripcion, tipoContable = @tipoContable where id =@id 
	end

-- crea la tabla transacion
create table transaccion 
(
	id int identity(1,1),
	idTipoTransaccion int,
	email varchar(20),
	Descripcion varchar(50) not null,
	monto money not null default 0,
	Fecha Datetime,
	constraint pk_idtransaccion primary key (id),
	constraint fk_idtipotransaccion foreign key (idTipoTransaccion) references tipo_transaccion(id),
	constraint fk_emailtransaccion foreign key (email) references usuario(email)
)



--******Procedimientos almacenados******
create proc agregarTransUsuario
	@idTipoTransaccion int,
	@email varchar(20),
	@Descripcion varchar(50),
	@monto money,
	@Fecha Datetime
	as
	begin
	insert into transaccion values (@idTipoTransaccion,@email,@Descripcion,@monto,@Fecha)
	end

create proc actualizarTransUsuario
	@id int,
	@idTipoTransaccion int,
	@email varchar(20),
	@Descripcion varchar(50),
	@monto money,
	@Fecha Datetime
	as
	begin
	update transaccion set idTipoTransaccion=@idTipoTransaccion,email=@email,Descripcion=@Descripcion,monto=@monto,Fecha=@Fecha where id = @id
	end

create proc borrarTransUsuario
	@id int,
	@email varchar(20)
	as
	begin
	delete transaccion where email = @email and id = @id
	end
drop proc transaccionConFiltro
create proc transaccionConFiltro
	@idTipoTransaccion int,
	@email varchar(20) 
	as
	begin
	select * 
	from transaccion t 
	inner join tipo_transaccion tt
	on t.idTipoTransaccion = tt.id
	where idTipoTransaccion = @idTipoTransaccion and email = @email
	end

exec transaccionConFiltro 1,'jusolis@hotmail.com'

create proc transaccionSumaMonto
	@idTipoTransaccion int,
	@email varchar(20)
	as
	begin
	select sum(monto) as Monto
	from transaccion where idTipoTransaccion = @idTipoTransaccion and email = @email
	end

-- crea la tabla tipoUsuario
create table tipoUsuario
(
	id int identity(1,1),
	Descripcion varchar(50) not null,
	constraint pk_idtipousuario primary key (id)
)

--******Procedimientos almacenados******
create proc agregarTipoUsuario
	@Descripcion varchar(50)
	as
	begin
	insert into tipoUsuario values (@Descripcion)
	end

create proc borrarTipoUsuario
	@id int
	as
	begin
	delete tipoUsuario where id = @id
	end

create proc actualizarTipoUsuario
	@id int,
	@Descripcion varchar(50)
	as
	begin
	update tipoUsuario set Descripcion = @Descripcion where id = @id
	end

create proc obtUsuario
	@id int
	as
	begin
	select * from tipoUsuario where id=@id
	end
drop proc obtUsuario
exec obtUsuario 2

-- crea la tabla usuario
--*********************************
create table usuario
(
	email varchar(20),
	clave varchar(30) not null,
	idusuario int identity (1,1),
	tipo_usuario int,
	constraint pk_email primary key (email), --llave primaria
	constraint fk_idusuario foreign key (idusuario) references persona(id), --llave foranea
	constraint fk_idtipousuario foreign key (tipo_usuario) references tipoUsuario(id)
)
alter table usuario
add idusuario int identity (1,1)

select * from usuario

--******Procedimientos almacenados******
create proc agregarUsuario
	@email varchar(20),
	@clave varchar(30),
	@tipo_usuario int
	as
	begin
	insert into usuario values(@email,@clave,@tipo_usuario)
	end

create proc borrarUsuario
	@email varchar(50)
	as
	begin
	delete usuario where email = @email
	end

create proc actualizarUsuario
	@email varchar(50),
	@clave varchar(30),
	@tipo_usuario varchar(50)
	as
	begin
	update usuario set clave=@clave, tipo_usuario=@tipo_usuario where email = @email
	end

create proc actualizarClave
	@email varchar(50),
	@clave varchar(30)
	as
	begin
	update usuario set clave = @clave where email = @email
	end

create proc borrarUsuario
	@email varchar(50)
	as
	begin
	delete usuario where email = @email
	end
exec borrarUsuario 2
select * from usuario

create proc obtTipoUsuario
	@email varchar(50)
	as
	begin
	select tipo_usuario from usuario where email = @email
	end

drop proc validarUsuario
exec validarUsuario 'jusolis@hotmail.com',123

-- crea la tabla persona
create table persona
(
	id int identity(1,1),
	Cedula varchar(20),
	Nombre varchar(50) not null,
	Apellido1 varchar(50) not null,
	Apellido2 varchar(50) null,
	emailPersona varchar(20) not null,
	Direccion varchar(100) null,
	Telefono varchar(20),
	constraint pk_idpersona primary key (id),
	constraint fk_personaemail foreign key (emailPersona) references usuario(email), --llave foranea
	constraint uq_cedula unique (cedula)
)
alter table persona
drop constraint fk_personaemail

--******Procedimientos almacenados******
create proc selectPersona
	@Cedula varchar(20)
	as
	begin
	select * from persona where cedula = @Cedula
	end

select * from usuario
select * from persona
delete persona where direccion = 'anduran64@gmail.com'

create proc registrarPersonaUsuario
	@Cedula varchar(20),
	@Nombre varchar(50),
	@Apellido1 varchar(50),
	@Apellido2 varchar(50),
	@Direccion varchar(100),
	@Telefono varchar(20),
	@emailPersona varchar(20),
	--datos de usuario
	@email varchar(20),
	@clave varchar(30),
	@tipo_usuario int
	as
	begin
	insert into persona values(@Cedula,@Nombre,@Apellido1,@Apellido2,@emailPersona,@Direccion,@Telefono);
	insert into usuario values(@email,@clave,@tipo_usuario)
	end

	drop proc registrarPersonaUsuario
exec registrarPersonaUsuario '1-1000-1000','Roy','Duran','Alpizar','San Jose','8954-5602','rduran64@gmail.com','rduran64@gmail.com',2,'123'
exec registrarPersonaUsuario '2-2000-2000','Jason','Duran','Alpizar','San Jose','8510-4649','jduran64@gmail.com','jduran25@gmail.com',2,'123'
exec registrarPersonaUsuario '3-3000-3000','Anthony','Duran','Alpizar','San Jose','8809-6244','anduran64@gmail.com','anduran63@gmail.com','123',2

delete usuario where idUsuario = 5
select * from usuario

create proc agregarPersona
	@Cedula varchar(20),
	@Nombre varchar(50),
	@Apellido1 varchar(50),
	@Apellido2 varchar(50),
	@Direccion varchar(100),
	@Telefono varchar(20),
	@emailPersona varchar(20)
	as
	begin
	insert into persona values(@Cedula,@Nombre,@Apellido1,@Apellido2,@Direccion,@Telefono,@emailPersona)
	end


create proc borrarPersona
	@emailPersona varchar(20)
	as
	begin
	delete persona where emailPersona = @emailPersona
	end



create proc actualizarPersona
	@Cedula varchar(20),
	@Nombre varchar(50),
	@Apellido1 varchar(50),
	@Apellido2 varchar(50),
	@Direccion varchar(100),
	@Telefono varchar(20),
	@emailPersona varchar(20)
	as
	begin
	update persona set Nombre=@Nombre, Apellido1=@Apellido1, Apellido2=@Apellido2, Direccion=@Direccion, Telefono=@Telefono where cedula=@Cedula
	end

select * from persona
--Triggers
-- se crea la tabla para trigger auditoria
create table TipoUsuario_Auditoria
(
	id int identity(1,1),
	Descripcion varchar(50),
	Usuario varchar(50),
	Tipo varchar(20),
	Fecha Datetime
)
select * from TipoUsuario_Auditoria

-- se crea la sentencia del trigger
create trigger Trigger_Auditoria_TipoUsuario
	on tipoUsuario
		after Insert, Delete

		as
		begin
		insert into TipoUsuario_Auditoria (id, Descripcion,Usuario,Tipo,Fecha)
		select i.id, i.Descripcion, 'DBA', 'Ingreso',GETDATE() from inserted i
		union all
		select d.id, d.Descripcion, 'DBA', 'Salida',GETDATE() from inserted d

		end


select * from tipousuario






