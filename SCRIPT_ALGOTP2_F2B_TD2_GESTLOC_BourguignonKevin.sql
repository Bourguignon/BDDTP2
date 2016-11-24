create schema GESTIONLOG;
create db_space SP_CLIENT;
create db_space SP_COMMUNE;
create db_space SP_LOCATION;


create table SIGNATAIRE(NUMCLI char (12) not null,
						NOM char (16) not null,
						PRENOM char (16) not null,
						DATENAISSANCE decimal (8) not null,
						TELEPHONE decimal (10) not null,
					primary key (NUMCLI))
					in SP_CLIENT;
					
create table COMMUNE(NOM char (12) not null,
					 CODEPOSTAL decimal (5) not null,
					 NBHABITANT decimal (6) not null,
					 DISTANCE decimal (6) not null,
				primary key (NOM.CODEPOSTAL))
				in SP_COMMUNE;
				
create table LOGEMENT(NUMLOG char (12) not null,
					  NOM.CODEPOSTAL char (17) not null,
					  ADRESSE char (80) not null,
					  QUARTIER char (80) not null,
					  TYPES char (2) not null,
					  SUPERFICIE decimal (3) not null,
					  LOYER decimal (6) not null,
					  CF decimal (2) not null,
				primary key (NUMLOG),
				foreign key (NOM.CODEPOSTAL) references COMMUNE
				on delete no action on update cascade)
				in SP_LOCATION;
				
create table LOCATION(NUMCLI char (12) not null,
					  NUMLOG char (12) not null,
					  DATEDEB decimal (8) not null,
					  DATEFIN decimal (8) not null,
				primary key (NUMCLI.NUMLOG),
				foreign key (NUMCLI) references SIGNATAIRE
				on delete no action on update cascade,
				foreign key (NUMLOG) references LOGEMENT
				on delete no action on update cascade)
				in SP_LOCATION;
				
create index XSIGN_NUMCLI on SIGNATAIRE(NUMCLI);
create index XLOG_NUMLOG on LOGEMENT(NUMLOG);
create index XLOC_NUMLOC on LOCATION(NUMCLI.NUMLOC);
create index XCOM_COMMUNE on COMMUNE(NOM.CODEPOSTAL);
