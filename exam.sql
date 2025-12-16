-- Alejandro Arévalo Merlo 78026620V

drop database if exists streaming;
create database streaming;
use streaming;

create table usuario ( -- tabla usuario con clave foranea a usuario referido, si se elimina el campo queda null
	id_usuario int primary key auto_increment,
    email varchar(255) not null,
    pasword varchar(8) not null,
    nombre varchar(255) not null,
    apellido varchar(255) not null,
    apellido2 varchar(255) not null,
    id_usuario_referido int null,
    foreign key (id_usuario_referido) references usuario(id_usuario) on delete set null on update cascade
);

create table serie ( -- tabla serie, se asocia con episodio
	id_serie int primary key auto_increment,
    nombre_serie varchar(255) not null
);

create table video ( -- tabla video el cual tiene a episodio y pelicula, ambos con su id. 
	id_video int primary key auto_increment,
    titulo varchar(255) not null,
    imagen varchar(255) null,
    video varchar(255) null,
    duracion int check(pagos >=0),
    tipo ENUM('Episodio', 'Pelicula'),
    calidad_video ENUM('SD', 'HD', 'FullHD', '4K') not null default 'HD',
    foreign key (id_video) references video(id_video) on delete set null on update cascade
);

create table episodio ( -- episodio con key de serie ya que pertenece a esta
	id_video int primary key auto_increment,
    temporada varchar(255) not null,
    numero varchar(255) not null,
    id_serie int,
    foreign key (id_serie) references serie(id_serie) on delete set null on update cascade
);

create table pelicula ( -- pelicula con key de video tambien ya que viene de este y no tiene id propio
	id_video int primary key,
	puntuacion_IMDb decimal(0,0),
    director varchar(255) null
    );
    
    create table genero (
    id_genero int primary key auto_increment,
    nombre_genero varchar(255) not null
    );
    
    create table usuario_ve_video ( -- relacion N:M entre usuario y video 
    primary key (id_usuario, id_video, fecha_hora),
    fecha_hora varchar(255) not null,
	foreign key (id_usuario) references usuario(id_usuario) on delete set null on update cascade,
    foreign key (id_video) references video(id_video) on delete set null on update cascade
    );
    
    create table video_pertenece_genero ( -- relacion N:M entre video y genero
    primary key (id_video, id_genero),
	foreign key (id_genero) references genero(id_genero) on delete set null on update cascade,
    foreign key (id_video) references video(id_video) on delete set null on update cascade
    );
    
    