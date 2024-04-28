DROP schema	if exists public cascade;
CREATE schema public;

CREATE TABLE hotel(
	idHotel INT,
	NombreEstablecimiento VARCHAR(50),
	NumHab INT,
	HoraCheckIn TIME,
	HoraCheckOut TIME,
	NumeroInterior INT,
	NumeroExterior INT,
	Calle VARCHAR(100),
	Municipio VARCHAR(100),
	Estado VARCHAR(100)
);

ALTER TABLE hotel ADD CONSTRAINT idHotel_positivo CHECK(idHotel > 0);
ALTER TABLE hotel ALTER COLUMN NombreEstablecimiento SET NOT NULL;
ALTER TABLE hotel ALTER COLUMN NumHab SET NOT NULL;
ALTER TABLE hotel ADD CONSTRAINT NumHab_positivo CHECK(NumHab > 0);
ALTER TABLE hotel ALTER COLUMN HoraCheckIn SET NOT NULL;
ALTER TABLE hotel ALTER COLUMN HoraCheckOut SET NOT NULL;
ALTER TABLE hotel ADD CONSTRAINT NumeroInterior_positivo CHECK(NumeroInterior > 0);
ALTER TABLE hotel ADD CONSTRAINT NumeroExterior_positivo CHECK(NumeroExterior > 0);
ALTER TABLE hotel ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE hotel ALTER COLUMN Municipio SET NOT NULL;
ALTER TABLE hotel ALTER COLUMN Estado SET NOT NULL;

ALTER TABLE hotel ADD PRIMARY KEY (idHotel);

COMMENT ON TABLE hotel IS 'Esta tabla almacena información sobre los hoteles';

COMMENT ON COLUMN hotel.idHotel IS 'Identificador único para cada hotel';
COMMENT ON COLUMN hotel.NombreEstablecimiento IS 'Nombre del establecimiento';
COMMENT ON COLUMN hotel.NumHab IS 'Número de habitaciones disponibles en el hotel';
COMMENT ON COLUMN hotel.HoraCheckIn IS 'Hora de check-in en el hotel';
COMMENT ON COLUMN hotel.HoraCheckOut IS 'Hora de check-out del hotel';
COMMENT ON COLUMN hotel.NumeroInterior IS 'Número interior del hotel';
COMMENT ON COLUMN hotel.NumeroExterior IS 'Número exterior del hotel';
COMMENT ON COLUMN hotel.Calle IS 'Calle donde se ubica el hotel';
COMMENT ON COLUMN hotel.Municipio IS 'Municipio donde se ubica el hotel';
COMMENT ON COLUMN hotel.Estado IS 'Estado donde se ubica el hotel';

COMMENT ON CONSTRAINT idHotel_positivo ON hotel IS 'Asegura que el identificador del hotel sea un número positivo';
COMMENT ON CONSTRAINT NumHab_positivo ON hotel IS 'Asegura que el número de habitaciones del hotel sea un número positivo';
COMMENT ON CONSTRAINT NumeroInterior_positivo ON hotel IS 'Asegura que el número interior del hotel sea un número positivo';
COMMENT ON CONSTRAINT NumeroExterior_positivo ON hotel IS 'Asegura que el número exterior del hotel sea un número positivo';


CREATE TABLE huesped(
	idHuesped INT,
	NombreHuesped VARCHAR(200),
	APaterno_Huesped VARCHAR(200),
	AMaterno_Huesped VARCHAR(200),
	Nacionalidad_Huesped VARCHAR(30),
	Genero_Huesped VARCHAR(2),
	Nacimiento_Huesped date,
	VecesHospedado INT,
	esSocio bool,
	NumMembresia char(16)
);

ALTER TABLE huesped ADD CONSTRAINT idHuesped_positivo CHECK(idHuesped > 0);
ALTER TABLE huesped ALTER COLUMN NombreHuesped SET NOT NULL;
ALTER TABLE huesped ALTER COLUMN APaterno_Huesped SET NOT NULL;
ALTER TABLE huesped ALTER COLUMN Nacionalidad_Huesped SET NOT NULL;
ALTER TABLE huesped ALTER COLUMN Genero_Huesped SET NOT NULL;
ALTER TABLE huesped ADD CONSTRAINT GenHuesped CHECK(Genero_Huesped in ('M', 'F', 'NB'));
ALTER TABLE huesped ALTER COLUMN Nacimiento_Huesped SET NOT NULL;
ALTER TABLE huesped ADD CONSTRAINT VecesHospedado_positivo CHECK(VecesHospedado >= 0);

ALTER TABLE huesped ADD PRIMARY KEY (idHuesped);

COMMENT ON TABLE huesped IS 'Esta tabla almacena información sobre los huéspedes';

COMMENT ON COLUMN huesped.idHuesped IS 'Identificador único para cada huésped';
COMMENT ON COLUMN huesped.NombreHuesped IS 'Nombre del huésped';
COMMENT ON COLUMN huesped.APaterno_Huesped IS 'Apellido paterno del huésped';
COMMENT ON COLUMN huesped.AMaterno_Huesped IS 'Apellido materno del huésped';
COMMENT ON COLUMN huesped.Nacionalidad_Huesped IS 'Nacionalidad del huésped';
COMMENT ON COLUMN huesped.Genero_Huesped IS 'Género del huésped';
COMMENT ON COLUMN huesped.Nacimiento_Huesped IS 'Fecha de nacimiento del huésped';
COMMENT ON COLUMN huesped.VecesHospedado IS 'Número de veces que el huésped se ha hospedado';
COMMENT ON COLUMN huesped.esSocio IS 'Indica si el huésped es socio o no';
COMMENT ON COLUMN huesped.NumMembresia IS 'Número de membresía del huésped, si es socio';

COMMENT ON CONSTRAINT idHuesped_positivo ON huesped IS 'Asegura que el identificador del huésped sea un número positivo';
COMMENT ON CONSTRAINT GenHuesped ON huesped IS 'Asegura que el género del huésped sea M (Masculino), F (Femenino) o NB (No Binario)';
COMMENT ON CONSTRAINT VecesHospedado_positivo ON huesped IS 'Asegura que el número de veces que el huésped se ha hospedado sea un número no negativo';



CREATE TABLE PersonalApoyo(
	RFC char(13),
	Nombre VARCHAR(200),
	APaterno VARCHAR(200),
	AMaterno VARCHAR(200),
	NumInt INT,
	NumExt INT,
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	FechaNacimiento date,
	Genero VARCHAR(2),
	FechaInicioContratacion date,
	HorarioEntrada TIME,
	HorarioSalida TIME,
	NumHabitaciones INT
);

