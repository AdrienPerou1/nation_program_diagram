drop schema if exists programme_but CASCADE;
create schema programme_but;
set schema 'programme_but';

create table _niveau(
  numero_n NUMERIC(1) primary key);

create table _competences(
  lib_competence varchar(2) primary key
);

create table _UE(
  code_UE varchar(2) primary key
);

create table _activites(
  lib_activite varchar(50) primary key,
  constraint revele_de foreign key (lib_activite) references _competences(lib_competence),
  constraint est_realise_dans foreign key (lib_activite) references _UE(code_UE)
);


create table _parcours(
  code_p varchar(2) primary key,
  libelle_parcours varchar(50) not null,
  nbre_gpe_td_p numeric(3),
  nbre_gpe_tp_p numeric(3)
);


CREATE table _correspond(
  code_p varchar(2),
  numero_n numeric(1),
  lib_activite varchar(50),
  constraint _correspond_fk1 foreign key (code_p) references _parcours(code_p),
  constraint _correspond_fk2 foreign key (numero_n) references _niveau(numero_n),
  constraint _correspond_fk3 foreign key (lib_activite) references _activites(lib_activite)
);



create table _semestre(
  numero_sem numeric(2) primary key
);

create table _ressources(
  code_R varchar(2) primary key,
  lib_R varchar(50) not null,
  nb_h_CM_PN numeric(3),
  nb_h_TD_PN numeric(3),
  nb_h_TP_PN numeric(3)
);



create table _SAE(
  code_SAE numeric(2) primary key,
  lib_sae varchar(50) not null,
  nb_h_TD_enc numeric(3),
  nb_h_TD_projet_autonomie numeric(3)
);

create table _comprend_R(
  code_UE varchar(2),
  code_SAE numeric(2),
  nb_h_TD_C numeric(3),
  nb_h_TP_C numeric(3),
  constraint _comprend_R_fk1 foreign key (code_UE) references _UE(code_UE),
  constraint _comprend_R_fk2 foreign key (code_SAE) references _SAE(code_SAE)
);


