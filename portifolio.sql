create database sistema_faculdade;
use sistema_faculdade;

create table tbl_cursos (
	id int primary key not null auto_increment,
    nome varchar(45) not null,
    descricao text,
    nivel varchar(45),
    carga_horaria float,
    unique index(id)
);

create table tbl_professores (
	id int primary key not null auto_increment,
	nome varchar(45) not null,
    titulacao varchar(45) not null,
    data_contratacao date,
    area_atuacao varchar(45),
    unique index(id)
);

create table tbl_alunos (
	id int primary key not null auto_increment,
    nome varchar(45) not null,
    cpf varchar(15) not null,
    data_cadastro date,
    data_nascimento date,
    unique index(id)
);

create table tbl_endereco (
	id int primary key not null auto_increment,
    pais varchar(45) not null,
    estado varchar(45) not null,
    cidade  varchar(45) not null,
    cep varchar(45) not null,
    rua varchar(45) not null,
    numero varchar(45) not null,
    logradouro varchar(45) not null,
    id_alunos int not null, 
    
    constraint fk_endereco_alunos
    foreign key (id_alunos)
	references tbl_alunos (id),
    unique index(id)
);

create table tbl_contatos (
	id int primary key not null auto_increment,
    contato varchar(15) not null,
    id_professores int not null,
    id_alunos int not null, 
    
    constraint fk_contatos_alunos
    foreign key (id_alunos)
	references tbl_alunos (id),
    unique index(id),
    
    constraint fk_contatos_professores
    foreign key (id_professores)
	references tbl_professores (id),
    unique index(id)
);

create table tbl_turmas (
	 id int primary key not null auto_increment,
	 sala varchar(45) not null,
	 turno varchar(45) not null,
	 semestre varchar(45) not null,
	 id_materias int not null,
	 id_professores int not null,
 
	constraint fk_materias_turmas
	foreign key (id_materias)
	references tbl_materias (id),
	unique index(id),
    
    constraint fk_professores_turmas
	foreign key (id_professores)
	references tbl_professores (id),
	unique index(id)
);

create table tbl_matriculas (
	id int primary key not null auto_increment,
	status  varchar(45) not null,
    data_matricula date not null,
    id_alunos int not null,
    id_cursos int not null,
     
	constraint fk_alunos_matriculas
    foreign key (id_alunos)
	references tbl_alunos (id),
    
    constraint fk_cursos_matriculas
    foreign key (id_cursos)
    references tbl_alunos (id),
    unique index(id)
); 
   
 create table tbl_notas (
	id int primary key not null auto_increment,
	nota_final varchar(45) ,
	id_professores int not null,
    id_alunos int not null,
	  
	constraint fk_professores_notas
	foreign key (id_professores)
	references tbl_professores (id),
	unique index(id),
    
    constraint fk_alunos_notas
	foreign key (id_alunos)
	references tbl_alunos (id),
	unique index(id)
 );

create table tbl_materias (
	id int primary key not null auto_increment,
    nome varchar(45) not null,
    descricao text,
    carga_horaria varchar(45),
    id_cursos int not null,
    
    constraint fk_cursos_materias
	foreign key (id_cursos)
	references tbl_cursos (id),
	unique index(id)
);