ALTER TABLE PersonalApoyo ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN APaterno SET NOT NULL;
ALTER TABLE PersonalApoyo ADD CONSTRAINT NumInt_positivo CHECK(NumInt > 0);
ALTER TABLE PersonalApoyo ADD CONSTRAINT NumExt_positivo CHECK(NumExt > 0);
ALTER TABLE PersonalApoyo ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN FechaNacimiento SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE PersonalApoyo ADD CONSTRAINT GenEmpleado CHECK(Genero in ('M', 'F', 'NB'));
ALTER TABLE PersonalApoyo ALTER COLUMN FechaInicioContratacion SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN HorarioEntrada SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN HorarioSalida SET NOT NULL;
ALTER TABLE PersonalApoyo ALTER COLUMN NumHabitaciones SET NOT NULL;

ALTER TABLE PersonalApoyo ADD CONSTRAINT NumHab_positivo CHECK(NumHabitaciones >= 0);

ALTER TABLE PersonalApoyo ADD PRIMARY KEY (RFC);

COMMENT ON TABLE PersonalApoyo IS 'Esta tabla almacena información sobre el personal de apoyo';

COMMENT ON COLUMN PersonalApoyo.RFC IS 'RFC del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.Nombre IS 'Nombre del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.APaterno IS 'Apellido paterno del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.AMaterno IS 'Apellido materno del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.NumInt IS 'Número interior de la dirección del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.NumExt IS 'Número exterior de la dirección del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.Calle IS 'Calle de la dirección del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.Colonia IS 'Colonia de la dirección del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.FechaNacimiento IS 'Fecha de nacimiento del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.Genero IS 'Género del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.FechaInicioContratacion IS 'Fecha de inicio de contratación del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.HorarioEntrada IS 'Hora de entrada del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.HorarioSalida IS 'Hora de salida del personal de apoyo';
COMMENT ON COLUMN PersonalApoyo.NumHabitaciones IS 'Número de habitaciones asignadas al personal de apoyo';

COMMENT ON CONSTRAINT NumHab_positivo ON PersonalApoyo IS 'Asegura que el número de habitaciones del personal de apoyo sea un número positivo';
COMMENT ON CONSTRAINT GenEmpleado ON PersonalApoyo IS 'Asegura que el género del personal de apoyo sea M (Masculino), F (Femenino) o NB (No Binario)';
COMMENT ON CONSTRAINT NumInt_positivo ON PersonalApoyo IS 'Asegura que el número interior de la dirección del personal de apoyo sea un número positivo';


CREATE TABLE recepcionista(
	RFC char(13),
	Nombre VARCHAR(200),
	APaterno VARCHAR(200),
	AMaterno VARCHAR(200),
	NumInt INT,
	NumExt INT,
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	FechaNacimiento date,
	Genero VARCHAR(2),
	FechaInicioContratacion date,
	HorarioEntrada TIME,
	HorarioSalida TIME
);

ALTER TABLE recepcionista ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN APaterno SET NOT NULL;
ALTER TABLE recepcionista ADD CONSTRAINT NumInt_positivo CHECK(NumInt > 0);
ALTER TABLE recepcionista ADD CONSTRAINT NumExt_positivo CHECK(NumExt > 0);
ALTER TABLE recepcionista ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN FechaNacimiento SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE recepcionista ADD CONSTRAINT GenEmpleado CHECK(Genero in ('M', 'F', 'NB'));
ALTER TABLE recepcionista ALTER COLUMN FechaInicioContratacion SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN HorarioEntrada SET NOT NULL;
ALTER TABLE recepcionista ALTER COLUMN HorarioSalida SET NOT NULL;

ALTER TABLE recepcionista ADD PRIMARY KEY (RFC);

COMMENT ON TABLE recepcionista IS 'Esta tabla almacena información sobre los recepcionistas';

COMMENT ON COLUMN recepcionista.RFC IS 'RFC del recepcionista';
COMMENT ON COLUMN recepcionista.Nombre IS 'Nombre del recepcionista';
COMMENT ON COLUMN recepcionista.APaterno IS 'Apellido paterno del recepcionista';
COMMENT ON COLUMN recepcionista.AMaterno IS 'Apellido materno del recepcionista';
COMMENT ON COLUMN recepcionista.NumInt IS 'Número interior de la dirección del recepcionista';
COMMENT ON COLUMN recepcionista.NumExt IS 'Número exterior de la dirección del recepcionista';
COMMENT ON COLUMN recepcionista.Calle IS 'Calle de la dirección del recepcionista';
COMMENT ON COLUMN recepcionista.Colonia IS 'Colonia de la dirección del recepcionista';
COMMENT ON COLUMN recepcionista.FechaNacimiento IS 'Fecha de nacimiento del recepcionista';
COMMENT ON COLUMN recepcionista.Genero IS 'Género del recepcionista';
COMMENT ON COLUMN recepcionista.FechaInicioContratacion IS 'Fecha de inicio de contratación del recepcionista';
COMMENT ON COLUMN recepcionista.HorarioEntrada IS 'Hora de entrada del recepcionista';
COMMENT ON COLUMN recepcionista.HorarioSalida IS 'Hora de salida del recepcionista';

COMMENT ON CONSTRAINT GenEmpleado ON recepcionista IS 'Asegura que el género del recepcionista sea M (Masculino), F (Femenino) o NB (No Binario)';
COMMENT ON CONSTRAINT NumInt_positivo ON recepcionista IS 'Asegura que el número interior de la dirección del recepcionista sea un número positivo';
COMMENT ON CONSTRAINT NumExt_positivo ON recepcionista IS 'Asegura que el número exterior de la dirección del recepcionista sea un número positivo';

CREATE TABLE limpiezaInterna(
	RFC char(13),
	Nombre VARCHAR(200),
	APaterno VARCHAR(200),
	AMaterno VARCHAR(200),
	NumInt INT,
	NumExt INT,
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	FechaNacimiento date,
	Genero VARCHAR(2),
	FechaInicioContratacion date,
	HorarioEntrada TIME,
	HorarioSalida TIME
);

ALTER TABLE limpiezaInterna ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN APaterno SET NOT NULL;
ALTER TABLE limpiezaInterna ADD CONSTRAINT NumInt_positivo CHECK(NumInt > 0);
ALTER TABLE limpiezaInterna ADD CONSTRAINT NumExt_positivo CHECK(NumExt > 0);
ALTER TABLE limpiezaInterna ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN FechaNacimiento SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE limpiezaInterna ADD CONSTRAINT GenEmpleado CHECK(Genero in ('M', 'F', 'NB'));
ALTER TABLE limpiezaInterna ALTER COLUMN FechaInicioContratacion SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN HorarioEntrada SET NOT NULL;
ALTER TABLE limpiezaInterna ALTER COLUMN HorarioSalida SET NOT NULL;

ALTER TABLE limpiezaInterna ADD PRIMARY KEY (RFC);

COMMENT ON TABLE limpiezaInterna IS 'Esta tabla almacena información sobre el personal de limpieza interna';

