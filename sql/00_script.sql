
begin;
--  cria a extensão do uuid caso ela nao exista no banco
create extension if not exists "uuid-ossp";
savepoint cria_uuid;

-- cria um novo tipo que representa os tipos de usuários
create type tipo_perfil as enum ('MENTOR', 'MENTORADO'); 
savepoint cria_tipos_de_perfis;
-- tables
create table if not exists usuarios (
	id uuid primary key default uuid_generate_v4(),
	tipo tipo_perfil,
	email varchar not null,
	senha varchar not null,
	nome varchar(255) not null,
	nascimento timestamp not null,
	unique(email)

);

create table if not exists habilidades (
	id uuid primary key default uuid_generate_v4(),
	id_perfil uuid not null,
	nome varchar not null
);

create table if not exists bloco_Tempo (
	id uuid not null primary key default uuid_generate_v4(),
	id_mentor uuid not null,
	inicio timestamp not null,
	fim timestamp not null
);

create table if not exists agendamento (
	id uuid primary key default uuid_generate_v4(), 
	id_mentor uuid not null, 
	id_mentorado uuid not null, 
	id_Bloco_Tempo uuid, 
	concluido boolean default false
);

create table if not exists avaliacao (
	id uuid primary key default uuid_generate_v4(), 
	id_agendamento uuid not null, 
	numero_Estrelas int not null
);
savepoint termina_criacao_tabelas;

-- relations
alter table habilidades add constraint fk_perfis foreign key(id_perfil) references usuarios(id);
references usuarios(id);
savepoint liga_habilidades_a_usuarios;

alter table bloco_tempo add constraint fk_mentor foreign key(id_mentor) references usuarios(id);
alter table agendamento add constraint fk_mentor foreign key(id_mentor) references usuarios(id);
alter table agendamento add	constraint fk_mentorado foreign key(id_mentorado) references usuarios(id);
alter table agendamento add	constraint fk_bloco_de_tempo foreign key(id_bloco_tempo) references bloco_tempo(id);

alter table avaliacao  add constraint fk_agendamento foreign key(id_agendamento) references agendamento(id);
savepoint liga_agendamento_a_usuarios;
commit;