COMMENT ON COLUMN limpiezaInterna.RFC IS 'RFC del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.Nombre IS 'Nombre del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.APaterno IS 'Apellido paterno del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.AMaterno IS 'Apellido materno del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.NumInt IS 'Número interior de la dirección del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.NumExt IS 'Número exterior de la dirección del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.Calle IS 'Calle de la dirección del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.Colonia IS 'Colonia de la dirección del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.FechaNacimiento IS 'Fecha de nacimiento del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.Genero IS 'Género del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.FechaInicioContratacion IS 'Fecha de inicio de contratación del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.HorarioEntrada IS 'Hora de entrada del personal de limpieza interna';
COMMENT ON COLUMN limpiezaInterna.HorarioSalida IS 'Hora de salida del personal de limpieza interna';

COMMENT ON CONSTRAINT GenEmpleado ON limpiezaInterna IS 'Asegura que el género del personal de limpieza interna sea M (Masculino), F (Femenino) o NB (No Binario)';
COMMENT ON CONSTRAINT NumInt_positivo ON limpiezaInterna IS 'Asegura que el número interior de la dirección del personal de limpieza interna sea un número positivo';
COMMENT ON CONSTRAINT NumExt_positivo ON limpiezaInterna IS 'Asegura que el número exterior de la dirección del personal de limpieza interna sea un número positivo';


CREATE TABLE servicioComida(
	RFC char(13),
	Nombre VARCHAR(200),
	APaterno VARCHAR(200),
	AMaterno VARCHAR(200),
	NumInt INT,
	NumExt INT,
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	FechaNacimiento date,
	Genero VARCHAR(2),
	FechaInicioContratacion date,
	HorarioEntrada TIME,
	HorarioSalida TIME
);

ALTER TABLE servicioComida ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN APaterno SET NOT NULL;
ALTER TABLE servicioComida ADD CONSTRAINT NumInt_positivo CHECK(NumInt > 0);
ALTER TABLE servicioComida ADD CONSTRAINT NumExt_positivo CHECK(NumExt > 0);
ALTER TABLE servicioComida ALTER COLUMN Calle SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN Colonia SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN FechaNacimiento SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE servicioComida ADD CONSTRAINT GenEmpleado CHECK(Genero in ('M', 'F', 'NB'));
ALTER TABLE servicioComida ALTER COLUMN FechaInicioContratacion SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN HorarioEntrada SET NOT NULL;
ALTER TABLE servicioComida ALTER COLUMN HorarioSalida SET NOT NULL;

ALTER TABLE servicioComida ADD PRIMARY KEY (RFC);

COMMENT ON TABLE servicioComida IS 'Esta tabla almacena información sobre el personal de servicio de comida';

COMMENT ON COLUMN servicioComida.RFC IS 'RFC del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.Nombre IS 'Nombre del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.APaterno IS 'Apellido paterno del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.AMaterno IS 'Apellido materno del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.NumInt IS 'Número interior de la dirección del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.NumExt IS 'Número exterior de la dirección del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.Calle IS 'Calle de la dirección del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.Colonia IS 'Colonia de la dirección del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.FechaNacimiento IS 'Fecha de nacimiento del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.Genero IS 'Género del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.FechaInicioContratacion IS 'Fecha de inicio de contratación del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.HorarioEntrada IS 'Hora de entrada del personal de servicio de comida';
COMMENT ON COLUMN servicioComida.HorarioSalida IS 'Hora de salida del personal de servicio de comida';

COMMENT ON CONSTRAINT GenEmpleado ON servicioComida IS 'Asegura que el género del personal de servicio de comida sea M (Masculino), F (Femenino) o NB (No Binario)';
COMMENT ON CONSTRAINT NumInt_positivo ON servicioComida IS 'Asegura que el número interior de la dirección del personal de servicio de comida sea un número positivo';
COMMENT ON CONSTRAINT NumExt_positivo ON servicioComida IS 'Asegura que el número exterior de la dirección del personal de servicio de comida sea un número positivo';


CREATE TABLE servicio(
	NombreServicio VARCHAR(50),
	costo numeric(7,2)
);

ALTER TABLE servicio ALTER COLUMN costo SET NOT NULL;

ALTER TABLE servicio ADD PRIMARY KEY (NombreServicio);

COMMENT ON TABLE servicio IS 'Esta tabla almacena información sobre los servicios que se ofrecen en los hoteles';

COMMENT ON COLUMN servicio.NombreServicio IS 'Nombre del servicio';
COMMENT ON COLUMN servicio.costo IS 'Costo del servicio';


CREATE TABLE habitacionPenthouse(
	NumeroHabitacion INT,
	idHotel INT,
	idHuesped INT,
	RFC CHAR(13),
	NumCamas INT,
	Costo numeric(7,2),
	Disponible bool
);

ALTER TABLE habitacionPenthouse ADD CONSTRAINT NumeroPentHouse_unique UNIQUE(NumeroHabitacion);
ALTER TABLE habitacionPenthouse ADD CONSTRAINT NumCamas_positivo CHECK(NumCamas > 0);
ALTER TABLE habitacionPenthouse ADD CONSTRAINT Costo_positivo CHECK(Costo > 0);
ALTER TABLE habitacionPenthouse ALTER COLUMN Disponible SET NOT NULL;

ALTER TABLE habitacionPenthouse ADD CONSTRAINT fk_Penthouse_Hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionPenthouse ADD CONSTRAINT fk_Penthouse_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionPenthouse ADD CONSTRAINT fk_Penthouse_PersonalApoyo FOREIGN KEY (RFC) REFERENCES PersonalApoyo (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionPenthouse ADD PRIMARY KEY (NumeroHabitacion, idHotel);

COMMENT ON TABLE habitacionPenthouse IS 'Esta tabla almacena información sobre las habitaciones penthouse';

COMMENT ON COLUMN habitacionPenthouse.NumeroHabitacion IS 'Número de la habitación';
COMMENT ON COLUMN habitacionPenthouse.idHotel IS 'Identificador del hotel al que pertenece la habitación';
COMMENT ON COLUMN habitacionPenthouse.idHuesped IS 'Identificador del huésped que se encuentra en la habitación';
COMMENT ON COLUMN habitacionPenthouse.RFC IS 'RFC del personal de apoyo que se encarga de la habitación';
COMMENT ON COLUMN habitacionPenthouse.NumCamas IS 'Número de camas en la habitación';
COMMENT ON COLUMN habitacionPenthouse.Costo IS 'Costo de la habitación';
COMMENT ON COLUMN habitacionPenthouse.Disponible IS 'Indica si la habitación está disponible o no';

COMMENT ON CONSTRAINT NumeroPentHouse_unique ON habitacionPenthouse IS 'Asegura que el número de la habitación penthouse sea único';
COMMENT ON CONSTRAINT NumCamas_positivo ON habitacionPenthouse IS 'Asegura que el número de camas en la habitación sea un número positivo';
COMMENT ON CONSTRAINT Costo_positivo ON habitacionPenthouse IS 'Asegura que el costo de la habitación sea un número positivo';
COMMENT ON CONSTRAINT fk_Penthouse_Hotel ON habitacionPenthouse IS 'Llave foránea que referencia al hotel al que pertenece la habitación';
COMMENT ON CONSTRAINT fk_Penthouse_Huesped ON habitacionPenthouse IS 'Llave foránea que referencia al huésped que se encuentra en la habitación';
COMMENT ON CONSTRAINT fk_Penthouse_PersonalApoyo ON habitacionPenthouse IS 'Llave foránea que referencia al personal de apoyo que se encarga de la habitación';


CREATE TABLE habitacionSimple(
	NumeroHabitacion INT,
	idHotel INT,
	idHuesped INT,
	RFC CHAR(13),
	NumCamas INT,
	Costo numeric(7,2),
	Disponible bool,
	Tipo CHAR(1)
);

ALTER TABLE habitacionSimple ADD CONSTRAINT NumeroSimple_unique UNIQUE(NumeroHabitacion);
ALTER TABLE habitacionSimple ADD CONSTRAINT NumCamas_positivo CHECK(NumCamas > 0);
ALTER TABLE habitacionSimple ADD CONSTRAINT Costo_positivo CHECK(Costo > 0);
ALTER TABLE habitacionSimple ALTER COLUMN Disponible SET NOT NULL;
ALTER TABLE habitacionSimple ALTER COLUMN Tipo SET NOT NULL;
ALTER TABLE habitacionSimple ADD CONSTRAINT TipoHabitacion CHECK(Tipo in ('I', 'D', 'C'));

ALTER TABLE habitacionSimple ADD CONSTRAINT fk_Simple_Hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionSimple ADD CONSTRAINT fk_Simple_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionSimple ADD CONSTRAINT fk_Simple_PersonalApoyo FOREIGN KEY (RFC) REFERENCES PersonalApoyo (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE habitacionSimple ADD PRIMARY KEY (NumeroHabitacion, idHotel);

COMMENT ON TABLE habitacionSimple IS 'Esta tabla almacena información sobre las habitaciones simples';

COMMENT ON COLUMN habitacionSimple.NumeroHabitacion IS 'Número de la habitación';
COMMENT ON COLUMN habitacionSimple.idHotel IS 'Identificador del hotel al que pertenece la habitación';
COMMENT ON COLUMN habitacionSimple.idHuesped IS 'Identificador del huésped que se encuentra en la habitación';
COMMENT ON COLUMN habitacionSimple.RFC IS 'RFC del personal de apoyo que se encarga de la habitación';
COMMENT ON COLUMN habitacionSimple.NumCamas IS 'Número de camas en la habitación';
COMMENT ON COLUMN habitacionSimple.Costo IS 'Costo de la habitación';
COMMENT ON COLUMN habitacionSimple.Disponible IS 'Indica si la habitación está disponible o no';
COMMENT ON COLUMN habitacionSimple.Tipo IS 'Tipo de habitación (I: Individual, D: Doble, C: Cuádruple)';

COMMENT ON CONSTRAINT NumeroSimple_unique ON habitacionSimple IS 'Asegura que el número de la habitación simple sea único';
COMMENT ON CONSTRAINT NumCamas_positivo ON habitacionSimple IS 'Asegura que el número de camas en la habitación sea un número positivo';
COMMENT ON CONSTRAINT Costo_positivo ON habitacionSimple IS 'Asegura que el costo de la habitación sea un número positivo';
COMMENT ON CONSTRAINT TipoHabitacion ON habitacionSimple IS 'Asegura que el tipo de habitación sea I (Individual), D (Doble) o C (Cuádruple)';
COMMENT ON CONSTRAINT fk_Simple_Hotel ON habitacionSimple IS 'Llave foránea que referencia al hotel al que pertenece la habitación';
COMMENT ON CONSTRAINT fk_Simple_Huesped ON habitacionSimple IS 'Llave foránea que referencia al huésped que se encuentra en la habitación';
COMMENT ON CONSTRAINT fk_Simple_PersonalApoyo ON habitacionSimple IS 'Llave foránea que referencia al personal de apoyo que se encarga de la habitación';
COMMENT ON CONSTRAINT fk_Simple_Hotel ON habitacionSimple IS 'Llave foránea que referencia al hotel al que pertenece la habitación';
COMMENT ON CONSTRAINT fk_Simple_Huesped ON habitacionSimple IS 'Llave foránea que referencia al huésped que se encuentra en la habitación';
COMMENT ON CONSTRAINT fk_Simple_PersonalApoyo ON habitacionSimple IS 'Llave foránea que referencia al personal de apoyo que se encarga de la habitación';


CREATE TABLE salon(
	NombreSalon VARCHAR(30),
	idHotel INT,
	Ubicacion VARCHAR(20),
	Capacidad INT,
	HorarioAtencion INTERVAL[0]
);

ALTER TABLE salon ADD CONSTRAINT salon_unique UNIQUE(NombreSalon);
ALTER TABLE salon ALTER COLUMN Ubicacion SET NOT NULL;
ALTER TABLE salon ALTER COLUMN Capacidad SET NOT NULL;
ALTER TABLE salon ALTER COLUMN HorarioAtencion SET NOT NULL;

ALTER TABLE salon ADD CONSTRAINT fk_Salon_Hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE salon ADD PRIMARY KEY (NombreSalon, idHotel);

COMMENT ON TABLE salon IS 'Esta tabla almacena información sobre los salones de eventos';

COMMENT ON COLUMN salon.NombreSalon IS 'Nombre del salón';
COMMENT ON COLUMN salon.idHotel IS 'Identificador del hotel al que pertenece el salón';
COMMENT ON COLUMN salon.Ubicacion IS 'Ubicación del salón';
COMMENT ON COLUMN salon.Capacidad IS 'Capacidad del salón';
COMMENT ON COLUMN salon.HorarioAtencion IS 'Horario de atención del salón';

COMMENT ON CONSTRAINT salon_unique ON salon IS 'Asegura que el nombre del salón sea único';
COMMENT ON CONSTRAINT fk_Salon_Hotel ON salon IS 'Llave foránea que referencia al hotel al que pertenece el salón';


CREATE TABLE TelefonoHotel(
	telefono VARCHAR(10),
	idHotel INT
);

ALTER TABLE TelefonoHotel ADD CONSTRAINT telHotel_unique UNIQUE(telefono);

ALTER TABLE TelefonoHotel ADD CONSTRAINT fk_Telefono_Hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE TelefonoHotel ADD PRIMARY KEY (telefono, idHotel);

COMMENT ON TABLE TelefonoHotel IS 'Esta tabla almacena los teléfonos de los hoteles';

COMMENT ON COLUMN TelefonoHotel.telefono IS 'Número de teléfono del hotel';
COMMENT ON COLUMN TelefonoHotel.idHotel IS 'Identificador del hotel al que pertenece el teléfono';

COMMENT ON CONSTRAINT telHotel_unique ON TelefonoHotel IS 'Asegura que el número de teléfono del hotel sea único';
COMMENT ON CONSTRAINT fk_Telefono_Hotel ON TelefonoHotel IS 'Llave foránea que referencia al hotel al que pertenece el teléfono';


CREATE TABLE responsable(
	NombreSalon VARCHAR(30),
	RFC CHAR(13)
);

ALTER TABLE responsable ADD CONSTRAINT SalonResponsables_unique UNIQUE(NombreSalon);

ALTER TABLE responsable ADD CONSTRAINT fk_Responsable_Salon FOREIGN KEY (NombreSalon) REFERENCES salon (NombreSalon) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE responsable ADD CONSTRAINT fk_Responsable_PersonalApoyo FOREIGN KEY (RFC) REFERENCES PersonalApoyo (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE responsable ADD PRIMARY KEY (NombreSalon, RFC);

COMMENT ON TABLE responsable IS 'Esta tabla almacena información sobre los responsables de los salones de eventos';

COMMENT ON COLUMN responsable.NombreSalon IS 'Nombre del salón de eventos';
COMMENT ON COLUMN responsable.RFC IS 'RFC del responsable del salón';

COMMENT ON CONSTRAINT SalonResponsables_unique ON responsable IS 'Asegura que el nombre del salón sea único';
COMMENT ON CONSTRAINT fk_Responsable_Salon ON responsable IS 'Llave foránea que referencia al salón de eventos';
COMMENT ON CONSTRAINT fk_Responsable_PersonalApoyo ON responsable IS 'Llave foránea que referencia al personal de apoyo que es responsable del salón';


CREATE TABLE encuesta(
	FechayHora DATE,
	idHuesped INT,
	limpieza CHAR(1),
	servicios CHAR(1),
	recomendaria bool,
	volveria bool,
	comentarios CHAR(1000)
);

ALTER TABLE encuesta ADD CONSTRAINT encuesta_unique UNIQUE(FechayHora);
ALTER TABLE encuesta ALTER COLUMN limpieza SET NOT NULL;
ALTER TABLE encuesta ADD CONSTRAINT RespuestaLimpieza CHECK(limpieza in ('1','2','3','4','5'));
ALTER TABLE encuesta ALTER COLUMN servicios SET NOT NULL;
ALTER TABLE encuesta ADD CONSTRAINT RespuestaServicios CHECK(servicios in ('1','2','3','4','5'));
ALTER TABLE encuesta ALTER COLUMN recomendaria SET NOT NULL;
ALTER TABLE encuesta ALTER COLUMN volveria SET NOT NULL;

ALTER TABLE encuesta ADD CONSTRAINT fk_encuesta_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE encuesta ADD PRIMARY KEY (FechayHora, idHuesped);

COMMENT ON TABLE encuesta IS 'Esta tabla almacena información sobre las encuestas de satisfacción de los huéspedes';

COMMENT ON COLUMN encuesta.FechayHora IS 'Fecha y hora en la que se realizó la encuesta';
COMMENT ON COLUMN encuesta.idHuesped IS 'Identificador del huésped que realizó la encuesta';
COMMENT ON COLUMN encuesta.limpieza IS 'Calificación de la limpieza del hotel';
COMMENT ON COLUMN encuesta.servicios IS 'Calificación de los servicios del hotel';
COMMENT ON COLUMN encuesta.recomendaria IS 'Indica si el huésped recomendaría el hotel';
COMMENT ON COLUMN encuesta.volveria IS 'Indica si el huésped volvería a hospedarse en el hotel';
COMMENT ON COLUMN encuesta.comentarios IS 'Comentarios del huésped';

COMMENT ON CONSTRAINT encuesta_unique ON encuesta IS 'Asegura que la fecha y hora de la encuesta sea única';
COMMENT ON CONSTRAINT RespuestaLimpieza ON encuesta IS 'Asegura que la calificación de la limpieza sea un número entre 1 y 5';
COMMENT ON CONSTRAINT RespuestaServicios ON encuesta IS 'Asegura que la calificación de los servicios sea un número entre 1 y 5';


CREATE TABLE telefonoHuesped(
	telefono CHAR(10),
	idHuesped INT
);

ALTER TABLE telefonoHuesped ADD CONSTRAINT telHuesped_unique UNIQUE(telefono);

ALTER TABLE telefonoHuesped ADD CONSTRAINT fk_telefono_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE telefonoHuesped ADD PRIMARY KEY (telefono, idHuesped);

COMMENT ON TABLE telefonoHuesped IS 'Esta tabla almacena los teléfonos de los huéspedes';

COMMENT ON COLUMN telefonoHuesped.telefono IS 'Número de teléfono del huésped';
COMMENT ON COLUMN telefonoHuesped.idHuesped IS 'Identificador del huésped al que pertenece el teléfono';

COMMENT ON CONSTRAINT telHuesped_unique ON telefonoHuesped IS 'Asegura que el número de teléfono del huésped sea único';
COMMENT ON CONSTRAINT fk_telefono_Huesped ON telefonoHuesped IS 'Llave foránea que referencia al huésped al que pertenece el teléfono';


CREATE TABLE correoHuesped(
	correo VARCHAR(35),
	idHuesped INT
);

ALTER TABLE correoHuesped ADD CONSTRAINT correoHuesped_unique UNIQUE(correo);

ALTER TABLE correoHuesped ADD CONSTRAINT fk_telefono_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE correoHuesped ADD PRIMARY KEY (correo, idHuesped);

COMMENT ON TABLE correoHuesped IS 'Esta tabla almacena los correos electrónicos de los huéspedes';

COMMENT ON COLUMN correoHuesped.correo IS 'Correo electrónico del huésped';
COMMENT ON COLUMN correoHuesped.idHuesped IS 'Identificador del huésped al que pertenece el correo';

COMMENT ON CONSTRAINT correoHuesped_unique ON correoHuesped IS 'Asegura que el correo electrónico del huésped sea único';
COMMENT ON CONSTRAINT fk_correo_Huesped ON correoHuesped IS 'Llave foránea que referencia al huésped al que pertenece el correo';


CREATE TABLE tarjeta(
	NumeroTarjeta CHAR(16),
	idHuesped INT,
	FechaVencimiento date
);

ALTER TABLE tarjeta ADD CONSTRAINT tarjetaHuesped_unique UNIQUE(NumeroTarjeta);
ALTER TABLE tarjeta ALTER COLUMN FechaVencimiento SET NOT NULL;

ALTER TABLE tarjeta ADD CONSTRAINT fk_tarjeta_Huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE tarjeta ADD PRIMARY KEY (NumeroTarjeta, idHuesped);

COMMENT ON TABLE tarjeta IS 'Esta tabla almacena información sobre las tarjetas de crédito de los huéspedes';

COMMENT ON COLUMN tarjeta.NumeroTarjeta IS 'Número de la tarjeta de crédito';
COMMENT ON COLUMN tarjeta.idHuesped IS 'Identificador del huésped al que pertenece la tarjeta';
COMMENT ON COLUMN tarjeta.FechaVencimiento IS 'Fecha de vencimiento de la tarjeta';

COMMENT ON CONSTRAINT tarjetaHuesped_unique ON tarjeta IS 'Asegura que el número de la tarjeta de crédito sea único';
COMMENT ON CONSTRAINT fk_tarjeta_Huesped ON tarjeta IS 'Llave foránea que referencia al huésped al que pertenece la tarjeta';


CREATE TABLE telefonoPersonalApoyo(
	telefono CHAR(10),
	RFC CHAR(13)
);

ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT telPersonalApoyo_unique UNIQUE(telefono);

ALTER TABLE telefonoPersonalApoyo ADD CONSTRAINT fk_telefono_PersonalApoyo FOREIGN KEY (RFC) REFERENCES PersonalApoyo (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE telefonoPersonalApoyo ADD PRIMARY KEY (telefono, RFC);

COMMENT ON TABLE telefonoPersonalApoyo IS 'Esta tabla almacena los teléfonos del personal de apoyo';

COMMENT ON COLUMN telefonoPersonalApoyo.telefono IS 'Número de teléfono del personal de apoyo';
COMMENT ON COLUMN telefonoPersonalApoyo.RFC IS 'RFC del personal de apoyo';

COMMENT ON CONSTRAINT telPersonalApoyo_unique ON telefonoPersonalApoyo IS 'Asegura que el número de teléfono del personal de apoyo sea único';
COMMENT ON CONSTRAINT fk_telefono_PersonalApoyo ON telefonoPersonalApoyo IS 'Llave foránea que referencia al personal de apoyo al que pertenece el teléfono';


CREATE TABLE telefonoLimpieza(
	telefono CHAR(10),
	RFC CHAR(13)
);

ALTER TABLE telefonoLimpieza ADD CONSTRAINT telLimpieza_unique UNIQUE(telefono);

ALTER TABLE telefonoLimpieza ADD CONSTRAINT fk_telefono_Limpieza FOREIGN KEY (RFC) REFERENCES limpiezaInterna (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE telefonoLimpieza ADD PRIMARY KEY (telefono, RFC);

COMMENT ON TABLE telefonoLimpieza IS 'Esta tabla almacena los teléfonos del personal de limpieza interna';

COMMENT ON COLUMN telefonoLimpieza.telefono IS 'Número de teléfono del personal de limpieza interna';
COMMENT ON COLUMN telefonoLimpieza.RFC IS 'RFC del personal de limpieza interna';

COMMENT ON CONSTRAINT telLimpieza_unique ON telefonoLimpieza IS 'Asegura que el número de teléfono del personal de limpieza interna sea único';
COMMENT ON CONSTRAINT fk_telefono_Limpieza ON telefonoLimpieza IS 'Llave foránea que referencia al personal de limpieza interna al que pertenece el teléfono';

CREATE TABLE telefonoRecepcionista(
	telefono CHAR(10),
	RFC CHAR(13)
);

ALTER TABLE telefonoRecepcionista ADD CONSTRAINT telRecepcionista_unique UNIQUE(telefono);

ALTER TABLE telefonoRecepcionista ADD CONSTRAINT fk_telefono_Recepcionista FOREIGN KEY (RFC) REFERENCES recepcionista (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE telefonoRecepcionista ADD PRIMARY KEY (telefono, RFC);

COMMENT ON TABLE telefonoRecepcionista IS 'Esta tabla almacena los teléfonos de los recepcionistas';

COMMENT ON COLUMN telefonoRecepcionista.telefono IS 'Número de teléfono del recepcionista';
COMMENT ON COLUMN telefonoRecepcionista.RFC IS 'RFC del recepcionista';

COMMENT ON CONSTRAINT telRecepcionista_unique ON telefonoRecepcionista IS 'Asegura que el número de teléfono del recepcionista sea único';
COMMENT ON CONSTRAINT fk_telefono_Recepcionista ON telefonoRecepcionista IS 'Llave foránea que referencia al recepcionista al que pertenece el teléfono';


CREATE TABLE telefonoServicioComida(
	telefono CHAR(10),
	RFC CHAR(13)
);

ALTER TABLE telefonoServicioComida ADD CONSTRAINT telServicioComida_unique UNIQUE(telefono);

ALTER TABLE telefonoServicioComida ADD CONSTRAINT fk_telefono_ServicioComida FOREIGN KEY (RFC) REFERENCES servicioComida (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE telefonoServicioComida ADD PRIMARY KEY (telefono, RFC);

COMMENT ON TABLE telefonoServicioComida IS 'Esta tabla almacena los teléfonos del personal de servicio de comida';

COMMENT ON COLUMN telefonoServicioComida.telefono IS 'Número de teléfono del personal de servicio de comida';
COMMENT ON COLUMN telefonoServicioComida.RFC IS 'RFC del personal de servicio de comida';

COMMENT ON CONSTRAINT telServicioComida_unique ON telefonoServicioComida IS 'Asegura que el número de teléfono del personal de servicio de comida sea único';
COMMENT ON CONSTRAINT fk_telefono_ServicioComida ON telefonoServicioComida IS 'Llave foránea que referencia al personal de servicio de comida al que pertenece el teléfono';

CREATE TABLE correoPersonalApoyo(
	correoElectronico VARCHAR(35),
	RFC CHAR(13)
);

ALTER TABLE correoPersonalApoyo ADD CONSTRAINT correoPersonalApoyo_unique UNIQUE(correoElectronico);

ALTER TABLE correoPersonalApoyo ADD CONSTRAINT fk_correo_PersonalApoyo FOREIGN KEY (RFC) REFERENCES PersonalApoyo (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE correoPersonalApoyo ADD PRIMARY KEY (correoElectronico, RFC);

COMMENT ON TABLE correoPersonalApoyo IS 'Esta tabla almacena los correos electrónicos del personal de apoyo';

COMMENT ON COLUMN correoPersonalApoyo.correoElectronico IS 'Correo electrónico del personal de apoyo';
COMMENT ON COLUMN correoPersonalApoyo.RFC IS 'RFC del personal de apoyo';

COMMENT ON CONSTRAINT correoPersonalApoyo_unique ON correoPersonalApoyo IS 'Asegura que el correo electrónico del personal de apoyo sea único';
COMMENT ON CONSTRAINT fk_correo_PersonalApoyo ON correoPersonalApoyo IS 'Llave foránea que referencia al personal de apoyo al que pertenece el correo';


CREATE TABLE correoLimpieza(
	correoElectronico VARCHAR(35),
	RFC CHAR(13)
);

ALTER TABLE correoLimpieza ADD CONSTRAINT correoLimpieza_unique UNIQUE(correoElectronico);

ALTER TABLE correoLimpieza ADD CONSTRAINT fk_correo_Limpieza FOREIGN KEY (RFC) REFERENCES limpiezaInterna (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE correoLimpieza ADD PRIMARY KEY (correoElectronico, RFC);

COMMENT ON TABLE correoLimpieza IS 'Esta tabla almacena los correos electrónicos del personal de limpieza interna';

COMMENT ON COLUMN correoLimpieza.correoElectronico IS 'Correo electrónico del personal de limpieza interna';
COMMENT ON COLUMN correoLimpieza.RFC IS 'RFC del personal de limpieza interna';

COMMENT ON CONSTRAINT correoLimpieza_unique ON correoLimpieza IS 'Asegura que el correo electrónico del personal de limpieza interna sea único';
COMMENT ON CONSTRAINT fk_correo_Limpieza ON correoLimpieza IS 'Llave foránea que referencia al personal de limpieza interna al que pertenece el correo';


CREATE TABLE correoRecepcionista(
	correoElectronico VARCHAR(35),
	RFC CHAR(13)
);

ALTER TABLE correoRecepcionista ADD CONSTRAINT correoRecepcionista_unique UNIQUE(correoElectronico);

ALTER TABLE correoRecepcionista ADD CONSTRAINT fk_correo_Recepcionista FOREIGN KEY (RFC) REFERENCES recepcionista (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE correoRecepcionista ADD PRIMARY KEY (correoElectronico, RFC);

COMMENT ON TABLE correoRecepcionista IS 'Esta tabla almacena los correos electrónicos de los recepcionistas';

COMMENT ON COLUMN correoRecepcionista.correoElectronico IS 'Correo electrónico del recepcionista';
COMMENT ON COLUMN correoRecepcionista.RFC IS 'RFC del recepcionista';

COMMENT ON CONSTRAINT correoRecepcionista_unique ON correoRecepcionista IS 'Asegura que el correo electrónico del recepcionista sea único';
COMMENT ON CONSTRAINT fk_correo_Recepcionista ON correoRecepcionista IS 'Llave foránea que referencia al recepcionista al que pertenece el correo';

CREATE TABLE correoServicioComida(
	correoElectronico VARCHAR(35),
	RFC CHAR(13)
);

ALTER TABLE correoServicioComida ADD CONSTRAINT correoServicioComida_unique UNIQUE(correoElectronico);

ALTER TABLE correoServicioComida ADD CONSTRAINT fk_correo_ServicioComida FOREIGN KEY (RFC) REFERENCES servicioComida (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE correoServicioComida ADD PRIMARY KEY (correoElectronico, RFC);

COMMENT ON TABLE correoServicioComida IS 'Esta tabla almacena los correos electrónicos del personal de servicio de comida';

COMMENT ON COLUMN correoServicioComida.correoElectronico IS 'Correo electrónico del personal de servicio de comida';
COMMENT ON COLUMN correoServicioComida.RFC IS 'RFC del personal de servicio de comida';

COMMENT ON CONSTRAINT correoServicioComida_unique ON correoServicioComida IS 'Asegura que el correo electrónico del personal de servicio de comida sea único';
COMMENT ON CONSTRAINT fk_correo_ServicioComida ON correoServicioComida IS 'Llave foránea que referencia al personal de servicio de comida al que pertenece el correo';


CREATE TABLE dar(
	idHotel INT,
	NombreServicio VARCHAR(50)
);

ALTER TABLE dar ADD CONSTRAINT Servicio_unique UNIQUE(NombreServicio);

ALTER TABLE dar ADD CONSTRAINT fk_dar_hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE dar ADD CONSTRAINT fk_dar_servicio FOREIGN KEY (NombreServicio) REFERENCES servicio (NombreServicio) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE dar ADD PRIMARY KEY (NombreServicio, idHotel);

COMMENT ON TABLE dar IS 'Esta tabla almacena información sobre los servicios que se ofrecen en los hoteles';

COMMENT ON COLUMN dar.idHotel IS 'Identificador del hotel al que pertenece el servicio';
COMMENT ON COLUMN dar.NombreServicio IS 'Nombre del servicio';

COMMENT ON CONSTRAINT Servicio_unique ON dar IS 'Asegura que el nombre del servicio sea único';
COMMENT ON CONSTRAINT fk_dar_hotel ON dar IS 'Llave foránea que referencia al hotel al que pertenece el servicio';
COMMENT ON CONSTRAINT fk_dar_servicio ON dar IS 'Llave foránea que referencia al servicio que se ofrece en el hotel';


CREATE TABLE reservar(
	idHuesped INT,
	NombreSalon VARCHAR(30),
	FechaEvento DATE,
	HoraInicio TIMESTAMP,
	HoraTermino TIMESTAMP,
	NumAsistentes INT
);

ALTER TABLE reservar ALTER COLUMN FechaEvento SET NOT NULL;
ALTER TABLE reservar ALTER COLUMN HoraInicio SET NOT NULL;
ALTER TABLE reservar ALTER COLUMN HoraTermino SET NOT NULL;
ALTER TABLE reservar ALTER COLUMN NumAsistentes SET NOT NULL;

ALTER TABLE reservar ADD CONSTRAINT fk_reservar_huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE reservar ADD CONSTRAINT fk_reservar_salon FOREIGN KEY (NombreSalon) REFERENCES salon (NombreSalon) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE reservar ADD PRIMARY KEY (idHuesped, NombreSalon);

COMMENT ON TABLE reservar IS 'Esta tabla almacena información sobre las reservaciones de salones de eventos';

COMMENT ON COLUMN reservar.idHuesped IS 'Identificador del huésped que realizó la reservación';
COMMENT ON COLUMN reservar.NombreSalon IS 'Nombre del salón de eventos';
COMMENT ON COLUMN reservar.FechaEvento IS 'Fecha del evento';
COMMENT ON COLUMN reservar.HoraInicio IS 'Hora de inicio del evento';
COMMENT ON COLUMN reservar.HoraTermino IS 'Hora de término del evento';
COMMENT ON COLUMN reservar.NumAsistentes IS 'Número de asistentes al evento';

COMMENT ON CONSTRAINT fk_reservar_huesped ON reservar IS 'Llave foránea que referencia al huésped que realizó la reservación';
COMMENT ON CONSTRAINT fk_reservar_salon ON reservar IS 'Llave foránea que referencia al salón de eventos que se reservó';


CREATE TABLE hospedar(
	idHuesped INT,
	idHotel INT,
	metodoPago char(1),
	numHuespedes INT,
	numNoches INT,
	mascotas bool,
	cargos NUMERIC(7,2)
);

ALTER TABLE hospedar ALTER COLUMN metodoPago SET NOT NULL;
ALTER TABLE hospedar ADD CONSTRAINT tipoPago CHECK(metodoPago in ('E','T'));
ALTER TABLE hospedar ALTER COLUMN numHuespedes SET NOT NULL;
ALTER TABLE hospedar ADD CONSTRAINT numHuespedes_positivo CHECK(numHuespedes > 0);
ALTER TABLE hospedar ALTER COLUMN numNoches SET NOT NULL;
ALTER TABLE hospedar ADD CONSTRAINT numNoches_positivo CHECK(numNoches > 0);
ALTER TABLE hospedar ALTER COLUMN mascotas SET NOT NULL;
ALTER TABLE hospedar ADD CONSTRAINT cargos_positivo CHECK(cargos >= 0);

ALTER TABLE hospedar ADD CONSTRAINT fk_hospedar_huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE hospedar ADD CONSTRAINT fk_hospedar_hotel FOREIGN KEY (idHotel) REFERENCES hotel (idHotel) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE hospedar ADD PRIMARY KEY (idHuesped, idHotel);

COMMENT ON TABLE hospedar IS 'Esta tabla almacena información sobre las reservaciones de habitaciones de los huéspedes';

COMMENT ON COLUMN hospedar.idHuesped IS 'Identificador del huésped que realizó la reservación';
COMMENT ON COLUMN hospedar.idHotel IS 'Identificador del hotel en el que se hospedó el huésped';
COMMENT ON COLUMN hospedar.metodoPago IS 'Método de pago (E: Efectivo, T: Tarjeta)';
COMMENT ON COLUMN hospedar.numHuespedes IS 'Número de huéspedes';
COMMENT ON COLUMN hospedar.numNoches IS 'Número de noches';
COMMENT ON COLUMN hospedar.mascotas IS 'Indica si el huésped lleva mascotas';
COMMENT ON COLUMN hospedar.cargos IS 'Cargos adicionales';

COMMENT ON CONSTRAINT tipoPago ON hospedar IS 'Asegura que el método de pago sea E (Efectivo) o T (Tarjeta)';
COMMENT ON CONSTRAINT numHuespedes_positivo ON hospedar IS 'Asegura que el número de huéspedes sea un número positivo';
COMMENT ON CONSTRAINT numNoches_positivo ON hospedar IS 'Asegura que el número de noches sea un número positivo';
COMMENT ON CONSTRAINT cargos_positivo ON hospedar IS 'Asegura que los cargos adicionales sean un número positivo';
COMMENT ON CONSTRAINT fk_hospedar_huesped ON hospedar IS 'Llave foránea que referencia al huésped que realizó la reservación';
COMMENT ON CONSTRAINT fk_hospedar_hotel ON hospedar IS 'Llave foránea que referencia al hotel en el que se hospedó el huésped';


CREATE TABLE cocinar(
	RFC CHAR(13),
	NombreSalon VARCHAR(30)
);

ALTER TABLE cocinar ADD CONSTRAINT fk_cocinar_servicioComida FOREIGN KEY (RFC) REFERENCES servicioComida (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE cocinar ADD CONSTRAINT fk_cocinar_salon FOREIGN KEY (NombreSalon) REFERENCES salon (NombreSalon) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE cocinar ADD PRIMARY KEY (NombreSalon, RFC);

COMMENT ON TABLE cocinar IS 'Esta tabla almacena información sobre los servicios de comida que se ofrecen en los salones de eventos';

COMMENT ON COLUMN cocinar.RFC IS 'RFC del personal de servicio de comida';
COMMENT ON COLUMN cocinar.NombreSalon IS 'Nombre del salón de eventos';

COMMENT ON CONSTRAINT fk_cocinar_servicioComida ON cocinar IS 'Llave foránea que referencia al personal de servicio de comida';
COMMENT ON CONSTRAINT fk_cocinar_salon ON cocinar IS 'Llave foránea que referencia al salón de eventos';


CREATE TABLE atender(
	RFC CHAR(13),
	idHuesped INT
);

ALTER TABLE atender ADD CONSTRAINT fk_atender_recepcionista FOREIGN KEY (RFC) REFERENCES recepcionista (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE atender ADD CONSTRAINT fk_atender_huesped FOREIGN KEY (idHuesped) REFERENCES huesped (idHuesped) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE atender ADD PRIMARY KEY (idHuesped, RFC);

COMMENT ON TABLE atender IS 'Esta tabla almacena información sobre los recepcionistas que atienden a los huéspedes';

COMMENT ON COLUMN atender.RFC IS 'RFC del recepcionista';
COMMENT ON COLUMN atender.idHuesped IS 'Identificador del huésped';

COMMENT ON CONSTRAINT fk_atender_recepcionista ON atender IS 'Llave foránea que referencia al recepcionista';
COMMENT ON CONSTRAINT fk_atender_huesped ON atender IS 'Llave foránea que referencia al huésped';


CREATE TABLE limpiarSimple(
	RFC CHAR(13),
	NumeroHabitacion INT
);

ALTER TABLE limpiarSimple ADD CONSTRAINT fk_limpiar_limpieza FOREIGN KEY (RFC) REFERENCES limpiezaInterna (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE limpiarSimple ADD CONSTRAINT fk_limpiar_simple FOREIGN KEY (NumeroHabitacion) REFERENCES habitacionSimple (NumeroHabitacion) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE limpiarSimple ADD PRIMARY KEY (NumeroHabitacion, RFC);

COMMENT ON TABLE limpiarSimple IS 'Esta tabla almacena información sobre las habitaciones simples que se limpian';

COMMENT ON COLUMN limpiarSimple.RFC IS 'RFC del personal de limpieza interna';
COMMENT ON COLUMN limpiarSimple.NumeroHabitacion IS 'Número de la habitación';

COMMENT ON CONSTRAINT fk_limpiar_limpieza ON limpiarSimple IS 'Llave foránea que referencia al personal de limpieza interna';
COMMENT ON CONSTRAINT fk_limpiar_simple ON limpiarSimple IS 'Llave foránea que referencia a la habitación simple que se limpia';


CREATE TABLE limpiarPenthouse(
	RFC CHAR(13),
	NumeroHabitacion INT
);

ALTER TABLE limpiarPenthouse ADD CONSTRAINT fk_limpiar_limpieza FOREIGN KEY (RFC) REFERENCES limpiezaInterna (RFC) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE limpiarPenthouse ADD CONSTRAINT fk_limpiar_penthouse FOREIGN KEY (NumeroHabitacion) REFERENCES habitacionPenthouse (NumeroHabitacion) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE limpiarPenthouse ADD PRIMARY KEY (NumeroHabitacion, RFC);

COMMENT ON TABLE limpiarPenthouse IS 'Esta tabla almacena información sobre las habitaciones penthouse que se limpian';

COMMENT ON COLUMN limpiarPenthouse.RFC IS 'RFC del personal de limpieza interna';
COMMENT ON COLUMN limpiarPenthouse.NumeroHabitacion IS 'Número de la habitación';

COMMENT ON CONSTRAINT fk_limpiar_limpieza ON limpiarPenthouse IS 'Llave foránea que referencia al personal de limpieza interna';
COMMENT ON CONSTRAINT fk_limpiar_penthouse ON limpiarPenthouse IS 'Llave foránea que referencia a la habitación penthouse que se limpia';
