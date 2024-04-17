DROP SCHEMA IF EXISTS  corp;

CREATE SCHEMA IF NOT EXISTS `corp` DEFAULT CHARACTER SET utf8 ;

USE `corp` ;

/*
CREATE USER  'usr_corp'@'%' IDENTIFIED BY 'corp'; 

GRANT ALL PRIVILEGES ON corp.* TO 'usr_corp'@'%' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON corp.* TO 'usr_corp'@'%' WITH GRANT OPTION;
*/

drop TABLE IF EXISTS PessoaIdioma;

DROP TABLE IF EXISTS Pessoa;

DROP TABLE IF EXISTS Municipio;
DROP TABLE IF EXISTS UnidadeFederacao;

DROP TABLE IF EXISTS Idioma;

DROP TABLE IF EXISTS Curso;

CREATE TABLE Idioma
(
  CodIdioma integer NOT NULL,
  Descricao varchar(30) NOT NULL,
  PRIMARY KEY (CodIdioma)
)
;

CREATE TABLE UnidadeFederacao (
	SiglaUF varchar (2)  NOT NULL ,
	SiglaPais2Letras varchar (2)  NOT NULL ,
	NomeOficial varchar (60)  NULL ,
	CONSTRAINT PK_UnidadeFederacao PRIMARY KEY  CLUSTERED 
	(
		SiglaUF
	) 
);

CREATE TABLE Municipio (
	CodMunicipio int NOT NULL ,
	NomeMunicipio varchar (30)  NOT NULL ,
	NomeAbrevMunicipio varchar (16)  NULL ,
	SiglaEstado varchar (2)  NULL ,
	CONSTRAINT PK_Municipio PRIMARY KEY  CLUSTERED 
	(
		CodMunicipio
	)  ,
	CONSTRAINT FK_UNIDADEFEDERACAO FOREIGN KEY 
	(
		SiglaEstado
	) REFERENCES UnidadeFederacao (
		SiglaUF
	) 
    /* , UNIQUE INDEX `Nome_UNIQUE` (`NomeMunicipio` ASC) */
) ;

CREATE TABLE Curso
(
  CodCurso INT NOT NULL AUTO_INCREMENT,
  Nome varchar(50) NOT NULL,
  CargaHoraria smallint null,
  Constraint primary key (codCurso)
);


	
CREATE TABLE Pessoa (
	CodPessoa int NOT NULL AUTO_INCREMENT ,
	CodCurso int NULL ,
	Nome varchar (50)  NOT NULL ,
	RG int NOT NULL ,
	DataNasc DATE NOT NULL ,
	EstCivil int NOT NULL ,
	Sexo varchar (1)  NULL ,
	endereco varchar (50)  NOT NULL ,
	complemento varchar (20)  NULL ,
	telefone varchar (15)  NOT NULL ,
	email varchar (40)  NULL ,
	bairro varchar (40)  NULL ,
	cep varchar (8)  NULL ,
	CodMunicipio int NOT NULL ,
	CONSTRAINT PK_Pessoa PRIMARY KEY  
	(
		CodPessoa
	) ,
	CONSTRAINT FK_Muncipio FOREIGN KEY 
	(
		CodMunicipio
	) REFERENCES Municipio (
		CodMunicipio
	)
) ;

CREATE TABLE PessoaIdioma
(
  CodPessoa int NOT NULL,
  CodIdioma int NOT NULL,
  NivelConhecimento varchar(20) NOT NULL,
  PRIMARY KEY (CodPessoa,CodIdioma),
  CONSTRAINT FK_Idioma  FOREIGN KEY ( CodIdioma )
   REFERENCES Idioma ( CodIdioma ),
  CONSTRAINT FK_Pessoa  FOREIGN KEY ( CodPessoa )
   REFERENCES Pessoa ( CodPessoa )
);


-- ALTER TABLE Pessoa ADD CONSTRAINT PessoaCurso
--  FOREIGN KEY ( CodCurso )
--   REFERENCES Curso ( CodCurso );

insert into UnidadeFederacao values ('AC','BR','ACRE');
insert into UnidadeFederacao values ('AL','BR','ALAGOAS');
insert into UnidadeFederacao values ('AM','BR','AMAZONAS');
insert into UnidadeFederacao values ('AP','BR','AMAPA');
insert into UnidadeFederacao values ('BA','BR','BAHIA');
insert into UnidadeFederacao values ('CE','BR','CEARA');
insert into UnidadeFederacao values ('DF','BR','DISTRITO FEDERAL');
insert into UnidadeFederacao values ('ES','BR','ESPIRITO SANTO');
insert into UnidadeFederacao values ('GO','BR','GOIAS');
insert into UnidadeFederacao values ('MA','BR','MARANHAO');
insert into UnidadeFederacao values ('MG','BR','MINAS GERAIS');
insert into UnidadeFederacao values ('MS','BR','MATO GROSSO DO SUL');
insert into UnidadeFederacao values ('MT','BR','MATO GROSSO');
insert into UnidadeFederacao values ('PA','BR','PARA');
insert into UnidadeFederacao values ('PB','BR','PARAIBA');
insert into UnidadeFederacao values ('PE','BR','PERNAMBUCO');
insert into UnidadeFederacao values ('PI','BR','PIAUI');
insert into UnidadeFederacao values ('PR','BR','PARANA');
insert into UnidadeFederacao values ('RJ','BR','RIO DE JANEIRO');
insert into UnidadeFederacao values ('RN','BR','RIO GRANDE DO NORTE');
insert into UnidadeFederacao values ('RO','BR','RONDONIA');
insert into UnidadeFederacao values ('RR','BR','RORAIMA');
insert into UnidadeFederacao values ('RS','BR','RIO GRANDE DO SUL');
insert into UnidadeFederacao values ('SC','BR','SANTA CATARINA');
insert into UnidadeFederacao values ('SE','BR','SERGIPE');
insert into UnidadeFederacao values ('SP','BR','SAO PAULO');
insert into UnidadeFederacao values ('TO','BR','TOCANTINS');

insert into Municipio values (19001,'ABATIA','ABATIA','PR');
insert into Municipio values (19002,'ADRIANOPOLIS','ADRIANOPOLIS','PR');
insert into Municipio values (19003,'AGUDOS DO SUL','AGUDOS DO SUL','PR');
insert into Municipio values (19004,'ALMIRANTE TAMANDARE','ALM.TAMANDARE','PR');
insert into Municipio values (19005,'ALTO PARANA','ALTO PARANA','PR');
insert into Municipio values (19006,'ALTO PIQUIRI','ALTO PIQUIRI','PR');
insert into Municipio values (19007,'ALTONIA','ALTONIA','PR');
insert into Municipio values (19008,'ALVORADA DO SUL','ALVORADA DO SUL','PR');
insert into Municipio values (19009,'AMAPORA','AMAPORA','PR');
insert into Municipio values (19010,'AMPERE','AMPERE','PR');
insert into Municipio values (19011,'ANDIRA','ANDIRA','PR');
insert into Municipio values (19012,'ANTONINA','ANTONINA','PR');
insert into Municipio values (19013,'ANTONIO OLINTO','ANTONIO OLINTO','PR');
insert into Municipio values (19014,'APUCARANA','APUCARANA','PR');
insert into Municipio values (19015,'ARAPONGAS','ARAPONGAS','PR');
insert into Municipio values (19016,'ARAPOTI','ARAPOTI','PR');
insert into Municipio values (19017,'ARARUNA','ARARUNA','PR');
insert into Municipio values (19018,'ARAUCARIA','ARAUCARIA','PR');
insert into Municipio values (19019,'ASSAI','ASSAI','PR');
insert into Municipio values (19020,'ASSIS CHATEAUBRIAND','A.CHATEAUBRIAND','PR');
insert into Municipio values (19021,'ASTORGA','ASTORGA','PR');
insert into Municipio values (19022,'ATALAIA','ATALAIA','PR');
insert into Municipio values (19023,'BALSA NOVA','BALSA NOVA','PR');
insert into Municipio values (19024,'BANDEIRANTES','BANDEIRANTES','PR');
insert into Municipio values (19025,'BARBOSA FERRAZ','BARBOSA FERRAZ','PR');
insert into Municipio values (19026,'BARRA DO JACARE','BARRA DO JACARE','PR');
insert into Municipio values (19027,'BARRACAO','BARRACAO','PR');
insert into Municipio values (19028,'BELA VISTA DO PARAISO','B.VISTA PARAISO','PR');
insert into Municipio values (19029,'BITURUNA','BITURUNA','PR');
insert into Municipio values (19030,'BOA ESPERANCA','BOA ESPERANCA','PR');
insert into Municipio values (19031,'BOCAIUVA DO SUL','BOCAIUVA DO SUL','PR');
insert into Municipio values (19032,'BOM SUCESSO','BOM SUCESSO','PR');
insert into Municipio values (19033,'BORRAZOPOLIS','BORRAZOPOLIS','PR');
insert into Municipio values (19034,'CAFEARA','CAFEARA','PR');
insert into Municipio values (19035,'CALIFORNIA','CALIFORNIA','PR');
insert into Municipio values (19036,'CAMBARA','CAMBARA','PR');
insert into Municipio values (19037,'CAMBE','CAMBE','PR');
insert into Municipio values (19038,'CAMBIRA','CAMBIRA','PR');
insert into Municipio values (19039,'CAMPINA DA LAGOA','CAMPINA LAGOA','PR');
insert into Municipio values (19040,'CAMPINA GRANDE DO SUL','C.GRANDE DO SUL','PR');
insert into Municipio values (19041,'CAMPO DO TENENTE','CAMPO TENENTE','PR');
insert into Municipio values (19042,'CAMPO LARGO','CAMPO LARGO','PR');
insert into Municipio values (19043,'CAMPO MOURAO','CAMPO MOURAO','PR');
insert into Municipio values (19045,'CANDIDO DE ABREU','CANDIDO ABREU','PR');
insert into Municipio values (19046,'CAPITAO LEONIDAS MARQUES','CAP.LEON.MARQUES','PR');
insert into Municipio values (19047,'CAPANEMA','CAPANEMA','PR');
insert into Municipio values (19048,'CARLOPOLIS','CARLOPOLIS','PR');
insert into Municipio values (19049,'CASCAVEL','CASCAVEL','PR');
insert into Municipio values (19050,'CASTRO','CASTRO','PR');
insert into Municipio values (19051,'CATANDUVAS','CATANDUVAS','PR');
insert into Municipio values (19052,'CENTENARIO DO SUL','CENTENARIO SUL','PR');
insert into Municipio values (19053,'CERRO AZUL','CERRO AZUL','PR');
insert into Municipio values (19054,'CEU AZUL','CEU AZUL','PR');
insert into Municipio values (19055,'CHOPINZINHO','CHOPINZINHO','PR');
insert into Municipio values (19056,'CIANORTE','CIANORTE','PR');
insert into Municipio values (19057,'CIDADE GAUCHA','CIDADE GAUCHA','PR');
insert into Municipio values (19058,'CLEVELANDIA','CLEVELANDIA','PR');
insert into Municipio values (19059,'COLOMBO','COLOMBO','PR');
insert into Municipio values (19060,'COLORADO','COLORADO','PR');
insert into Municipio values (19061,'CONGONHINHAS','CONGONHINHAS','PR');
insert into Municipio values (19062,'CONSELHEIRO MAIRINCK','CONS.MAIRINCK','PR');
insert into Municipio values (19063,'CONTENDA','CONTENDA','PR');
insert into Municipio values (19064,'CORBELIA','CORBELIA','PR');
insert into Municipio values (19065,'CORNELIO PROCOPIO','CORN.PROCOPIO','PR');
insert into Municipio values (19066,'CORONEL VIVIDA','CORONEL VIVIDA','PR');
insert into Municipio values (19067,'CRUZ MACHADO','CRUZ MACHADO','PR');
insert into Municipio values (19068,'CRUZEIRO DO OESTE','CRUZEIRO D´OESTE','PR');
insert into Municipio values (19069,'CRUZEIRO DO SUL','CRUZEIRO DO SUL','PR');
insert into Municipio values (19070,'CURITIBA','CURITIBA','PR');
insert into Municipio values (19071,'CURIUVA','CURIUVA','PR');
insert into Municipio values (19072,'DIAMANTE DO NORTE','DIAMANTE NORTE','PR');
insert into Municipio values (19073,'DOIS VIZINHOS','DOIS VIZINHOS','PR');
insert into Municipio values (19074,'DOUTOR CAMARGO','DOUTOR CAMARGO','PR');
insert into Municipio values (19075,'ENEAS MARQUES','ENEAS MARQUES','PR');
insert into Municipio values (19076,'ENGENHEIRO BELTRAO','ENG.BELTRAO','PR');
insert into Municipio values (19077,'FAXINAL','FAXINAL','PR');
insert into Municipio values (19078,'FENIX','FENIX','PR');
insert into Municipio values (19079,'FLORAI','FLORAI','PR');
insert into Municipio values (19080,'FLORESTA','FLORESTA','PR');
insert into Municipio values (19081,'FLORESTOPOLIS','FLORESTOPOLIS','PR');
insert into Municipio values (19082,'FLORIDA','FLORIDA','PR');
insert into Municipio values (19084,'FOZ DO IGUACU','FOZ DO IGUACU','PR');
insert into Municipio values (19085,'FRANCISCO BELTRAO','FRANC.BELTRAO','PR');
insert into Municipio values (19086,'GENERAL CARNEIRO','GAL.CARNEIRO','PR');
insert into Municipio values (19087,'GOIOERE','GOIOERE','PR');
insert into Municipio values (19088,'GRANDES RIOS','GRANDES RIOS','PR');
insert into Municipio values (19089,'GUAIRA','GUAIRA','PR');
insert into Municipio values (19090,'GUAIRACA','GUAIRACA','PR');
insert into Municipio values (19091,'GUAPIRAMA','GUAPIRAMA','PR');
insert into Municipio values (19092,'GUAPOREMA','GUAPOREMA','PR');
insert into Municipio values (19093,'GUARACI','GUARACI','PR');
insert into Municipio values (19094,'GUARANIACU','GUARANIACU','PR');
insert into Municipio values (19095,'GUARAPUAVA','GUARAPUAVA','PR');
insert into Municipio values (19096,'GUARAQUECABA','GUARAQUECABA','PR');
insert into Municipio values (19097,'GUARATUBA','GUARATUBA','PR');
insert into Municipio values (19098,'IBAITI','IBAITI','PR');
insert into Municipio values (19099,'IBIPORA','IBIPORA','PR');
insert into Municipio values (19100,'ICARAIMA','ICARAIMA','PR');
insert into Municipio values (19101,'IGUARACU','IGUARACU','PR');
insert into Municipio values (19102,'IMBITUVA','IMBITUVA','PR');
insert into Municipio values (19103,'INACIO MARTINS','INACIO MARTINS','PR');
insert into Municipio values (19104,'INAJA','INAJA','PR');
insert into Municipio values (19105,'INDIANOPOLIS','INDIANOPOLIS','PR');
insert into Municipio values (19106,'IPIRANGA','IPIRANGA','PR');
insert into Municipio values (19107,'IPORA','IPORA','PR');
insert into Municipio values (19108,'IRATI','IRATI','PR');
insert into Municipio values (19109,'IRETAMA','IRETAMA','PR');
insert into Municipio values (19110,'ITAGUAJE','ITAGUAJE','PR');
insert into Municipio values (19111,'ITAMBARACA','ITAMBARACA','PR');
insert into Municipio values (19112,'ITAMBE','ITAMBE','PR');
insert into Municipio values (19113,'ITAPEJARA D´OESTE','ITAPEJ.D´OESTE','PR');
insert into Municipio values (19114,'ITAUNA DO SUL','ITAUNA DO SUL','PR');
insert into Municipio values (19115,'IVAI','IVAI','PR');
insert into Municipio values (19116,'IVAIPORA','IVAIPORA','PR');
insert into Municipio values (19118,'JABOTI','JABOTI','PR');
insert into Municipio values (19119,'JACAREZINHO','JACAREZINHO','PR');
insert into Municipio values (19120,'JAGUAPITA','JAGUAPITA','PR');
insert into Municipio values (19121,'JAGUARIAIVA','JAGUARIAIVA','PR');
insert into Municipio values (19122,'JANDAIA DO SUL','JANDAIA DO SUL','PR');
insert into Municipio values (19123,'JANIOPOLIS','JANIOPOLIS','PR');
insert into Municipio values (19124,'JAPIRA','JAPIRA','PR');
insert into Municipio values (19125,'JAPURA','JAPURA','PR');
insert into Municipio values (19126,'JARDIM ALEGRE','JARDIM ALEGRE','PR');
insert into Municipio values (19127,'JARDIM OLINDA','JARDIM OLINDA','PR');
insert into Municipio values (19128,'JATAIZINHO','JATAIZINHO','PR');
insert into Municipio values (19129,'JOAQUIM TAVORA','JOAQUIM TAVORA','PR');
insert into Municipio values (19130,'JUNDIAI DO SUL','JUNDIAI DO SUL','PR');
insert into Municipio values (19131,'JUSSARA','JUSSARA','PR');
insert into Municipio values (19132,'KALORE','KALORE','PR');
insert into Municipio values (19133,'LAPA','LAPA','PR');
insert into Municipio values (19134,'LARANJEIRAS DO SUL','LARANJEIRAS SUL','PR');
insert into Municipio values (19135,'LEOPOLIS','LEOPOLIS','PR');
insert into Municipio values (19136,'LOANDA','LOANDA','PR');
insert into Municipio values (19137,'LOBATO','LOBATO','PR');
insert into Municipio values (19138,'LONDRINA','LONDRINA','PR');
insert into Municipio values (19139,'LUPIONOPOLIS','LUPIONOPOLIS','PR');
insert into Municipio values (19140,'MARECHAL CANDIDO RONDON','MAL.CAND.RONDON','PR');
insert into Municipio values (19141,'MALLET','MALLET','PR');
insert into Municipio values (19142,'MAMBORE','MAMBORE','PR');
insert into Municipio values (19143,'MANDAGUACU','MANDAGUACU','PR');
insert into Municipio values (19144,'MANDAGUARI','MANDAGUARI','PR');
insert into Municipio values (19145,'MANDIRITUBA','MANDIRITUBA','PR');
insert into Municipio values (19146,'MANGUEIRINHA','MANGUEIRINHA','PR');
insert into Municipio values (19147,'MANOEL RIBAS','MANOEL RIBAS','PR');
insert into Municipio values (19148,'MARIA HELENA','MARIA HELENA','PR');
insert into Municipio values (19149,'MARIALVA','MARIALVA','PR');
insert into Municipio values (19150,'MARILANDIA DO SUL','MARILANDIA SUL','PR');
insert into Municipio values (19151,'MARILENA','MARILENA','PR');
insert into Municipio values (19152,'MARILUZ','MARILUZ','PR');
insert into Municipio values (19153,'MARINGA','MARINGA','PR');
insert into Municipio values (19154,'MARIOPOLIS','MARIOPOLIS','PR');
insert into Municipio values (19155,'MARMELEIRO','MARMELEIRO','PR');
insert into Municipio values (19156,'MARUMBI','MARUMBI','PR');
insert into Municipio values (19157,'MATELANDIA','MATELANDIA','PR');
insert into Municipio values (19158,'MATINHOS','MATINHOS','PR');
insert into Municipio values (19159,'MEDIANEIRA','MEDIANEIRA','PR');
insert into Municipio values (19160,'MIRADOR','MIRADOR','PR');
insert into Municipio values (19161,'MIRASELVA','MIRASELVA','PR');
insert into Municipio values (19162,'MOREIRA SALES','MOREIRA SALES','PR');
insert into Municipio values (19163,'MORRETES','MORRETES','PR');
insert into Municipio values (19164,'MUNHOZ DE MELLO','MUNHOZ DE MELO','PR');
insert into Municipio values (19165,'NOSSA SENHORA DAS GRACAS','N.SRA.DAS GRACAS','PR');
insert into Municipio values (19166,'NOVA ALIANCA DO IVAI','N.ALIANCA IVAI','PR');
insert into Municipio values (19167,'NOVA AMERICA DA COLINA','N.A.DA COLINA','PR');
insert into Municipio values (19168,'NOVA AURORA','NOVA AURORA','PR');
insert into Municipio values (19169,'NOVA CANTU','NOVA CANTU','PR');
insert into Municipio values (19170,'NOVA ESPERANCA','NOVA ESPERANCA','PR');
insert into Municipio values (19171,'NOVA FATIMA','NOVA FATIMA','PR');
insert into Municipio values (19172,'NOVA LONDRINA','NOVA LONDRINA','PR');
insert into Municipio values (19173,'NOVA OLIMPIA','NOVA OLIMPIA','PR');
insert into Municipio values (19174,'ORTIGUEIRA','ORTIGUEIRA','PR');
insert into Municipio values (19175,'OURIZONA','OURIZONA','PR');
insert into Municipio values (19176,'PAICANDU','PAICANDU','PR');
insert into Municipio values (19177,'PALMAS','PALMAS','PR');
insert into Municipio values (19178,'PALMEIRA','PALMEIRA','PR');
insert into Municipio values (19179,'PALMITAL','PALMITAL','PR');
insert into Municipio values (19180,'PALOTINA','PALOTINA','PR');
insert into Municipio values (19181,'PARAISO DO NORTE','PARAISO NORTE','PR');
insert into Municipio values (19182,'PARANACITY','PARANACITY','PR');
insert into Municipio values (19183,'PARANAGUA','PARANAGUA','PR');
insert into Municipio values (19184,'PARANAPOEMA','PARANAPOEMA','PR');
insert into Municipio values (19185,'PARANAVAI','PARANAVAI','PR');
insert into Municipio values (19186,'PATO BRANCO','PATO BRANCO','PR');
insert into Municipio values (19187,'PAULA FREITAS','PAULA FREITAS','PR');
insert into Municipio values (19188,'PAULO FRONTIN','PAULO FRONTIN','PR');
insert into Municipio values (19189,'PEABIRU','PEABIRU','PR');
insert into Municipio values (19190,'PEROLA','PEROLA','PR');
insert into Municipio values (19191,'PEROLA DO OESTE','PEROLA D´OESTE','PR');
insert into Municipio values (19192,'PIEN','PIEN','PR');
insert into Municipio values (19193,'PINHALAO','PINHALAO','PR');
insert into Municipio values (19194,'PINHAO','PINHAO','PR');
insert into Municipio values (19195,'PIRAI DO SUL','PIRAI DO SUL','PR');
insert into Municipio values (19196,'PIRAQUARA','PIRAQUARA','PR');
insert into Municipio values (19197,'PITANGA','PITANGA','PR');
insert into Municipio values (19198,'PLANALTINA DO PARANA','PLANALT.PARANA','PR');
insert into Municipio values (19199,'PLANALTO','PLANALTO','PR');
insert into Municipio values (19200,'PONTA GROSSA','PONTA GROSSA','PR');
insert into Municipio values (19201,'PORECATU','PORECATU','PR');
insert into Municipio values (19202,'PORTO AMAZONAS','PORTO AMAZONAS','PR');
insert into Municipio values (19203,'PORTO RICO','PORTO RICO','PR');
insert into Municipio values (19204,'PORTO VITORIA','PORTO VITORIA','PR');
insert into Municipio values (19205,'PRESIDENTE CASTELO BRANCO','PRES.C.BRANCO','PR');
insert into Municipio values (19206,'PRIMEIRO DE MAIO','PRIMEIRO MAIO','PR');
insert into Municipio values (19207,'PRUDENTOPOLIS','PRUDENTOPOLIS','PR');
insert into Municipio values (19208,'QUATIGUA','QUATIGUA','PR');
insert into Municipio values (19209,'QUATRO BARRAS','QUATRO BARRAS','PR');
insert into Municipio values (19210,'QUERENCIA DO NORTE','QUERENCIA NORTE','PR');
insert into Municipio values (19211,'QUINTA DO SOL','QUINTA DO SOL','PR');
insert into Municipio values (19212,'QUITANDINHA','QUITANDINHA','PR');
insert into Municipio values (19213,'RANCHO ALEGRE','RANCHO ALEGRE','PR');
insert into Municipio values (19214,'REALEZA','REALEZA','PR');
insert into Municipio values (19215,'REBOUCAS','REBOUCAS','PR');
insert into Municipio values (19216,'RENASCENCA','RENASCENCA','PR');
insert into Municipio values (19217,'RESERVA','RESERVA','PR');
insert into Municipio values (19218,'RIBEIRAO CLARO','RIBEIRAO CLARO','PR');
insert into Municipio values (19219,'RIBEIRAO DO PINHAL','RIBEIRAO PINHAL','PR');
insert into Municipio values (19220,'RIO AZUL','RIO AZUL','PR');
insert into Municipio values (19221,'RIO BOM','RIO BOM','PR');
insert into Municipio values (19222,'RIO BRANCO DO SUL','R.BRANCO DO SUL','PR');
insert into Municipio values (19223,'RIO NEGRO','RIO NEGRO','PR');
insert into Municipio values (19224,'ROLANDIA','ROLANDIA','PR');
insert into Municipio values (19225,'RONCADOR','RONCADOR','PR');
insert into Municipio values (19226,'RONDON','RONDON','PR');
insert into Municipio values (19227,'SANTA AMELIA','SANTA AMELIA','PR');
insert into Municipio values (19228,'SANTO ANTONIO DA PLATINA','STO.ANT.PLATINA','PR');
insert into Municipio values (19229,'SANTO ANTONIO DO CAIUA','SANTO ANT.CAIUA','PR');
insert into Municipio values (19230,'SANTO ANTONIO DO PARAISO','STO.ANT.PARAISO','PR');
insert into Municipio values (19231,'SANTO ANTONIO DO SUDOESTE','S.ANT.SUDOESTE','PR');
insert into Municipio values (19232,'SAO CARLOS DO IVAI','SAO CARLOS IVAI','PR');
insert into Municipio values (19233,'SANTA CECILIA DO PAVAO','STA.CEC.PAVAO','PR');
insert into Municipio values (19234,'SANTA CRUZ MONT CASTELO','S.C.M.CASTELO','PR');
insert into Municipio values (19235,'SANTA FE','SANTA FE','PR');
insert into Municipio values (19236,'SANTA HELENA','SANTA HELENA','PR');
insert into Municipio values (19237,'SANTO INACIO','SANTO INACIO','PR');
insert into Municipio values (19238,'SANTA INES','SANTA INES','PR');
insert into Municipio values (19239,'SANTA ISABEL DO IVAI','STA.ISABEL IVAI','PR');
insert into Municipio values (19240,'SANTA IZABEL DO OESTE','S.IZABEL OESTE','PR');
insert into Municipio values (19241,'SAO JERONIMO DA SERRA','S.JERON.SERRA','PR');
insert into Municipio values (19242,'SAO JOAO','SAO JOAO','PR');
insert into Municipio values (19243,'SAO JOAO DO CAIUA','S.JOAO CAIUA','PR');
insert into Municipio values (19244,'SAO JOAO DO IVAI','SAO JOAO IVAI','PR');
insert into Municipio values (19245,'SAO JOAO DO TRIUNFO','S.JOAO TRIUNFO','PR');
insert into Municipio values (19247,'SAO JORGE D´OESTE','S.JORGE D´OESTE','PR');
insert into Municipio values (19248,'SAO JOSE DA BOA VISTA','S.J.BOA VISTA','PR');
insert into Municipio values (19249,'SAO JOSE DOS PINHAIS','S.JOSE PINHAIS','PR');
insert into Municipio values (19250,'SANTA MARIANA','SANTA MARIANA','PR');
insert into Municipio values (19251,'SAO MATEUS DO SUL','S.MATEUS DO SUL','PR');
insert into Municipio values (19252,'SAO MIGUEL DO IGUACU','S.MIGUEL IGUACU','PR');
insert into Municipio values (19253,'SAO PEDRO DO IVAI','SAO PEDRO IVAI','PR');
insert into Municipio values (19254,'SAO PEDRO DO PARANA','S.PEDRO PARANA','PR');
insert into Municipio values (19255,'SAO SEBASTIAO DA AMOREIRA','S.SEB.AMOREIRA','PR');
insert into Municipio values (19256,'SAO TOME','SAO TOME','PR');
insert into Municipio values (19257,'SABAUDIA','SABAUDIA','PR');
insert into Municipio values (19258,'SALGADO FILHO','SALGADO FILHO','PR');
insert into Municipio values (19259,'SALTO DO ITARARE','SALTO ITARARE','PR');
insert into Municipio values (19260,'SALTO DO LONTRA','SALTO DO LONTRA','PR');
insert into Municipio values (19261,'SANTANA DO ITARARE','SANTANA ITARARE','PR');
insert into Municipio values (19262,'SAPOPEMA','SAPOPEMA','PR');
insert into Municipio values (19263,'SENGES','SENGES','PR');
insert into Municipio values (19264,'SERTANEJA','SERTANEJA','PR');
insert into Municipio values (19265,'SERTANOPOLIS','SERTANOPOLIS','PR');
insert into Municipio values (19266,'SIQUEIRA CAMPOS','SIQUEIRA CAMPOS','PR');
insert into Municipio values (19267,'TAMBOARA','TAMBOARA','PR');
insert into Municipio values (19268,'TAPEJARA','TAPEJARA','PR');
insert into Municipio values (19269,'TAPIRA','TAPIRA','PR');
insert into Municipio values (19270,'TEIXEIRA SOARES','TEIXEIRA SOARES','PR');
insert into Municipio values (19271,'TELEMACO BORBA','TELEMACO BORBA','PR');
insert into Municipio values (19272,'TERRA BOA','TERRA BOA','PR');
insert into Municipio values (19273,'TERRA RICA','TERRA RICA','PR');
insert into Municipio values (19274,'TERRA ROXA','TERRA ROXA','PR');
insert into Municipio values (19275,'TIBAGI','TIBAGI','PR');
insert into Municipio values (19276,'TIJUCAS DO SUL','TIJUCAS DO SUL','PR');
insert into Municipio values (19277,'TOLEDO','TOLEDO','PR');
insert into Municipio values (19278,'TOMAZINA','TOMAZINA','PR');
insert into Municipio values (19279,'TUNEIRAS DO OESTE','TUN.D´OESTE','PR');
insert into Municipio values (19280,'UBIRATA','UBIRATA','PR');
insert into Municipio values (19281,'UMUARAMA','UMUARAMA','PR');
insert into Municipio values (19282,'UNIAO DA VITORIA','UNIAO VITORIA','PR');
insert into Municipio values (19283,'UNIFLOR','UNIFLOR','PR');
insert into Municipio values (19284,'URAI','URAI','PR');
insert into Municipio values (19285,'WENCESLAU BRAZ','WENCESLAU BRAZ','PR');
insert into Municipio values (19286,'VERE','VERE','PR');
insert into Municipio values (19287,'VITORINO','VITORINO','PR');
insert into Municipio values (19288,'XAMBRE','XAMBRE','PR');
insert into Municipio values (19289,'IVATUBA','IVATUBA','PR');
insert into Municipio values (19296,'FRANCISCO ALVES','FRANCISCO ALVES','PR');
insert into Municipio values (19304,'NOVA SANTA ROSA','NOVA SANTA ROSA','PR');
insert into Municipio values (19309,'QUEDAS DO IGUACU','QUEDAS IGUACU','PR');
insert into Municipio values (19317,'FORMOSA DO OESTE','FORMOSA D´OESTE','PR');
insert into Municipio values (19321,'SAO JORGE DO IVAI','S.JORGE DO IVAI','PR');
insert into Municipio values (19326,'ALTAMIRA DO PARANA','ALTAMIRA PARANA','PR');
insert into Municipio values (19327,'BRAGANEY','BRAGANEY','PR');
insert into Municipio values (19328,'CAFELANDIA','CAFELANDIA','PR');
insert into Municipio values (19329,'CANTAGALO','CANTAGALO','PR');
insert into Municipio values (19330,'DOURADINA','DOURADINA','PR');
insert into Municipio values (19331,'FIGUEIRA','FIGUEIRA','PR');
insert into Municipio values (19332,'JURANDA','JURANDA','PR');
insert into Municipio values (19333,'LUNARDELLI','LUNARDELLI','PR');
insert into Municipio values (19334,'MISSAL','MISSAL','PR');
insert into Municipio values (19335,'NOVA PRATA DO IGUACU','N.PRATA IGUACU','PR');
insert into Municipio values (19336,'PRANCHITA','PRANCHITA','PR');
insert into Municipio values (19337,'SAO JORGE DO PATROCINIO','S.J.PATROCINIO','PR');
insert into Municipio values (19338,'SANTA TEREZINHA DE ITAIPU','STA.TER.ITAIPU','PR');
insert into Municipio values (19339,'SARANDI','SARANDI','PR');
insert into Municipio values (19340,'TRES BARRAS DO PARANA','T.BARRAS PARANA','PR');
insert into Municipio values (19341,'TUPASSI','TUPASSI','PR');
insert into Municipio values (19342,'TURVO','TURVO','PR');
insert into Municipio values (19343,'VERA CRUZ DO OESTE','VERA CRUZ OESTE','PR');
insert into Municipio values (19344,'BOA VISTA DA APARECIDA','B.V.APARECIDA','PR');
insert into Municipio values (19345,'JESUITAS','JESUITAS','PR');
insert into Municipio values (19346,'SAO JOSE DAS PALMEIRAS','S.JOSE PALMEIRAS','PR');
insert into Municipio values (19349,'CAMPO BONITO','CAMPO BONITO','PR');
insert into Municipio values (19350,'CORUMBATAI DO SUL','CORUMBATAI SUL','PR');
insert into Municipio values (19351,'DIAMANTE D´OESTE','DIAMANTE D´OESTE','PR');
insert into Municipio values (19352,'ROSARIO DO IVAI','ROSARIO IVAI','PR');
insert into Municipio values (19353,'NOVA TEBAS','NOVA TEBAS','PR');
insert into Municipio values (19354,'SULINA','SULINA','PR');
insert into Municipio values (19355,'LUIZIANA','LUIZIANA','PR');
insert into Municipio values (19356,'IBEMA','IBEMA','PR');
insert into Municipio values (19357,'OURO VERDE DO OESTE','OURO VERDE OESTE','PR');
insert into Municipio values (19358,'GODOY MOREIRA','GODOY MOREIRA','PR');
insert into Municipio values (19359,'SANTA TEREZA DO OESTE','STA TEREZA OESTE','PR');
insert into Municipio values (19360,'LINDOESTE','LINDOESTE','PR');
insert into Municipio values (19362,'IGUATU','IGUATU','PR');
insert into Municipio values (19363,'NOVO ITACOLOMI','NOVO ITACOLOMI','PR');
insert into Municipio values (19365,'PITANGUEIRAS','PITANGUEIRAS','PR');
insert into Municipio values (19366,'PRADO FERREIRA','PRADO FERREIRA','PR');
insert into Municipio values (19368,'LARANJAL','LARANJAL','PR');
insert into Municipio values (19370,'SAO PEDRO DO IGUACU','S.PEDRO IGUACU','PR');
insert into Municipio values (19371,'MAUA DA SERRA','MAUA DA SERRA','PR');
insert into Municipio values (19372,'NOVA ESPERANCA DO SUDOESTE','N.E.SUDOESTE/PR','PR');
insert into Municipio values (19373,'NOVA LARANJEIRAS','N.LARANJEIRAS','PR');
insert into Municipio values (19374,'PINHAL DO SAO BENTO','PINHAL S.BENTO','PR');
insert into Municipio values (19375,'VENTANIA','VENTANIA','PR');
insert into Municipio values (19376,'ANGULO','ANGULO','PR');
insert into Municipio values (19377,'BRASILANDIA DO SUL','BRASILANDIA SUL','PR');
insert into Municipio values (19378,'CANDOI','CANDOI','PR');
insert into Municipio values (19379,'CARAMBEI','CARAMBEI','PR');
insert into Municipio values (19380,'CORONEL DOMINGOS SOARES','C.DOMINGO SOARES','PR');
insert into Municipio values (19383,'MERCEDES','MERCEDES','PR');
insert into Municipio values (19384,'QUATRO PONTES','QUATRO PONTES','PR');
insert into Municipio values (19385,'SAO MANOEL DO PARANA','S MANOEL PARANA','PR');
insert into Municipio values (19386,'FAROL','FAROL','PR');
insert into Municipio values (19388,'LIDIANOPOLIS','LIDIANOPOLIS','PR');
insert into Municipio values (19389,'ANAHY','ANAHY','PR');
insert into Municipio values (19391,'IRACEMA DO OESTE','IRACEMA DO OESTE','PR');
insert into Municipio values (19392,'RANCHO ALEGRE DO OESTE','RANCHO AL.DOESTE','PR');
insert into Municipio values (19393,'DIAMANTE DO SUL','DIAMANTE DO SUL','PR');
insert into Municipio values (19395,'SANTA MARIA DO OESTE','S.MARIA DO OESTE','PR');
insert into Municipio values (19396,'BOM SUCESSO DO SUL','BOM SUCESSO SUL','PR');
insert into Municipio values (19397,'FAZENDA RIO GRANDE','FAZ. RIO GRANDE','PR');
insert into Municipio values (19398,'HONORIO SERPA','HONORIO SERPA','PR');
insert into Municipio values (19399,'IVATE','IVATE','PR');
insert into Municipio values (19400,'BOA ESPERANCA DO IGUACU','BOA ESPER.IGUACU','PR');
insert into Municipio values (19401,'CAFEZAL DO SUL','CAFEZAL DO SUL','PR');
insert into Municipio values (19402,'CRUZEIRO DO IGUACU','CRUZEIRO IGUACU','PR');
insert into Municipio values (19403,'ENTRE RIOS DO OESTE','ENTRE RIOS OESTE','PR');
insert into Municipio values (19404,'FLOR DA SERRA DO SUL','FLOR SERRA SUL','PR');
insert into Municipio values (19405,'ITAIPULANDIA','ITAIPULANDIA','PR');
insert into Municipio values (19406,'ITAPERUCU','ITAPERUCU','PR');
insert into Municipio values (19407,'MARIPA','MARIPA','PR');
insert into Municipio values (19408,'MATO RICO','MATO RICO','PR');
insert into Municipio values (19409,'NOVA SANTA BARBARA','NOVA STA BARBARA','PR');
insert into Municipio values (19410,'PATO BRAGADO','PATO BRAGADO/PR','PR');
insert into Municipio values (19411,'PINHAIS','PINHAIS','PR');
insert into Municipio values (19412,'RAMILANDIA','RAMILANDIA','PR');
insert into Municipio values (19413,'RIO BONITO DO IGUACU','R. BONITO IGUACU','PR');
insert into Municipio values (19414,'SANTA LUCIA','SANTA LUCIA','PR');
insert into Municipio values (19415,'SANTA MONICA','SANTA MONICA','PR');
insert into Municipio values (19416,'SAUDADE DO IGUACU','SAUDADE IGUACU','PR');
insert into Municipio values (19417,'TUNAS','TUNAS','PR');
insert into Municipio values (19418,'VILA ALTA','VILA ALTA','PR');
insert into Municipio values (19419,'VIRMOND','VIRMOND','PR');
insert into Municipio values (19420,'DOUTOR ULYSSES','DOUTOR ULYSSES','PR');
insert into Municipio values (19421,'QUARTO CENTENARIO','Q. CENTENARIO','PR');
insert into Municipio values (19422,'ARAPUA','ARAPUA','PR');
insert into Municipio values (19423,'ARIRANHA DO IVAI','ARIRANHA DO IVAI','PR');
insert into Municipio values (19424,'BELA VISTA DA CAROBA','B. VISTA CAROBA','PR');
insert into Municipio values (19425,'BOA VENTURA DE SAO ROQUE','B.VENT.SAO ROQUE','PR');
insert into Municipio values (19426,'BOM JESUS DO SUL','BOM JESUS DO SUL','PR');
insert into Municipio values (19427,'CAMPINA DO SIMAO','CAMPINA DO SIMAO','PR');
insert into Municipio values (19428,'CAMPO MAGRO','CAMPO MAGRO','PR');
insert into Municipio values (19429,'CRUZMALTINA','CRUZMALTINA','PR');
insert into Municipio values (19430,'ESPERANCA NOVA','ESPERANCA NOVA','PR');
insert into Municipio values (19431,'ESPIGAO ALTO DO IGUACU','ESPIGAO A.IGUACU','PR');
insert into Municipio values (19432,'FERNANDES PINHEIRO','F. PINHEIRO','PR');
insert into Municipio values (19433,'FOZ DO JORDAO','FOZ DO JORDAO','PR');
insert into Municipio values (19434,'GOIOXIM','GOIOXIM','PR');
insert into Municipio values (19435,'GUAMIRANGA','GUAMIRANGA','PR');
insert into Municipio values (19436,'IMBAU','IMBAU','PR');
insert into Municipio values (19437,'MANFRINOPOLIS','MANFRINOPOLIS','PR');
insert into Municipio values (19438,'MARQUINHO','MARQUINHO','PR');
insert into Municipio values (19439,'PEROBAL','PEROBAL','PR');
insert into Municipio values (19440,'PONTAL DO PARANA','PONTAL DO PARANA','PR');
insert into Municipio values (19441,'PORTO BARREIRO','PORTO BARREIRO','PR');
insert into Municipio values (19442,'RESERVA DO IGUACU','RESERVA IGUACU','PR');
insert into Municipio values (19443,'RIO BRANCO DO IVAI','RIO BRANCO IVAI','PR');
insert into Municipio values (19444,'SERRANOPOLIS DO IGUACU','S. DO IGUACU','PR');
insert into Municipio values (19445,'TAMARANA','TAMARANA','PR');
insert into Municipio values (20001,'ANGRA DOS REIS','ANGRA DOS REIS','RJ');
insert into Municipio values (20002,'ARARUAMA','ARARUAMA','RJ');
insert into Municipio values (20003,'BARRA DO PIRAI','BARRA DO PIRAI','RJ');
insert into Municipio values (20004,'BARRA MANSA','BARRA MANSA','RJ');
insert into Municipio values (20005,'BOM JARDIM','BOM JARDIM','RJ');
insert into Municipio values (20006,'BOM JESUS DO ITABAPOANA','B.J.ITABAPOANA','RJ');
insert into Municipio values (20007,'CABO FRIO','CABO FRIO','RJ');
insert into Municipio values (20008,'CACHOEIRAS DE MACACU','CACH.DE MACACU','RJ');
insert into Municipio values (20009,'CAMBUCI','CAMBUCI','RJ');
insert into Municipio values (20011,'CANTAGALO','CANTAGALO','RJ');
insert into Municipio values (20012,'CARMO','CARMO','RJ');
insert into Municipio values (20013,'CASIMIRO DE ABREU','CASIMIRO ABREU','RJ');
insert into Municipio values (20014,'CONCEICAO DE MACABU','CONCEICAO MACABU','RJ');
insert into Municipio values (20015,'CORDEIRO','CORDEIRO','RJ');
insert into Municipio values (20016,'DUAS BARRAS','DUAS BARRAS','RJ');
insert into Municipio values (20017,'DUQUE DE CAXIAS','DUQUE DE CAXIAS','RJ');
insert into Municipio values (20018,'ENGENHEIRO PAULO DE FRONTIN','E.PAULO FRONTIM','RJ');
insert into Municipio values (20019,'ITABORAI','ITABORAI','RJ');
insert into Municipio values (20020,'ITAGUAI','ITAGUAI','RJ');
insert into Municipio values (20021,'ITAOCARA','ITAOCARA','RJ');
insert into Municipio values (20022,'ITAPERUNA','ITAPERUNA','RJ');
insert into Municipio values (20023,'LAJE DO MURIAE','LAJE DO MURIAE','RJ');
insert into Municipio values (20024,'MACAE','MACAE','RJ');
insert into Municipio values (20025,'MAGE','MAGE','RJ');
insert into Municipio values (20026,'MANGARATIBA','MANGARATIBA','RJ');
insert into Municipio values (20027,'MARICA','MARICA','RJ');
insert into Municipio values (20028,'MENDES','MENDES','RJ');
insert into Municipio values (20029,'MIGUEL PEREIRA','MIGUEL PEREIRA','RJ');
insert into Municipio values (20030,'MIRACEMA','MIRACEMA','RJ');
insert into Municipio values (20031,'NATIVIDADE','NATIVIDADE','RJ');
insert into Municipio values (20032,'NILOPOLIS','NILOPOLIS','RJ');
insert into Municipio values (20033,'NITEROI','NITEROI','RJ');
insert into Municipio values (20034,'NOVA FRIBURGO','NOVA FRIBURGO','RJ');
insert into Municipio values (20035,'NOVA IGUACU','NOVA IGUACU','RJ');
insert into Municipio values (20036,'PARACAMBI','PARACAMBI','RJ');
insert into Municipio values (20037,'PARAIBA DO SUL','PARAIBA DO SUL','RJ');
insert into Municipio values (20038,'PARATI','PARATI','RJ');
insert into Municipio values (20039,'PETROPOLIS','PETROPOLIS','RJ');
insert into Municipio values (20040,'PIRAI','PIRAI','RJ');
insert into Municipio values (20041,'PORCIUNCULA','PORCIUNCULA','RJ');
insert into Municipio values (20042,'RESENDE','RESENDE','RJ');
insert into Municipio values (20043,'RIO BONITO','RIO BONITO','RJ');
insert into Municipio values (20044,'RIO CLARO','RIO CLARO','RJ');
insert into Municipio values (20045,'RIO DAS FLORES','RIO DAS FLORES','RJ');
insert into Municipio values (20046,'SAO SEBASTIAO DO ALTO','S.SEBASTIAO ALTO','RJ');
insert into Municipio values (20047,'SANTO ANTONIO DE PADUA','STO.ANT.PADUA','RJ');
insert into Municipio values (20048,'SAO FIDELIS','SAO FIDELIS','RJ');
insert into Municipio values (20049,'SAO GONCALO','SAO GONCALO','RJ');
insert into Municipio values (20050,'SAO JOAO DA BARRA','SAO JOAO BARRA','RJ');
insert into Municipio values (20051,'SAO JOAO DO MERITI','S.JOAO MERITI','RJ');
insert into Municipio values (20052,'SANTA MARIA MADALENA','S.MARIA MADALENA','RJ');
insert into Municipio values (20053,'SAO PEDRO DA ALDEIA','S.PEDRO ALDEIA','RJ');
insert into Municipio values (20054,'SAPUCAIA','SAPUCAIA','RJ');
insert into Municipio values (20055,'SAQUAREMA','SAQUAREMA','RJ');
insert into Municipio values (20056,'SILVA JARDIM','SILVA JARDIM','RJ');
insert into Municipio values (20057,'SUMIDOURO','SUMIDOURO','RJ');
insert into Municipio values (20058,'TERESOPOLIS','TERESOPOLIS','RJ');
insert into Municipio values (20059,'TRAJANO DE MORAES','TRAJANO MORAES','RJ');
insert into Municipio values (20060,'TRES RIOS','TRES RIOS','RJ');
insert into Municipio values (20061,'VALENCA','VALENCA','RJ');
insert into Municipio values (20062,'VASSOURAS','VASSOURAS','RJ');
insert into Municipio values (20063,'VOLTA REDONDA','VOLTA REDONDA','RJ');
insert into Municipio values (20069,'AREAL','AREAL','RJ');
insert into Municipio values (20070,'ARRAIAL DO CABO','ARRAIAL DO CABO','RJ');
insert into Municipio values (20077,'BELFORD ROXO','BELFORD ROXO','RJ');
insert into Municipio values (20080,'CARDOSO MOREIRA','CARDOSO MOREIRA','RJ');
insert into Municipio values (20089,'IGUABA GRANDE','IGUABA GRANDE','RJ');
insert into Municipio values (20095,'ITALVA','ITALVA','RJ');
insert into Municipio values (20097,'ITATIAIA','ITATIAIA','RJ');
insert into Municipio values (20098,'JAPERI','JAPERI','RJ');
insert into Municipio values (20101,'MACUCO','MACUCO','RJ');
insert into Municipio values (20111,'PINHEIRAL','PINHEIRAL','RJ');
insert into Municipio values (20115,'QUEIMADOS','QUEIMADOS','RJ');
insert into Municipio values (20116,'QUISSAMA','QUISSAMA','RJ');
insert into Municipio values (20117,'RIO DAS OSTRAS','RIO DAS OSTRAS','RJ');
insert into Municipio values (20128,'SEROPEDICA','SEROPEDICA','RJ');
insert into Municipio values (20133,'RIO DE JANEIRO','RIO DE JANEIRO','RJ');
insert into Municipio values (20134,'CAMPOS DOS GOITACAZES','CAMP. GOITACAZES','RJ');
insert into Municipio values (20135,'SAO JOSE DO VALE DO RIO PRETO','S.J.V.RIO PRETO','RJ');
insert into Municipio values (20136,'GUAPIMIRIM','GUAPIMIRIM','RJ');
insert into Municipio values (20137,'QUATIS','QUATIS','RJ');
insert into Municipio values (20138,'PATY DOS ALFERES','PATY DOS ALFERES','RJ');
insert into Municipio values (20139,'APERIBE','APERIBE','RJ');
insert into Municipio values (20140,'ARMACAO DE BUZIOS','ARMACAO BUZIOS','RJ');
insert into Municipio values (20141,'COMENDADOR LEVY GASPARIAN','COM.LEVY GASPAR.','RJ');
insert into Municipio values (20142,'PORTO REAL','PORTO REAL','RJ');
insert into Municipio values (20143,'SAO JOSE DE UBA','SAO JOSE DE UBA','RJ');
insert into Municipio values (20144,'TANGUA','TANGUA','RJ');
insert into Municipio values (20145,'VARRE SAI','VARRE SAI','RJ');
insert into Municipio values (20146,'CARAPEBUS','CARAPEBUS','RJ');
insert into Municipio values (20147,'SAO FRANCISCO DE ITABAPOANA','S.F.ITABAPOANA','RJ');
insert into Municipio values (20148,'MESQUITA','MESQUITA','RJ');
insert into Municipio values (21001,'ACARI','ACARI','RN');
insert into Municipio values (21002,'ACU','ACU','RN');
insert into Municipio values (21003,'AFONSO BEZERRA','AFONSO BEZERRA','RN');
insert into Municipio values (21004,'AGUA NOVA','AGUA NOVA','RN');
insert into Municipio values (21005,'ALEXANDRIA','ALEXANDRIA','RN');
insert into Municipio values (21006,'ALMINO AFONSO','ALMINO AFONSO','RN');
insert into Municipio values (21007,'ALTO DO RODRIGUES','ALTO RODRIGUES','RN');
insert into Municipio values (21008,'ANGICOS','ANGICOS','RN');
insert into Municipio values (21009,'ANTONIO MARTINS','ANTONIO MARTINS','RN');
insert into Municipio values (21010,'APODI','APODI','RN');
insert into Municipio values (21011,'AREIA BRANCA','AREIA BRANCA','RN');
insert into Municipio values (21012,'ARES','ARES','RN');
insert into Municipio values (21013,'AUGUSTO SEVERO','AUGUSTO SEVERO','RN');
insert into Municipio values (21014,'BAIA FORMOSA','BAIA FORMOSA','RN');
insert into Municipio values (21015,'BARCELONA','BARCELONA','RN');
insert into Municipio values (21016,'BENTO FERNANDES','BENTO FERNANDES','RN');
insert into Municipio values (21017,'BOM JESUS','BOM JESUS','RN');
insert into Municipio values (21018,'BREJINHO','BREJINHO','RN');
insert into Municipio values (21019,'CAICARA DO RIO DO VENTO','CAIC.RIO VENTO','RN');
insert into Municipio values (21020,'CAICO','CAICO','RN');
insert into Municipio values (21021,'CAMPO REDONDO','CAMPO REDONDO','RN');
insert into Municipio values (21022,'CANGUARETAMA','CANGUARETAMA','RN');
insert into Municipio values (21023,'CARAUBAS','CARAUBAS','RN');
insert into Municipio values (21024,'CARNAUBA DOS DANTAS','CARNAUBA DANTAS','RN');
insert into Municipio values (21025,'CARNAUBAIS','CARNAUBAIS','RN');
insert into Municipio values (21026,'CEARA-MIRIM','CEARA-MIRIM','RN');
insert into Municipio values (21027,'CERRO-CORA','CERRO-CORA','RN');
insert into Municipio values (21028,'CORONEL EZEQUIEL','CEL.EZEQUIEL','RN');
insert into Municipio values (21029,'CORONEL JOAO Pessoa','CEL.JOAO Pessoa','RN');
insert into Municipio values (21030,'CRUZETA','CRUZETA','RN');
insert into Municipio values (21031,'CURRAIS NOVOS','CURRAIS NOVOS','RN');
insert into Municipio values (21032,'DOUTOR SEVERIANO','DR.SEVERIANO','RN');
insert into Municipio values (21033,'ENCANTO','ENCANTO','RN');
insert into Municipio values (21034,'EQUADOR','EQUADOR','RN');
insert into Municipio values (21035,'ESPIRITO SANTO','ESPIRITO SANTO','RN');
insert into Municipio values (21036,'EXTREMOZ','EXTREMOZ','RN');
insert into Municipio values (21037,'FELIPE GUERRA','FELIPE GUERRA','RN');
insert into Municipio values (21038,'FLORANIA','FLORANIA','RN');
insert into Municipio values (21039,'FRANCISCO DANTAS','FRANC.DANTAS','RN');
insert into Municipio values (21040,'FRUTUOSO GOMES','FRUTUOSO GOMES','RN');
insert into Municipio values (21041,'GALINHOS','GALINHOS','RN');
insert into Municipio values (21042,'GOIANINHA','GOIANINHA','RN');
insert into Municipio values (21043,'GOVERNADOR DIX-SEPT ROSADO','DIX-SEPT ROSADO','RN');
insert into Municipio values (21044,'GROSSOS','GROSSOS','RN');
insert into Municipio values (21045,'GUAMARE','GUAMARE','RN');
insert into Municipio values (21046,'IELMO MARINHO','IELMO MARINHO','RN');
insert into Municipio values (21047,'IPANGUACU','IPANGUACU','RN');
insert into Municipio values (21048,'IPUEIRA','IPUEIRA','RN');
insert into Municipio values (21049,'ITAU','ITAU','RN');
insert into Municipio values (21050,'JACANA','JACANA','RN');
insert into Municipio values (21051,'JANDAIRA','JANDAIRA','RN');
insert into Municipio values (21052,'JANDUIS','JANDUIS','RN');
insert into Municipio values (21053,'JANUARIO CICCO','JANUARIO CICCO','RN');
insert into Municipio values (21054,'JAPI','JAPI','RN');
insert into Municipio values (21055,'JARDIM DE ANGICOS','JARDIM ANGICOS','RN');
insert into Municipio values (21056,'JARDIM DE PIRANHAS','JARDIM PIRANHAS','RN');
insert into Municipio values (21057,'JARDIM DO SERIDO','JARDIM SERIDO','RN');
insert into Municipio values (21058,'JOAO CAMARA','JOAO CAMARA','RN');
insert into Municipio values (21059,'JOAO DIAS','JOAO DIAS','RN');
insert into Municipio values (21060,'JOSE DA PENHA','JOSE DA PENHA','RN');
insert into Municipio values (21061,'JUCURUTU','JUCURUTU','RN');
insert into Municipio values (21063,'LAGOA DANTA','LAGOA DANTA','RN');
insert into Municipio values (21064,'LAGOA DE PEDRAS','LAGOA DE PEDRAS','RN');
insert into Municipio values (21065,'LAGOA DE VELHOS','LAGOA DE VELHOS','RN');
insert into Municipio values (21066,'LAGOA NOVA','LAGOA NOVA','RN');
insert into Municipio values (21067,'LAGOA SALGADA','LAGOA SALGADA','RN');
insert into Municipio values (21068,'LAJES','LAJES','RN');
insert into Municipio values (21069,'LAJES PINTADAS','LAJES PINTADAS','RN');
insert into Municipio values (21070,'LUCRECIA','LUCRECIA','RN');
insert into Municipio values (21071,'LUIS GOMES','LUIS GOMES','RN');
insert into Municipio values (21072,'MACAIBA','MACAIBA','RN');
insert into Municipio values (21073,'MACAU','MACAU','RN');
insert into Municipio values (21074,'MARCELINO VIEIRA','MARC.VIEIRA','RN');
insert into Municipio values (21075,'MARTINS','MARTINS','RN');
insert into Municipio values (21076,'MAXARANGUAPE','MAXARANGUAPE','RN');
insert into Municipio values (21077,'MONTANHAS','MONTANHAS','RN');
insert into Municipio values (21078,'MONTE ALEGRE','MONTE ALEGRE','RN');
insert into Municipio values (21079,'MONTE DAS GAMELEIRAS','M.GAMELEIRAS','RN');
insert into Municipio values (21080,'MOSSORO','MOSSORO','RN');
insert into Municipio values (21081,'NATAL','NATAL','RN');
insert into Municipio values (21082,'NISIA FLORESTA','NISIA FLORESTA','RN');
insert into Municipio values (21083,'NOVA CRUZ','NOVA CRUZ','RN');
insert into Municipio values (21084,'OLHO D´AGUA BORGES','O.D´AGUA BORGES','RN');
insert into Municipio values (21085,'OURO BRANCO','OURO BRANCO','RN');
insert into Municipio values (21086,'PARANA','PARANA','RN');
insert into Municipio values (21087,'PARAU','PARAU','RN');
insert into Municipio values (21088,'PARAZINHO','PARAZINHO','RN');
insert into Municipio values (21089,'PARELHAS','PARELHAS','RN');
insert into Municipio values (21090,'PARNAMIRIM','PARNAMIRIM','RN');
insert into Municipio values (21091,'PASSA E FICA','PASSA E FICA','RN');
insert into Municipio values (21092,'PASSAGEM','PASSAGEM','RN');
insert into Municipio values (21093,'PATU','PATU','RN');
insert into Municipio values (21094,'PAU DOS FERROS','PAU DOS FERROS','RN');
insert into Municipio values (21095,'PEDRA GRANDE','PEDRA GRANDE','RN');
insert into Municipio values (21096,'PEDRA PRETA','PEDRA PRETA','RN');
insert into Municipio values (21097,'PEDRO AVELINO','PEDRO AVELINO','RN');
insert into Municipio values (21098,'PEDRO VELHO','PEDRO VELHO','RN');
insert into Municipio values (21099,'PENDENCIAS','PENDENCIAS','RN');
insert into Municipio values (21100,'PILOES','PILOES','RN');
insert into Municipio values (21101,'POCO BRANCO','POCO BRANCO','RN');
insert into Municipio values (21102,'PORTALEGRE','PORTALEGRE','RN');
insert into Municipio values (21103,'PRESIDENTE JUSCELINO','PRES.JUSCELINO','RN');
insert into Municipio values (21104,'PUREZA','PUREZA','RN');
insert into Municipio values (21105,'RAFAEL FERNANDES','RAF.FERNANDES','RN');
insert into Municipio values (21106,'RAFAEL GODEIRO','RAFAEL GODEIRO','RN');
insert into Municipio values (21107,'RIACHO DA CRUZ','RIACHO DA CRUZ','RN');
insert into Municipio values (21108,'RIACHO DE SANTANA','RIACHO SANTANA','RN');
insert into Municipio values (21109,'RIACHUELO','RIACHUELO','RN');
insert into Municipio values (21110,'RODOLFO FERNANDES','ROD.FERNANDES','RN');
insert into Municipio values (21111,'RUY BARBOSA','RUY BARBOSA','RN');
insert into Municipio values (21112,'SANTO ANTONIO','SANTO ANTONIO','RN');
insert into Municipio values (21113,'SAO BENTO DO NORTE','S.BENTO NORTE','RN');
insert into Municipio values (21114,'SAO BENTO DO TRAIRI','S.BENTO TRAIRI','RN');
insert into Municipio values (21115,'SANTA CRUZ','SANTA CRUZ','RN');
insert into Municipio values (21116,'SAO FERNANDO','SAO FERNANDO','RN');
insert into Municipio values (21117,'SAO FRANCISCO DO OESTE','S.FRANC.D´OESTE','RN');
insert into Municipio values (21118,'SAO GONCALO DO AMARANTE','S.GONC.AMARANTE','RN');
insert into Municipio values (21119,'SAO JOAO DO SABUGI','S.JOAO SABUGI','RN');
insert into Municipio values (21120,'SAO JOSE DE MIPIBU','S.JOSE MIPIBU','RN');
insert into Municipio values (21121,'SAO JOSE DO CAMPESTRE','S.J.CAMPESTRE','RN');
insert into Municipio values (21122,'SAO JOSE DO SERIDO','S.JOSE SERIDO','RN');
insert into Municipio values (21123,'SAO MIGUEL','SAO MIGUEL','RN');
insert into Municipio values (21124,'SAO PAULO DO POTENGI','S.PAULO POTENGI','RN');
insert into Municipio values (21125,'SAO PEDRO','SAO PEDRO','RN');
insert into Municipio values (21126,'SAO RAFAEL','SAO RAFAEL','RN');
insert into Municipio values (21127,'SAO TOME','SAO TOME','RN');
insert into Municipio values (21128,'SAO VICENTE','SAO VICENTE','RN');
insert into Municipio values (21129,'SERRA DO MEL','SERRA DO MEL','RN');
insert into Municipio values (21130,'SANTANA DO MATOS','SANTANA MATOS','RN');
insert into Municipio values (21131,'SENADOR ELOI DE SOUZA','SEN.ELOI SOUZA','RN');
insert into Municipio values (21132,'SENADOR GEORGINO AVELINO','SEN.G.AVELINO','RN');
insert into Municipio values (21133,'SERRA DE SAO BENTO','SERRA S.BENTO','RN');
insert into Municipio values (21134,'SERRA NEGRA DO NORTE','S.NEGRA NORTE','RN');
insert into Municipio values (21135,'SERRINHA','SERRINHA','RN');
insert into Municipio values (21136,'SEVERIANO MELO','SEVERIANO MELO','RN');
insert into Municipio values (21137,'SITIO NOVO','SITIO NOVO','RN');
insert into Municipio values (21138,'TABOLEIRO GRANDE','TABOLEIRO GRANDE','RN');
insert into Municipio values (21139,'TAIPU','TAIPU','RN');
insert into Municipio values (21140,'TANGARA','TANGARA','RN');
insert into Municipio values (21141,'TENENTE ANANIAS','TENENTE ANANIAS','RN');
insert into Municipio values (21142,'TIBAU DO SUL','TIBAU DO SUL','RN');
insert into Municipio values (21143,'TIMBAUBA DOS BATISTAS','TIMB.BATISTAS','RN');
insert into Municipio values (21144,'TOUROS','TOUROS','RN');
insert into Municipio values (21145,'UMARIZAL','UMARIZAL','RN');
insert into Municipio values (21146,'UPANEMA','UPANEMA','RN');
insert into Municipio values (21147,'VARZEA','VARZEA','RN');
insert into Municipio values (21148,'VERA CRUZ','VERA CRUZ','RN');
insert into Municipio values (21149,'VICOSA','VICOSA','RN');
insert into Municipio values (21150,'VILA FLOR','VILA FLOR','RN');
insert into Municipio values (21152,'BARAUNA','BARAUNA','RN');
insert into Municipio values (21154,'FERNANDO PEDROSA','FERNANDO PEDROSA','RN');
insert into Municipio values (21155,'MESSIAS TARGINO','MESSIAS TARGINO','RN');
insert into Municipio values (21157,'SANTANA DO SERIDO','SANTANA SERIDO','RN');
insert into Municipio values (21158,'BODO','BODO','RN');
insert into Municipio values (21159,'ITAJA','ITAJA','RN');
insert into Municipio values (21160,'MAJOR SALES','MAJOR SALES','RN');
insert into Municipio values (21161,'PORTO DE MANGUE','PORTO DE MANGUE','RN');
insert into Municipio values (21162,'SANTA MARIA','SANTA MARIA','RN');
insert into Municipio values (21163,'TIBAU','TIBAU','RN');
insert into Municipio values (21164,'CAICARA DO NORTE','CAICARA DO NORTE','RN');
insert into Municipio values (21165,'RIO DO FOGO','RIO DO FOGO','RN');
insert into Municipio values (21166,'SAO MIGUEL DE TOUROS','S.MIGUEL TOUROS','RN');
insert into Municipio values (21167,'TENENTE LAURENTINO CRUZ','T.LAURENT.CRUZ','RN');
insert into Municipio values (21168,'TRIUNFO POTIGUAR','TRIUNFO POTIGUAR','RN');
insert into Municipio values (21169,'VENHA-VER','VENHA-VER','RN');
insert into Municipio values (21170,'SERRINHA DOS PINTOS','SERRINHA PINTOS','RN');
insert into Municipio values (22001,'GUAJARA-MIRIM','GUAJARA-MIRIM','RO');
insert into Municipio values (22002,'PORTO VELHO','PORTO VELHO','RO');
insert into Municipio values (22004,'ARIQUEMES','ARIQUEMES','RO');
insert into Municipio values (22007,'PIMENTA BUENO','PIMENTA BUENO','RO');
insert into Municipio values (22012,'VILHENA','VILHENA','RO');
insert into Municipio values (22013,'CACOAL','CACOAL','RO');
insert into Municipio values (22014,'JI PARANA','JI PARANA','RO');
insert into Municipio values (22015,'JARU','JARU','RO');
insert into Municipio values (22016,'CEREJEIRAS','CEREJEIRAS','RO');
insert into Municipio values (22017,'OURO PRETO DO OESTE','OURO PRETO OESTE','RO');
insert into Municipio values (22018,'ROLIM DE MOURA','ROLIM DE MOURA','RO');
insert into Municipio values (22019,'PRESIDENTE MEDICI','PRES.MEDICI','RO');
insert into Municipio values (22021,'COSTA MARQUES','COSTA MARQUES','RO');
insert into Municipio values (22023,'COLORADO D´OESTE','COLORADO OESTE','RO');
insert into Municipio values (22025,'ESPIGAO D´OESTE','ESPIGAO D´OESTE','RO');
insert into Municipio values (22026,'MACHADINHO D´OESTE','MACHADINHO OESTE','RO');
insert into Municipio values (22027,'SANTA LUZIA D´OESTE','STA LUZIA OESTE','RO');
insert into Municipio values (22028,'ALVORADA D´OESTE','ALVORADA D´OESTE','RO');
insert into Municipio values (22029,'SAO MIGUEL DO GUAPORE','S.MIGUEL GUAPORE','RO');
insert into Municipio values (22030,'CABIXI','CABIXI','RO');
insert into Municipio values (22031,'ALTA FLORESTA D´OESTE','A.FLORESTA OESTE','RO');
insert into Municipio values (22032,'NOVA BRASILANDIA D´OESTE','N.BRASIL.D´OESTE','RO');
insert into Municipio values (22033,'VILA NOVA DO MAMORE','V.NOVA DO MAMORE','RO');
insert into Municipio values (22034,'CANDEIAS DO JAMARI','CANDEIAS JAMARI','RO');
insert into Municipio values (22035,'MONTE NEGRO','MONTE NEGRO','RO');
insert into Municipio values (22036,'JAMARI','JAMARI','RO');
insert into Municipio values (22037,'SERINGUEIRAS','SERINGUEIRAS','RO');
insert into Municipio values (22038,'URUPA','URUPA','RO');
insert into Municipio values (22039,'MIRANTE DA SERRA','MIRANTE SERRA','RO');
insert into Municipio values (22040,'MINISTRO ANDREAZZA','MIN ANDREAZZA','RO');
insert into Municipio values (22041,'ALTO PARAISO','ALTO PARAISO','RO');
insert into Municipio values (22042,'CACAULANDIA','CACAULANDIA','RO');
insert into Municipio values (22043,'CAMPO NOVO DE RONDONIA','CAMPO N.RONDONIA','RO');
insert into Municipio values (22044,'CASTANHEIRAS','CASTANHEIRAS','RO');
insert into Municipio values (22045,'CORUMBEARA','CORUMBEARA','RO');
insert into Municipio values (22046,'GOVERNADOR JORGE TEIXEIRA','GOV.J. TEIXEIRA','RO');
insert into Municipio values (22047,'NOVO HORIZONTE DO OESTE','N. HORIZ. OESTE','RO');
insert into Municipio values (22048,'RIO CRESPO','RIO CRESPO','RO');
insert into Municipio values (22049,'SAO FRANCISCO DO GUAPORE','S.FRANC. GUAPORE','RO');
insert into Municipio values (22050,'THEOBROMA','THEOBROMA','RO');
insert into Municipio values (22051,'VALE DO PARAISO','VALE DO PARAISO','RO');
insert into Municipio values (22052,'CUJUBIM','CUJUBIM','RO');
insert into Municipio values (22053,'BURITIS','BURITIS','RO');
insert into Municipio values (22054,'CHUPINGUAIA','CHUPINGUAIA','RO');
insert into Municipio values (22055,'NOVA UNIAO','NOVA UNIAO','RO');
insert into Municipio values (22056,'PARECIS','PARECIS','RO');
insert into Municipio values (22057,'PRIMAVERA DE RONDONIA','PRIMAV.RONDONIA','RO');
insert into Municipio values (22058,'SAO FELIPE D´OESTE','S.FELIPE D´OESTE','RO');
insert into Municipio values (22059,'TEIXEIROPOLIS','TEIXEIROPOLIS','RO');
insert into Municipio values (22060,'VALE DO ANARI','VALE DO ANARI','RO');
insert into Municipio values (22061,'ALTO ALEGRE DOS PARECIS','ALTO ALEGRE PAR.','RO');
insert into Municipio values (22062,'PIMENTEIRAS DO OESTE','PIMENTEIRAS OEST','RO');
insert into Municipio values (23001,'BOA VISTA','BOA VISTA','RR');
insert into Municipio values (23002,'CARACARAI','CARACARAI','RR');
insert into Municipio values (23003,'ALTO ALEGRE','ALTO ALEGRE','RR');
insert into Municipio values (23004,'BONFIM','BONFIM','RR');
insert into Municipio values (23005,'MUCAJAI','MUCAJAI','RR');
insert into Municipio values (23006,'NORMANDIA','NORMANDIA','RR');
insert into Municipio values (23007,'SAO JOAO DA BALIZA','S.JOAO.BALIZA','RR');
insert into Municipio values (23008,'SAO LUIZ','SAO LUIZ','RR');
insert into Municipio values (23010,'AMAJARI','AMAJARI','RR');
insert into Municipio values (23011,'CANTA','CANTA','RR');
insert into Municipio values (23012,'CAROEBE','CAROEBE','RR');
insert into Municipio values (23013,'IRACEMA','IRACEMA','RR');
insert into Municipio values (23014,'PACARAIMA','PACARAIMA','RR');
insert into Municipio values (23015,'UIRAMUTA','UIRAMUTA','RR');
insert into Municipio values (23016,'RORAINOPOLIS','RORAINOPOLIS','RR');
insert into Municipio values (24001,'AGUDO','AGUDO','RS');
insert into Municipio values (24002,'AJURICABA','AJURICABA','RS');
insert into Municipio values (24003,'ALECRIM','ALECRIM','RS');
insert into Municipio values (24004,'ALEGRETE','ALEGRETE','RS');
insert into Municipio values (24005,'ALPESTRE','ALPESTRE','RS');
insert into Municipio values (24006,'ALVORADA','ALVORADA','RS');
insert into Municipio values (24007,'ANTA GORDA','ANTA GORDA','RS');
insert into Municipio values (24008,'ANTONIO PRADO','ANTONIO PRADO','RS');
insert into Municipio values (24009,'ARATIBA','ARATIBA','RS');
insert into Municipio values (24010,'ARROIO DO MEIO','ARROIO DO MEIO','RS');
insert into Municipio values (24011,'ARROIO DO TIGRE','ARROIO DO TIGRE','RS');
insert into Municipio values (24012,'ARROIO DOS RATOS','ARROIO RATOS','RS');
insert into Municipio values (24013,'ARROIO GRANDE','ARROIO GRANDE','RS');
insert into Municipio values (24014,'ARVOREZINHA','ARVOREZINHA','RS');
insert into Municipio values (24015,'AUGUSTO PESTANA','AUGUSTO PESTANA','RS');
insert into Municipio values (24016,'BAGE','BAGE','RS');
insert into Municipio values (24017,'BARAO DE COTEGIPE','BARAO COTEGIPE','RS');
insert into Municipio values (24018,'BARRA DO RIBEIRO','BARRA RIBEIRO','RS');
insert into Municipio values (24019,'BARRACAO','BARRACAO','RS');
insert into Municipio values (24020,'BARROS CASSAL','BARROS CASSAL','RS');
insert into Municipio values (24021,'BENTO GONCALVES','BENTO GONCALVES','RS');
insert into Municipio values (24022,'BOA VISTA DO BURICA','B.VISTA BURICA','RS');
insert into Municipio values (24023,'BOM JESUS','BOM JESUS','RS');
insert into Municipio values (24024,'BOM RETIRO DO SUL','BOM RETIRO SUL','RS');
insert into Municipio values (24025,'BOSSOROCA','BOSSOROCA','RS');
insert into Municipio values (24026,'BRAGA','BRAGA','RS');
insert into Municipio values (24027,'BUTIA','BUTIA','RS');
insert into Municipio values (24028,'CACAPAVA DO SUL','CACAPAVA DO SUL','RS');
insert into Municipio values (24029,'CACEQUI','CACEQUI','RS');
insert into Municipio values (24030,'CACHOEIRA DO SUL','CACHOEIRA SUL','RS');
insert into Municipio values (24031,'CACHOEIRINHA','CACHOEIRINHA','RS');
insert into Municipio values (24032,'CACIQUE DOBLE','CACIQUE DOBLE','RS');
insert into Municipio values (24033,'CAIBATE','CAIBATE','RS');
insert into Municipio values (24034,'CAICARA','CAICARA','RS');
insert into Municipio values (24035,'CAMAQUA','CAMAQUA','RS');
insert into Municipio values (24036,'CAMBARA DO SUL','CAMBARA DO SUL','RS');
insert into Municipio values (24037,'CAMPINA DAS MISSOES','CAMPINA MISSOES','RS');
insert into Municipio values (24038,'CAMPINAS DO SUL','CAMPINAS DO SUL','RS');
insert into Municipio values (24039,'CAMPO BOM','CAMPO BOM','RS');
insert into Municipio values (24040,'CAMPO NOVO','CAMPO NOVO','RS');
insert into Municipio values (24041,'CANDELARIA','CANDELARIA','RS');
insert into Municipio values (24042,'CANDIDO GODOI','CANDIDO GODOI','RS');
insert into Municipio values (24043,'CANELA','CANELA','RS');
insert into Municipio values (24044,'CANGUCU','CANGUCU','RS');
insert into Municipio values (24045,'CANOAS','CANOAS','RS');
insert into Municipio values (24046,'CARAZINHO','CARAZINHO','RS');
insert into Municipio values (24047,'CARLOS BARBOSA','CARLOS BARBOSA','RS');
insert into Municipio values (24048,'CASCA','CASCA','RS');
insert into Municipio values (24049,'CATUIPE','CATUIPE','RS');
insert into Municipio values (24050,'CAXIAS DO SUL','CAXIAS DO SUL','RS');
insert into Municipio values (24051,'CERRO LARGO','CERRO LARGO','RS');
insert into Municipio values (24052,'CHAPADA','CHAPADA','RS');
insert into Municipio values (24053,'CHIAPETA','CHIAPETA','RS');
insert into Municipio values (24054,'CIRIACO','CIRIACO','RS');
insert into Municipio values (24055,'COLORADO','COLORADO','RS');
insert into Municipio values (24056,'CONDOR','CONDOR','RS');
insert into Municipio values (24057,'CONSTANTINA','CONSTANTINA','RS');
insert into Municipio values (24058,'CORONEL BICACO','CORONEL BICACO','RS');
insert into Municipio values (24059,'CRISSIUMAL','CRISSIUMAL','RS');
insert into Municipio values (24060,'CRUZ ALTA','CRUZ ALTA','RS');
insert into Municipio values (24061,'CRUZEIRO DO SUL','CRUZEIRO DO SUL','RS');
insert into Municipio values (24062,'DAVID CANABARRO','DAVID CANABARRO','RS');
insert into Municipio values (24063,'DOIS IRMAOS','DOIS IRMAOS','RS');
insert into Municipio values (24064,'DOM FELICIANO','DOM FELICIANO','RS');
insert into Municipio values (24065,'DOM PEDRITO','DOM PEDRITO','RS');
insert into Municipio values (24066,'DONA FRANCISCA','DONA FRANCISCA','RS');
insert into Municipio values (24067,'ENCANTADO','ENCANTADO','RS');
insert into Municipio values (24068,'ENCRUZILHADA DO SUL','ENCRUZILHADA SUL','RS');
insert into Municipio values (24069,'ERECHIM','ERECHIM','RS');
insert into Municipio values (24070,'HERVAL','HERVAL','RS');
insert into Municipio values (24071,'ERVAL GRANDE','ERVAL GRANDE','RS');
insert into Municipio values (24072,'ERVAL SECO','ERVAL SECO','RS');
insert into Municipio values (24073,'ESMERALDA','ESMERALDA','RS');
insert into Municipio values (24074,'ESPUMOSO','ESPUMOSO','RS');
insert into Municipio values (24075,'ESTANCIA VELHA','ESTANCIA VELHA','RS');
insert into Municipio values (24076,'ESTEIO','ESTEIO','RS');
insert into Municipio values (24077,'ESTRELA','ESTRELA','RS');
insert into Municipio values (24078,'FARROUPILHA','FARROUPILHA','RS');
insert into Municipio values (24079,'FAXINAL DO SOTURNO','FAXINAL SOTURNO','RS');
insert into Municipio values (24080,'FELIZ','FELIZ','RS');
insert into Municipio values (24081,'FLORES DA CUNHA','FLORES DA CUNHA','RS');
insert into Municipio values (24082,'FONTOURA XAVIER','FONTOURA XAVIER','RS');
insert into Municipio values (24083,'FORMIGUEIRO','FORMIGUEIRO','RS');
insert into Municipio values (24084,'FREDERICO WESTPHALEN','FRED.WESTPHALEN','RS');
insert into Municipio values (24085,'GARIBALDI','GARIBALDI','RS');
insert into Municipio values (24086,'GAURAMA','GAURAMA','RS');
insert into Municipio values (24087,'GENERAL CAMARA','GENERAL CAMARA','RS');
insert into Municipio values (24088,'GETULIO VARGAS','GETULIO VARGAS','RS');
insert into Municipio values (24089,'GIRUA','GIRUA','RS');
insert into Municipio values (24090,'GRAMADO','GRAMADO','RS');
insert into Municipio values (24091,'GRAVATAI','GRAVATAI','RS');
insert into Municipio values (24092,'GUAIBA','GUAIBA','RS');
insert into Municipio values (24093,'GUAPORE','GUAPORE','RS');
insert into Municipio values (24094,'GUARANI DAS MISSOES','GUARANI MISSOES','RS');
insert into Municipio values (24095,'HORIZONTINA','HORIZONTINA','RS');
insert into Municipio values (24096,'HUMAITA','HUMAITA','RS');
insert into Municipio values (24097,'IBIACA','IBIACA','RS');
insert into Municipio values (24098,'IBIRAIARAS','IBIRAIARAS','RS');
insert into Municipio values (24099,'IBIRUBA','IBIRUBA','RS');
insert into Municipio values (24100,'IGREJINHA','IGREJINHA','RS');
insert into Municipio values (24101,'IJUI','IJUI','RS');
insert into Municipio values (24102,'ILOPOLIS','ILOPOLIS','RS');
insert into Municipio values (24103,'INDEPENDENCIA','INDEPENDENCIA','RS');
insert into Municipio values (24104,'IRAI','IRAI','RS');
insert into Municipio values (24105,'ITAQUI','ITAQUI','RS');
insert into Municipio values (24106,'ITATIBA DO SUL','ITATIBA DO SUL','RS');
insert into Municipio values (24107,'IVOTI','IVOTI','RS');
insert into Municipio values (24108,'JACUTINGA','JACUTINGA','RS');
insert into Municipio values (24109,'JAGUARAO','JAGUARAO','RS');
insert into Municipio values (24110,'JAGUARI','JAGUARI','RS');
insert into Municipio values (24111,'JULIO DE CASTILHOS','JULIO CASTILHOS','RS');
insert into Municipio values (24112,'LAGOA VERMELHA','LAGOA VERMELHA','RS');
insert into Municipio values (24113,'LAJEADO','LAJEADO','RS');
insert into Municipio values (24114,'LAVRAS DO SUL','LAVRAS DO SUL','RS');
insert into Municipio values (24115,'LIBERATO SALZANO','LIBER.SALZANO','RS');
insert into Municipio values (24116,'MACHADINHO','MACHADINHO','RS');
insert into Municipio values (24117,'MARAU','MARAU','RS');
insert into Municipio values (24118,'MARCELINO RAMOS','MARCELINO RAMOS','RS');
insert into Municipio values (24119,'MARIANO MORO','MARIANO MORO','RS');
insert into Municipio values (24120,'MATA','MATA','RS');
insert into Municipio values (24121,'MAXIMILIANO DE ALMEIDA','M.DE ALMEIDA','RS');
insert into Municipio values (24122,'MIRAGUAI','MIRAGUAI','RS');
insert into Municipio values (24123,'MONTENEGRO','MONTENEGRO','RS');
insert into Municipio values (24124,'MOSTARDAS','MOSTARDAS','RS');
insert into Municipio values (24125,'MUCUM','MUCUM','RS');
insert into Municipio values (24126,'NAO-ME-TOQUE','NAO-ME-TOQUE','RS');
insert into Municipio values (24127,'NONOAI','NONOAI','RS');
insert into Municipio values (24128,'NOVA ARACA','NOVA ARACA','RS');
insert into Municipio values (24129,'NOVA BASSANO','NOVA BASSANO','RS');
insert into Municipio values (24130,'NOVA BRESCIA','NOVA BRESCIA','RS');
insert into Municipio values (24131,'NOVA PALMA','NOVA PALMA','RS');
insert into Municipio values (24132,'NOVA PETROPOLIS','NOVA PETROPOLIS','RS');
insert into Municipio values (24133,'NOVA PRATA','NOVA PRATA','RS');
insert into Municipio values (24134,'NOVO HAMBURGO','NOVO HAMBURGO','RS');
insert into Municipio values (24135,'OSORIO','OSORIO','RS');
insert into Municipio values (24136,'PAIM FILHO','PAIM FILHO','RS');
insert into Municipio values (24137,'PALMEIRA DAS MISSOES','P.DAS MISSOES','RS');
insert into Municipio values (24138,'PALMITINHO','PALMITINHO','RS');
insert into Municipio values (24139,'PANAMBI','PANAMBI','RS');
insert into Municipio values (24140,'PARAI','PARAI','RS');
insert into Municipio values (24141,'PASSO FUNDO','PASSO FUNDO','RS');
insert into Municipio values (24142,'PEDRO OSORIO','PEDRO OSORIO','RS');
insert into Municipio values (24143,'PEJUCARA','PEJUCARA','RS');
insert into Municipio values (24144,'PELOTAS','PELOTAS','RS');
insert into Municipio values (24145,'PINHEIRO MACHADO','PIN.MACHADO','RS');
insert into Municipio values (24146,'PIRATINI','PIRATINI','RS');
insert into Municipio values (24147,'PLANALTO','PLANALTO','RS');
insert into Municipio values (24148,'PORTAO','PORTAO','RS');
insert into Municipio values (24149,'PORTO ALEGRE','PORTO ALEGRE','RS');
insert into Municipio values (24150,'PORTO LUCENA','PORTO LUCENA','RS');
insert into Municipio values (24151,'PORTO XAVIER','PORTO XAVIER','RS');
insert into Municipio values (24152,'PUTINGA','PUTINGA','RS');
insert into Municipio values (24153,'QUARAI','QUARAI','RS');
insert into Municipio values (24154,'REDENTORA','REDENTORA','RS');
insert into Municipio values (24155,'RESTINGA SECA','RESTINGA SECA','RS');
insert into Municipio values (24156,'RIO GRANDE','RIO GRANDE','RS');
insert into Municipio values (24157,'RIO PARDO','RIO PARDO','RS');
insert into Municipio values (24158,'ROCA SALES','ROCA SALES','RS');
insert into Municipio values (24159,'RODEIO BONITO','RODEIO BONITO','RS');
insert into Municipio values (24160,'ROLANTE','ROLANTE','RS');
insert into Municipio values (24161,'RONDA ALTA','RONDA ALTA','RS');
insert into Municipio values (24162,'RONDINHA','RONDINHA','RS');
insert into Municipio values (24163,'ROQUE GONZALES','ROQUE GONZALES','RS');
insert into Municipio values (24164,'ROSARIO DO SUL','ROSARIO DO SUL','RS');
insert into Municipio values (24165,'SANTO ANGELO','SANTO ANGELO','RS');
insert into Municipio values (24166,'SANTO ANTONIO DA PATRULHA','STO ANT PATRULHA','RS');
insert into Municipio values (24167,'SANTO ANTONIO DAS MISSOES','STO.ANT.MISSOES','RS');
insert into Municipio values (24168,'SANTO AUGUSTO','SANTO AUGUSTO','RS');
insert into Municipio values (24169,'SANTA BARBARA DO SUL','S.BARBARA SUL','RS');
insert into Municipio values (24170,'SAO BORJA','SAO BORJA','RS');
insert into Municipio values (24171,'SANTO CRISTO','SANTO CRISTO','RS');
insert into Municipio values (24172,'SANTA CRUZ DO SUL','S.CRUZ DO SUL','RS');
insert into Municipio values (24173,'SAO FRANCISCO DE ASSIS','S.FRANC.ASSIS','RS');
insert into Municipio values (24174,'SAO FRANCISCO DE PAULA','S.FRANC.PAULA','RS');
insert into Municipio values (24175,'SAO GABRIEL','SAO GABRIEL','RS');
insert into Municipio values (24176,'SAO JERONIMO','SAO JERONIMO','RS');
insert into Municipio values (24177,'SAO JOSE DO NORTE','SAO JOSE NORTE','RS');
insert into Municipio values (24178,'SAO JOSE DO OURO','SAO JOSE OURO','RS');
insert into Municipio values (24179,'SAO LEOPOLDO','SAO LEOPOLDO','RS');
insert into Municipio values (24180,'SAO LOURENCO DO SUL','S.LOURENCO SUL','RS');
insert into Municipio values (24181,'SAO LUIZ GONZAGA','S.LUIZ GONZAGA','RS');
insert into Municipio values (24182,'SAO MARCOS','SAO MARCOS','RS');
insert into Municipio values (24183,'SANTA MARIA','SANTA MARIA','RS');
insert into Municipio values (24184,'SAO MARTINHO','SAO MARTINHO','RS');
insert into Municipio values (24185,'SAO NICOLAU','SAO NICOLAU','RS');
insert into Municipio values (24186,'SAO PAULO DAS MISSOES','S.PAULO MISSOES','RS');
insert into Municipio values (24187,'SAO PEDRO DO SUL','SAO PEDRO SUL','RS');
insert into Municipio values (24188,'SANTA ROSA','SANTA ROSA','RS');
insert into Municipio values (24189,'SAO SEBASTIAO DO CAI','S.SEBASTIAO CAI','RS');
insert into Municipio values (24190,'SAO SEPE','SAO SEPE','RS');
insert into Municipio values (24191,'SAO VALENTIM','SAO VALENTIM','RS');
insert into Municipio values (24192,'SAO VICENTE DO SUL','SAO VICENTE SUL','RS');
insert into Municipio values (24193,'SANTA VITORIA DO PALMAR','STA.VIT.PALMAR','RS');
insert into Municipio values (24194,'SALVADOR DO SUL','SALVADOR DO SUL','RS');
insert into Municipio values (24195,'SANANDUVA','SANANDUVA','RS');
insert into Municipio values (24196,'SANTANA DA BOA VISTA','SANT.BOA VISTA','RS');
insert into Municipio values (24197,'SANTANA DO LIVRAMENTO','SANT.LIVRAMENTO','RS');
insert into Municipio values (24198,'SANTIAGO','SANTIAGO','RS');
insert into Municipio values (24199,'SAPIRANGA','SAPIRANGA','RS');
insert into Municipio values (24200,'SAPUCAIA DO SUL','SAPUCAIA DO SUL','RS');
insert into Municipio values (24201,'SARANDI','SARANDI','RS');
insert into Municipio values (24202,'SEBERI','SEBERI','RS');
insert into Municipio values (24203,'SELBACH','SELBACH','RS');
insert into Municipio values (24204,'SERAFINA CORREA','SERAFINA CORREA','RS');
insert into Municipio values (24205,'SERTAO','SERTAO','RS');
insert into Municipio values (24206,'SEVERIANO DE ALMEIDA','SEV.ALMEIDA','RS');
insert into Municipio values (24207,'SOBRADINHO','SOBRADINHO','RS');
insert into Municipio values (24208,'SOLEDADE','SOLEDADE','RS');
insert into Municipio values (24209,'TAPEJARA','TAPEJARA','RS');
insert into Municipio values (24210,'TAPERA','TAPERA','RS');
insert into Municipio values (24211,'TAPES','TAPES','RS');
insert into Municipio values (24212,'TAQUARA','TAQUARA','RS');
insert into Municipio values (24213,'TAQUARI','TAQUARI','RS');
insert into Municipio values (24214,'TENENTE PORTELA','TENENTE PORTELA','RS');
insert into Municipio values (24215,'TORRES','TORRES','RS');
insert into Municipio values (24216,'TRAMANDAI','TRAMANDAI','RS');
insert into Municipio values (24217,'TRES COROAS','TRES COROAS','RS');
insert into Municipio values (24218,'TRES DE MAIO','TRES DE MAIO','RS');
insert into Municipio values (24219,'TRES PASSOS','TRES PASSOS','RS');
insert into Municipio values (24220,'TRIUNFO','TRIUNFO','RS');
insert into Municipio values (24221,'TUCUNDUVA','TUCUNDUVA','RS');
insert into Municipio values (24222,'TUPANCIRETA','TUPANCIRETA','RS');
insert into Municipio values (24223,'TUPARENDI','TUPARENDI','RS');
insert into Municipio values (24224,'URUGUAIANA','URUGUAIANA','RS');
insert into Municipio values (24225,'VACARIA','VACARIA','RS');
insert into Municipio values (24226,'VENANCIO AIRES','VENANCIO AIRES','RS');
insert into Municipio values (24227,'VERA CRUZ','VERA CRUZ','RS');
insert into Municipio values (24228,'VERANOPOLIS','VERANOPOLIS','RS');
insert into Municipio values (24229,'VIADUTOS','VIADUTOS','RS');
insert into Municipio values (24230,'VIAMAO','VIAMAO','RS');
insert into Municipio values (24231,'VICENTE DUTRA','VICENTE DUTRA','RS');
insert into Municipio values (24232,'VICTOR GRAEFF','VICTOR GRAEFF','RS');
insert into Municipio values (24233,'ACEGUA','ACEGUA','RS');
insert into Municipio values (24236,'CAPAO DA CANOA','CAPAO DA CANOA','RS');
insert into Municipio values (24237,'CHARQUEADAS','CHARQUEADAS','RS');
insert into Municipio values (24238,'CHUI','CHUI','RS');
insert into Municipio values (24239,'CORONEL PILAR','CORONEL PILAR','RS');
insert into Municipio values (24240,'EREBANGO','EREBANGO','RS');
insert into Municipio values (24246,'IVORA','IVORA','RS');
insert into Municipio values (24247,'MORRO REDONDO','MORRO REDONDO','RS');
insert into Municipio values (24249,'PEDRAS ALTAS','PEDRAS ALTAS','RS');
insert into Municipio values (24250,'SAO JOSE DO HORTENCIO','S.J.HORTENCIO','RS');
insert into Municipio values (24251,'SAO VENDELINO','SAO VENDELINO','RS');
insert into Municipio values (24252,'SILVEIRA MARTINS','SILV.MARTINS','RS');
insert into Municipio values (24253,'TEUTONIA','TEUTONIA','RS');
insert into Municipio values (24254,'TOROPI','TOROPI','RS');
insert into Municipio values (24255,'UNISTALDA','UNISTALDA','RS');
insert into Municipio values (24256,'PALMARES DO SUL','PALMARES DO SUL','RS');
insert into Municipio values (24257,'TAVARES','TAVARES','RS');
insert into Municipio values (24258,'CAPAO DO LEAO','CAPAO DO LEAO','RS');
insert into Municipio values (24259,'SALTO DO JACUI','SALTO DO JACUI','RS');
insert into Municipio values (24260,'COTIPORA','COTIPORA','RS');
insert into Municipio values (24261,'BOM PRINCIPIO','BOM PRINCIPIO','RS');
insert into Municipio values (24262,'PAROBE','PAROBE','RS');
insert into Municipio values (24263,'FORTALEZA DOS VALOS','FORTALEZA VALOS','RS');
insert into Municipio values (24264,'JOIA','JOIA','RS');
insert into Municipio values (24266,'VISTA ALEGRE DO PRATA','V.ALEGRE PRATA','RS');
insert into Municipio values (24267,'DOUTOR MAURICIO CARDOSO','DOUTOR M.CARDOSO','RS');
insert into Municipio values (24268,'SEDE NOVA','SEDE NOVA','RS');
insert into Municipio values (24269,'VISTA GAUCHA','VISTA GAUCHA','RS');
insert into Municipio values (24270,'TAQUARUCU DO SUL','TAQUARUCU DO SUL','RS');
insert into Municipio values (24271,'TRES PALMEIRAS','TRES PALMEIRAS','RS');
insert into Municipio values (24272,'TRINDADE DO SUL','TRINDADE DO SUL','RS');
insert into Municipio values (24273,'VISTA ALEGRE','VISTA ALEGRE','RS');
insert into Municipio values (24274,'AUREA','AUREA','RS');
insert into Municipio values (24275,'ENTRE RIOS DO SUL','ENTRE RIOS SUL','RS');
insert into Municipio values (24276,'ESTACAO','ESTACAO','RS');
insert into Municipio values (24277,'FAXINALZINHO','FAXINALZINHO','RS');
insert into Municipio values (24278,'IPIRANGA DO SUL','IPIRANGA DO SUL','RS');
insert into Municipio values (24279,'TRES ARROIOS','TRES ARROIOS','RS');
insert into Municipio values (24280,'SAO JOAO DA URTIGA','SAO JOAO URTIGA','RS');
insert into Municipio values (24281,'DEZESSEIS DE NOVEMBRO','16 DE NOVEMBRO','RS');
insert into Municipio values (24282,'ENTRE IJUIS','ENTRE IJUIS','RS');
insert into Municipio values (24283,'EUGENIO DE CASTRO','EUGENIO CASTRO','RS');
insert into Municipio values (24284,'PIRAPO','PIRAPO','RS');
insert into Municipio values (24285,'SAO MIGUEL DAS MISSOES','S.MIGUEL MISSOES','RS');
insert into Municipio values (24286,'ALEGRIA','ALEGRIA','RS');
insert into Municipio values (24287,'CERRO GRANDE','CERRO GRANDE','RS');
insert into Municipio values (24288,'JABOTICABA','JABOTICABA','RS');
insert into Municipio values (24289,'PINHAL','PINHAL','RS');
insert into Municipio values (24290,'AGUA SANTA','AGUA SANTA','RS');
insert into Municipio values (24291,'CAMARGO','CAMARGO','RS');
insert into Municipio values (24292,'CASEIROS','CASEIROS','RS');
insert into Municipio values (24293,'ERNESTINA','ERNESTINA','RS');
insert into Municipio values (24294,'SAO DOMINGOS DO SUL','SAO DOMINGOS SUL','RS');
insert into Municipio values (24295,'VANINI','VANINI','RS');
insert into Municipio values (24296,'VILA MARIA','VILA MARIA','RS');
insert into Municipio values (24297,'SALDANHA MARINHO','SALDANHA MARINHO','RS');
insert into Municipio values (24298,'TRES CACHOEIRAS','TRES CACHOEIRAS','RS');
insert into Municipio values (24299,'ALTO ALEGRE','ALTO ALEGRE','RS');
insert into Municipio values (24300,'AMARAL FERRADOR','AMARAL FERRADOR','RS');
insert into Municipio values (24301,'ANDRE DA ROCHA','ANDRE DA ROCHA','RS');
insert into Municipio values (24302,'ARROIO DO SAL','ARROIO DO SAL','RS');
insert into Municipio values (24303,'BARAO','BARAO','RS');
insert into Municipio values (24304,'BOQUEIRAO DO LEAO','BOQUEIRAO LEAO','RS');
insert into Municipio values (24305,'BROCHIER','BROCHIER','RS');
insert into Municipio values (24306,'CAMPOS BORGES','CAMPOS BORGES','RS');
insert into Municipio values (24307,'CAPELA DE SANTANA','CAPELA SANTANA','RS');
insert into Municipio values (24308,'CERRO BRANCO','CERRO BRANCO','RS');
insert into Municipio values (24309,'CERRO GRANDE DO SUL','CERRO GRANDE SUL','RS');
insert into Municipio values (24310,'CIDREIRA','CIDREIRA','RS');
insert into Municipio values (24311,'CRISTAL','CRISTAL','RS');
insert into Municipio values (24312,'DOIS LAJEADOS','DOIS LAJEADOS','RS');
insert into Municipio values (24313,'ELDORADO DO SUL','ELDORADO DO SUL','RS');
insert into Municipio values (24314,'FAGUNDES VARELA','FAGUNDES VARELA','RS');
insert into Municipio values (24315,'GLORINHA','GLORINHA','RS');
insert into Municipio values (24316,'GUABIJU','GUABIJU','RS');
insert into Municipio values (24317,'HARMONIA','HARMONIA','RS');
insert into Municipio values (24318,'IBARAMA','IBARAMA','RS');
insert into Municipio values (24319,'IBIRAIPUTA','IBIRAPUITA','RS');
insert into Municipio values (24320,'IMBE','IMBE','RS');
insert into Municipio values (24321,'IMIGRANTE','IMIGRANTE','RS');
insert into Municipio values (24322,'IPE','IPE','RS');
insert into Municipio values (24323,'ITACURUBI','ITACURUBI','RS');
insert into Municipio values (24324,'JAQUIRANA','JAQUIRANA','RS');
insert into Municipio values (24325,'LAGOAO','LAGOAO','RS');
insert into Municipio values (24326,'MONTAURI','MONTAURI','RS');
insert into Municipio values (24327,'NOVA ALVORADA','NOVA ALVORADA','RS');
insert into Municipio values (24328,'NOVA ESPERANCA DO SUL','N. ESPERANCA SUL','RS');
insert into Municipio values (24329,'NOVA HARTZ','NOVA HARTZ','RS');
insert into Municipio values (24330,'PANTANO GRANDE','PANTANO GRANDE','RS');
insert into Municipio values (24331,'PARAISO DO SUL','PARAISO DO SUL','RS');
insert into Municipio values (24332,'PAVERANA','PAVERANA','RS');
insert into Municipio values (24333,'POCO DAS ANTAS','POCO DAS ANTAS','RS');
insert into Municipio values (24334,'POUSO NOVO','POUSO NOVO','RS');
insert into Municipio values (24335,'PROGRESSO','PROGRESSO','RS');
insert into Municipio values (24336,'PROTASIO ALVES','PROTASIO ALVES','RS');
insert into Municipio values (24337,'QUINZE DE NOVEMBRO','15 DE NOVEMBRO','RS');
insert into Municipio values (24338,'RELVADO','RELVADO','RS');
insert into Municipio values (24339,'RIOZINHO','RIOZINHO','RS');
insert into Municipio values (24340,'SANTA MARIA DO ERVAL','STA MARIA ERVAL','RS');
insert into Municipio values (24341,'SAO JORGE','SAO JORGE','RS');
insert into Municipio values (24342,'SAO JOSE DO HERVAL','SAO JOSE HERVAL','RS');
insert into Municipio values (24343,'SEGREDO','SEGREDO','RS');
insert into Municipio values (24344,'TERRA DE AREIA','TERRA DE AREIA','RS');
insert into Municipio values (24345,'TUNAS','TUNAS','RS');
insert into Municipio values (24346,'TUPANDI','TUPANDI','RS');
insert into Municipio values (24347,'VILA FLORES','VILA FLORES','RS');
insert into Municipio values (24348,'NOVO TIRADENTES','NOVO TIRADENTES','RS');
insert into Municipio values (24349,'SAO PEDRO BUTIA','SAO PEDRO BUTIA','RS');
insert into Municipio values (24350,'NOVA ROMA DO SUL','N ROMA DO SUL','RS');
insert into Municipio values (24351,'CANDIOTA','CANDIOTA','RS');
insert into Municipio values (24352,'COXILHA','COXILHA','RS');
insert into Municipio values (24353,'NOVA BOA VISTA','N.BOA VISTA','RS');
insert into Municipio values (24354,'BARRA FUNDA','BARRA FUNDA','RS');
insert into Municipio values (24355,'BOA VISTA DAS MISSOES','B.VISTA MISSOES','RS');
insert into Municipio values (24356,'SINIMBU','SINIMBU','RS');
insert into Municipio values (24357,'SAO JOSE DOS AUSENTES','S.JOSE AUSENTES','RS');
insert into Municipio values (24358,'NOVA SANTA RITA','NOVA SANTA RITA','RS');
insert into Municipio values (24359,'CORONEL BARROS','CEL.BARROS','RS');
insert into Municipio values (24360,'ENGENHO VELHO','ENGENHO VELHO','RS');
insert into Municipio values (24361,'AMETISTA DO SUL','AMETISTA DO SUL','RS');
insert into Municipio values (24362,'NOVA PADUA','NOVA PADUA','RS');
insert into Municipio values (24363,'SALVADOR DAS MISSOES','SALVADOR MISSOES','RS');
insert into Municipio values (24364,'MAQUINE','MAQUINE','RS');
insert into Municipio values (24365,'PINHAL GRANDE','PINHAL GRANDE','RS');
insert into Municipio values (24366,'PONTE PRETA','PONTE PRETA','RS');
insert into Municipio values (24367,'SAGRADA FAMILIA','SAGRADA FAMILIA','RS');
insert into Municipio values (24368,'MANOEL VIANA','MANOEL VIANA','RS');
insert into Municipio values (24369,'NOVO BARREIRO','N.BARREIRO','RS');
insert into Municipio values (24370,'NOVO MACHADO','N.MACHADO','RS');
insert into Municipio values (24371,'MULITERNO','MULITERNO','RS');
insert into Municipio values (24372,'BARRA DO GUARITA','BARRA DO GUARITA','RS');
insert into Municipio values (24373,'CAPITAO','CAPITAO','RS');
insert into Municipio values (24374,'LAJEADO DO BUGRE','LAJEADO BUGRE','RS');
insert into Municipio values (24375,'SERIO','SERIO','RS');
insert into Municipio values (24376,'CAMPESTRE DA SERRA','CAMPESTRE SERRA','RS');
insert into Municipio values (24377,'PINHEIRINHO DO VALE','PINHEIRINHO VALE','RS');
insert into Municipio values (24378,'DERRUBADAS','DERRUBADAS','RS');
insert into Municipio values (24379,'MONTE BELO DO SUL','M. BELO DO SUL','RS');
insert into Municipio values (24380,'SAO JOSE DO INHACORA','S.JOSE INHACORA','RS');
insert into Municipio values (24381,'LAGOA DOS TRES CANTOS','L. TRES CANTOS','RS');
insert into Municipio values (24382,'BARRA DO RIO AZUL','BARRA RIO AZUL','RS');
insert into Municipio values (24383,'PARECI NOVO','PARECI NOVO','RS');
insert into Municipio values (24384,'MATO LEITAO','MATO LEITAO','RS');
insert into Municipio values (24385,'GRAMADO DOS LOUREIROS','G.LOUREIROS','RS');
insert into Municipio values (24386,'TRAVESSEIRO','TRAVESSEIRO','RS');
insert into Municipio values (24387,'TIRADENTES DO SUL','TIRADENTES SUL','RS');
insert into Municipio values (24388,'SAO JOSE DAS MISSOES','S.JOSE MISSOES','RS');
insert into Municipio values (24389,'VALE DO SOL','VALE DO SOL','RS');
insert into Municipio values (24390,'MATO CASTELHANO','MATO CASTELHANO','RS');
insert into Municipio values (24391,'MORMACO','MORMACO','RS');
insert into Municipio values (24392,'NICOLAU VERGUEIRO','N. VERGUEIRO','RS');
insert into Municipio values (24393,'DOIS IRMAOS DAS MISSOES','DOIS I. MISSOES','RS');
insert into Municipio values (24394,'RIO DOS INDIOS','RIO DOS INDIOS','RS');
insert into Municipio values (24395,'PONTAO','PONTAO','RS');
insert into Municipio values (24396,'TUPANCI DO SUL','TUPANCI DO SUL','RS');
insert into Municipio values (24397,'LINHA NOVA','LINHA NOVA','RS');
insert into Municipio values (24398,'XANGRI-LA','XANGRI-LA','RS');
insert into Municipio values (24399,'NOVA CANDELARIA','NOVA CANDELARIA','RS');
insert into Municipio values (24400,'MORRINHOS DO SUL','MORRINHOS DO SUL','RS');
insert into Municipio values (24401,'COQUEIROS DO SUL','COQUEIROS DO SUL','RS');
insert into Municipio values (24402,'BARRA DO QUARAI','BARRA DO QUARAI','RS');
insert into Municipio values (24403,'CHARRUA','CHARRUA','RS');
insert into Municipio values (24404,'CARLOS GOMES','CARLOS GOMES','RS');
insert into Municipio values (24405,'SAO JOAO DO POLISENE','S.JOAO POLISENE','RS');
insert into Municipio values (24406,'SAO PEDRO DA SERRA','S. PEDRO SERRA','RS');
insert into Municipio values (24407,'BARAO DO TRIUNFO','BARAO DO TRIUNFO','RS');
insert into Municipio values (24408,'MARQUES DE SOUZA','MARQUES DE SOUZA','RS');
insert into Municipio values (24409,'VALE REAL','VALE REAL','RS');
insert into Municipio values (24410,'PORTO VERA CRUZ','PORTO VERA CRUZ','RS');
insert into Municipio values (24411,'CENTENARIO','CENTENARIO','RS');
insert into Municipio values (24412,'SAO VALENTIM DO SUL','S. VALENTIM SUL','RS');
insert into Municipio values (24413,'PORTO MAUA','PORTO MAUA','RS');
insert into Municipio values (24414,'ALTO FELIZ','ALTO FELIZ','RS');
insert into Municipio values (24415,'ARAMBARE','ARAMBARE','RS');
insert into Municipio values (24416,'ARARICA','ARARICA','RS');
insert into Municipio values (24417,'BOM PROGRESSO','BOM PROGRESSO','RS');
insert into Municipio values (24418,'CARAA','CARAA','RS');
insert into Municipio values (24419,'COLINAS','COLINAS','RS');
insert into Municipio values (24420,'DILERMANDO DE AGUIAR','DILERM. AGUIAR','RS');
insert into Municipio values (24421,'ESTRELA VELHA','ESTRELA VELHA','RS');
insert into Municipio values (24422,'FAZENDA VILANOVA','FAZENDA VILANOVA','RS');
insert into Municipio values (24423,'SANTA TEREZA','SANTA TEREZA','RS');
insert into Municipio values (24424,'SANTO ANTONIO DO PALMA','STO. ANT. PALMA','RS');
insert into Municipio values (24425,'SANTO ANTONIO DO PLANALTO','STO ANT PLANALTO','RS');
insert into Municipio values (24426,'SANTO EXPEDITO DO SUL','STO EXPEDITO SUL','RS');
insert into Municipio values (24427,'SAO MARTINHO DA SERRA','S.MARTINHO SERRA','RS');
insert into Municipio values (24428,'SAO VALERIO DO SUL','S. VALERIO SUL','RS');
insert into Municipio values (24429,'SENTINELA DO SUL','SENTINELA DO SUL','RS');
insert into Municipio values (24430,'SERTAO SANTANA','SERTAO SANTANA','RS');
insert into Municipio values (24431,'SETE DE SETEMBRO','SETE DE SETEMBRO','RS');
insert into Municipio values (24432,'TABAI','TABAI','RS');
insert into Municipio values (24433,'TRES FORQUILHAS','TRES FORQUILHAS','RS');
insert into Municipio values (24434,'UBIRETEMA','UBIRETEMA','RS');
insert into Municipio values (24435,'UNIAO DA SERRA','UNIAO DA SERRA','RS');
insert into Municipio values (24436,'VESPASIANO CORREA','VESPAS. CORREA','RS');
insert into Municipio values (24437,'VILA NOVA DO SUL','VILA NOVA DO SUL','RS');
insert into Municipio values (24438,'VITORIA DAS MISSOES','VIT. DAS MISSOES','RS');
insert into Municipio values (24439,'MINAS DO LEAO','MINAS DO LEAO','RS');
insert into Municipio values (24440,'LINDOLFO COLLOR','LINDOLFO COLLOR','RS');
insert into Municipio values (24441,'BENJAMIN CONSTANT SUL','B.CONSTANT SUL','RS');
insert into Municipio values (24442,'BALNEARIO PINHAL','BALNEARIO PINHAL','RS');
insert into Municipio values (24443,'BOA VISTA DO SUL','BOA VISTA DO SUL','RS');
insert into Municipio values (24444,'CERRITO','CERRITO','RS');
insert into Municipio values (24445,'CHUVISCA','CHUVISCA','RS');
insert into Municipio values (24446,'CRISTAL DO SUL','CRISTAL DO SUL','RS');
insert into Municipio values (24447,'DOM PEDRO DE ALCANTARA','D.P.ALCANTARA','RS');
insert into Municipio values (24448,'DOUTOR RICARDO','DOUTOR RICARDO','RS');
insert into Municipio values (24449,'FLORIANO PEIXOTO','FLORIANO PEIXOTO','RS');
insert into Municipio values (24450,'GARRUCHOS','GARRUCHOS','RS');
insert into Municipio values (24451,'GENTIL','GENTIL','RS');
insert into Municipio values (24452,'GRAMADO XAVIER','GRAMADO XAVIER','RS');
insert into Municipio values (24453,'HERVEIRA','HERVEIRA','RS');
insert into Municipio values (24454,'HULHA NEGRA','HULHA NEGRA','RS');
insert into Municipio values (24455,'INHACORA','INHACORA','RS');
insert into Municipio values (24456,'ITAARA','ITAARA','RS');
insert into Municipio values (24457,'ITAPUCA','ITAPUCA','RS');
insert into Municipio values (24458,'JARI','JARI','RS');
insert into Municipio values (24459,'MAMPITUBA','MAMPITUBA','RS');
insert into Municipio values (24460,'MARATA','MARATA','RS');
insert into Municipio values (24461,'MARIANA PIMENTEL','MARIANA PIMENTEL','RS');
insert into Municipio values (24462,'MONTE ALEGRE DOS CAMPOS','M.A.CAMPOS','RS');
insert into Municipio values (24463,'MORRO REUTER','MORRO REUTER','RS');
insert into Municipio values (24464,'MUITOS CAPOES','MUITOS CAPOES','RS');
insert into Municipio values (24465,'NOVA RAMADA','NOVA RAMADA','RS');
insert into Municipio values (24466,'NOVO CABRAIS','NOVO CABRAIS','RS');
insert into Municipio values (24467,'PASSA SETE','PASSA SETE','RS');
insert into Municipio values (24468,'PICADA CAFE','PICADA CAFE','RS');
insert into Municipio values (24469,'PRESIDENTE LUCENA','PRES.LUCENA','RS');
insert into Municipio values (24470,'QUEVEDOS','QUEVEDOS','RS');
insert into Municipio values (24471,'SANTA CLARA DO SUL','S.CLARA DO SUL','RS');
insert into Municipio values (24472,'SENADOR SALGADO FILHO','S.SALGADO FILHO','RS');
insert into Municipio values (24473,'VALE VERDE','VALE VERDE','RS');
insert into Municipio values (24474,'VILA LANGARO','VILA LANGARO','RS');
insert into Municipio values (24475,'ESPERANCA DO SUL','ESPERANCA DO SUL','RS');
insert into Municipio values (24476,'MACAMBARA','MACAMBARA','RS');
insert into Municipio values (24477,'PASSO DO SOBRADO','PASSO DO SOBRADO','RS');
insert into Municipio values (24478,'CAPIVARI DO SUL','CAPIVARI DO SUL','RS');
insert into Municipio values (24479,'ALMIRANTE TAMANDARE DO SUL','A. TAMANDARE SUL','RS');
insert into Municipio values (24480,'ARROIO DO PADRE','ARROIO DO PADRE','RS');
insert into Municipio values (24481,'BOA VISTA DO CADEADO','B.VISTA CADEADO','RS');
insert into Municipio values (24482,'BOA VISTA DO INCRA','B.VISTA DO INCRA','RS');
insert into Municipio values (24483,'BOZANO','BOZANO','RS');
insert into Municipio values (24484,'CANUDOS DO VALE','CANUDOS DO VALE','RS');
insert into Municipio values (24485,'CAPAO BONITO DO SUL','CAPAO BONITO SUL','RS');
insert into Municipio values (24486,'CAPAO DO CIPO','CAPAO DO CIPO','RS');
insert into Municipio values (24487,'COQUEIRO DE BAIXO','COQUEIRO BAIXO','RS');
insert into Municipio values (24488,'CRUZALTENSE','CRUZALTENSE','RS');
insert into Municipio values (24489,'FORQUETINHA','FORQUETINHA','RS');
insert into Municipio values (24490,'ITATI','ITATI','RS');
insert into Municipio values (24491,'JACUIZINHO','JACUIZINHO','RS');
insert into Municipio values (24492,'LAGOA BONITA DO SUL','LAGOA BONITA SUL','RS');
insert into Municipio values (24493,'MATO QUEIMADO','MATO QUEIMADO','RS');
insert into Municipio values (24494,'NOVO XINGU','NOVO XINGU','RS');
insert into Municipio values (24495,'PAULO BENTO','PAULO BENTO','RS');
insert into Municipio values (24496,'PINHAL DA SERRA','PINHAL DA SERRA','RS');
insert into Municipio values (24497,'PINTO BANDEIRA','PINTO BANDEIRA','RS');
insert into Municipio values (24498,'QUATRO IRMAOS','QUATRO IRMAOS','RS');
insert into Municipio values (24499,'ROLADOR','ROLADOR','RS');
insert into Municipio values (24500,'SANTA CECILIA DO SUL','S.CECILIA DO SUL','RS');
insert into Municipio values (24501,'SANTA MARGARIDA DO SUL','S.MARGARIDA SUL','RS');
insert into Municipio values (24502,'SAO JOSE DO SUL','SAO JOSE DO SUL','RS');
insert into Municipio values (24503,'SAO PEDRO DAS MISSOES','S.PEDRO MISSOES','RS');
insert into Municipio values (24504,'TIO HUGO','TIO HUGO','RS');
insert into Municipio values (24505,'WESTFALIA','WESTFALIA','RS');
insert into Municipio values (24506,'TURUCU','TURUCU','RS');
insert into Municipio values (25001,'ABELARDO LUZ','ABELARDO LUZ','SC');
insert into Municipio values (25002,'AGROLANDIA','AGROLANDIA','SC');
insert into Municipio values (25003,'AGRONOMICA','AGRONOMICA','SC');
insert into Municipio values (25004,'AGUA DOCE','AGUA DOCE','SC');
insert into Municipio values (25005,'AGUAS DE CHAPECO','AGUAS CHAPECO','SC');
insert into Municipio values (25006,'AGUAS MORNAS','AGUAS MORNAS','SC');
insert into Municipio values (25007,'ALFREDO WAGNER','ALFREDO WAGNER','SC');
insert into Municipio values (25008,'ANCHIETA','ANCHIETA','SC');
insert into Municipio values (25009,'ANGELINA','ANGELINA','SC');
insert into Municipio values (25010,'ANITA GARIBALDI','ANITA GARIBALDI','SC');
insert into Municipio values (25011,'ANITAPOLIS','ANITAPOLIS','SC');
insert into Municipio values (25012,'ANTONIO CARLOS','ANTONIO CARLOS','SC');
insert into Municipio values (25013,'ARAQUARI','ARAQUARI','SC');
insert into Municipio values (25014,'ARARANGUA','ARARANGUA','SC');
insert into Municipio values (25015,'ARMAZEM','ARMAZEM','SC');
insert into Municipio values (25016,'ARROIO TRINTA','ARROIO TRINTA','SC');
insert into Municipio values (25017,'ASCURRA','ASCURRA','SC');
insert into Municipio values (25018,'ATALANTA','ATALANTA','SC');
insert into Municipio values (25019,'AURORA','AURORA','SC');
insert into Municipio values (25020,'BALNEARIO DE CAMBORIU','BALN.CAMBORIU','SC');
insert into Municipio values (25021,'BARRA VELHA','BARRA VELHA','SC');
insert into Municipio values (25022,'BENEDITO NOVO','BENEDITO NOVO','SC');
insert into Municipio values (25023,'BIGUACU','BIGUACU','SC');
insert into Municipio values (25024,'BLUMENAU','BLUMENAU','SC');
insert into Municipio values (25025,'BOM JARDIM DA SERRA','B.JARDIM SERRA','SC');
insert into Municipio values (25026,'BOM RETIRO','BOM RETIRO','SC');
insert into Municipio values (25027,'BOTUVERA','BOTUVERA','SC');
insert into Municipio values (25028,'BRACO DO NORTE','BRACO DO NORTE','SC');
insert into Municipio values (25029,'BRUSQUE','BRUSQUE','SC');
insert into Municipio values (25030,'CACADOR','CACADOR','SC');
insert into Municipio values (25031,'CAIBI','CAIBI','SC');
insert into Municipio values (25032,'CAMBORIU','CAMBORIU','SC');
insert into Municipio values (25033,'CAMPO ALEGRE','CAMPO ALEGRE','SC');
insert into Municipio values (25034,'CAMPO BELO DO SUL','CAMPO BELO SUL','SC');
insert into Municipio values (25035,'CAMPO ERE','CAMPO ERE','SC');
insert into Municipio values (25036,'CAMPOS NOVOS','CAMPOS NOVOS','SC');
insert into Municipio values (25037,'CANELINHA','CANELINHA','SC');
insert into Municipio values (25038,'CANOINHAS','CANOINHAS','SC');
insert into Municipio values (25039,'CAPINZAL','CAPINZAL','SC');
insert into Municipio values (25040,'CATANDUVAS','CATANDUVAS','SC');
insert into Municipio values (25041,'CAXAMBU DO SUL','CAXAMBU DO SUL','SC');
insert into Municipio values (25042,'CHAPECO','CHAPECO','SC');
insert into Municipio values (25043,'CONCORDIA','CONCORDIA','SC');
insert into Municipio values (25044,'CORONEL FREITAS','CORONEL FREITAS','SC');
insert into Municipio values (25045,'CORUPA','CORUPA','SC');
insert into Municipio values (25046,'CRICIUMA','CRICIUMA','SC');
insert into Municipio values (25047,'CUNHA PORA','CUNHA PORA','SC');
insert into Municipio values (25048,'CURITIBANOS','CURITIBANOS','SC');
insert into Municipio values (25049,'DESCANSO','DESCANSO','SC');
insert into Municipio values (25050,'DIONISIO CERQUEIRA','DION.CERQUEIRA','SC');
insert into Municipio values (25051,'DONA EMMA','DONA EMMA','SC');
insert into Municipio values (25052,'ERVAL VELHO','ERVAL VELHO','SC');
insert into Municipio values (25053,'FAXINAL DOS GUEDES','FAXINAL GUEDES','SC');
insert into Municipio values (25054,'FLORIANOPOLIS','FLORIANOPOLIS','SC');
insert into Municipio values (25055,'FRAIBURGO','FRAIBURGO','SC');
insert into Municipio values (25056,'GALVAO','GALVAO','SC');
insert into Municipio values (25057,'GAROPABA','GAROPABA','SC');
insert into Municipio values (25058,'GARUVA','GARUVA','SC');
insert into Municipio values (25059,'GASPAR','GASPAR','SC');
insert into Municipio values (25060,'GOVERNADOR CELSO RAMOS','GOV.CELSO RAMOS','SC');
insert into Municipio values (25061,'GRAO PARA','GRAO PARA','SC');
insert into Municipio values (25062,'GRAVATAL','GRAVATAL','SC');
insert into Municipio values (25063,'GUABIRUBA','GUABIRUBA','SC');
insert into Municipio values (25064,'GUARACIABA','GUARACIABA','SC');
insert into Municipio values (25065,'GUARAMIRIM','GUARAMIRIM','SC');
insert into Municipio values (25066,'GUARUJA DO SUL','GUARUJA DO SUL','SC');
insert into Municipio values (25067,'HERVAL D´OESTE','HERVAL D´OESTE','SC');
insert into Municipio values (25068,'IBICARE','IBICARE','SC');
insert into Municipio values (25069,'IBIRAMA','IBIRAMA','SC');
insert into Municipio values (25070,'ICARA','ICARA','SC');
insert into Municipio values (25071,'ILHOTA','ILHOTA','SC');
insert into Municipio values (25072,'IMARUI','IMARUI','SC');
insert into Municipio values (25073,'IMBITUBA','IMBITUBA','SC');
insert into Municipio values (25074,'IMBUIA','IMBUIA','SC');
insert into Municipio values (25075,'INDAIAL','INDAIAL','SC');
insert into Municipio values (25076,'IPIRA','IPIRA','SC');
insert into Municipio values (25077,'IPUMIRIM','IPUMIRIM','SC');
insert into Municipio values (25078,'IRANI','IRANI','SC');
insert into Municipio values (25079,'IRINEOPOLIS','IRINEOPOLIS','SC');
insert into Municipio values (25080,'ITA','ITA','SC');
insert into Municipio values (25081,'ITAIOPOLIS','ITAIOPOLIS','SC');
insert into Municipio values (25082,'ITAJAI','ITAJAI','SC');
insert into Municipio values (25083,'ITAPEMA','ITAPEMA','SC');
insert into Municipio values (25084,'ITAPIRANGA','ITAPIRANGA','SC');
insert into Municipio values (25085,'ITUPORANGA','ITUPORANGA','SC');
insert into Municipio values (25086,'JABORA','JABORA','SC');
insert into Municipio values (25087,'JACINTO MACHADO','JACINTO MACHADO','SC');
insert into Municipio values (25088,'JAGUARUNA','JAGUARUNA','SC');
insert into Municipio values (25089,'JARAGUA DO SUL','JARAGUA DO SUL','SC');
insert into Municipio values (25090,'JOACABA','JOACABA','SC');
insert into Municipio values (25091,'JOINVILE','JOINVILE','SC');
insert into Municipio values (25092,'LACERDOPOLIS','LACERDOPOLIS','SC');
insert into Municipio values (25093,'LAGES','LAGES','SC');
insert into Municipio values (25094,'LAGUNA','LAGUNA','SC');
insert into Municipio values (25095,'LAURENTINO','LAURENTINO','SC');
insert into Municipio values (25096,'LAURO MULLER','LAURO MULLER','SC');
insert into Municipio values (25097,'LEBON REGIS','LEBON REGIS','SC');
insert into Municipio values (25098,'LEOBERTO LEAL','LEOBERTO LEAL','SC');
insert into Municipio values (25099,'LONTRAS','LONTRAS','SC');
insert into Municipio values (25100,'LUIZ ALVES','LUIZ ALVES','SC');
insert into Municipio values (25101,'MAFRA','MAFRA','SC');
insert into Municipio values (25102,'MAJOR GERCINO','MAJOR GERCINO','SC');
insert into Municipio values (25103,'MAJOR VIEIRA','MAJOR VIEIRA','SC');
insert into Municipio values (25104,'MARACAJA','MARACAJA','SC');
insert into Municipio values (25105,'MARAVILHA','MARAVILHA','SC');
insert into Municipio values (25106,'MASSARANDUBA','MASSARANDUBA','SC');
insert into Municipio values (25107,'MATOS COSTA','MATOS COSTA','SC');
insert into Municipio values (25108,'MELEIRO','MELEIRO','SC');
insert into Municipio values (25109,'MODELO','MODELO','SC');
insert into Municipio values (25110,'MONDAI','MONDAI','SC');
insert into Municipio values (25111,'MONTE CASTELO','MONTE CASTELO','SC');
insert into Municipio values (25112,'MORRO DA FUMACA','MORRO DA FUMACA','SC');
insert into Municipio values (25113,'NAVEGANTES','NAVEGANTES','SC');
insert into Municipio values (25114,'NOVA ERECHIM','NOVA ERECHIM','SC');
insert into Municipio values (25115,'NOVA TRENTO','NOVA TRENTO','SC');
insert into Municipio values (25116,'NOVA VENEZA','NOVA VENEZA','SC');
insert into Municipio values (25117,'ORLEANS','ORLEANS','SC');
insert into Municipio values (25118,'OURO','OURO','SC');
insert into Municipio values (25119,'PALHOCA','PALHOCA','SC');
insert into Municipio values (25120,'PALMA SOLA','PALMA SOLA','SC');
insert into Municipio values (25121,'PALMITOS','PALMITOS','SC');
insert into Municipio values (25122,'PAPANDUVA','PAPANDUVA','SC');
insert into Municipio values (25123,'PAULO LOPES','PAULO LOPES','SC');
insert into Municipio values (25124,'PEDRAS GRANDES','PEDRAS GRANDES','SC');
insert into Municipio values (25125,'PENHA','PENHA','SC');
insert into Municipio values (25126,'PERITIBA','PERITIBA','SC');
insert into Municipio values (25127,'PETROLANDIA','PETROLANDIA','SC');
insert into Municipio values (25128,'PICARRAS','PICARRAS','SC');
insert into Municipio values (25129,'PINHALZINHO','PINHALZINHO','SC');
insert into Municipio values (25130,'PINHEIRO PRETO','PINHEIRO PRETO','SC');
insert into Municipio values (25131,'PIRATUBA','PIRATUBA','SC');
insert into Municipio values (25132,'POMERODE','POMERODE','SC');
insert into Municipio values (25133,'PONTE ALTA','PONTE ALTA','SC');
insert into Municipio values (25134,'PONTE SERRADA','PONTE SERRADA','SC');
insert into Municipio values (25135,'PORTO BELO','PORTO BELO','SC');
insert into Municipio values (25136,'PORTO UNIAO','PORTO UNIAO','SC');
insert into Municipio values (25137,'POUSO REDONDO','POUSO REDONDO','SC');
insert into Municipio values (25138,'PRAIA GRANDE','PRAIA GRANDE','SC');
insert into Municipio values (25139,'PRES. CASTELO BRANCO','PRES.C.BRANCO','SC');
insert into Municipio values (25140,'PRESIDENTE GETULIO','PRES.GETULIO','SC');
insert into Municipio values (25141,'PRESIDENTE NEREU','PRES.NEREU','SC');
insert into Municipio values (25142,'QUILOMBO','QUILOMBO','SC');
insert into Municipio values (25143,'RANCHO QUEIMADO','RANCHO QUEIMADO','SC');
insert into Municipio values (25144,'RIO DAS ANTAS','RIO DAS ANTAS','SC');
insert into Municipio values (25145,'RIO DO CAMPO','RIO DO CAMPO','SC');
insert into Municipio values (25146,'RIO DO OESTE','RIO DO OESTE','SC');
insert into Municipio values (25147,'RIO DO SUL','RIO DO SUL','SC');
insert into Municipio values (25148,'RIO DOS CEDROS','RIO DOS CEDROS','SC');
insert into Municipio values (25149,'RIO FORTUNA','RIO FORTUNA','SC');
insert into Municipio values (25150,'RIO NEGRINHO','RIO NEGRINHO','SC');
insert into Municipio values (25151,'RODEIO','RODEIO','SC');
insert into Municipio values (25152,'ROMELANDIA','ROMELANDIA','SC');
insert into Municipio values (25153,'SANTO AMARO DA IMPERATRIZ','S.A.IMPERATRIZ','SC');
insert into Municipio values (25154,'SAO BENTO DO SUL','SAO BENTO SUL','SC');
insert into Municipio values (25155,'SAO BONIFACIO','SAO BONIFACIO','SC');
insert into Municipio values (25156,'SAO CARLOS','SAO CARLOS','SC');
insert into Municipio values (25157,'SANTA CECILIA','SANTA CECILIA','SC');
insert into Municipio values (25158,'SAO DOMINGOS','SAO DOMINGOS','SC');
insert into Municipio values (25159,'SAO FRANCISCO DO SUL','S.FRANCISCO SUL','SC');
insert into Municipio values (25160,'SAO JOAO BATISTA','S.JOAO BATISTA','SC');
insert into Municipio values (25161,'SAO JOAO DO SUL','S.JOAO DO SUL','SC');
insert into Municipio values (25162,'SAO JOAQUIM','SAO JOAQUIM','SC');
insert into Municipio values (25163,'SAO JOSE','SAO JOSE','SC');
insert into Municipio values (25165,'SAO JOSE DO CERRITO','S.JOSE CERRITO','SC');
insert into Municipio values (25166,'SAO LOURENCO DO OESTE','S.LOURENCO OESTE','SC');
insert into Municipio values (25167,'SAO LUDGERO','SAO LUDGERO','SC');
insert into Municipio values (25168,'SAO MARTINHO','SAO MARTINHO','SC');
insert into Municipio values (25169,'SAO MIGUEL D´OESTE','S.MIG.D´OESTE','SC');
insert into Municipio values (25170,'SANTA ROSA DE LIMA','SANTA ROSA LIMA','SC');
insert into Municipio values (25171,'SALETE','SALETE','SC');
insert into Municipio values (25172,'SALTO VELOSO','SALTO VELOSO','SC');
insert into Municipio values (25173,'SAUDADES','SAUDADES','SC');
insert into Municipio values (25174,'SCHROEDER','SCHROEDER','SC');
insert into Municipio values (25175,'SEARA','SEARA','SC');
insert into Municipio values (25176,'SIDEROPOLIS','SIDEROPOLIS','SC');
insert into Municipio values (25177,'SOMBRIO','SOMBRIO','SC');
insert into Municipio values (25178,'TAIO','TAIO','SC');
insert into Municipio values (25179,'TANGARA','TANGARA','SC');
insert into Municipio values (25180,'TIJUCAS','TIJUCAS','SC');
insert into Municipio values (25181,'TIMBE DO SUL','TIMBE DO SUL','SC');
insert into Municipio values (25182,'TIMBO','TIMBO','SC');
insert into Municipio values (25183,'TRES BARRAS','TRES BARRAS','SC');
insert into Municipio values (25184,'TREZE DE MAIO','TREZE DE MAIO','SC');
insert into Municipio values (25185,'TREZE TILIAS','TREZE TILIAS','SC');
insert into Municipio values (25186,'TROMBUDO CENTRAL','TROMB.CENTRAL','SC');
insert into Municipio values (25187,'TUBARAO','TUBARAO','SC');
insert into Municipio values (25188,'TURVO','TURVO','SC');
insert into Municipio values (25189,'URUBICI','URUBICI','SC');
insert into Municipio values (25190,'URUSSANGA','URUSSANGA','SC');
insert into Municipio values (25191,'VARGEAO','VARGEAO','SC');
insert into Municipio values (25192,'VIDAL RAMOS','VIDAL RAMOS','SC');
insert into Municipio values (25193,'VIDEIRA','VIDEIRA','SC');
insert into Municipio values (25194,'WITMARSUM','WITMARSUM','SC');
insert into Municipio values (25195,'XANXERE','XANXERE','SC');
insert into Municipio values (25196,'XAVANTINA','XAVANTINA','SC');
insert into Municipio values (25197,'XAXIM','XAXIM','SC');
insert into Municipio values (25198,'ABDON BATISTA','ABDON BATISTA','SC');
insert into Municipio values (25199,'APIUNA','APIUNA','SC');
insert into Municipio values (25200,'ARABUTA','ARABUTA','SC');
insert into Municipio values (25203,'BOCAINA DO SUL','BOCAINA DO SUL','SC');
insert into Municipio values (25205,'CALMON','CALMON','SC');
insert into Municipio values (25208,'DOUTOR PEDRINHO','DR.PEDRINHO','SC');
insert into Municipio values (25210,'ERMO','ERMO','SC');
insert into Municipio values (25211,'FORQUILHINHA','FORQUILHINHA','SC');
insert into Municipio values (25215,'JOSE BOITEUX','JOSE BOITEUX','SC');
insert into Municipio values (25216,'LUZERNA','LUZERNA','SC');
insert into Municipio values (25219,'PAINEL','PAINEL','SC');
insert into Municipio values (25226,'SAO PEDRO DE ALCANTARA','S.P.ALCANTARA','SC');
insert into Municipio values (25228,'SAO JOSE DO CEDRO','S.JOSE DO CEDRO','SC');
insert into Municipio values (25229,'CORREIA PINTO','CORREIA PINTO','SC');
insert into Municipio values (25230,'OTACILIO COSTA','OTACILIO COSTA','SC');
insert into Municipio values (25231,'CELSO RAMOS','CELSO RAMOS','SC');
insert into Municipio values (25232,'IPORA DO OESTE','IPORA DO OESTE','SC');
insert into Municipio values (25233,'IRACEMINHA/SC','IRACEMINHA/SC','SC');
insert into Municipio values (25234,'ITAPOA','ITAPOA','SC');
insert into Municipio values (25235,'LINDOIA DO SUL','LINDOIA DO SUL','SC');
insert into Municipio values (25236,'MAREMA','MAREMA','SC');
insert into Municipio values (25237,'SANTA ROSA DO SUL','SANTA ROSA SUL','SC');
insert into Municipio values (25238,'SERRA ALTA','SERRA ALTA','SC');
insert into Municipio values (25239,'TIMBO GRANDE','TIMBO GRANDE','SC');
insert into Municipio values (25240,'TUNAPOLIS','TUNAPOLIS','SC');
insert into Municipio values (25241,'UNIAO DO OESTE','UNIAO DO OESTE','SC');
insert into Municipio values (25242,'URUPEMA','URUPEMA','SC');
insert into Municipio values (25244,'BOMBINHAS','BOMBINHAS','SC');
insert into Municipio values (25245,'OURO VERDE','OURO VERDE','SC');
insert into Municipio values (25246,'SANTA TEREZINHA','SANTA TEREZINHA','SC');
insert into Municipio values (25247,'MIRIM DOCE','MIRIM DOCE','SC');
insert into Municipio values (25248,'SAO JOAO DO OESTE','SAO JOAO OESTE','SC');
insert into Municipio values (25249,'COCAL DO SUL','COCAL DO SUL','SC');
insert into Municipio values (25250,'AGUAS FRIAS','AGUAS FRIAS','SC');
insert into Municipio values (25251,'NOVA ITABERABA','NOVA ITABERABA','SC');
insert into Municipio values (25252,'GUATAMBU','GUATAMBU','SC');
insert into Municipio values (25253,'MORRO GRANDE','MORRO GRANDE','SC');
insert into Municipio values (25254,'CORDILHEIRA ALTA','CORDILHEIRA ALTA','SC');
insert into Municipio values (25255,'CAPIVARI DE BAIXO','CAPIVARI BAIXO','SC');
insert into Municipio values (25256,'BELMONTE','BELMONTE','SC');
insert into Municipio values (25257,'SANGAO','SANGAO','SC');
insert into Municipio values (25258,'IRATI','IRATI','SC');
insert into Municipio values (25259,'PONTE ALTA DO NORTE','P.ALTA NORTE','SC');
insert into Municipio values (25260,'VARGEM BONITA','VARGEM BONITA','SC');
insert into Municipio values (25261,'FORMOSA DO SUL','FORMOSA DO SUL','SC');
insert into Municipio values (25262,'SANTA HELENA','SANTA HELENA','SC');
insert into Municipio values (25263,'RIQUEZA','RIQUEZA','SC');
insert into Municipio values (25264,'LAGEADO GRANDE','LAGEADO GRANDE','SC');
insert into Municipio values (25265,'SAO CRISTOVAO DO SUL','S.CRISTOVAO SUL','SC');
insert into Municipio values (25266,'CERRO NEGRO','CERRO NEGRO','SC');
insert into Municipio values (25267,'MONTE CARLO','MONTE CARLO','SC');
insert into Municipio values (25268,'SAO JOAO DO ITAPERIU','S.JOAO ITAPERIU','SC');
insert into Municipio values (25269,'NOVO HORIZONTE','NOVO HORIZONTE','SC');
insert into Municipio values (25270,'CORONEL MARTINS','CEL.MARTINS','SC');
insert into Municipio values (25271,'IPUACU','IPUACU','SC');
insert into Municipio values (25272,'SUL BRASIL','SUL BRASIL','SC');
insert into Municipio values (25273,'PLANALTO ALEGRE','PLANALTO ALEGRE','SC');
insert into Municipio values (25274,'JARDINOPOLIS','JARDINOPOLIS','SC');
insert into Municipio values (25275,'BARRA DO SUL','BARRA DO SUL','SC');
insert into Municipio values (25276,'SAO MIGUEL DA BOA VISTA','S.M.BOA VISTA','SC');
insert into Municipio values (25277,'VARGEM','VARGEM','SC');
insert into Municipio values (25278,'MACIEIRA','MACIEIRA','SC');
insert into Municipio values (25279,'VITOR MEIRELES','VITOR MEIRELES','SC');
insert into Municipio values (25280,'PARAISO','PARAISO','SC');
insert into Municipio values (25281,'BRACO DO TROMBUDO','BRACO TROMBUDO','SC');
insert into Municipio values (25282,'PASSOS MAIA','PASSOS MAIA','SC');
insert into Municipio values (25283,'JUPIA','JUPIA','SC');
insert into Municipio values (25284,'BELA VISTA DO TOLDO','B.VISTA DO TOLDO','SC');
insert into Municipio values (25285,'CAPAO ALTO','CAPAO ALTO','SC');
insert into Municipio values (25286,'PRINCESA','PRINCESA','SC');
insert into Municipio values (25287,'SAO BERNARDINO','SAO BERNARDINO','SC');
insert into Municipio values (25288,'BARRA BONITA','BARRA BONITA','SC');
insert into Municipio values (25289,'SANTA TEREZINHA DO PROGRESSO','STA.T.PROGRESSO','SC');
insert into Municipio values (25290,'BOM JESUS','BOM JESUS','SC');
insert into Municipio values (25291,'ARVOREDO','ARVOREDO','SC');
insert into Municipio values (25292,'PASSO DE TORRES','PASSO DE TORRES','SC');
insert into Municipio values (25293,'SALTINHO','SALTINHO','SC');
insert into Municipio values (25294,'IOMERE','IOMERE','SC');
insert into Municipio values (25295,'BANDEIRANTES','BANDEIRANTES','SC');
insert into Municipio values (25296,'SANTIAGO DO SUL','SANTIAGO DO SUL','SC');
insert into Municipio values (25297,'FREI ROGERIO','FREI ROGERIO','SC');
insert into Municipio values (25298,'TREVISO','TREVISO','SC');
insert into Municipio values (25299,'BOM JESUS DO OESTE','BOM JESUS OESTE','SC');
insert into Municipio values (25300,'ENTRE RIOS','ENTRE RIOS','SC');
insert into Municipio values (25301,'FLOR DO SERTAO','FLOR DO SERTAO','SC');
insert into Municipio values (25302,'IBIAM','IBIAM','SC');
insert into Municipio values (25303,'PAIAL','PAIAL','SC');
insert into Municipio values (25304,'TIGRINHOS','TIGRINHOS','SC');
insert into Municipio values (25305,'ZORTEA','ZORTEA','SC');
insert into Municipio values (25306,'PALMEIRA','PALMEIRA','SC');
insert into Municipio values (25307,'BALNEARIO GAIVOTA','BALN.GAIVOTA','SC');
insert into Municipio values (25308,'ALTO BELA VISTA','ALTO BELA VISTA','SC');
insert into Municipio values (25309,'BALNEARIO ARROIO DO SILVA','B.ARROIO SILVA','SC');
insert into Municipio values (25310,'BRUNOPOLIS','BRUNOPOLIS','SC');
insert into Municipio values (25311,'CHAPADAO DO LAGEADO','CHAPADAO LAGEADO','SC');
insert into Municipio values (25312,'RIO RUFINO','RIO RUFINO','SC');
insert into Municipio values (25313,'CUNHATAI','CUNHATAI','SC');
insert into Municipio values (26001,'AMPARO DE SAO FRANCISCO','AMP.S.FRANCISCO','SE');
insert into Municipio values (26002,'AQUIDABA','AQUIDABA','SE');
insert into Municipio values (26003,'ARACAJU','ARACAJU','SE');
insert into Municipio values (26004,'ARAUA','ARAUA','SE');
insert into Municipio values (26005,'AREIA BRANCA','AREIA BRANCA','SE');
insert into Municipio values (26006,'BARRA DOS COQUEIROS','BARRA COQUEIROS','SE');
insert into Municipio values (26007,'BREJO GRANDE','BREJO GRANDE','SE');
insert into Municipio values (26008,'BOQUIM','BOQUIM','SE');
insert into Municipio values (26009,'CAMPO DO BRITO','CAMPO DO BRITO','SE');
insert into Municipio values (26010,'CANHOBA','CANHOBA','SE');
insert into Municipio values (26011,'CANINDE DE SAO FRANCISCO','C.SAO FRANCISCO','SE');
insert into Municipio values (26012,'CAPELA','CAPELA','SE');
insert into Municipio values (26013,'CARIRA','CARIRA','SE');
insert into Municipio values (26014,'CARMOPOLIS','CARMOPOLIS','SE');
insert into Municipio values (26015,'CEDRO DE SAO JOAO','CEDRO SAO JOAO','SE');
insert into Municipio values (26016,'CRISTINAPOLIS','CRISTINAPOLIS','SE');
insert into Municipio values (26018,'CUMBE','CUMBE','SE');
insert into Municipio values (26019,'DIVINA PASTORA','DIVINA PASTORA','SE');
insert into Municipio values (26020,'ESTANCIA','ESTANCIA','SE');
insert into Municipio values (26021,'FEIRA NOVA','FEIRA NOVA','SE');
insert into Municipio values (26022,'FREI PAULO','FREI PAULO','SE');
insert into Municipio values (26023,'GARARU','GARARU','SE');
insert into Municipio values (26024,'GENERAL MAYNARD','GENERAL MAYNARD','SE');
insert into Municipio values (26025,'GRACHO CARDOSO','GRACHO CARDOSO','SE');
insert into Municipio values (26026,'ILHA DAS FLORES','ILHA DAS FLORES','SE');
insert into Municipio values (26027,'INDIAROBA','INDIAROBA','SE');
insert into Municipio values (26028,'ITABAIANA','ITABAIANA','SE');
insert into Municipio values (26029,'ITABAIANINHA','ITABAIANINHA','SE');
insert into Municipio values (26030,'ITABI','ITABI','SE');
insert into Municipio values (26031,'ITAPORANGA D´AJUDA','ITAP.D´AJUDA','SE');
insert into Municipio values (26032,'JAPARATUBA','JAPARATUBA','SE');
insert into Municipio values (26033,'JAPOATA','JAPOATA','SE');
insert into Municipio values (26034,'LAGARTO','LAGARTO','SE');
insert into Municipio values (26035,'LARANJEIRAS','LARANJEIRAS','SE');
insert into Municipio values (26036,'MACAMBIRA','MACAMBIRA','SE');
insert into Municipio values (26037,'MALHADA DOS BOIS','MALHADA BOIS','SE');
insert into Municipio values (26038,'MALHADOR','MALHADOR','SE');
insert into Municipio values (26039,'MARUIM','MARUIM','SE');
insert into Municipio values (26040,'MOITA BONITA','MOITA BONITA','SE');
insert into Municipio values (26041,'MONTE ALEGRE DE SERGIPE','M.ALEGRE SERGIPE','SE');
insert into Municipio values (26042,'MURIBECA','MURIBECA','SE');
insert into Municipio values (26043,'NEOPOLIS','NEOPOLIS','SE');
insert into Municipio values (26044,'NOSSA SENHORA DAS DORES','N.SRA.DAS DORES','SE');
insert into Municipio values (26045,'NOSSA SENHORA DA GLORIA','N.SRA.DA GLORIA','SE');
insert into Municipio values (26046,'NOSSA SENHORA DE LOURDES','N.SRA.LOURDES','SE');
insert into Municipio values (26047,'NOSSA SENHORA DO SOCORRO','N.SRA.SOCORRO','SE');
insert into Municipio values (26048,'PACATUBA','PACATUBA','SE');
insert into Municipio values (26049,'PEDRA MOLE','PEDRA MOLE','SE');
insert into Municipio values (26050,'PEDRINHAS','PEDRINHAS','SE');
insert into Municipio values (26051,'PINHAO','PINHAO','SE');
insert into Municipio values (26052,'PIRAMBU','PIRAMBU','SE');
insert into Municipio values (26053,'POCO REDONDO','POCO REDONDO','SE');
insert into Municipio values (26054,'POCO VERDE','POCO VERDE','SE');
insert into Municipio values (26055,'PORTO DA FOLHA','PORTO DA FOLHA','SE');
insert into Municipio values (26056,'PROPRIA','PROPRIA','SE');
insert into Municipio values (26057,'RIACHAO DO DANTAS','RIACHAO DANTAS','SE');
insert into Municipio values (26058,'RIACHUELO','RIACHUELO','SE');
insert into Municipio values (26059,'RIBEIROPOLIS','RIBEIROPOLIS','SE');
insert into Municipio values (26060,'ROSARIO DO CATETE','ROSARIO CATETE','SE');
insert into Municipio values (26061,'SALGADO','SALGADO','SE');
insert into Municipio values (26062,'SANTA LUZIA DO ITANHI','S.LUZIA ITANHI','SE');
insert into Municipio values (26063,'SANTA ROSA DE LIMA','SANTA ROSA LIMA','SE');
insert into Municipio values (26064,'SANTO AMARO DAS BROTAS','S.AMARO BROTAS','SE');
insert into Municipio values (26065,'SAO CRISTOVAO','SAO CRISTOVAO','SE');
insert into Municipio values (26066,'SAO DOMINGOS','SAO DOMINGOS','SE');
insert into Municipio values (26067,'SAO FRANCISCO','SAO FRANCISCO','SE');
insert into Municipio values (26068,'SAO MIGUEL DO ALEIXO','S.MIGUEL ALEIXO','SE');
insert into Municipio values (26069,'SIMAO DIAS','SIMAO DIAS','SE');
insert into Municipio values (26070,'SIRIRI','SIRIRI','SE');
insert into Municipio values (26071,'TELHA','TELHA','SE');
insert into Municipio values (26072,'TOBIAS BARRETO','TOBIAS BARRETO','SE');
insert into Municipio values (26073,'TOMAR DO GERU','TOMAR DO GERU','SE');
insert into Municipio values (26074,'UMBAUBA','UMBAUBA','SE');
insert into Municipio values (26075,'NOSSA SENHORA APARECIDA','N.SRA.APARECIDA','SE');
insert into Municipio values (26076,'SANTANA DE SAO FRANCISCO','SANT.S.FRANCISCO','SE');
insert into Municipio values (27001,'ADAMANTINA','ADAMANTINA','SP');
insert into Municipio values (27002,'ADOLFO','ADOLFO','SP');
insert into Municipio values (27003,'AGUAI','AGUAI','SP');
insert into Municipio values (27004,'AGUAS DA PRATA','AGUAS DA PRATA','SP');
insert into Municipio values (27005,'AGUAS DE LINDOIA','AGUAS LINDOIA','SP');
insert into Municipio values (27006,'AGUAS DE SAO PEDRO','AGUAS SAO PEDRO','SP');
insert into Municipio values (27007,'AGUDOS','AGUDOS','SP');
insert into Municipio values (27008,'ALFREDO MARCONDES','ALF.MARCONDES','SP');
insert into Municipio values (27009,'ALTAIR','ALTAIR','SP');
insert into Municipio values (27010,'ALTINOPOLIS','ALTINOPOLIS','SP');
insert into Municipio values (27011,'ALTO ALEGRE','ALTO ALEGRE','SP');
insert into Municipio values (27012,'ALVARES FLORENCE','ALV.FLORENCE','SP');
insert into Municipio values (27013,'ALVARES MACHADO','ALVARES MACHADO','SP');
insert into Municipio values (27014,'ALVARO DE CARVALHO','ALVARO CARVALHO','SP');
insert into Municipio values (27015,'ALVINLANDIA','ALVINLANDIA','SP');
insert into Municipio values (27016,'AMERICANA','AMERICANA','SP');
insert into Municipio values (27017,'AMERICO BRASILIENSE','AM.BRASILIENSE','SP');
insert into Municipio values (27018,'AMERICO DE CAMPOS','AMERICO CAMPOS','SP');
insert into Municipio values (27019,'AMPARO','AMPARO','SP');
insert into Municipio values (27020,'ANALANDIA','ANALANDIA','SP');
insert into Municipio values (27021,'ANDRADINA','ANDRADINA','SP');
insert into Municipio values (27022,'ANGATUBA','ANGATUBA','SP');
insert into Municipio values (27023,'ANHEMBI','ANHEMBI','SP');
insert into Municipio values (27024,'ANHUMAS','ANHUMAS','SP');
insert into Municipio values (27025,'APARECIDA','APARECIDA','SP');
insert into Municipio values (27026,'APARECIDA D´OESTE','APAREC.D´OESTE','SP');
insert into Municipio values (27027,'APIAI','APIAI','SP');
insert into Municipio values (27028,'ARACATUBA','ARACATUBA','SP');
insert into Municipio values (27029,'ARACOIABA DA SERRA','ARACOIABA SERRA','SP');
insert into Municipio values (27030,'ARAMINA','ARAMINA','SP');
insert into Municipio values (27031,'ARANDU','ARANDU','SP');
insert into Municipio values (27032,'ARARAQUARA','ARARAQUARA','SP');
insert into Municipio values (27033,'ARARAS','ARARAS','SP');
insert into Municipio values (27034,'AREALVA','AREALVA','SP');
insert into Municipio values (27035,'AREIAS','AREIAS','SP');
insert into Municipio values (27036,'AREIOPOLIS','AREIOPOLIS','SP');
insert into Municipio values (27037,'ARIRANHA','ARIRANHA','SP');
insert into Municipio values (27038,'ARTUR NOGUEIRA','ARTUR NOGUEIRA','SP');
insert into Municipio values (27039,'ARUJA','ARUJA','SP');
insert into Municipio values (27040,'ASSIS','ASSIS','SP');
insert into Municipio values (27041,'ATIBAIA','ATIBAIA','SP');
insert into Municipio values (27042,'AURIFLAMA','AURIFLAMA','SP');
insert into Municipio values (27043,'AVAI','AVAI','SP');
insert into Municipio values (27044,'AVANHANDAVA','AVANHANDAVA','SP');
insert into Municipio values (27045,'AVARE','AVARE','SP');
insert into Municipio values (27046,'BADY BASSITT','BADY BASSITT','SP');
insert into Municipio values (27047,'BALBINOS','BALBINOS','SP');
insert into Municipio values (27048,'BALSAMO','BALSAMO','SP');
insert into Municipio values (27049,'BANANAL','BANANAL','SP');
insert into Municipio values (27050,'BARAO DE ANTONINA','BARAO ANTONINA','SP');
insert into Municipio values (27051,'BARBOSA','BARBOSA','SP');
insert into Municipio values (27052,'BARIRI','BARIRI','SP');
insert into Municipio values (27053,'BARRA BONITA','BARRA BONITA','SP');
insert into Municipio values (27054,'BARRA DO TURVO','BARRA DO TURVO','SP');
insert into Municipio values (27055,'BARRETOS','BARRETOS','SP');
insert into Municipio values (27056,'BARRINHA','BARRINHA','SP');
insert into Municipio values (27057,'BARUERI','BARUERI','SP');
insert into Municipio values (27058,'BASTOS','BASTOS','SP');
insert into Municipio values (27059,'BATATAIS','BATATAIS','SP');
insert into Municipio values (27060,'BAURU','BAURU','SP');
insert into Municipio values (27061,'BEBEDOURO','BEBEDOURO','SP');
insert into Municipio values (27062,'BENTO DE ABREU','BENTO DE ABREU','SP');
insert into Municipio values (27063,'BERNARDINO DE CAMPOS','BERN.DE CAMPOS','SP');
insert into Municipio values (27064,'BILAC','BILAC','SP');
insert into Municipio values (27065,'BIRIGUI','BIRIGUI','SP');
insert into Municipio values (27066,'BIRITIBA-MIRIM','BIRITIBA-MIRIM','SP');
insert into Municipio values (27067,'BOA ESPERANCA DO SUL','B.ESPERANCA SUL','SP');
insert into Municipio values (27068,'BOCAINA','BOCAINA','SP');
insert into Municipio values (27069,'BOFETE','BOFETE','SP');
insert into Municipio values (27070,'BOITUVA','BOITUVA','SP');
insert into Municipio values (27071,'BOM JESUS DOS PERDOES','B.JESUS PERDOES','SP');
insert into Municipio values (27072,'BORA','BORA','SP');
insert into Municipio values (27073,'BORACEIA','BORACEIA','SP');
insert into Municipio values (27074,'BORBOREMA','BORBOREMA','SP');
insert into Municipio values (27075,'BOTUCATU','BOTUCATU','SP');
insert into Municipio values (27076,'BRAGANCA PAULISTA','BRAG.PAULISTA','SP');
insert into Municipio values (27077,'BRAUNA','BRAUNA','SP');
insert into Municipio values (27078,'BRODOSQUI','BRODOSQUI','SP');
insert into Municipio values (27079,'BROTAS','BROTAS','SP');
insert into Municipio values (27080,'BURI','BURI','SP');
insert into Municipio values (27081,'BURITAMA','BURITAMA','SP');
insert into Municipio values (27082,'BURITIZAL','BURITIZAL','SP');
insert into Municipio values (27083,'CABRALIA PAULISTA','CABR.PAULISTA','SP');
insert into Municipio values (27084,'CABREUVA','CABREUVA','SP');
insert into Municipio values (27085,'CACAPAVA','CACAPAVA','SP');
insert into Municipio values (27086,'CACHOEIRA PAULISTA','CACH.PAULISTA','SP');
insert into Municipio values (27087,'CACONDE','CACONDE','SP');
insert into Municipio values (27088,'CAFELANDIA','CAFELANDIA','SP');
insert into Municipio values (27089,'CAIABU','CAIABU','SP');
insert into Municipio values (27090,'CAIEIRAS','CAIEIRAS','SP');
insert into Municipio values (27091,'CAIUA','CAIUA','SP');
insert into Municipio values (27092,'CAJAMAR','CAJAMAR','SP');
insert into Municipio values (27093,'CAJOBI','CAJOBI','SP');
insert into Municipio values (27094,'CAJURU','CAJURU','SP');
insert into Municipio values (27095,'CAMPINAS','CAMPINAS','SP');
insert into Municipio values (27096,'CAMPO LIMPO PAULISTA','C.LIMP.PAULISTA','SP');
insert into Municipio values (27097,'CAMPOS DO JORDAO','CAMPOS JORDAO','SP');
insert into Municipio values (27098,'CAMPOS NOVOS PAULISTA','C.NOVOS PAULISTA','SP');
insert into Municipio values (27099,'CANANEIA','CANANEIA','SP');
insert into Municipio values (27100,'CANDIDO MOTA','CANDIDO MOTA','SP');
insert into Municipio values (27101,'CANDIDO RODRIGUES','CAND.RODRIGUES','SP');
insert into Municipio values (27102,'CAPAO BONITO','CAPAO BONITO','SP');
insert into Municipio values (27103,'CAPELA DO ALTO','CAPELA DO ALTO','SP');
insert into Municipio values (27104,'CAPIVARI','CAPIVARI','SP');
insert into Municipio values (27105,'CARAGUATATUBA','CARAGUATATUBA','SP');
insert into Municipio values (27106,'CARAPICUIBA','CARAPICUIBA','SP');
insert into Municipio values (27107,'CARDOSO','CARDOSO','SP');
insert into Municipio values (27108,'CASA BRANCA','CASA BRANCA','SP');
insert into Municipio values (27109,'CASSIA DOS COQUEIROS','CASSIA COQUEIROS','SP');
insert into Municipio values (27110,'CASTILHO','CASTILHO','SP');
insert into Municipio values (27111,'CATANDUVA','CATANDUVA','SP');
insert into Municipio values (27112,'CATIGUA','CATIGUA','SP');
insert into Municipio values (27113,'CEDRAL','CEDRAL','SP');
insert into Municipio values (27114,'CERQUEIRA CESAR','CERQUEIRA CESAR','SP');
insert into Municipio values (27115,'CERQUILHO','CERQUILHO','SP');
insert into Municipio values (27116,'CESARIO LANGE','CESARIO LANGE','SP');
insert into Municipio values (27117,'CHARQUEADA','CHARQUEADA','SP');
insert into Municipio values (27118,'CHAVANTES','CHAVANTES','SP');
insert into Municipio values (27119,'CLEMENTINA','CLEMENTINA','SP');
insert into Municipio values (27120,'COLINA','COLINA','SP');
insert into Municipio values (27121,'COLOMBIA','COLOMBIA','SP');
insert into Municipio values (27122,'CONCHAL','CONCHAL','SP');
insert into Municipio values (27123,'CONCHAS','CONCHAS','SP');
insert into Municipio values (27124,'CORDEIROPOLIS','CORDEIROPOLIS','SP');
insert into Municipio values (27125,'COROADOS','COROADOS','SP');
insert into Municipio values (27126,'CORONEL MACEDO','CORONEL MACEDO','SP');
insert into Municipio values (27127,'CORUMBATAI','CORUMBATAI','SP');
insert into Municipio values (27128,'COSMOPOLIS','COSMOPOLIS','SP');
insert into Municipio values (27129,'COSMORAMA','COSMORAMA','SP');
insert into Municipio values (27130,'COTIA','COTIA','SP');
insert into Municipio values (27131,'CRAVINHOS','CRAVINHOS','SP');
insert into Municipio values (27132,'CRISTAIS PAULISTA','CRISTAIS PAUL.','SP');
insert into Municipio values (27133,'CRUZALIA','CRUZALIA','SP');
insert into Municipio values (27134,'CRUZEIRO','CRUZEIRO','SP');
insert into Municipio values (27135,'CUBATAO','CUBATAO','SP');
insert into Municipio values (27136,'CUNHA','CUNHA','SP');
insert into Municipio values (27137,'DESCALVADO','DESCALVADO','SP');
insert into Municipio values (27138,'DIADEMA','DIADEMA','SP');
insert into Municipio values (27139,'DIVINOLANDIA','DIVINOLANDIA','SP');
insert into Municipio values (27140,'DOBRADA','DOBRADA','SP');
insert into Municipio values (27141,'DOIS CORREGOS','DOIS CORREGOS','SP');
insert into Municipio values (27142,'DOLCINOPOLIS','DOLCINOPOLIS','SP');
insert into Municipio values (27143,'DOURADO','DOURADO','SP');
insert into Municipio values (27144,'DRACENA','DRACENA','SP');
insert into Municipio values (27145,'DUARTINA','DUARTINA','SP');
insert into Municipio values (27146,'DUMONT','DUMONT','SP');
insert into Municipio values (27147,'ECHAPORA','ECHAPORA','SP');
insert into Municipio values (27148,'ELDORADO','ELDORADO','SP');
insert into Municipio values (27149,'ELIAS FAUSTO','ELIAS FAUSTO','SP');
insert into Municipio values (27150,'EMBU','EMBU','SP');
insert into Municipio values (27151,'EMBU-GUACU','EMBU-GUACU','SP');
insert into Municipio values (27152,'ESTRELA D´OESTE','ESTRELA D´OESTE','SP');
insert into Municipio values (27153,'ESTRELA DO NORTE','ESTRELA NORTE','SP');
insert into Municipio values (27154,'FARTURA','FARTURA','SP');
insert into Municipio values (27155,'FERNANDO PRESTES','FERN.PRESTES','SP');
insert into Municipio values (27156,'FERNANDOPOLIS','FERNANDOPOLIS','SP');
insert into Municipio values (27157,'FERRAZ VASCONCELOS','FER.VASCONCELOS','SP');
insert into Municipio values (27158,'FLORA RICA','FLORA RICA','SP');
insert into Municipio values (27159,'FLOREAL','FLOREAL','SP');
insert into Municipio values (27160,'FLORIDA PAULISTA','FLOR.PAULISTA','SP');
insert into Municipio values (27161,'FLORINEA','FLORINEA','SP');
insert into Municipio values (27162,'FRANCA','FRANCA','SP');
insert into Municipio values (27163,'FRANCISCO MORATO','FRANC.MORATO','SP');
insert into Municipio values (27164,'FRANCO DA ROCHA','FRANCO DA ROCHA','SP');
insert into Municipio values (27165,'GABRIEL MONTEIRO','GABR.MONTEIRO','SP');
insert into Municipio values (27166,'GALIA','GALIA','SP');
insert into Municipio values (27167,'GARCA','GARCA','SP');
insert into Municipio values (27168,'GASTAO VIDIGAL','GASTAO VIDIGAL','SP');
insert into Municipio values (27169,'GENERAL SALGADO','GENERAL SALGADO','SP');
insert into Municipio values (27170,'GETULINA','GETULINA','SP');
insert into Municipio values (27171,'GLICERIO','GLICERIO','SP');
insert into Municipio values (27172,'GUAICARA','GUAICARA','SP');
insert into Municipio values (27173,'GUAIMBE','GUAIMBE','SP');
insert into Municipio values (27174,'GUAIRA','GUAIRA','SP');
insert into Municipio values (27175,'GUAPIACU','GUAPIACU','SP');
insert into Municipio values (27176,'GUAPIARA','GUAPIARA','SP');
insert into Municipio values (27177,'GUARA','GUARA','SP');
insert into Municipio values (27178,'GUARACAI','GUARACAI','SP');
insert into Municipio values (27179,'GUARACI','GUARACI','SP');
insert into Municipio values (27180,'GUARANI D´OESTE','GUARANI D´OESTE','SP');
insert into Municipio values (27181,'GUARANTA','GUARANTA','SP');
insert into Municipio values (27182,'GUARARAPES','GUARARAPES','SP');
insert into Municipio values (27183,'GUARAREMA','GUARAREMA','SP');
insert into Municipio values (27184,'GUARATINGUETA','GUARATINGUETA','SP');
insert into Municipio values (27185,'GUAREI','GUAREI','SP');
insert into Municipio values (27186,'GUARIBA','GUARIBA','SP');
insert into Municipio values (27187,'GUARUJA','GUARUJA','SP');
insert into Municipio values (27188,'GUARULHOS','GUARULHOS','SP');
insert into Municipio values (27189,'GUZOLANDIA','GUZOLANDIA','SP');
insert into Municipio values (27190,'HERCULANDIA','HERCULANDIA','SP');
insert into Municipio values (27191,'IACANGA','IACANGA','SP');
insert into Municipio values (27192,'IACRI','IACRI','SP');
insert into Municipio values (27193,'IBATE','IBATE','SP');
insert into Municipio values (27194,'IBIRA','IBIRA','SP');
insert into Municipio values (27195,'IBIRAREMA','IBIRAREMA','SP');
insert into Municipio values (27196,'IBITINGA','IBITINGA','SP');
insert into Municipio values (27197,'IBIUNA','IBIUNA','SP');
insert into Municipio values (27198,'ICEM','ICEM','SP');
insert into Municipio values (27199,'IEPE','IEPE','SP');
insert into Municipio values (27200,'IGARACU DO TIETE','IGARACU TIETE','SP');
insert into Municipio values (27201,'IGARAPAVA','IGARAPAVA','SP');
insert into Municipio values (27202,'IGARATA','IGARATA','SP');
insert into Municipio values (27203,'IGUAPE','IGUAPE','SP');
insert into Municipio values (27204,'ILHABELA','ILHABELA','SP');
insert into Municipio values (27205,'INDAIATUBA','INDAIATUBA','SP');
insert into Municipio values (27206,'INDIANA','INDIANA','SP');
insert into Municipio values (27207,'INDIAPORA','INDIAPORA','SP');
insert into Municipio values (27208,'INUBIA PAULISTA','INUBIA PAULISTA','SP');
insert into Municipio values (27209,'IPAUCU','IPAUCU','SP');
insert into Municipio values (27210,'IPERO','IPERO','SP');
insert into Municipio values (27211,'IPEUNA','IPEUNA','SP');
insert into Municipio values (27212,'IPORANGA','IPORANGA','SP');
insert into Municipio values (27213,'IPUA','IPUA','SP');
insert into Municipio values (27214,'IRACEMAPOLIS','IRACEMAPOLIS','SP');
insert into Municipio values (27215,'IRAPUA','IRAPUA','SP');
insert into Municipio values (27216,'IRAPURU','IRAPURU','SP');
insert into Municipio values (27217,'ITABERA','ITABERA','SP');
insert into Municipio values (27218,'ITAI','ITAI','SP');
insert into Municipio values (27219,'ITAJOBI','ITAJOBI','SP');
insert into Municipio values (27220,'ITAJU','ITAJU','SP');
insert into Municipio values (27221,'ITANHAEM','ITANHAEM','SP');
insert into Municipio values (27222,'ITAPECERICA DA SERRA','ITAP.DA SERRA','SP');
insert into Municipio values (27223,'ITAPETININGA','ITAPETININGA','SP');
insert into Municipio values (27224,'ITAPEVA','ITAPEVA','SP');
insert into Municipio values (27225,'ITAPEVI','ITAPEVI','SP');
insert into Municipio values (27226,'ITAPIRA','ITAPIRA','SP');
insert into Municipio values (27227,'ITAPOLIS','ITAPOLIS','SP');
insert into Municipio values (27228,'ITAPORANGA','ITAPORANGA','SP');
insert into Municipio values (27229,'ITAPUI','ITAPUI','SP');
insert into Municipio values (27230,'ITAPURA','ITAPURA','SP');
insert into Municipio values (27231,'ITAQUAQUECETUBA','ITAQUAQUECETUBA','SP');
insert into Municipio values (27232,'ITARARE','ITARARE','SP');
insert into Municipio values (27233,'ITARIRI','ITARIRI','SP');
insert into Municipio values (27234,'ITATIBA','ITATIBA','SP');
insert into Municipio values (27235,'ITATINGA','ITATINGA','SP');
insert into Municipio values (27236,'ITIRAPINA','ITIRAPINA','SP');
insert into Municipio values (27237,'ITIRAPUA','ITIRAPUA','SP');
insert into Municipio values (27238,'ITOBI','ITOBI','SP');
insert into Municipio values (27239,'ITU','ITU','SP');
insert into Municipio values (27240,'ITUPEVA','ITUPEVA','SP');
insert into Municipio values (27241,'ITUVERAVA','ITUVERAVA','SP');
insert into Municipio values (27242,'JABORANDI','JABORANDI','SP');
insert into Municipio values (27243,'JABOTICABAL','JABOTICABAL','SP');
insert into Municipio values (27244,'JACAREI','JACAREI','SP');
insert into Municipio values (27245,'JACI','JACI','SP');
insert into Municipio values (27246,'JACUPIRANGA','JACUPIRANGA','SP');
insert into Municipio values (27247,'JAGUARIUNA','JAGUARIUNA','SP');
insert into Municipio values (27248,'JALES','JALES','SP');
insert into Municipio values (27249,'JAMBEIRO','JAMBEIRO','SP');
insert into Municipio values (27250,'JANDIRA','JANDIRA','SP');
insert into Municipio values (27251,'JARDINOPOLIS','JARDINOPOLIS','SP');
insert into Municipio values (27252,'JARINU','JARINU','SP');
insert into Municipio values (27253,'JAU','JAU','SP');
insert into Municipio values (27254,'JERIQUARA','JERIQUARA','SP');
insert into Municipio values (27255,'JOANOPOLIS','JOANOPOLIS','SP');
insert into Municipio values (27256,'JOAO RAMALHO','JOAO RAMALHO','SP');
insert into Municipio values (27257,'JOSE BONIFACIO','JOSE BONIFACIO','SP');
insert into Municipio values (27258,'JULIO MESQUITA','JULIO MESQUITA','SP');
insert into Municipio values (27259,'JUNDIAI','JUNDIAI','SP');
insert into Municipio values (27260,'JUNQUEIROPOLIS','JUNQUEIROPOLIS','SP');
insert into Municipio values (27261,'JUQUIA','JUQUIA','SP');
insert into Municipio values (27262,'JUQUITIBA','JUQUITIBA','SP');
insert into Municipio values (27263,'LAGOINHA','LAGOINHA','SP');
insert into Municipio values (27264,'LARANJAL PAULISTA','LAR.PAULISTA','SP');
insert into Municipio values (27265,'LAVINIA','LAVINIA','SP');
insert into Municipio values (27266,'LAVRINHAS','LAVRINHAS','SP');
insert into Municipio values (27267,'LEME','LEME','SP');
insert into Municipio values (27268,'LENCOIS PAULISTA','LENC.PAULISTA','SP');
insert into Municipio values (27269,'LIMEIRA','LIMEIRA','SP');
insert into Municipio values (27270,'LINDOIA','LINDOIA','SP');
insert into Municipio values (27271,'LINS','LINS','SP');
insert into Municipio values (27272,'LORENA','LORENA','SP');
insert into Municipio values (27273,'LOUVEIRA','LOUVEIRA','SP');
insert into Municipio values (27274,'LUCELIA','LUCELIA','SP');
insert into Municipio values (27275,'LUCIANOPOLIS','LUCIANOPOLIS','SP');
insert into Municipio values (27276,'LUIS ANTONIO','LUIS ANTONIO','SP');
insert into Municipio values (27277,'LUISIANIA','LUISIANIA','SP');
insert into Municipio values (27278,'LUPERCIO','LUPERCIO','SP');
insert into Municipio values (27279,'LUTECIA','LUTECIA','SP');
insert into Municipio values (27280,'MACATUBA','MACATUBA','SP');
insert into Municipio values (27281,'MACAUBAL','MACAUBAL','SP');
insert into Municipio values (27282,'MACEDONIA','MACEDONIA','SP');
insert into Municipio values (27283,'MAGDA','MAGDA','SP');
insert into Municipio values (27284,'MAIRINQUE','MAIRINQUE','SP');
insert into Municipio values (27285,'MAIRIPORA','MAIRIPORA','SP');
insert into Municipio values (27286,'MANDURI','MANDURI','SP');
insert into Municipio values (27287,'MARABA PAULISTA','MARABA PAULISTA','SP');
insert into Municipio values (27288,'MARACAI','MARACAI','SP');
insert into Municipio values (27289,'MARIAPOLIS','MARIAPOLIS','SP');
insert into Municipio values (27290,'MARILIA','MARILIA','SP');
insert into Municipio values (27291,'MARINOPOLIS','MARINOPOLIS','SP');
insert into Municipio values (27292,'MARTINOPOLIS','MARTINOPOLIS','SP');
insert into Municipio values (27293,'MATAO','MATAO','SP');
insert into Municipio values (27294,'MAUA','MAUA','SP');
insert into Municipio values (27295,'MENDONCA','MENDONCA','SP');
insert into Municipio values (27296,'MERIDIANO','MERIDIANO','SP');
insert into Municipio values (27297,'MIGUELOPOLIS','MIGUELOPOLIS','SP');
insert into Municipio values (27298,'MINEIROS DO TIETE','MINEIROS TIETE','SP');
insert into Municipio values (27299,'MIRA ESTRELA','MIRA ESTRELA','SP');
insert into Municipio values (27300,'MIRACATU','MIRACATU','SP');
insert into Municipio values (27301,'MIRANDOPOLIS','MIRANDOPOLIS','SP');
insert into Municipio values (27302,'MIRANTE DO PARANAPANEMA','M.PARANAPANEMA','SP');
insert into Municipio values (27303,'MIRASSOL','MIRASSOL','SP');
insert into Municipio values (27304,'MIRASSOLANDIA','MIRASSOLANDIA','SP');
insert into Municipio values (27305,'MOCOCA','MOCOCA','SP');
insert into Municipio values (27306,'MOGI DAS CRUZES','MOGI DAS CRUZES','SP');
insert into Municipio values (27307,'MOGI-GUACU','MOGI-GUACU','SP');
insert into Municipio values (27308,'MOGI-MIRIM','MOGI-MIRIM','SP');
insert into Municipio values (27309,'MOMBUCA','MOMBUCA','SP');
insert into Municipio values (27310,'MONCOES','MONCOES','SP');
insert into Municipio values (27311,'MONGAGUA','MONGAGUA','SP');
insert into Municipio values (27312,'MONTE ALEGRE DO SUL','M.ALEGRE DO SUL','SP');
insert into Municipio values (27313,'MONTE ALTO','MONTE ALTO','SP');
insert into Municipio values (27314,'MONTE APRAZIVEL','MONTE APRAZIVEL','SP');
insert into Municipio values (27315,'MONTE AZUL PAULISTA','M.AZUL PAULISTA','SP');
insert into Municipio values (27316,'MONTE CASTELO','MONTE CASTELO','SP');
insert into Municipio values (27317,'MONTE MOR','MONTE MOR','SP');
insert into Municipio values (27318,'MONTEIRO LOBATO','MONTEIRO LOBATO','SP');
insert into Municipio values (27319,'MORRO AGUDO','MORRO AGUDO','SP');
insert into Municipio values (27320,'MORUNGABA','MORUNGABA','SP');
insert into Municipio values (27321,'MURUTINGA DO SUL','MURUTINGA SUL','SP');
insert into Municipio values (27322,'NARANDIBA','NARANDIBA','SP');
insert into Municipio values (27323,'NATIVIDADE DA SERRA','NATIV.DA SERRA','SP');
insert into Municipio values (27324,'NAZARE PAULISTA','NAZARE PAULISTA','SP');
insert into Municipio values (27325,'NEVES PAULISTA','NEVES PAULISTA','SP');
insert into Municipio values (27326,'NHANDEARA','NHANDEARA','SP');
insert into Municipio values (27327,'NIPOA','NIPOA','SP');
insert into Municipio values (27328,'NOVA ALIANCA','NOVA ALIANCA','SP');
insert into Municipio values (27329,'NOVA EUROPA','NOVA EUROPA','SP');
insert into Municipio values (27330,'NOVA GRANADA','NOVA GRANADA','SP');
insert into Municipio values (27331,'NOVA GUATAPORANGA','N.GUATAPORANGA','SP');
insert into Municipio values (27332,'NOVA INDEPENDENCIA','N.INDEPENDENCIA','SP');
insert into Municipio values (27333,'NOVA LUZITANIA','NOVA LUZITANIA','SP');
insert into Municipio values (27334,'NOVA ODESSA','NOVA ODESSA','SP');
insert into Municipio values (27335,'NOVO HORIZONTE','NOVO HORIZONTE','SP');
insert into Municipio values (27336,'NUPORANGA','NUPORANGA','SP');
insert into Municipio values (27337,'OCAUCU','OCAUCU','SP');
insert into Municipio values (27338,'OLEO','OLEO','SP');
insert into Municipio values (27339,'OLIMPIA','OLIMPIA','SP');
insert into Municipio values (27340,'ONDA VERDE','ONDA VERDE','SP');
insert into Municipio values (27341,'ORIENTE','ORIENTE','SP');
insert into Municipio values (27342,'ORINDIUVA','ORINDIUVA','SP');
insert into Municipio values (27343,'ORLANDIA','ORLANDIA','SP');
insert into Municipio values (27344,'OSASCO','OSASCO','SP');
insert into Municipio values (27345,'OSCAR BRESSANE','OSCAR BRESSANE','SP');
insert into Municipio values (27346,'OSWALDO CRUZ','OSWALDO CRUZ','SP');
insert into Municipio values (27347,'OURINHOS','OURINHOS','SP');
insert into Municipio values (27348,'OURO VERDE','OURO VERDE','SP');
insert into Municipio values (27349,'PACAEMBU','PACAEMBU','SP');
insert into Municipio values (27350,'PALESTINA','PALESTINA','SP');
insert into Municipio values (27351,'PALMARES PAULISTA','PALM.PAULISTA','SP');
insert into Municipio values (27352,'PALMEIRA D´OESTE','P.D´OESTE','SP');
insert into Municipio values (27353,'PALMITAL','PALMITAL','SP');
insert into Municipio values (27354,'PANORAMA','PANORAMA','SP');
insert into Municipio values (27355,'PARAGUACU PAULISTA','PAR.PAULISTA','SP');
insert into Municipio values (27356,'PARAIBUNA','PARAIBUNA','SP');
insert into Municipio values (27357,'PARAISO','PARAISO','SP');
insert into Municipio values (27358,'PARANAPANEMA','PARANAPANEMA','SP');
insert into Municipio values (27359,'PARANAPUA','PARANAPUA','SP');
insert into Municipio values (27360,'PARAPUA','PARAPUA','SP');
insert into Municipio values (27361,'PARDINHO','PARDINHO','SP');
insert into Municipio values (27362,'PARIQUERA-ACU','PARIQUERA-ACU','SP');
insert into Municipio values (27363,'PATROCINIO PAULISTA','PATROC.PAULISTA','SP');
insert into Municipio values (27364,'PAULICEIA','PAULICEIA','SP');
insert into Municipio values (27365,'PAULINIA','PAULINIA','SP');
insert into Municipio values (27366,'PAULO DE FARIA','PAULO DE FARIA','SP');
insert into Municipio values (27367,'PEDERNEIRAS','PEDERNEIRAS','SP');
insert into Municipio values (27368,'PEDRA BELA','PEDRA BELA','SP');
insert into Municipio values (27369,'PEDRANOPOLIS','PEDRANOPOLIS','SP');
insert into Municipio values (27370,'PEDREGULHO','PEDREGULHO','SP');
insert into Municipio values (27371,'PEDREIRA','PEDREIRA','SP');
insert into Municipio values (27372,'PEDRO DE TOLEDO','PEDRO DE TOLEDO','SP');
insert into Municipio values (27373,'PENAPOLIS','PENAPOLIS','SP');
insert into Municipio values (27374,'PEREIRA BARRETO','PEREIRA BARRETO','SP');
insert into Municipio values (27375,'PEREIRAS','PEREIRAS','SP');
insert into Municipio values (27376,'PERUIBE','PERUIBE','SP');
insert into Municipio values (27377,'PIACATU','PIACATU','SP');
insert into Municipio values (27378,'PIEDADE','PIEDADE','SP');
insert into Municipio values (27379,'PILAR DO SUL','PILAR DO SUL','SP');
insert into Municipio values (27380,'PINDAMONHANGABA','PINDAMONHANGABA','SP');
insert into Municipio values (27381,'PINDORAMA','PINDORAMA','SP');
insert into Municipio values (27383,'PINHALZINHO','PINHALZINHO','SP');
insert into Municipio values (27384,'PIQUEROBI','PIQUEROBI','SP');
insert into Municipio values (27385,'PIQUETE','PIQUETE','SP');
insert into Municipio values (27386,'PIRACAIA','PIRACAIA','SP');
insert into Municipio values (27387,'PIRACICABA','PIRACICABA','SP');
insert into Municipio values (27388,'PIRAJU','PIRAJU','SP');
insert into Municipio values (27389,'PIRAJUI','PIRAJUI','SP');
insert into Municipio values (27390,'PIRANGI','PIRANGI','SP');
insert into Municipio values (27391,'PIRAPORA DO BOM JESUS','PIRAP.BOM JESUS','SP');
insert into Municipio values (27392,'PIRAPOZINHO','PIRAPOZINHO','SP');
insert into Municipio values (27393,'PIRASSUNUNGA','PIRASSUNUNGA','SP');
insert into Municipio values (27394,'PIRATININGA','PIRATININGA','SP');
insert into Municipio values (27395,'PITANGUEIRAS','PITANGUEIRAS','SP');
insert into Municipio values (27396,'PLANALTO','PLANALTO','SP');
insert into Municipio values (27397,'PLATINA','PLATINA','SP');
insert into Municipio values (27398,'POA','POA','SP');
insert into Municipio values (27399,'POLONI','POLONI','SP');
insert into Municipio values (27400,'POMPEIA','POMPEIA','SP');
insert into Municipio values (27401,'PONGAI','PONGAI','SP');
insert into Municipio values (27402,'PONTAL','PONTAL','SP');
insert into Municipio values (27403,'PONTES GESTAL','PONTES GESTAL','SP');
insert into Municipio values (27404,'POPULINA','POPULINA','SP');
insert into Municipio values (27405,'PORANGABA','PORANGABA','SP');
insert into Municipio values (27406,'PORTO FELIZ','PORTO FELIZ','SP');
insert into Municipio values (27407,'PORTO FERREIRA','PORTO FERREIRA','SP');
insert into Municipio values (27408,'POTIRENDABA','POTIRENDABA','SP');
insert into Municipio values (27409,'PRADOPOLIS','PRADOPOLIS','SP');
insert into Municipio values (27410,'PRAIA GRANDE','PRAIA GRANDE','SP');
insert into Municipio values (27411,'PRESIDENTE ALVES','PRES.ALVES','SP');
insert into Municipio values (27412,'PRESIDENTE BERNARDES','PRES.BERNARDES','SP');
insert into Municipio values (27413,'PRESIDENTE EPITACIO','PRES.EPITACIO','SP');
insert into Municipio values (27414,'PRESIDENTE PRUDENTE','PRES.PRUDENTE','SP');
insert into Municipio values (27415,'PRESIDENTE WENCESLAU','PRES.VENCESLAU','SP');
insert into Municipio values (27416,'PROMISSAO','PROMISSAO','SP');
insert into Municipio values (27417,'QUATA','QUATA','SP');
insert into Municipio values (27418,'QUEIROZ','QUEIROZ','SP');
insert into Municipio values (27419,'QUELUZ','QUELUZ','SP');
insert into Municipio values (27420,'QUINTANA','QUINTANA','SP');
insert into Municipio values (27421,'RAFARD','RAFARD','SP');
insert into Municipio values (27422,'RANCHARIA','RANCHARIA','SP');
insert into Municipio values (27423,'REDENCAO DA SERRA','REDENCAO SERRA','SP');
insert into Municipio values (27424,'REGENTE FEIJO','REGENTE FEIJO','SP');
insert into Municipio values (27425,'REGINOPOLIS','REGINOPOLIS','SP');
insert into Municipio values (27426,'REGISTRO','REGISTRO','SP');
insert into Municipio values (27427,'RESTINGA','RESTINGA','SP');
insert into Municipio values (27428,'RIBEIRA','RIBEIRA','SP');
insert into Municipio values (27429,'RIBEIRAO BONITO','RIBEIRAO BONITO','SP');
insert into Municipio values (27430,'RIBEIRAO BRANCO','RIBEIRAO BRANCO','SP');
insert into Municipio values (27431,'RIBEIRAO CORRENTE','RIB.CORRENTE','SP');
insert into Municipio values (27432,'RIBEIRAO DO SUL','RIBEIRAO DO SUL','SP');
insert into Municipio values (27433,'RIBEIRAO PIRES','RIBEIRAO PIRES','SP');
insert into Municipio values (27434,'RIBEIRAO PRETO','RIBEIRAO PRETO','SP');
insert into Municipio values (27436,'RIFAINA','RIFAINA','SP');
insert into Municipio values (27437,'RINCAO','RINCAO','SP');
insert into Municipio values (27438,'RINOPOLIS','RINOPOLIS','SP');
insert into Municipio values (27439,'RIO CLARO','RIO CLARO','SP');
insert into Municipio values (27440,'RIO DAS PEDRAS','RIO DAS PEDRAS','SP');
insert into Municipio values (27441,'RIO GRANDE DA SERRA','R.GRANDE SERRA','SP');
insert into Municipio values (27442,'RIOLANDIA','RIOLANDIA','SP');
insert into Municipio values (27443,'ROSEIRA','ROSEIRA','SP');
insert into Municipio values (27444,'RUBIACEA','RUBIACEA','SP');
insert into Municipio values (27445,'RUBINEIA','RUBINEIA','SP');
insert into Municipio values (27446,'SANTA ADELIA','SANTA ADELIA','SP');
insert into Municipio values (27447,'SANTA ALBERTINA','SANTA ALBERTINA','SP');
insert into Municipio values (27448,'SANTO ANASTACIO','SANTO ANASTACIO','SP');
insert into Municipio values (27449,'SANTO ANDRE','SANTO ANDRE','SP');
insert into Municipio values (27450,'SANTO ANTONIO DA ALEGRIA','STO.ANT.ALEGRIA','SP');
insert into Municipio values (27451,'SANTO ANTONIO DE POSSE','STO.ANT.POSSE','SP');
insert into Municipio values (27452,'SANTO ANTONIO DO JARDIM','STO.ANT.JARDIM','SP');
insert into Municipio values (27453,'SANTO ANTONIO DO PINHAL','STO.ANT.PINHAL','SP');
insert into Municipio values (27454,'SANTA BARBARA D´OESTE','S.BARB.D´OESTE','SP');
insert into Municipio values (27456,'SAO BENTO DO SAPUCAI','S.BENTO SAPUCAI','SP');
insert into Municipio values (27457,'SAO BERNARDO DO CAMPO','S.B.DO CAMPO','SP');
insert into Municipio values (27458,'SANTA BRANCA','SANTA BRANCA','SP');
insert into Municipio values (27459,'SAO CAETANO DO SUL','S.CAETANO SUL','SP');
insert into Municipio values (27460,'SAO CARLOS','SAO CARLOS','SP');
insert into Municipio values (27461,'SANTA CLARA D´OESTE','STA.CLARA OESTE','SP');
insert into Municipio values (27462,'SANTA CRUZ DA CONCEICAO','S.C.CONCEICAO','SP');
insert into Municipio values (27463,'SANTA CRUZ DAS PALMEIRAS','S.C.PALMEIRAS','SP');
insert into Municipio values (27464,'SANTA CRUZ DO RIO PARDO','S.CRUZ R.PARDO','SP');
insert into Municipio values (27465,'SANTA ERNESTINA','SANTA ERNESTINA','SP');
insert into Municipio values (27466,'SANTO EXPEDITO','SANTO EXPEDITO','SP');
insert into Municipio values (27467,'SANTA FE DO SUL','SANTA FE DO SUL','SP');
insert into Municipio values (27468,'SAO FRANCISCO','SAO FRANCISCO','SP');
insert into Municipio values (27469,'SANTA GERTRUDES','SANTA GERTRUDES','SP');
insert into Municipio values (27470,'SANTA ISABEL','SANTA ISABEL','SP');
insert into Municipio values (27471,'SAO JOAO DA BOA VISTA','S.JOAO B.VISTA','SP');
insert into Municipio values (27472,'SAO JOAO DO PAU D´ALHO','S.JOAO P.D´ALHO','SP');
insert into Municipio values (27473,'SAO JOAO DAS DUAS PONTES','S.JOAO D.PONTES','SP');
insert into Municipio values (27474,'SAO JOAQUIM DA BARRA','S.JOAQUIM BARRA','SP');
insert into Municipio values (27475,'SAO JOSE DA BELA VISTA','S.J.BELA VISTA','SP');
insert into Municipio values (27476,'SAO JOSE DO BARREIRO','S.JOSE BARREIRO','SP');
insert into Municipio values (27477,'SAO JOSE DO RIO PARDO','S.J.RIO PARDO','SP');
insert into Municipio values (27478,'SAO JOSE DO RIO PRETO','S.J.RIO PRETO','SP');
insert into Municipio values (27479,'SAO JOSE DOS CAMPOS','S.JOSE CAMPOS','SP');
insert into Municipio values (27480,'SANTA LUCIA','SANTA LUCIA','SP');
insert into Municipio values (27481,'SAO LUIS DO PARAITINGA','S.L.PARAITINGA','SP');
insert into Municipio values (27482,'SAO MANUEL','SAO MANOEL','SP');
insert into Municipio values (27483,'SANTA MARIA DA SERRA','STA.MARIA SERRA','SP');
insert into Municipio values (27484,'SANTA MERCEDES','SANTA MERCEDES','SP');
insert into Municipio values (27485,'SAO MIGUEL ARCANJO','S.MIG.ARCANJO','SP');
insert into Municipio values (27486,'SAO PAULO','SAO PAULO','SP');
insert into Municipio values (27487,'SAO PEDRO','SAO PEDRO','SP');
insert into Municipio values (27488,'SAO PEDRO DO TURVO','S.PEDRO TURVO','SP');
insert into Municipio values (27489,'SANTA RITA D´OESTE','S.RITA D´OESTE','SP');
insert into Municipio values (27490,'SANTA RITA DO PASSA QUATRO','S.RITA P.QUATRO','SP');
insert into Municipio values (27491,'SAO ROQUE','SAO ROQUE','SP');
insert into Municipio values (27492,'SANTA ROSA DE VITERBO','S.ROSA VITERBO','SP');
insert into Municipio values (27493,'SAO SEBASTIAO','SAO SEBASTIAO','SP');
insert into Municipio values (27494,'SAO SEBASTIAO DA GRAMA','S.SEB.GRAMA','SP');
insert into Municipio values (27495,'SAO SIMAO','SAO SIMAO','SP');
insert into Municipio values (27496,'SAO VICENTE','SAO VICENTE','SP');
insert into Municipio values (27497,'SABINO','SABINO','SP');
insert into Municipio values (27498,'SAGRES','SAGRES','SP');
insert into Municipio values (27499,'SALES','SALES','SP');
insert into Municipio values (27500,'SALES DE OLIVEIRA','SALES OLIVEIRA','SP');
insert into Municipio values (27501,'SALESOPOLIS','SALESOPOLIS','SP');
insert into Municipio values (27502,'SALMORAO','SALMORAO','SP');
insert into Municipio values (27503,'SALTO','SALTO','SP');
insert into Municipio values (27504,'SALTO DE PIRAPORA','SALTO PIRAPORA','SP');
insert into Municipio values (27505,'SALTO GRANDE','SALTO GRANDE','SP');
insert into Municipio values (27506,'SANDOVALINA','SANDOVALINA','SP');
insert into Municipio values (27507,'SANTANA DO PARNAIBA','SANT.PARNAIBA','SP');
insert into Municipio values (27508,'SANTANA DA PONTE PENSA','S.PONTE PENSA','SP');
insert into Municipio values (27509,'SANTOPOLIS DO AGUAPEI','SANTOP.IGUAPEI','SP');
insert into Municipio values (27510,'SANTOS','SANTOS','SP');
insert into Municipio values (27511,'SARAPUI','SARAPUI','SP');
insert into Municipio values (27512,'SARUTAIA','SARUTAIA','SP');
insert into Municipio values (27513,'SEBASTIANOPOLIS DO SUL','SEBASTIANOP.SUL','SP');
insert into Municipio values (27514,'SERRA AZUL','SERRA AZUL','SP');
insert into Municipio values (27515,'SERRA NEGRA','SERRA NEGRA','SP');
insert into Municipio values (27516,'SERRANA','SERRANA','SP');
insert into Municipio values (27517,'SERTAOZINHO','SERTAOZINHO','SP');
insert into Municipio values (27518,'SETE BARRAS','SETE BARRAS','SP');
insert into Municipio values (27519,'SEVERINIA','SEVERINIA','SP');
insert into Municipio values (27520,'SILVEIRAS','SILVEIRAS','SP');
insert into Municipio values (27521,'SOCORRO','SOCORRO','SP');
insert into Municipio values (27522,'SOROCABA','SOROCABA','SP');
insert into Municipio values (27523,'SUD MENUCCI','SUD MENUCCI','SP');
insert into Municipio values (27524,'SUMARE','SUMARE','SP');
insert into Municipio values (27525,'SUZANO','SUZANO','SP');
insert into Municipio values (27526,'TABAPUA','TABAPUA','SP');
insert into Municipio values (27527,'TABATINGA','TABATINGA','SP');
insert into Municipio values (27528,'TABOAO DA SERRA','TABOAO DA SERRA','SP');
insert into Municipio values (27529,'TACIBA','TACIBA','SP');
insert into Municipio values (27530,'TAGUAI','TAGUAI','SP');
insert into Municipio values (27531,'TAIACU','TAIACU','SP');
insert into Municipio values (27532,'TAIUVA','TAIUVA','SP');
insert into Municipio values (27533,'TAMBAU','TAMBAU','SP');
insert into Municipio values (27534,'TANABI','TANABI','SP');
insert into Municipio values (27535,'TAPIRAI','TAPIRAI','SP');
insert into Municipio values (27536,'TAPIRATIBA','TAPIRATIBA','SP');
insert into Municipio values (27537,'TAQUARITINGA','TAQUARITINGA','SP');
insert into Municipio values (27538,'TAQUARITUBA','TAQUARITUBA','SP');
insert into Municipio values (27539,'TARABAI','TARABAI','SP');
insert into Municipio values (27540,'TATUI','TATUI','SP');
insert into Municipio values (27541,'TAUBATE','TAUBATE','SP');
insert into Municipio values (27542,'TEJUPA','TEJUPA','SP');
insert into Municipio values (27543,'TEODORO SAMPAIO','TEODORO SAMPAIO','SP');
insert into Municipio values (27544,'TERRA ROXA','TERRA ROXA','SP');
insert into Municipio values (27545,'TIETE','TIETE','SP');
insert into Municipio values (27546,'TIMBURI','TIMBURI','SP');
insert into Municipio values (27547,'TORRINHA','TORRINHA','SP');
insert into Municipio values (27548,'TREMEMBE','TREMEMBE','SP');
insert into Municipio values (27549,'TRES FRONTEIRAS','TRES FRONTEIRAS','SP');
insert into Municipio values (27550,'TUPA','TUPA','SP');
insert into Municipio values (27551,'TUPI PAULISTA','TUPI PAULISTA','SP');
insert into Municipio values (27552,'TURIUBA','TURIUBA','SP');
insert into Municipio values (27553,'TURMALINA','TURMALINA','SP');
insert into Municipio values (27554,'UBATUBA','UBATUBA','SP');
insert into Municipio values (27555,'UBIRAJARA','UBIRAJARA','SP');
insert into Municipio values (27556,'UCHOA','UCHOA','SP');
insert into Municipio values (27557,'UNIAO PAULISTA','UNIAO PAULISTA','SP');
insert into Municipio values (27558,'URANIA','URANIA','SP');
insert into Municipio values (27559,'URU','URU','SP');
insert into Municipio values (27560,'URUPES','URUPES','SP');
insert into Municipio values (27561,'VALENTIM GENTIL','VALENTIM GENTIL','SP');
insert into Municipio values (27562,'VALINHOS','VALINHOS','SP');
insert into Municipio values (27563,'VALPARAISO','VALPARAISO','SP');
insert into Municipio values (27564,'VARGEM GRANDE DO SUL','VARG.GRANDE SUL','SP');
insert into Municipio values (27565,'VARZEA PAULISTA','VARZEA PAULISTA','SP');
insert into Municipio values (27566,'VERA CRUZ','VERA CRUZ','SP');
insert into Municipio values (27567,'VINHEDO','VINHEDO','SP');
insert into Municipio values (27568,'VIRADOURO','VIRADOURO','SP');
insert into Municipio values (27569,'VISTA ALEGRE DO ALTO','V.ALEGRE ALTO','SP');
insert into Municipio values (27570,'VOTORANTIM','VOTORANTIM','SP');
insert into Municipio values (27571,'VOTUPORANGA','VOTUPORANGA','SP');
insert into Municipio values (27573,'ALAMBARI','ALAMBARI','SP');
insert into Municipio values (27575,'ALUMINIO','ALUMINIO','SP');
insert into Municipio values (27578,'ARACARIGUAMA','ARACARIGUAMA','SP');
insert into Municipio values (27579,'ARAPEI','ARAPEI','SP');
insert into Municipio values (27581,'ARCO-IRIS','ARCO-IRIS','SP');
insert into Municipio values (27584,'BERTIOGA','BERTIOGA','SP');
insert into Municipio values (27597,'ELISIARIO','ELISIARIO','SP');
insert into Municipio values (27603,'GAVIAO PEIXOTO','GAVIAO PEIXOTO','SP');
insert into Municipio values (27607,'GUATAPARA','GUATAPARA','SP');
insert into Municipio values (27609,'IBITIUVA','IBITIUVA','SP');
insert into Municipio values (27611,'ILHA SOLTEIRA','ILHA SOLTEIRA','SP');
insert into Municipio values (27612,'IPIGUA','IPIGUA','SP');
insert into Municipio values (27634,'PRACINHA','PRACINHA','SP');
insert into Municipio values (27635,'PRATANIA','PRATANIA','SP');
insert into Municipio values (27637,'RIBEIRAO DOS INDIOS','RIBEIRAO INDIOS','SP');
insert into Municipio values (27640,'SALTINHO','SALTINHO','SP');
insert into Municipio values (27650,'VARGEM','VARGEM','SP');
insert into Municipio values (27653,'VITORIA BRASIL','VITORIA BRASIL','SP');
insert into Municipio values (27657,'AGUAS DE SANTA BARBARA','AG.STA.BARBARA','SP');
insert into Municipio values (27660,'VARGEM GRANDE PAULISTA','V.G.PAULISTA','SP');
insert into Municipio values (27661,'ESPIRITO SANTO DO PINHAL','ESP.ANTO PINHAL','SP');
insert into Municipio values (27662,'RIVERSUL','RIVERSUL','SP');
insert into Municipio values (27663,'BOREBI','BOREBI','SP');
insert into Municipio values (27664,'DIRCE REIS','DIRCE REIS','SP');
insert into Municipio values (27665,'EMBAUBA','EMBAUBA','SP');
insert into Municipio values (27666,'ESPIRITO SANTO DO URVO','ESP. SANTO TURVO','SP');
insert into Municipio values (27667,'EUCLIDES DA CUNHA PAULISTA','EUCL.C.PAULISTA','SP');
insert into Municipio values (27668,'IARAS','IARAS','SP');
insert into Municipio values (27669,'MOTUCA','MOTUCA','SP');
insert into Municipio values (27670,'ROSANA','ROSANA','SP');
insert into Municipio values (27671,'TARUMA','TARUMA','SP');
insert into Municipio values (27672,'MARAPOAMA','MARAPOAMA','SP');
insert into Municipio values (27673,'PEDRINHAS PAULISTA','PEDR. PAULISTA','SP');
insert into Municipio values (27674,'LOURDES','LOURDES','SP');
insert into Municipio values (27675,'SUZANOPOLIS','SUZANOPOLIS','SP');
insert into Municipio values (27676,'HORTOLANDIA','HORTOLANDIA','SP');
insert into Municipio values (27677,'CAJATI','CAJATI','SP');
insert into Municipio values (27678,'ZACARIAS','ZACARIAS','SP');
insert into Municipio values (27679,'EMILIANOPOLIS','EMILIANOPOLIS','SP');
insert into Municipio values (27680,'TAQUARIVAI','TAQUARIVAI','SP');
insert into Municipio values (27681,'CANITAR','CANITAR','SP');
insert into Municipio values (27682,'ILHA COMPRIDA','ILHA COMPRIDA','SP');
insert into Municipio values (27683,'ASPASIA','ASPASIA','SP');
insert into Municipio values (27684,'ITAPIRAPUA PAULISTA','ITAPIR. PAULISTA','SP');
insert into Municipio values (27685,'PARISI','PARISI','SP');
insert into Municipio values (27686,'POTIM','POTIM','SP');
insert into Municipio values (27687,'RIBEIRAO GRANDE','RIBEIRAO GRANDE','SP');
insert into Municipio values (27688,'ENGENHEIRO COELHO','ENG.COELHO','SP');
insert into Municipio values (27689,'NOVAIS','NOVAIS','SP');
insert into Municipio values (27690,'CAMPINA DO MONTE ALEGRE','CAMPINA M.ALEGRE','SP');
insert into Municipio values (27691,'HOLAMBRA','HOLAMBRA','SP');
insert into Municipio values (27692,'SAO JOAO DE IRACEMA','S. JOAO IRACEMA','SP');
insert into Municipio values (27693,'SAO LOURENCO DA SERRA','S.LOURENCO SERRA','SP');
insert into Municipio values (27694,'NOVA CANAA PAULISTA','NOVA C. PAULISTA','SP');
insert into Municipio values (27695,'NOVA CAMPINA','NOVA CAMPINA','SP');
insert into Municipio values (27696,'ESTIVA GERBI','ESTIVA GERBI','SP');
insert into Municipio values (27697,'ITAOCA','ITAOCA','SP');
insert into Municipio values (27698,'BARRA DO CHAPEU','BARRA DO CHAPEU','SP');
insert into Municipio values (27699,'BOM SUCESSO DE ITARARE','B. SUC. ITARARE','SP');
insert into Municipio values (27700,'BREJO ALEGRE','BREJO ALEGRE','SP');
insert into Municipio values (27701,'CANAS','CANAS','SP');
insert into Municipio values (27702,'FERNAO','FERNAO','SP');
insert into Municipio values (27703,'MESOPOLIS','MESOPOLIS','SP');
insert into Municipio values (27704,'NANTES','NANTES','SP');
insert into Municipio values (27705,'NOVA CASTILHO','NOVA CASTILHO','SP');
insert into Municipio values (27706,'PAULISTANIA','PAULISTANIA','SP');
insert into Municipio values (27707,'PONTALINDA','PONTALINDA','SP');
insert into Municipio values (27708,'QUADRA','QUADRA','SP');
insert into Municipio values (27709,'SANTA SALETE','SANTA SALETE','SP');
insert into Municipio values (27710,'SANTO ANTONIO DO ARACANGUA','STO.A. ARACANGUA','SP');
insert into Municipio values (27711,'TAQUARAL','TAQUARAL','SP');
insert into Municipio values (27712,'TORRE DE PEDRA','TORRE DE PEDRA','SP');
insert into Municipio values (27713,'TRABIJU','TRABIJU','SP');
insert into Municipio values (27714,'TUIUTI','TUIUTI','SP');
insert into Municipio values (27715,'UBARANA','UBARANA','SP');
insert into Municipio values (27716,'JUMIRIM','JUMIRIM','SP');
insert into Municipio values (27717,'OUROESTE','OUROESTE','SP');
insert into Municipio values (27718,'SANTA CRUZ DA ESPERANCA','S.CRUZ ESPERANCA','SP');
insert into Municipio values (28001,'AGUA CLARA','AGUA CLARA','MS');
insert into Municipio values (28002,'AMAMBAI','AMAMBAI','MS');
insert into Municipio values (28003,'ANASTACIO','ANASTACIO','MS');
insert into Municipio values (28004,'ANAURILANDIA','ANAURILANDIA','MS');
insert into Municipio values (28005,'ANTONIO JOAO','ANTONIO JOAO','MS');
insert into Municipio values (28006,'APARECIDA DO TABOADO','APAREC.TABOADO','MS');
insert into Municipio values (28007,'AQUIDAUANA','AQUIDAUANA','MS');
insert into Municipio values (28008,'BANDEIRANTES','BANDEIRANTES','MS');
insert into Municipio values (28009,'BATAGUASSU','BATAGUASSU','MS');
insert into Municipio values (28010,'BATAIPORA','BATAIPORA','MS');
insert into Municipio values (28011,'BELA VISTA','BELA VISTA','MS');
insert into Municipio values (28012,'BONITO','BONITO','MS');
insert into Municipio values (28013,'BRASILANDIA','BRASILANDIA','MS');
insert into Municipio values (28014,'CAARAPO','CAARAPO','MS');
insert into Municipio values (28015,'CAMAPUA','CAMAPUA','MS');
insert into Municipio values (28016,'CAMPO GRANDE','CAMPO GRANDE','MS');
insert into Municipio values (28017,'CARACOL','CARACOL','MS');
insert into Municipio values (28018,'CASSILANDIA','CASSILANDIA','MS');
insert into Municipio values (28019,'CORGUINHO','CORGUINHO','MS');
insert into Municipio values (28020,'CORUMBA','CORUMBA','MS');
insert into Municipio values (28021,'COXIM','COXIM','MS');
insert into Municipio values (28022,'DOURADOS','DOURADOS','MS');
insert into Municipio values (28023,'FATIMA DO SUL','FATIMA DO SUL','MS');
insert into Municipio values (28024,'GLORIA DE DOURADOS','GLORIA DOURADOS','MS');
insert into Municipio values (28025,'GUIA LOPES DA LAGUNA','G.LOPES LAGUNA','MS');
insert into Municipio values (28026,'IGUATEMI','IGUATEMI','MS');
insert into Municipio values (28027,'INOCENCIA','INOCENCIA','MS');
insert into Municipio values (28028,'ITAPORA','ITAPORA','MS');
insert into Municipio values (28029,'IVINHEMA','IVINHEMA','MS');
insert into Municipio values (28030,'JARAGUARI','JARAGUARI','MS');
insert into Municipio values (28031,'JARDIM','JARDIM','MS');
insert into Municipio values (28032,'JATEI','JATEI','MS');
insert into Municipio values (28033,'LADARIO','LADARIO','MS');
insert into Municipio values (28034,'MARACAJU','MARACAJU','MS');
insert into Municipio values (28035,'MIRANDA','MIRANDA','MS');
insert into Municipio values (28036,'NAVIRAI','NAVIRAI','MS');
insert into Municipio values (28037,'NIOAQUE','NIOAQUE','MS');
insert into Municipio values (28038,'NOVA ANDRADINA','NOVA ANDRADINA','MS');
insert into Municipio values (28039,'PARANAIBA','PARANAIBA','MS');
insert into Municipio values (28040,'PEDRO GOMES','PEDRO GOMES','MS');
insert into Municipio values (28041,'PONTA PORA','PONTA PORA','MS');
insert into Municipio values (28042,'PORTO MURTINHO','PORTO MURTINHO','MS');
insert into Municipio values (28043,'RIBAS DO RIO PARDO','RIBAS RIO PARDO','MS');
insert into Municipio values (28044,'RIO BRILHANTE','RIO BRILHANTE','MS');
insert into Municipio values (28045,'RIO NEGRO','RIO NEGRO','MS');
insert into Municipio values (28046,'RIO VERDE DO MATO GROSSO','R.VERDE M.GROSSO','MS');
insert into Municipio values (28047,'ROCHEDO','ROCHEDO','MS');
insert into Municipio values (28048,'SIDROLANDIA','SIDROLANDIA','MS');
insert into Municipio values (28049,'TERENOS','TERENOS','MS');
insert into Municipio values (28050,'TRES LAGOAS','TRES LAGOAS','MS');
insert into Municipio values (28051,'CORONEL SAPUCAIA','CEL.SAPUCAIA','MS');
insert into Municipio values (28054,'VICENTINA','VICENTINA','MS');
insert into Municipio values (28056,'ANGELICA','ANGELICA','MS');
insert into Municipio values (28057,'ARAL MOREIRA','ARAL MOREIRA','MS');
insert into Municipio values (28058,'DEODAPOLIS','DEODAPOLIS','MS');
insert into Municipio values (28059,'ELDORADO','ELDORADO','MS');
insert into Municipio values (28060,'MUNDO NOVO','MUNDO NOVO','MS');
insert into Municipio values (28061,'BODOQUENA','BODOQUENA','MS');
insert into Municipio values (28062,'COSTA RICA','COSTA RICA','MS');
insert into Municipio values (28063,'DOURADINA','DOURADINA','MS');
insert into Municipio values (28064,'ITAQUIRAI','ITAQUIRAI','MS');
insert into Municipio values (28065,'SAO GABRIEL DO OESTE','S.GABRIEL OESTE','MS');
insert into Municipio values (28066,'SELVIRIA','SELVIRIA','MS');
insert into Municipio values (28067,'DOIS IRMAOS DO BURITI','D.IRMAOS BURITI','MS');
insert into Municipio values (28068,'JUTI','JUTI','MS');
insert into Municipio values (28069,'SETE QUEDAS','SETE QUEDAS','MS');
insert into Municipio values (28070,'TACURU','TACURU','MS');
insert into Municipio values (28071,'TAQUARUSSU','TAQUARUSSU','MS');
insert into Municipio values (28072,'SANTA RITA DO PARDO','SANTA RITA PARDO','MS');
insert into Municipio values (28073,'PARANHOS','PARANHOS','MS');
insert into Municipio values (28074,'CHAPADAO DO SUL','CHAPADAO DO SUL','MS');
insert into Municipio values (28075,'SONORA','SONORA','MS');
insert into Municipio values (28076,'LAGUNA CARAPA','LAGUNA CARAPA','MS');
insert into Municipio values (28077,'JAPORA','JAPORA','MS');
insert into Municipio values (28108,'NOVO HORIZONTE DO SUL','N.HORIZONTE SUL','MS');
insert into Municipio values (28109,'NOVA ALVORADA DO SUL','N.ALVORADA SUL','MS');
insert into Municipio values (28110,'ALCINOPOLIS','ALCINOPOLIS','MS');
insert into Municipio values (29001,'ALIANCA DO TOCANTINS','ALINACA TOCAN','TO');
insert into Municipio values (29002,'APARECIDA DO RIO NEGRO','A.RIO NEGRO','TO');
insert into Municipio values (29003,'BARROLANDIA','BARROLANDIA','TO');
insert into Municipio values (29004,'BERNARDO SAYAO','BERNARDO SAYAO','TO');
insert into Municipio values (29005,'CASEARA','CASEARA','TO');
insert into Municipio values (29006,'COMBINADO','COMBINADO','TO');
insert into Municipio values (29007,'GOIANORTE','GOIANORTE','TO');
insert into Municipio values (29008,'MARIANOPOLIS DO TOCANTINS','MARIANOPOLIS TOC','TO');
insert into Municipio values (29009,'NOVA ROSALANDIA','NOVA ROSALANDIA','TO');
insert into Municipio values (29010,'NOVO ALEGRE','NOVO ALEGRE','TO');
insert into Municipio values (29011,'PEQUIZEIRO','PEQUIZEIRO','TO');
insert into Municipio values (29012,'PORTO ALEGRE DO TOCANTINS','P.ALEGRE TOCAN','TO');
insert into Municipio values (29013,'SAMPAIO','SAMPAIO','TO');
insert into Municipio values (29014,'BURITI DO TOCANTINS','BURITI TOCAN','TO');
insert into Municipio values (29015,'DIVINOPOLIS DO TOCANTINS','DIVINOPOLIS TOC','TO');
insert into Municipio values (29017,'PRAIA NORTE','PRAIA NORTE','TO');
insert into Municipio values (29018,'SAO VALERIO DA NATIVIDADE','S.V.NATIVIDADE','TO');
insert into Municipio values (29020,'SANTA ROSA DO TOCANTINS','S.ROSA TOCANTINS','TO');
insert into Municipio values (29021,'SANTA TERESA DO TOCANTINS','S.TERESA TOCAN','TO');
insert into Municipio values (29022,'PALMAS','PALMAS','TO');
insert into Municipio values (29023,'LAGOA DA CONFUSAO','LAGOA CONFUSAO','TO');
insert into Municipio values (29024,'ABREULANDIA','ABREULANDIA','TO');
insert into Municipio values (29025,'ANGICO','ANGICO','TO');
insert into Municipio values (29026,'ARAGOMINAS','ARAGOMINAS','TO');
insert into Municipio values (29027,'ARAGUANA','ARAGUANA','TO');
insert into Municipio values (29028,'BOM JESUS DO TOCANTINS','B.JES. TOCANTINS','TO');
insert into Municipio values (29029,'BRASILANDIA DO TOCANTINS','BR. TOCANTINS','TO');
insert into Municipio values (29030,'CACHOEIRINHA','CACHOEIRINHA','TO');
insert into Municipio values (29031,'CAMPOS LINDOS','CAMPOS LINDOS','TO');
insert into Municipio values (29032,'CARMOLANDIA','CARMOLANDIA','TO');
insert into Municipio values (29033,'CARRASCO BONITO','CARRASCO BONITO','TO');
insert into Municipio values (29034,'CENTENARIO','CENTENARIO','TO');
insert into Municipio values (29035,'CHAPADA DA NATIVIDADE','CHAP. NATIVIDADE','TO');
insert into Municipio values (29036,'CRIXAS DO TOCANTINS','CRIXAS TOCANTINS','TO');
insert into Municipio values (29037,'DARCINOPOLIS','DARCINOPOLIS','TO');
insert into Municipio values (29038,'ESPERANTINA','ESPERANTINA','TO');
insert into Municipio values (29039,'FORTALEZA DO TABOCAO','FORT. TABOCAO','TO');
insert into Municipio values (29040,'JAU DO TOCANTINS','JAU DO TOCANTINS','TO');
insert into Municipio values (29041,'JUARINA','JUARINA','TO');
insert into Municipio values (29042,'LAGOA DO TOCANTINS','LAGOA TOCANTINS','TO');
insert into Municipio values (29043,'LAJEADO','LAJEADO','TO');
insert into Municipio values (29044,'MATEIROS','MATEIROS','TO');
insert into Municipio values (29045,'MAURILANDIA DO TOCANTINS','MAUR. TOCANTINS','TO');
insert into Municipio values (29046,'MONTE SANTO DO TOCANTINS','M. STO.TOCANTINS','TO');
insert into Municipio values (29047,'MOSQUITO','MOSQUITO','TO');
insert into Municipio values (29048,'MURICILANDIA','MURICILANDIA','TO');
insert into Municipio values (29049,'NOVO JARDIM','NOVO JARDIM','TO');
insert into Municipio values (29050,'PAU D´ ARCO','PAU D´ ARCO','TO');
insert into Municipio values (29051,'PIRAQUE','PIRAQUE','TO');
insert into Municipio values (29052,'RECURSOLANDIA','RECURSOLANDIA','TO');
insert into Municipio values (29053,'RIACHINHO','RIACHINHO','TO');
insert into Municipio values (29054,'RIO DA CONCEICAO','RIO DA CONCEICAO','TO');
insert into Municipio values (29055,'RIO DOS BOIS','RIO DOS BOIS','TO');
insert into Municipio values (29056,'SANDOLANDIA','SANDOLANDIA','TO');
insert into Municipio values (29057,'SANTA FE DO ARAGUAIA','STA FE ARAGUAIA','TO');
insert into Municipio values (29058,'SANTA MARIA DO TOCANTINS','STA M. TOCANTINS','TO');
insert into Municipio values (29059,'SANTA TEREZINHA DO TOCANTINS','STA T. TOCANTINS','TO');
insert into Municipio values (29060,'SAO BENTO DO TOCANTINS','S. B. TOCANTINS','TO');
insert into Municipio values (29061,'SAO FELIX DO TOCANTINS','S. F. TOCANTINS','TO');
insert into Municipio values (29062,'SAO MIGUEL DO TOCANTINS','S. M. TOCANTINS','TO');
insert into Municipio values (29063,'SAO SALVADOR DO TOCANTINS','S. S. TOCANTINS','TO');
insert into Municipio values (29064,'SUCUPIRA','SUCUPIRA','TO');
insert into Municipio values (29065,'TAIPAS DO TOCANTINS','TAIPAS TOCANTINS','TO');
insert into Municipio values (29066,'TUPIRAMA','TUPIRAMA','TO');
insert into Municipio values (29067,'TUPIRATINS','TUPIRATINS','TO');
insert into Municipio values (29068,'BANDEIRANTES DO TOCANTINS','BAND.TOCANTINS','TO');
insert into Municipio values (29069,'BARRA DE OURO','BARRA DE OURO','TO');
insert into Municipio values (29070,'CARIRI DO TOCANTINS','CARIRI TOCANTINS','TO');
insert into Municipio values (29071,'IPUEIRAS','IPUEIRAS','TO');
insert into Municipio values (29072,'ITAPIRATINS','ITAPIRATINS','TO');
insert into Municipio values (29073,'LAVANDEIRA','LAVANDEIRA','TO');
insert into Municipio values (29074,'LUZINOPOLIS','LUZINOPOLIS','TO');
insert into Municipio values (29075,'OLIVEIRA DE FATIMA','OLIVEIRA FATIMA','TO');
insert into Municipio values (29076,'PALMEIRANTE','PALMEIRANTE','TO');
insert into Municipio values (29077,'PUGMIL','PUGMIL','TO');
insert into Municipio values (29078,'SANTA RITA DO TOCANTINS','S.RITA TOCANTINS','TO');
insert into Municipio values (29079,'AGUIARNOPOLIS','AGUIARNOPOLIS','TO');
insert into Municipio values (29080,'TALISMA','TALISMA','TO');

insert into Curso
            (nome, cargaHoraria)
     VALUES ('Administração de Empresas', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Bacharelado em Informática', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Ciência da Computação', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Desenho Industrial', 3400);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Engenharia da Computação', 3600);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Tecnólogo em Processamento de Dados', 2400);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Técnico em Processamento de Dados', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Técnico em Contabilidade', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Gestão da Informação', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Técnico em Eletronica', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Psicologia', 3600);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Ciências Econômicas', 3400);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Comunicação Social', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Eletrônica', 3600);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Engenharia Eletrônica', 4000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Matemática', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Engenharia Elétrica', 4000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Serviço Social', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Bacharelado em Sistemas de Informação', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Publicidade e Propaganda', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Tecnologia em Informática', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Bacharelado em Análise de Sistemas', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Ensino Médio', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Ensino Médio', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Técnico em Informática', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Tecnologia em Processamento de Dados', 2600);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Técnico em Eletrotécnica', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ( 'Engenharia Mecânica', 2000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Educação Física', 3000);
insert into Curso
            (nome, cargaHoraria)
     VALUES ('Artes Visuais - Computação', 3000);

-- insert into Curso  (nome, cargaHoraria)  VALUES ( 'Tecnologia em Artes Gráficas');




insert into Pessoa values (704,9,'Leonardo Stahlschmidt',1104652,'1979/05/06',4,'M','R Solimões, 1506','ap 202','372-0972','leonardo@hotmail.com','Mercês','80810070',19070);
insert into Pessoa values (705,10,'Gustavo Aníbal Couceiro de Aguiar',7324797,'1980/07/24',4,'M','Silveira Peixoto','780, apto 603','372-9604','gustavo@hotmail.com','Agua Verde','80240120',19070);
insert into Pessoa values (706,12,'André Damaceno Siqueira',2153110,'1981/10/20',4,'M','Rua Miguel Abrão, 491','Casa','372-8237','andré@hotmail.com','Portão','81070140',19070);
insert into Pessoa values (707,14,'Solange Reimberg Roschel',4048651,'1962/07/26',4,'F','Rua Francisco Rocha, 1827','Ap 1402','372-6870','solange@hotmail.com','Açores','88730390',25054);
insert into Pessoa values (708,16,'Marcelo Tonholi',3070014,'1982/11/04',4,'M','Rua da Lua Travessa 155,','casa 17','372-5503','marcelo@hotmail.com','Sitio Cercado','81910390',19070);
insert into Pessoa values (709,null,'Fernando Baldim',921373,'1979/10/17',4,'M','Rua Bonifácio R da luz','38','372-4136','fernando@hotmail.com','centro','84925000',19070);
insert into Pessoa values (710,20,'Jason Guilherme Mayer',7171750,'1982/08/28',4,'M','R: Schiller','nÝ555, ap:212','372-2769','jason@hotmail.com','Cristo Rei','80050260',19070);
insert into Pessoa values (711,22,'Juliano Begui Bortolaz',1681178,'1980/12/27',4,'M','Rua Leon Nicolas, 1338','Casa','372-1402','juliano@hotmail.com','Capão Raso','81150140',19070);
insert into Pessoa values (712,24,'Geziel Madeira de Campos',5749339,'1979/04/25',4,'M','Rua Mateus Leme, 834','apto 32B','372-0035','geziel@hotmail.com','Centro Civico','80530010',19070);
insert into Pessoa values (713,26,'Douglas Ivanski da Silva',7379833,'1979/01/17',4,'M','Manoel de Sousa Dias Negrão','1702','372-8668','douglas@hotmail.com','Boa Vista','82540070',19070);
insert into Pessoa values (714,28,'Alan Doretto',5354338,'1978/05/03',4,'M','Av. garibaldi Deliberador','99, ap. 71 - D.D','372-7301','alan@hotmail.com','Jardim Claudia','86050900',19249);
insert into Pessoa values (715,30,'Fernanda Li Minku',9606447,'1982/12/19',4,'F','Rua Coronel Dulcídio, 1881','apto. 202','372-5934','fernanda@hotmail.com','Agua Verde','80250100',19070);
insert into Pessoa values (716,1,'ALESSANDRO WEBER',2474720,'1973/06/05',4,'M','RUA ZACARIAS DE PAULA NEVES, 36','APTO 24A','372-4567','alessandro@hotmail.com','PORTAO','80320180',19070);
insert into Pessoa values (717,3,'Luis Guilherme Baptista Cordeiro',8417840,'1983/04/25',4,'M','Rua Charles Dickens 581','Casa','372-3200','luis@hotmail.com','Abranches','82220080',19070);
insert into Pessoa values (718,5,'Wilson Antoniolli Junior',1226849,'1981/12/26',4,'M','Rua Euclides da Cunha n.:1560','apto.:104','372-1833','wilson@hotmail.com','Champagnat','80730360',19070);
insert into Pessoa values (719,7,'Marina Amorim Figueiredo',7966798,'1981/09/07',4,'F','Rua General Potiguara nÝ 487','Bl 19 apto 11','372-0466','marina@hotmail.com','Capão Raso','81050500',19070);
insert into Pessoa values (720,9,'monica bednarczuk lopes da silva',7181384,'1978/12/29',4,'F','rua 24 de maio, 379','ap.133','372-9099','monica@hotmail.com','centro','80230080',19070);
insert into Pessoa values (721,11,'Francislene Fátima de Camargo',3082698,'1982/09/22',4,'F','Alameda Bom Pastor 3809','Bairro: Costeira','372-7732','francislene@hotmail.com','Costeira','83015140',19249);
insert into Pessoa values (722,13,'Karla Szeliga',3065496,'1983/01/25',4,'F','Rua Deputado Waldemiro Pedroso, 1063','bl. 2 - apto 1','372-6365','karla@hotmail.com','Novo Mundo','81050150',19070);
insert into Pessoa values (723,15,'Eduardo Eiji Takiguti',5888031,'1982/06/30',4,'M','Rua Cel Hoche Pedra Pires, 58','ap 11','372-4998','eduardo@hotmail.com','Seminário','80240510',19070);
insert into Pessoa values (724,17,'Rafael Fernando Sydney Silva',8570574,'1982/04/18',1,'M','R: João Alencar Guimarães','nÝ3025, BL-E ap 11','372-3631','rafael@hotmail.com','Santa Quitéria','81220190',19070);
insert into Pessoa values (725,19,'Gisele Batista Correia',5250267,'1980/08/01',4,'F','Rua Joao Gaida','num 35','372-2264','gisele@hotmail.com','Sao Gabriel','83407360',19070);
insert into Pessoa values (726,21,'Luciane Wasko',8223279,'1979/08/12',4,'F','Rua Leonardo Krasinski, 222','casa','372-0897','luciane@hotmail.com','Boa Vista','82540230',19070);
insert into Pessoa values (727,23,'Natasha Krassuski Fortes',9120783,'1982/11/20',4,'F','Rua Jornalista Nelson Luis Ribas de Oliveira, 244','casa 3','372-9530','natasha@hotmail.com','Campina do Siqueira','80740550',19070);
insert into Pessoa values (728,8,'Lisianne do Rosario Cabral',1574083,'1978/04/08',4,'F','Rua Pres Carlos Cavalcanti, 327','ap 802','372-8163','lisianne@hotmail.com','Centro','80020280',19070);
insert into Pessoa values (729,27,'Aloísio Kurz Schiavon',9900260,'1982/10/19',4,'M','R. Dep. Atílio de Almeida Barbosa, 581','Sobrado','372-6796','aloísio@hotmail.com','Boa Vista','82560460',19070);
insert into Pessoa values (730,29,'ANDREA DE MELLO DA COSTA',800404,'1971/08/19',1,'F','AV.MARINGA, 3943','SOBRADO 22','372-5429','andrea@hotmail.com','JARDIM ATUBA','83326010',19249);
insert into Pessoa values (731,31,'Edson Marty',2539244,'1981/03/30',4,'M','Rua Simão Bolívar, 631','Apto. 304','372-4062','edson@hotmail.com','Juvevê','80040140',19070);
insert into Pessoa values (732,2,'Charles Rafael Stein Piancini',1221965,'1983/07/26',4,'M','Rua: Frederico Mauer','311','372-2695','charles@hotmail.com','Coqueiros','88080020',25023);
insert into Pessoa values (733,4,'Charles Saad de Mattos',1382468,'1981/12/27',4,'M','Rua Belem','892 ap 201','372-1328','charles@hotmail.com','Cabral','80035170',19070);
insert into Pessoa values (734,6,'Murilo Cervi de Almeida',9461350,'1981/11/04',4,'M','Av. João Gualberto, 1034','apto 1402','372-9961','murilo@hotmail.com','Alto da Glória','80030000',19070);
insert into Pessoa values (735,8,'Gilberto Cesar Vicenzi',8998783,'1981/06/23',4,'M','Rua Pedro Locatelli Junior, 94','apto 23 Bl I','372-8594','gilberto@hotmail.com','Uberaba','81570030',19070);
insert into Pessoa values (736,10,'Danilo Peres Buss',285088,'1980/02/21',4,'M','Rua Almir Nelson de Almeida','Ap.11 Bl.11','372-7227','danilo@hotmail.com','Campo Comprido','81230220',19070);
insert into Pessoa values (737,12,'Antonio Verdu Y Castellon Junior',5255269,'1982/04/26',4,'M','Rua:Carlos Klemtz,1410','Bl:15   AP:04','372-5860','antonio@hotmail.com','Fazendinha','81320000',19070);
insert into Pessoa values (738,14,'Josiane Hofman',547322,'1974/02/27',4,'F','Rua Engenheiro Rebouças, 848','casa','372-4493','josiane@hotmail.com','Abraao','88215100',25054);
insert into Pessoa values (739,16,'Francisco Summa Netto',7181888,'1981/01/07',4,'M','Rua Amazonas de Souza Azevedo, 415','Casa','372-3126','francisco@hotmail.com','Coqueiros','88080020',25054);
insert into Pessoa values (740,17,'Cindia Regiane Garcia Veiga',3652799,'1981/10/30',1,'F','Rua Raggi Izar 670','Nenhum','372-1758','cindia@hotmail.com','Hauer','81630140',19070);
insert into Pessoa values (741,19,'João Marcelino Strapasson',9446800,'1983/09/07',4,'M','R. Diógenes do Brasil Lobato, 621','-','372-0391','joão@hotmail.com','Tingui','82620050',19070);
insert into Pessoa values (742,21,'Ivan Luciano Branco',677075,'1970/07/17',4,'M','David Geronasso','1140','372-9024','ivan@hotmail.com','Boa Vista','82560360',19070);
insert into Pessoa values (743,23,'Faruk Mustafa Zahra',7166354,'1981/12/30',4,'M','Brigadeiro Franco 5632','-----','372-7657','faruk@hotmail.com','Parolin','80220100',19070);
insert into Pessoa values (744,21,'Rafael Miguel Schlichting',8018052,'1977/04/08',4,'M','R. Theodoro Schneider, 241','Bl. 08 Ap. 304','372-6290','rafael@hotmail.com','Portão','81070310',19070);
insert into Pessoa values (745,27,'Aldo Monteiro do Nascimento',1955610,'1982/02/01',4,'M','Av. dos Canários, 198','-','372-4923','aldo@hotmail.com','Jd. MontParnasse','83508150',19070);
insert into Pessoa values (746,29,'Willian Felipe Albrecht',1358767,'1984/08/30',4,'M','Rua João Nadvorny, 08','.','372-3556','willian@hotmail.com','Campina do Siqueira','80730040',19070);
insert into Pessoa values (747,31,'Márcio José Santana Elias',3043175,'1981/08/29',4,'M','R.Luiz Leão, 01',' AptÝ108','372-2189','márcio@hotmail.com','Centro','80030010',19070);
insert into Pessoa values (748,2,'Rafael Antunes Rodrigues',5962870,'1984/12/29',4,'M','R. Leonardo Wesolowski 45','bl. 1 apto. 24','372-0822','rafael@hotmail.com','Campo Comprido','81230210',19070);
insert into Pessoa values (749,4,'Xenócrates Amon Mello',4538731,'1983/12/13',4,'M','Rua Cidade de Laguna, 556.','BL 1 AP 13','372-9455','xenócrates@hotmail.com','CIC','81240250',19070);
insert into Pessoa values (750,6,'Jean Fellipe de Souza',539569,'1981/06/20',4,'M','Rua Carneiro Lobo, 243.','Apto 1901','372-8088','jean@hotmail.com','Agua Vede','80240240',19070);
insert into Pessoa values (751,8,'Marcelo Rodrigo Roeder',2153371,'1977/01/25',4,'M','Rua: Murilo do Amaral Ferreira nÝ625','Casa','372-6721','marcelo@hotmail.com','Agua Verde','80620120',19070);
insert into Pessoa values (752,10,'Marcos Alexandre Dahle',7861550,'1983/03/01',4,'M','Rua Agudos do Sul','545','372-5354','marcos@hotmail.com','Conjunto Jupitert','83045040',19249);
insert into Pessoa values (753,12,'Glaucio Ribeiro',1927168,'1982/08/29',4,'M','Rua Tadeu Milan, 104','bloco-10 apto-202','372-3987','glaucio@hotmail.com','Sábia','83708060',19070);
insert into Pessoa values (754,14,'Igor Alexandre Albuquerque',6931323,'1979/09/03',4,'M','Martim Afonso, 2416','ap: 1301','372-2620','igor@hotmail.com','Gloria','80730030',25091);
insert into Pessoa values (755,16,'Ademir José Belin',1830286,'1977/04/28',4,'M','Rua Corumbá n 48','ap 106','372-1253','ademir@hotmail.com','Boa Vista','83608330',25091);
insert into Pessoa values (756,18,'Fabiana Vardânega da Silva',414602,'1982/05/31',4,'F','Rua. Paulina Ader nÝ 165','sobrado','372-9886','fabiana@hotmail.com','Capão Raso','81050250',19070);
insert into Pessoa values (757,20,'Gislaine Chaves Armstrong',3915760,'1981/04/16',4,'F','R. João Zanetti, nÝ 210','casa','372-8519','gislaine@hotmail.com','Jardim Paulista','83430000',19249);
insert into Pessoa values (758,22,'Olga Donat Hönnicke',2885438,'1969/10/29',1,'F','R. Capitão Leônidas Marques, 1999','Ap 202 - Bl 16','372-7152','olga@hotmail.com','Uberaba','81550000',19070);
insert into Pessoa values (759,24,'Jeter Marlon da Silva',7651067,'1971/06/16',4,'M','Rua Lombardo Furlan , 41','casa','372-5785','jeter@hotmail.com','Santa Felicidade','82020550',19070);
insert into Pessoa values (760,26,'Rodrigo José Coutinho Martins',3927512,'1979/04/06',4,'M','Rua Dr. João Tobias Pinto Rebelo,3440','apto32','372-4418','rodrigo@hotmail.com','Portão','81070070',19070);
insert into Pessoa values (761,28,'Paulo Henrique Franzon',1366727,'1982/04/13',4,'M','Rua Guaianazes 1037','Apartamento 201','372-3051','paulo@hotmail.com','Vila Izabel','80320240',25023);
insert into Pessoa values (762,30,'Glaucio Fabiano Luiz',1802045,'1974/11/23',4,'M','Rua Carlos Essenfelder, 1151','','372-1684','glaucio@hotmail.com','Hauer','81650090',19070);
insert into Pessoa values (763,1,'Edson Caleffi de Oliveira',7505847,'1981/02/02',4,'M','R Cid Marcondes de Albuquerque, 2503','casa','372-0317','edson@hotmail.com','Pinheirinho','81825080',19070);
insert into Pessoa values (764,3,'Guilherme Simião Ferreira',1127252,'1982/01/07',4,'M','Rua Santa Catarina, 332','ap. 202','372-8950','guilherme@hotmail.com','Agua Verde','80620100',19070);
insert into Pessoa values (765,5,'Marcelo Adriano Amaral',1746211,'1982/11/10',4,'M','R. Raggi Izar 706','casa 04','372-7583','marcelo@hotmail.com','Hauer','81630140',19070);
insert into Pessoa values (766,7,'Ricardo Rockenbach Nascimento',6969963,'1981/11/28',4,'M','R Irmãs Paulinas 5485','ap 03   bl 04','372-6216','ricardo@hotmail.com','Novo Mundo','81020230',19070);
insert into Pessoa values (767,9,'João de Jesus Vieira Junior',602126,'1983/04/24',4,'M','Rua Teófilo Treicik, 185','casa','372-4849','joão@hotmail.com', NULL,'82310290',19070);
insert into Pessoa values (768,11,'Rafael Cesar Susin',955308,'1984/06/04',4,'M','Conj Prive Rua Florindo Lindes 254 nÝ5','casa','372-3482','rafael@hotmail.com','Vila Amélia','83330270',19070);
insert into Pessoa values (769,13,'Fernando Lino da Silva',890419,'1982/01/30',4,'M','Regina Schulman 1145','casa','372-2115','fernando@hotmail.com','Boqueirao','81750350',19070);
insert into Pessoa values (770,15,'Denis Douglas Cavalheiro',4289815,'1997/03/06',4,'M','Rua Emanuel Klingbeil, 344','Final da rua','372-0748','denis@hotmail.com','Boqueirão','81750360',19070);
insert into Pessoa values (771,17,'Sali Teixeira de Freitas',6486577,'1979/08/19',4,'F','Rua Clóvis Beviláqua, 78','apt 11','372-9381','sali@hotmail.com','Cabral','80035080',19070);
insert into Pessoa values (772,19,'Ricardo Rocha Mendes',9762835,'1978/11/27',4,'M','R.  Jose de Alencar, 110','apto. 111','372-8014','ricardo@hotmail.com','Cristo Rei','80050240',19070);
insert into Pessoa values (773,21,'William R. Machado',3148499,'1972/03/17',1,'M','Rua: Ildefonso C. Fontana,251','Casa','372-6647','william@hotmail.com','CIC','81170020',19070);
insert into Pessoa values (774,22,'Daniel Lenharo de Souza',2624420,'1983/01/16',4,'M','Helcio da cunha ajuz, 117','casa','372-5279','daniel@hotmail.com','xaxim','81710300',19070);
insert into Pessoa values (775,24,'ADRIANO NUNES DE LARA',7948884,'1982/05/04',4,'M','R: ORLANDO DESTEFANI','294','372-3912','adriano@hotmail.com','S+O BRAZ','82300410',19070);
insert into Pessoa values (776,26,'Evaristo Broullon Couso Miranda',5178974,'1976/05/29',4,'M','Av. Marechal Deodoro, 3015','Apto 03','372-2545','evaristo@hotmail.com','Alto da XV','80050010',19070);
insert into Pessoa values (777,28,'Marcia Maria Pereira dos Reis',3198688,'1973/12/17',4,'F','R. Abrao Winter, nÝ 208','apt. 210','372-1178','marcia@hotmail.com','Xaxim','81830280',19070);
insert into Pessoa values (778,30,'Teng Suk Yun',7137390,'1978/06/13',4,'F','Voluntários de Pátria','11','372-9811','teng@hotmail.com','Centro','80020000',19070);
insert into Pessoa values (779,1,'Nadir Rodrigues Betin',8899529,'1977/11/12',4,'F','Rua Canoinhas,565','Casa','372-8444','nadir@hotmail.com','Borda do Campo','83075050',19070);
insert into Pessoa values (780,3,'Kelly Schlepa',8176678,'1976/02/14',1,'F','Rua Pedro Gusso, 60','Apto 204','372-7077','kelly@hotmail.com','Capão Raso','81050200',19070);
insert into Pessoa values (781,5,'Clóvis Teixeira',7066569,'1983/06/12',4,'M','R: Francisco Schuartz, 87','Casa','372-5710','clóvis@hotmail.com','Araçatuba','83301560',19070);
insert into Pessoa values (782,7,'Niuli Robson Witt',1924532,'1981/11/05',4,'M','Rua Timóteo José Ferreira, 96','Casa','372-4343','niuli@hotmail.com','Bacacheri','82600590',19070);
insert into Pessoa values (783,9,'Gilson Luiz Lopes Pereira',4516085,'1979/09/10',4,'M','Professor João Soares Barcelos 3256','casa','372-2976','gilson@hotmail.com','boqueirão','81670080',19070);
insert into Pessoa values (784,11,'Gerson José Da Silva',145115,'1980/10/28',4,'M','R: Iolando João Toninelo      469','casa','372-1609','gerson@hotmail.com','São Braz','82310170',19070);
insert into Pessoa values (785,13,'Graciele Milene Negrissoli',2585354,'1982/10/07',4,'F','Av. presidente kennedy, 1500','apÝ 04, blÝ A1','372-0242','graciele@hotmail.com','Agua Verde','80220201',19070);
insert into Pessoa values (786,15,'Cleia Cerniak',3244756,'1972/03/20',1,'F','Rua Major Theolindo Ferreira Ribas 3454','Casa','372-8875','cleia@hotmail.com','boqueirao','81670110',19070);
insert into Pessoa values (787,17,'Mauricio Joly',4655490,'1982/07/21',4,'M','R: Sebastião A. Ferreira, 2667','casa','372-7508','mauricio@hotmail.com','Bairro Alto','82820080',19070);
insert into Pessoa values (788,19,'FRANCESCA  DE FATIMA PALHANO GOES',6350004,'1981/01/29',4,'F','EDMUNDO SAPORSKI','612','372-6141','francesca@hotmail.com','MERCES','80710610',19070);
insert into Pessoa values (789,21,'Fernanda da Cruz siqueira',6134416,'1980/09/18',4,'F','Eugênio José de Souza, 1746','Ap. 32 , Bl. 02','372-4774','fernanda@hotmail.com','Guaíra','80630130',19070);
insert into Pessoa values (790,23,'Jhonatan Wilson de Souza',3706125,'1982/07/05',4,'M','Rua Abrão Winter 35','35','372-3407','jhonatan@hotmail.com','Xaxim','81830280',19070);
insert into Pessoa values (791,4,'Paulo Alexandre Cavazani de Souza',5185862,'1984/03/09',4,'M','Paulino Santana de Oliveira 31','prox ao 13Ý BPM','372-2040','paulo@hotmail.com','Novo Mundo','8107009',19070);
insert into Pessoa values (792,27,'Lessandro Marcelo Lucca',6943725,'1982/01/08',4,'M','John Foster Dulles, 261','Jd. Los Angeles','372-0673','lessandro@hotmail.com','Seminário','80310520',19070);
insert into Pessoa values (793,29,'Robson Pascoal Pereira',1557318,'1983/03/14',4,'M','manoel hygino dos santos','441','372-9306','robson@hotmail.com','Vila Guaira','80630230',19070);
insert into Pessoa values (794,31,'Henrique Jose Ataides Neto',5998112,'1980/12/01',4,'M','R. Brigadeiro Franco, 2507','ap 1303','372-7939','henrique@hotmail.com','Rebouças','80250030',19070);
insert into Pessoa values (795,2,'Tiago de Carvalho Perin',5604116,'1981/06/25',4,'M','Rua Bruno Filgueira, 2100','apto 151','372-6572','tiago@hotmail.com','Bigorrilho','80730380',19070);
insert into Pessoa values (796,4,'Maurício Eduardo Hernaski',6403476,'1982/05/08',4,'M','Rua da Paz','460','372-5205','maurício@hotmail.com','Centro','80060160',19070);
insert into Pessoa values (797,6,'Luciano Sytnik',8582717,'1980/07/25',4,'M','Rua Deputado Carlos Rene Egg,323','Casa','372-3838','luciano@hotmail.com','Santa Felicidade','82410450',19070);
insert into Pessoa values (798,8,'Diges Feltrin Guizelini',1819844,'1983/02/08',4,'M','Rosa carvalho chaves','nÝ 85','372-2471','diges@hotmail.com','Novo mundo','81030390',19070);
insert into Pessoa values (799,10,'Gustavo Leandro Gogola',471750,'1984/03/26',4,'M','Rua Augusto Mueller','81','372-1104','gustavo@hotmail.com','Xaxim','81810220',19070);
insert into Pessoa values (800,12,'Douglas Pinto Hoffmann',1821928,'1977/02/20',4,'M','Rua Antonio Pietruza 266','ap 102  a/c Leticia','372-9737','douglas@hotmail.com','Portão','80610320',19070);
insert into Pessoa values (801,14,'Thais Tucunduva Perim',9581457,'1984/08/11',4,'F','Rua Carlos de Campos,482','apto 21','372-8370','thais@hotmail.com','Boa Vista','82540110',19070);
insert into Pessoa values (802,16,'Giovanni Lima Acosta',9540392,'1979/11/17',4,'M','Rua Cônego Januário da Cunha Barbosa, 658','Sobrado','372-7003','giovanni@hotmail.com','Jardim das Américas','81530480',19249);
insert into Pessoa values (803,18,'Carlos Aguinel Silva',1282022,'1976/05/04',4,'M','Guilherme Bruschz','Casa','372-5636','carlos@hotmail.com','Bairro Novo A','81920170',19070);
insert into Pessoa values (804,20,'Fernando Moskven Sobrinho',5473507,'1984/07/02',4,'M','Rua Robert Kennedy','183','372-4269','fernando@hotmail.com','Tingui','82600010',19070);
insert into Pessoa values (805,22,'Anderson Celecino Brito de Souza',3294549,'1983/05/10',4,'M','R. Alexandrino Alves de Oliveira','NÝ 65','372-2902','anderson@hotmail.com','Sitio Cercado','81900540',19070);
insert into Pessoa values (806,24,'Rafael Giuseppe Cano Ioris',6222483,'1983/12/27',4,'M','Rua Mateus Leme 444','apto.: 332','372-1535','rafael@hotmail.com','Centro Cívico','80530010',19070);
insert into Pessoa values (807,26,'Marcelo Cantos Correa',2457368,'1981/10/08',4,'M','Rua Presidente Faria, 727','casa','372-0168','marcelo@hotmail.com','Colonia Faria','83411050',19249);
insert into Pessoa values (808,28,'Jucilei de Fátima Bertão',6009735,'1978/04/05',4,'F','Cel. José Leal Fontoura,565','casa','372-8801','jucilei@hotmail.com','Boqueirão','81720030',19070);
insert into Pessoa values (809,29,'RODRIGO SOUZA DOS SANTOS',2695439,'1983/08/22',4,'M','AUGUSTO STRESSER, 1000','CASA','372-7433','rodrigo@hotmail.com','HUGO LANGE','80040310',19070);
insert into Pessoa values (810,31,'Cassio E. C. Milani',7246332,'1980/03/27',4,'M','Rua Humberto de Campos 412','Casa','372-6066','cassio@hotmail.com','Pilarzinho','82120410',19070);
insert into Pessoa values (811,2,'Vinicius Lafuente',1918996,'1984/03/19',4,'M','Rua Hipolito da Costa, 1360','casa','372-4699','vinicius@hotmail.com','Hauer','81670440',19070);
insert into Pessoa values (812,4,'Nadia Al-Bdywoui',3265471,'1983/03/18',4,'F','Engenheiros Rebouças, 2111','ap. 06','372-3332','nadia@hotmail.com','Rebouças','80230040',19070);
insert into Pessoa values (813,6,'Marilda Pontes Lacerda',8076470,'1979/06/03',4,'F','Rua Miguel Gaska','Casa 02','372-1965','marilda@hotmail.com','Capão Raso','81020710',19070);
insert into Pessoa values (814,8,'Robson Fernando Bordun',5242500,'1978/04/19',4,'M','Rua. Dr. Faivre,808','Ap. 23','372-0598','robson@hotmail.com','Centro','80060140',19070);
insert into Pessoa values (815,10,'Alvaro Henrique Mateus da Rocha',7469509,'1978/11/08',4,'M','Dr. João de Paula Moura Brito, 642','Casa 01','372-9231','alvaro@hotmail.com','Uberaba','81570390',19070);
insert into Pessoa values (816,12,'Flavia Dias de Carvalho',415278,'1982/09/17',4,'F','Cel Domingos Soares','NÝ 554','372-7864','flavia@hotmail.com','Bairro Alto','82820150',19070);
insert into Pessoa values (817,14,'Nelson dos Santos Filho',8951231,'1978/08/26',4,'M','R: Miguel Jareck, 300','casa','372-6497','nelson@hotmail.com','Costeira','83085020',19249);
insert into Pessoa values (818,16,'Vinicius Koodi Nihei',7614095,'1982/07/14',4,'M','Rua Dra. Maria Falce de Macedo','NÝ 10','372-5130','vinicius@hotmail.com','Ahú','82200290',19070);
insert into Pessoa values (819,18,'Roberto Carlos Bordin',8891634,'1978/05/18',1,'M','R. Mato Grosso','6334','372-3763','roberto@hotmail.com','Ferraria','83644000',19070);
insert into Pessoa values (820,20,'Antonio Rodrigues Barros',9951124,'1976/10/09',4,'M','Rua Luiz Leão, 0001','Apto 323','372-2396','antonio@hotmail.com','Centro','80030010',19070);
insert into Pessoa values (821,22,'Diogo Rodrigues de Jesus',523630,'1983/03/26',4,'M','Rua Tenente Francisco Ferreira de Souza 2420','casa 2','372-1029','diogo@hotmail.com','Vila Hauer','81670010',19070);
insert into Pessoa values (822,24,'Fernando Luis do Nascimento',8747039,'1981/11/16',4,'M','Rua São Sebastião 455','Casa','372-9662','fernando@hotmail.com','Campo Pequeno','83404050',19070);
insert into Pessoa values (823,26,'Leonardo Simoni',595295,'1981/12/09',4,'M','Rua Cândido Xavier NÝ 755','Ap.54','372-8295','leonardo@hotmail.com','Agua Verde','80240280',19070);
insert into Pessoa values (824,28,'Ricardo Ohlsen Roth',2399119,'1980/01/19',4,'M','Av. Vereador Toaldo Tulio, 3029','casa 06 Grand Ville','372-6928','ricardo@hotmail.com','São Braz','82300000',19070);
insert into Pessoa values (825,30,'Eduardo Ramos Ficker Assis',657819,'1981/10/24',4,'M','Raggi Izar','casa','372-5561','eduardo@hotmail.com','Hauer','81670190',19070);
insert into Pessoa values (826,1,'Rúbia da Silva Krüger',1762206,'1979/06/27',4,'F','Rua Artur Bernardes, nÝ 103','Casa','372-4194','rúbia@hotmail.com','Vila Amélia','83330080',19070);
insert into Pessoa values (827,3,'Higor Biz',6685607,'1981/01/10',4,'M','Rua Cirilo Merlin 859','sobrado','372-2827','higor@hotmail.com','Novo  Mundo','81010360',19070);
insert into Pessoa values (828,5,'Luigi Alves da Conceição',4077243,'1983/06/04',4,'M','Rua Augusto Dias Paredes','NÝ09','372-1460','luigi@hotmail.com','Boqueirão','81730100',19070);
insert into Pessoa values (829,7,'Thiago Tibilletti',2826927,'1983/03/20',4,'M','Rua Mato Grosso, 495','ap 12 bloco B','372-0093','thiago@hotmail.com','Agua Verde','80620070',19070);
insert into Pessoa values (830,9,'Sizaltino R. Lima Jr.',8623889,'1980/03/31',4,'M','rua Pedro Alves da Rocha','nÝ1.685','372-8726','sizaltino@hotmail.com','Jardim Itália','83020360',19249);
insert into Pessoa values (831,11,'Neiva Scharnoveber',9575220,'1981/08/06',4,'F','Rua Contenda','nÝ 130','372-7359','neiva@hotmail.com','Sitio Cercado','81910100',19070);
insert into Pessoa values (832,13,'Régis Quintanilha da Silva',6063109,'1981/06/19',4,'M','Rua João Ribeiro','391','372-5992','régis@hotmail.com','Jardim das Américas','81540130',19249);
insert into Pessoa values (833,15,'Priscila Staniski',8358576,'1983/08/10',4,'F','Rua Carlos Klemtz, 1410','Bl. 16 Apt. 21','372-4625',null,'Fazendinha','81320000',19070);
insert into Pessoa values (834,17,'Rafael de Oliveira Ianck',3225032,'1981/05/24',4,'M','Marques do Paraná 1275','apto 13 bloco a','372-3258','rafael@hotmail.com','Agua Verde','80620210',19070);
insert into Pessoa values (835,19,'Dromar Fernando Martynhak',3258072,'1981/01/19',4,'M','Rua FernandoSimas','577','372-1891','dromar@hotmail.com','Bigorrilho','80430190',19070);
insert into Pessoa values (836,21,'Márcio André Ishida',4618581,'1982/11/04',4,'M','Estefano Joucoski','No.348','372-0524','márcio@hotmail.com','Vista Alegre','80820550',19070);
insert into Pessoa values (837,23,'Marco Antonio Miranda',206984,'1981/05/18',4,'M','Rua Henrique Mehl','nÝ 738','372-9157','marco@hotmail.com','Uberaba','81560140',19070);
insert into Pessoa values (838,3,'Marcelo Awane',6308619,'1983/04/15',4,'M','Rua Anita Garibaldi','491','372-7790','marcelo@hotmail.com','Cabral','80540180',19070);
insert into Pessoa values (839,27,'Guilherme Fukasawa',4237882,'1984/08/19',4,'M','Rua do angico 185','Nenhum','372-6423','guilherme@hotmail.com','Vila B','85867100',19070);
insert into Pessoa values (840,29,'Santiago Pedro Timm Soares',4075028,'1980/09/21',4,'M','Rua Mateus Leme, 1620','Ap. 401','372-5056',null,'Centro Cívico','80530010',19070);
insert into Pessoa values (841,31,'Luiz Gonçalves Ferreira Filho',1595926,'1983/05/24',4,'M','Rua Carlos João Goudard 184','sobrado 05','372-3689','luiz@hotmail.com','Fazendinha','81330540',19070);
insert into Pessoa values (842,2,'Rafael Felix Budel',8974483,'1979/03/24',4,'M','José Peruci, 03','','372-2322','rafael@hotmail.com','Santa Felicidade','80030140',19070);
insert into Pessoa values (843,4,'Thiago Lizardo de Moraes',9574406,'1982/06/01',4,'M','R: Carlos Klemtz, 1410','Bloco 10 apto. 21','372-0955','thiago@hotmail.com','Fazendinha','81320000',19070);
insert into Pessoa values (844,5,'Silvia Caroline Kou',509721,'1978/02/26',4,'F','Av. Batel, 1505','ap 32','372-9587','silvia@hotmail.com','Batel','80420090',19070);
insert into Pessoa values (845,7,'Christian Savi Alberti',8438110,'1979/05/15',4,'M','R: Paulo Maeder Bittencourt, 50','Casa','372-8220','christian@hotmail.com','Abranches','82130180',19070);
insert into Pessoa values (846,9,'douglas granemann',442642,'1970/12/05',4,'M','rua b nÝ55','conjunto açucena','372-6853','douglas@hotmail.com','boqueirão','81750500',19070);
insert into Pessoa values (847,11,'Michelle Luri Abe',9634516,'1981/01/14',4,'F','R. Cap. Benjamin Claudino Ferreira, 1493','Casa','372-5486','michelle@hotmail.com','Centro','83005390',19070);
insert into Pessoa values (849,null,'Luciano D. Amarante',9184094,'1977/09/04',4,'M','Pasteur 615','Ap 32','372-2752','luciano@hotmail.com','Batel/Agua Verde','80250080',19070);
insert into Pessoa values (850,17,'Simone Canestraro Senco',852775,'1973/10/05',1,'F','Rua Maranhão, 35','casa','372-1385','simone@hotmail.com','Jardim Santos Dumont I','83040060',19249);
insert into Pessoa values (851,19,'André Luiz Balvedi',7940773,'1982/05/03',4,'M','Rua Gustavo Rattman, 274',' ','372-0018','andré@hotmail.com','Bacacheri','82520630',19070);
insert into Pessoa values (852,21,'Helena Maria Guimarães Peres Nicoletti',5563925,'1978/04/03',4,'F','R. João Barbosa de Almeirda','casa','372-8651','helena@hotmail.com','Xaxim','81830200',19070);
insert into Pessoa values (853,23,'José Henrique Machado de Almeida',3748976,'1983/07/04',4,'M','Rua Luis Pinheiro 1446','n/a','372-7284','josé@hotmail.com','Centro','84990000',19070);
insert into Pessoa values (854,12,'Marcel Antunes Raposo',9727254,'1981/09/13',4,'M','Rua Parintins 74','apto 34G','372-5917','marcel@hotmail.com','Vila Izabel','80320270',19070);
insert into Pessoa values (855,27,'Leonardo Tadeu Anderson Pinheiro',7610608,'1979/11/10',4,'M','Av. Visconde de Guarapuava,3185','ap. 1002','372-4550','leonardo@hotmail.com','Centro','80010100',19070);
insert into Pessoa values (856,29,'Thiago Camargo Rodachinski',9174236,'1982/09/13',4,'M','Rua Guaratuba,740','Apartamento 602','372-3183','thiago@hotmail.com','Ahú','80540260',19070);
insert into Pessoa values (857,31,'Ezequias Batista Pinto',2030245,'1982/03/06',4,'M','Padre João Rzemelka ,580','casa','372-1816','ezequias@hotmail.com','Campo Comprido','81280120',19070);
insert into Pessoa values (858,2,'Renan Marcel Cardoso Baggio',3184264,'1983/01/30',4,'M','Rua Santana, 534','Casa','372-0449','renan@hotmail.com','Ibiraquera','83210070',19249);
insert into Pessoa values (859,4,'Robson Keidy Sewo',9247116,'1983/04/20',4,'M','Scharfemberg de Quadros, 712','casa 12','372-9082','robson@hotmail.com','Centro','83009050',19070);
insert into Pessoa values (860,6,'Willian Cristopher Filus',2432210,'1983/07/24',4,'M','José Giostri Sobrinho','Casa','372-7715','willian@hotmail.com','Solitude','82980080',19070);
insert into Pessoa values (861,8,'Rafael Ianczyk',7275402,'1976/11/03',4,'M','r. Cidade de Franca, 111','casa','372-6348','rafael@hotmail.com','Seminário','80310050',19070);
insert into Pessoa values (862,10,'Pedro Emanuel Costa Vaz',315408,'1980/04/09',4,'M','João Espiranceta, 138','casa','372-4981','pedro@hotmail.com','Jardim Osasco','83403130',19249);
insert into Pessoa values (863,12,'Antonio José Leopoldino',6028825,'1980/04/08',4,'M','R: SUD+O','Casa','372-3614','antonio@hotmail.com','CAJURU','82960150',19070);
insert into Pessoa values (864,14,'Tiago Vignatti',3239819,'1984/04/23',4,'M','R. Augusto de Mari, 2498','-','372-2247','tiago@hotmail.com','Centro','88630010',25023);
insert into Pessoa values (865,16,'Joatemir Sarmanho Beltrão da Silva',7915080,'1974/05/09',1,'M','Rua Bruno Filgueira , 1866','Apto-12-B','372-0880','joatemir@hotmail.com','Bigorrilho','80730380',19070);
insert into Pessoa values (866,18,'Nádia Xavier de Oliveira',2055385,'1980/12/16',4,'F','Rua Carlos Klemtz','NÝ668','372-9513','nádia@hotmail.com','Fazendinha','81320000',19070);
insert into Pessoa values (867,20,'Nicolas Alejandro Manzo Rojas',3141828,'1983/11/10',4,'M','Rua Paulina Ader n.Ý 372','Nacionalidade_Chile','372-8146','nicolas@hotmail.com','Novo Mundo','81050250',19070);
insert into Pessoa values (868,22,'Cesar Augusto Serenato',5234493,'1980/12/24',4,'M','Rua Noel Rosa','Casa','372-6779','cesar@hotmail.com','Bigorrilho','80710140',19070);
insert into Pessoa values (869,24,'Ricardo Nachi Pimentel',4508217,'1983/05/12',4,'M','R. -ngelo Sampaio, 1190','apto 1302','372-5412','ricardo@hotmail.com','Batel','80250120',19070);
insert into Pessoa values (870,26,'Guilherme Leandro Zonatto',5879208,'1983/07/10',4,'M','Rua João Havro, nÝ1419','--------------------','372-4045','guilherme@hotmail.com','Boa Vista','82560020',19070);
insert into Pessoa values (871,28,'Kelly Cristina dos Santos',8829462,'1976/01/01',4,'F','Lodovico Kaminiski,3303','sobrado','372-2678','kelly@hotmail.com','Fazendinha','81260040',19070);
insert into Pessoa values (872,30,'mayara morokawa',4013901,'1982/08/26',4,'F','rua jose verissimo 1117','casa09','372-1311','mayara@hotmail.com','alto','82820000',19070);
insert into Pessoa values (873,1,'Francisco Cláudio R. Holanda Jr.',4396077,'1983/06/23',4,'M','Rua Augusto Steembock , 544','casa 97','372-9944','francisco@hotmail.com','Uberaba','81550080',19070);
insert into Pessoa values (874,3,'Juliana Cristina Hohmann',6135053,'1983/09/20',4,'F','Rua Alexandre Possebon Filho, 15','Casa','372-8577','juliana@hotmail.com','Afonso Pena','83045300',19070);
insert into Pessoa values (875,5,'Jeferson Seiki Akatsu',3115242,'1981/01/10',4,'M','R. Atilio Borio','N 71','372-7210','jeferson@hotmail.com','Cristo Rei','80050250',19070);
insert into Pessoa values (876,7,'ARILSON TAVARES DE SOUZA',8395999,'1974/08/08',1,'M','RUA TOLEDO 79','GUARAITUBA','372-5843','arilson@hotmail.com','GUARAITUBA','83410600',19070);
insert into Pessoa values (877,9,'Paulo Celso Grossmann Jr.',7064275,'1982/11/10',4,'M','Rua Guilherme Pugsley','1188','372-4476','paulo@hotmail.com','Agua Verde','80620000',19070);
insert into Pessoa values (878,11,'Fabio Frech Gouveia',4393314,'1983/03/04',4,'M','Rua Albino Tesserolli 173','casa','372-3109','fabio@hotmail.com','Santa Felicidade','82015210',19070);
insert into Pessoa values (879,12,'Ramon Fernandes Garcia',6160432,'1983/06/21',4,'M','Rua Desenbargador Isaías Bevilaqua 103','apartamento 14','372-1741','ramon@hotmail.com','Merces','80430040',19070);
insert into Pessoa values (880,14,'Rogério Uhlig',1727306,'1980/06/11',4,'M','Rua Senador Alencar Guimarães, nÝ 183.','Apto. 22','372-0374','rogério@hotmail.com','Centro','80010070',19070);
insert into Pessoa values (881,16,'Marcos Venício Scheffler',1849836,'1983/11/15',4,'M','Rua Guararapes, 1407','apto 402','372-9007','marcos@hotmail.com','Vila Izabel','80320210',19070);
insert into Pessoa values (882,18,'Daniel Borusch',7704444,'1983/09/09',4,'M','Rua: Professora Maria José Godoy','nÝ 448','372-7640','daniel@hotmail.com','Bom Retiro','80520220',19070);
insert into Pessoa values (883,20,'Rodrigo Petreli Pimenta',5455227,'1978/04/18',4,'M','R: Francisco das Chagas Lopes','NÝ 05 Casa 01','372-6273','rodrigo@hotmail.com','Boa Vista','82650130',19070);
insert into Pessoa values (884,22,'JOSÉ FERNANDO RODRIGUES',5761317,'1984/02/08',4,'M','CLEMENTE RITZ','NÝ 251','372-4906','josé@hotmail.com','FAZENDINHA','81250020',19070);
insert into Pessoa values (885,24,'Mariana Gusmão Nascimento Costa',5752543,'1977/12/05',4,'F','AV. Cel. Francisco H. dos Santos, 654','ap.18','372-3539','mariana@hotmail.com','Jardim das Americas','81530000',19249);
insert into Pessoa values (886,26,'Aline Fátima de Meira',51539,'1983/05/27',4,'F','Rua Arthur Manoel Iwersen','1971','372-2172','aline@hotmail.com','Alto Boqueirão','81770540',19070);
insert into Pessoa values (887,28,'Marcelo Herman',8918247,'1981/06/17',4,'M','R. Cap. Joao Zaleski 1146','casa','372-0805','marcelo@hotmail.com','Lindoia','81001008',19070);
insert into Pessoa values (888,30,'Fernanda de Araujo Cunha',2634345,'1980/11/02',4,'F','Cyrilo Merlim, 241','241','372-9438','fernanda@hotmail.com','Novo Mundo','81010360',19070);
insert into Pessoa values (889,1,'Sandra Karina Dias',6310733,'1983/06/27',4,'F','Av. Presidente Kennedy, 3244','apto 33','372-8071','sandrakd@hotmail.com','Agua Verde','80610010',19070);
insert into Pessoa values (890,3,'Rodrigo Crema de Araujo',7405737,'1977/06/27',4,'M','Rua Florindo Lindes','casa','372-6704','rodrigo@hotmail.com','Privê Bois de Bologne','83330270',19070);
insert into Pessoa values (891,5,'Marcelo Henrique Amorim da Silva',9343287,'1982/07/22',4,'M','R. padre manoel da nóbrega','1596','372-5337','marcelo@hotmail.com','Novo Mundo','81030330',19070);
insert into Pessoa values (892,7,'Richard Reichardt',6597313,'1981/03/17',4,'M','Av da Republica','68','372-3970','richard@hotmail.com','Parolin','81030120',19070);
insert into Pessoa values (893,9,'Maria Eliza Wielewski',3453247,'1978/11/28',4,'F','Rua Carlota Mion,13,apto.03,bl.03','Jd. Esplanada','372-2603','maria@hotmail.com','Campina do Siqueira','80740660',19070);
insert into Pessoa values (894,11,'Eduardo Takeshi Ynoue',4100204,'1981/12/15',4,'M','Rua Oliveira Viana','3514','372-1236','eduardo@hotmail.com','Boqueirão','81670090',19070);
insert into Pessoa values (895,13,'Ricardo Surdi',1293025,'1982/08/06',4,'M','Casimiro de Abreu, 290','casa c.','372-9869','ricardo@hotmail.com','AH+','82200130',19070);
insert into Pessoa values (896,15,'Carla Maria Schmitz',8354271,'1982/10/09',4,'F','Rua São Januário 530','.','372-8502','carlaschmitz@hotmail.com','Jardim Botânico','80210300',19249);
insert into Pessoa values (897,17,'Patrik Luiz de O. Camargo',9556037,'1979/11/26',4,'M','Rua: Trindade ,33','casa 23','372-7135','patrik@hotmail.com','cajuru','82420120',19070);
insert into Pessoa values (898,19,'Tiago Yugo Iwasa',3106086,'1984/04/06',4,'M','R. Cel. Alfredo Ferreira da Costa, 504','Casa','372-5768','tiago@hotmail.com','Jardim das Américas','81540090',19249);
insert into Pessoa values (899,21,'Marcos Laércio de Peder',9457626,'1969/11/06',4,'M','R. Angelo João Gottardi, 144','.','372-4401','marcos@hotmail.com','Cajuru','82970060',19070);
insert into Pessoa values (900,23,'Josiane Aparecida Lopes',2458584,'1970/04/15',4,'F','R. Chile, 215','','372-3034','josiane@hotmail.com','Prado Velho','80215170',19070);
insert into Pessoa values (901,21,'ANA PAULA PORTES DE MIRANDA',3835411,'1975/05/10',4,'F','AV. AGUA VERDE 607','APTO 61','372-1667','ana@hotmail.com','AGUA VERDE','80620200',19070);
insert into Pessoa values (902,27,'Carlos Eduardo Ferraz',9054054,'1981/04/18',4,'M','rua Sant Ana do Itararé','nÝ 215,  casa  22B','372-0300','carlos@hotmail.com','Ratones','88910380',25054);
insert into Pessoa values (903,29,'Kiryan Mello',3002723,'1980/11/11',4,'M','Reinoldo Ihlenfeldt','32','372-8933','kiryan@hotmail.com','Santa Cândida','82640260',19070);
insert into Pessoa values (904,31,'Ricardo Daniachi',2780684,'1978/02/11',4,'M','Rua Para','512','372-7566','ricardo@hotmail.com','agua verde','80610020',19070);
insert into Pessoa values (905,2,'Irineo Muchinski Filho',7951094,'1978/11/21',4,'M','Rua Jacob Mehl, 219','Casa','372-6199','irineo@hotmail.com','Atuba','83326250',19070);
insert into Pessoa values (906,4,'Valdeci dos Santos',531101,'1983/06/10',4,'M','Rua Salomão Elias Feder, 445','445','372-4832','valdeci@hotmail.com','Uberaba','81570390',19070);
insert into Pessoa values (907,6,'Eliandro Dal Negro',7469694,'1976/11/20',4,'M','Rua Francisco Caron,429.','Casa','372-3465','eliandro@hotmail.com','Pilarzinho','82120200',19070);
insert into Pessoa values (908,8,'Paulo Cesar Correia Feuerschuette',3783590,'1981/10/25',4,'M','Rua Carneiro Lobo, 323','Ap. 92','372-2098','paulo@hotmail.com','Agua Verde','80240240',19070);
insert into Pessoa values (909,10,'José Furtunato da Silva',3691137,'1975/04/08',4,'M','R: José Cubas Martins,61','Proximo da coca cola','372-0731','josé@hotmail.com','Uberaba','81590600',19070);
insert into Pessoa values (910,12,'Juan Fernandes Vieira Gutierrez',3545970,'1983/10/25',4,'M','Theodoro Martins, nÝ 187','Sobrado','372-9364','juan@hotmail.com','Uberaba','81580110',19070);
insert into Pessoa values (911,14,'Kely Rodrigues Ignácio',3626266,'1982/01/15',4,'F','R: Raul Pompéia 2235','B 4 AP 2','372-7997','kelyr@hotmail.com','Fazendinha','81260150',19070);
insert into Pessoa values (912,16,'Carlos Eduardo Dubena',8211393,'1982/04/08',4,'M','Av. Vicente Machado, 2693','casa','372-6630','carlos@hotmail.com','Seminário','80440020',19070);
insert into Pessoa values (913,18,'Alex Fernando Sarruf',4868813,'1976/12/11',4,'M','Rua Engenheiro Niepce da Silva, 200','bl:8 ap:304','372-5263','alex@hotmail.com','Portão','80610900',19070);
insert into Pessoa values (914,19,'Luciane Quintiliano',5432852,'1976/04/19',1,'F','Rua Ivo Neves, 33','casa','372-3895','luciane@hotmail.com','Costeira','83015720',19249);
insert into Pessoa values (915,21,'Daniel Victor Montoril Negrão',9132709,'1983/12/06',4,'M','R. Prof. Benedito Conceição, 789','Casa A','372-2528','daniel@hotmail.com','Capão da Imbuia','82810080',19070);
insert into Pessoa values (916,23,'Rodrigo Henrique Oliveira França',5820807,'1981/10/06',4,'M','Rua Sanito Rocha 207','apto 714','372-1161','rodrigo@hotmail.com','Cristo Rei','80050380',19070);
insert into Pessoa values (917,1,'Celio Roberto de Morais',344833,'1978/08/30',1,'M','Rua Francisco Rocha, 412','Apto 34','372-9794','celio@hotmail.com','Batel','80420130',19070);
insert into Pessoa values (918,27,'Danilo Giovani Provenzi',228467,'1983/02/26',4,'M','rua Atilio Ramos nÝ 238','casa','372-8427','danilo@hotmail.com','Bairro Alto','82840140',19070);
insert into Pessoa values (919,29,'Alex Rocca',7297551,'1982/06/21',4,'M','Rua Marte, 1833','Parigot de Souza','372-7060','alex@hotmail.com','Sitio Cercado','81910340',19070);
insert into Pessoa values (920,31,'Ana Carolina Kachel Araújo',1443555,'1983/05/18',4,'F','R. Dep. Mário de Barros 1130','apartamento 136','372-5693','ana@hotmail.com','Centro-Cívico','80530280',19070);
insert into Pessoa values (921,2,'Max Landscheck',2940034,'1979/05/01',4,'M','R.garuva 56','nt','372-4326','max@hotmail.com','Santa Helena','81240200',19249);
insert into Pessoa values (922,4,'Roger C. Beraldi',5373747,'1982/06/29',4,'M','R. Dep. Edegar Távora','casa nÝ 496','372-2959','roger@hotmail.com','Barreirinha','82700270',19070);
insert into Pessoa values (923,6,'Marcio Bevervanso',2293941,'1981/04/05',4,'M','Rua José de Alencar nÝ90','Ap 301','372-1592','marcio@hotmail.com','Cristo Rei','80050240',19070);
insert into Pessoa values (924,8,'Ana Paula Mandu',1620945,'1983/08/29',4,'F','Rua Mateus Leme','6548','372-0225','ana@hotmail.com','Abranches','82130000',19070);
insert into Pessoa values (925,10,'Marcelo Henrique A. da Silva',9343287,'1982/07/22',4,'M','Rua Padre Manoel da Nóbrega, 1596','casa','372-8858','marcelo@hotmail.com','Novo Mundo','81030330',19070);
insert into Pessoa values (926,12,'Marlus Laureano Mizerkowski',3208071,'1983/04/27',4,'M','Rua da Bandeira','415 - 31B','372-7491','marlus@hotmail.com','Cabral','80035270',19070);
insert into Pessoa values (927,14,'Everton Vitor Sobrinho',4641856,'1982/05/26',4,'M','R. Dr. Manoel Pedro 539','apartamento 407','372-6124','everton@hotmail.com','Cabral','80035030',19070);
insert into Pessoa values (928,16,'Michel F.S.Sniecikoski',8943996,'1979/08/06',4,'M','R. Berta klemtz, 492','casa','372-4757','michel@hotmail.com','Fazendinha','81330380',19070);
insert into Pessoa values (929,18,'José Luis Abelardino',8354271,'1982/10/09',4,'M','Rua São Januário 530','.','372-3390','josé@hotmail.com','Jardim Botânico','80210300',19249);
insert into Pessoa values (930,20,'Maria Rosane Chernij',8695654,'1973/05/04',4,'F','Rua Maestro Francisco Antonelo, 2961','Casa','372-2023','maria@hotmail.com','Novo Mundo','81030100',19070);
insert into Pessoa values (931,22,'Roger Michel Santos Machado',734125,'1981/03/30',4,'M','Chile','2241 ap 57','372-0656','roger@hotmail.com','Rebouças','80220901',19070);
insert into Pessoa values (932,24,'Nicole Coradin',2513650,'1984/08/13',4,'F','Rua Manoel Eufrásio, 695','apto 302','372-9289','nicole@hotmail.com','Juvevê','80540010',19070);
insert into Pessoa values (933,26,'luciano de abreu sabatke',1238233,'1984/05/08',4,'M','rua dos funcionários','1213   ap09','372-7922','luciano@hotmail.com','cabral','80035050',19070);
insert into Pessoa values (934,28,'Michelle Luri Abe',9634516,'1981/01/14',4,'F','Rua Cap. Benjamin Claudino Ferreira','casa','372-6555','michelle@hotmail.com','Centro','83005390',19070);
insert into Pessoa values (935,30,'Rafaela Marochi',2944361,'1984/01/03',4,'F','Rua São Mateus, 350','Casa','372-5188','rafaela@hotmail.com','Portão','81070080',19070);
insert into Pessoa values (936,1,'wiliam schuta',41348,'1984/06/23',4,'M','são luiz  nÝ414','casa','372-3821','wiliam@hotmail.com','estação','83705010',19070);
insert into Pessoa values (937,3,'Leandro Cesar Teixeira',6099198,'1983/12/16',4,'M','Rua Curupis,244','Casa','372-2454','leandro@hotmail.com','Santa Quiteria','80310200',19070);
insert into Pessoa values (938,5,'Luiz Fernando Pereira',585041,'1976/09/26',4,'M','Avenida Silva Jardim','1502/21','372-1087','luiz@hotmail.com','Rebouças','80250200',19070);
insert into Pessoa values (939,7,'Eliandro Dal Negro',7469694,'1976/11/20',4,'M','Rua Francisco Caron, 429.','casa','372-9720','eliandro@hotmail.com','Pilarzinho','82120200',19070);
insert into Pessoa values (940,9,'Guilherme Moschen',7908985,'1983/08/18',4,'M','Rua Dos Dominicanos, 1171','C/A','372-8353','guilherme@hotmail.com','Boa Vista','82560390',19070);
insert into Pessoa values (941,11,'Fabiane Steffen Mottin',1522759,'1983/06/10',4,'F','Rua João Schleder Sobrinho','1373 B','372-6986','fabiane@hotmail.com','Boa Vista','82540060',19070);
insert into Pessoa values (942,13,'Wesley Pereira Maran',6622458,'1980/07/05',4,'M','Rua Padre Agostinho, 378','ap 203','372-5619','wesley@hotmail.com','Mercês','80410020',19070);
insert into Pessoa values (943,15,'Anderson Celecino Brito de Souza',3294549,'1983/05/10',4,'M','Rua Alexandrino Alves de Oliveira','N-65','372-4252','anderson@hotmail.com','Sítio Cercado','81900540',19070);
insert into Pessoa values (944,17,'Paola Albiero Gomez',7081130,'1981/12/13',4,'F','Travessa Percy Withers, 80','ap 202','372-2885','paola@hotmail.com','Agua Verde','80240190',19070);
insert into Pessoa values (945,19,'Luciana Romagnolli',7609044,'1983/04/09',4,'F','R Desembargador Isaias Bevilaqua 259','ap 103','372-1518','luciana@hotmail.com','Merces','80340040',19070);
insert into Pessoa values (946,21,'Alisson de Almeida Pissetti',7483716,'1982/12/27',4,'M','Rua Zem Bertappelle 315','casa 11','372-0151','alisson@hotmail.com','Santa Felicidade','82030430',19070);
insert into Pessoa values (947,23,'LAUREANO P. F. NISHI DE SOUZA',9921897,'1980/11/10',4,'M','RUA EÇA DE QUEIROZ 1205','AP 23 C','372-8784','laureano@hotmail.com','AHU','80540140',19070);
insert into Pessoa values (948,24,'Fernando Maxclioff Calvache',3774847,'1983/08/16',4,'M','Luiz Leão, nÝ 1','apto 234','372-7416','fernando@hotmail.com','Centro','80030010',19070);
insert into Pessoa values (949,26,'Sergio Calizario Sobrinho',4448284,'1978/04/05',4,'M','Rua Rio Iriri,221','Casa','372-6049','sergio@hotmail.com','Alto','82840310',19070);
insert into Pessoa values (950,28,'Heder Goes Maciel',7082601,'1980/02/28',4,'M','Maria Madalemna de Miranda Wolfart, 193','Casa','372-4682','heder@hotmail.com','Boa Vista','82650190',19070);
insert into Pessoa values (951,30,'Marcos Ferreira da Silva',2700252,'1967/09/03',1,'M','R Nair Ferraz Cazelato, 251','Conj Rede Ferroviari','372-3315','marcos@hotmail.com','Boqueirão','81770690',19070);
insert into Pessoa values (952,1,'João Roberto Zulkievicz',5871926,'1972/03/15',1,'M','Estrada Santa Cândida, 221','Sobrado 15','372-1948','joão@hotmail.com','Santa Cândida','82630490',19070);
insert into Pessoa values (953,3,'Felipe Busato de Lima',3074989,'1979/10/31',4,'M','Rua Desembargador Augusto Guimarães Cortes, 54','Sobrado 04','372-0581','felipe@hotmail.com','Campina do Siqueira','8074002',19070);
insert into Pessoa values (954,5,'João Norberto de Sousa Junior',6671672,'1984/02/07',4,'M','Av.: Iguaçu, 3001','apto 1502','372-9214','joão@hotmail.com','Batel','80240031',19070);
insert into Pessoa values (955,7,'Paulo Roberto Boniatti',5579908,'1983/04/22',4,'M','Rua: Cristiano Strobel 3310','casa 60','372-7847','paulo@hotmail.com','Boqueirão','81710370',19070);
insert into Pessoa values (956,9,'Fernando Felipe Kuss',4866480,'1984/12/07',4,'M','Rua Irati','315','372-6480','fernando@hotmail.com','Santa Quitéria','80310150',19070);
insert into Pessoa values (957,11,'Leonardo Moreira dos Santos',6605796,'1984/09/20',4,'M','Rua Prof. Nuno de Souza e Silva, 35','casa','372-5113','leonardo@hotmail.com','Santo Inácio','82010420',19070);
insert into Pessoa values (958,13,'Ana Maria Ditzel Amarante',9811019,'1983/07/21',4,'F','rua cel. manoel alves do amaral, 222','casa','372-3746','ana@hotmail.com','jardim social','82520340',19249);
insert into Pessoa values (959,15,'Everton Karasinski',9436636,'1978/05/07',4,'M','Rua Guaianazes, 779','ap.: 03','372-2379','everton@hotmail.com','Vila Izabel','80320240',19070);
insert into Pessoa values (960,17,'Ricardo Sousa Wojcik',9690384,'1984/12/28',4,'M','Rua Afonso Zanon','nÝ 249','372-1012','ricardo@hotmail.com','Santa Helena Cic','81250590',19249);
insert into Pessoa values (961,19,'Claudia Kotowy',7727756,'1982/12/10',4,'F','Rua Dom Orione','1664','372-9645','claudia@hotmail.com','Portão','80330060',19070);
insert into Pessoa values (962,21,'Maikel Alberto Arabori',9849777,'1983/04/25',4,'M','Al. Julia da Costa 1875, ap402','ap 402','372-8278','maikel@hotmail.com','Bigorrilho','80730070',19070);
insert into Pessoa values (963,23,'Fabiana Anciutti Orreda',4137965,'1974/11/19',4,'F','Al Dr. Carlos de Carvalho, 1461','ap16','372-6911','fabiana@hotmail.com','Batel','8073000',19070);
insert into Pessoa values (964,2,'Antonio Rodrigues Barros',9951124,'1976/10/09',4,'M','Rua Luiz Leão, 0001','Apto - 323','372-5544','antonio@hotmail.com','Centro','80030010',19070);
insert into Pessoa values (965,27,'Xenócrates Amon Mello',4538731,'1983/12/13',4,'M','Rua Cidade de Laguna, 556.','BL 01 AP 13','372-4177','xenócrates@hotmail.com','Cidade Industrial','81240250',19070);
insert into Pessoa values (966,29,'Dante Keidji Ohashi',6310733,'1983/06/27',4,'M','Av. Presidente Kennedy, 3244','apto 33','372-2810','dante@hotmail.com','Agua Verde','80610010',19070);
insert into Pessoa values (967,31,'Ricardo Nachi Pimentel',4508217,'1983/05/12',4,'M','Rua Angelo Sampaio 1190','apto 1302','372-1443','ricardo@hotmail.com','Batel','80250120',19070);
insert into Pessoa values (968,2,'Jason Guilherme Mayer',7171750,'1982/08/28',4,'M','R: Schiller,555','ap.212','372-0076','jason@hotmail.com','Cristo Rei','80050260',19070);
insert into Pessoa values (969,4,'André Rosenstein Silva',6721140,'1983/09/16',4,'M','R. Com. Lustoza de Andrade nÝ 357','Casa','372-8709','andré@hotmail.com','Bom Retiro','80520350',19070);
insert into Pessoa values (970,6,'Fábio Augusto Brandalise',5816457,'1983/09/14',4,'M','Rua das cerejeiras, 37','casa','372-7342','fábio@hotmail.com','barreirinha','82700510',19070);
insert into Pessoa values (971,8,'FRANKLIN AUGUSTO GONÇALVES',9284216,'1979/02/20',4,'M','Rua Professor Fábio de Souza, 670','Casa','372-5975','franklin@hotmail.com','Santa Quitéria','80310230',19070);
insert into Pessoa values (972,10,'Thales Vicente das Neves Kischelevski',6242477,'1983/02/17',4,'M','Rua Salvador','520','372-4608','thales@hotmail.com','Cajuru','82940160',19070);
insert into Pessoa values (974,14,'Artur D. F. S. Lipori',9986797,'1983/10/29',4,'M','Rua -ngelo Trevisan 530','casa 1','372-1874','artur@hotmail.com','Cascatinha','82010030',19070);
insert into Pessoa values (975,16,'Ricardo Bernardes',4232634,'1975/09/25',4,'M','rua eng. Niepce da silva, 200','bl 3 ap 302','372-0507','ricardo@hotmail.com','PORTAO','80610280',19070);
insert into Pessoa values (976,18,'Marcos Aloisio Santos de Almeida',8379067,'1958/12/24',1,'M','Rua Jose Palu, 451','Bl 17 - Ap 33','372-9140','marcos@hotmail.com','Novo Mundo','81020050',19070);
insert into Pessoa values (977,20,'Marcos Tupan Silva',4368051,'1982/03/24',4,'M','Rua Eduardo Geronasso, 1357','Casa','372-7773','marcos@hotmail.com','Bacacheri','82510280',19070);
insert into Pessoa values (978,22,'Jonatan Renato Müller',1569785,'1982/02/01',4,'M','Rua Durval de Morais, 318','Casa','372-6406','jonatan@hotmail.com','Jardim das Américas','81530460',19249);
insert into Pessoa values (979,24,'Leticia Midori Sato',1466972,'1981/11/22',4,'F','rua Atílio Bório, 71','-','372-5039','leticia@hotmail.com','Cristo Rei','80050250',19070);
insert into Pessoa values (980,26,'Gustavo Leandro Gogola',471750,'1984/03/26',4,'M','Rua Augusto Mueller','nÝ 81','372-3672','gustavo@hotmail.com','Xaxim','81810220',19070);
insert into Pessoa values (981,28,'Andrea de Fatima Filius',7046497,'1981/06/29',4,'F','Rua Andorinha  123','Fenix','372-2305','andrea@hotmail.com','Jardim Fênix','83326460',19249);
insert into Pessoa values (982,30,'Jonath Rodrigues Ignácio',3551734,'1982/01/15',4,'M','R: Raul Pompéia 2235','B 4 Ap 2','372-0938','jonath@hotmail.com','CIC','81260150',19070);
insert into Pessoa values (983,31,'reverson luis de melo follador',1417150,'1980/05/02',4,'M','francisco derosso 6120','casa','372-9570','reverson@hotmail.com','alto boqueirao','81770000',19070);
insert into Pessoa values (984,2,'Fernando de Moraes Bozza',1468646,'1983/09/11',4,'M','R. Antonio Agenor do Nascimento, 53','SB 01','372-8203','fernando@hotmail.com','Jd. das Américas','81540160',19070);
insert into Pessoa values (985,4,'Thiago Lizardo de Moraes',9574406,'1982/06/01',4,'M','Rua Carlos Klemtz, 1410','bloco 10 apto 21','372-6836','thiago@hotmail.com','Fazendinha','81320000',19070);
insert into Pessoa values (986,6,'Janaina Benato Siqueira',8525587,'1983/08/23',4,'F','Coronel Isaias Natel de Paula 131','Casa','372-5469','janaina@hotmail.com','Jurerê','88520450',25054);
insert into Pessoa values (987,8,'Jeandro Guimarães',5466769,'1981/07/28',4,'M','Rua Ermelino de Leão, 333','Ap 82','372-4102','jeandro@hotmail.com','Centro','80410230',19070);
insert into Pessoa values (988,10,'Alexandre Conte da Nova',5612770,'1981/08/04',4,'M','R. Fernando Moreira','N 124 Apt 503','372-2735','alexandre@hotmail.com','Centro','80410120',19070);
insert into Pessoa values (989,12,'Rafael Vinicius Schaffer',1700366,'1984/02/17',4,'M','R. Heitor de Andrade, 626','casa normal','372-1368','rafael@hotmail.com','Jardim das Américas','81530310',19249);
insert into Pessoa values (990,14,'Fabio Suguinoshita',4898397,'1982/01/16',4,'M','Rua Atilio Borio, 71','apto 307','372-0001','fabio@hotmail.com','Cristo Rei','80050250',19070);
insert into Pessoa values (991,16,'Rafael Matta Carnasciali',834270,'1983/03/03',4,'M','Rua São Pedro, 169','ap 202','372-8634','rafael@hotmail.com','Cabral','80035020',19070);
insert into Pessoa values (992,18,'Marcela Chaves Armstrong',3915760,'1981/04/16',4,'F','Travessa do Lazer','n.91','372-7267','marcela@hotmail.com','Jardim Jacob Ceccon','83430000',19249);
insert into Pessoa values (993,20,'Alexandre Augusto Brotto',3140471,'1977/07/30',4,'M','rua: Curt Roters n: 66','Casa','372-5900','alexandre@hotmail.com','Boqueirão','81750120',19070);
insert into Pessoa values (994,22,'Olivia Koltun',5910875,'1959/08/30',1,'F','Atilio Borio','174 Ap. 84','372-4533','olivia@hotmail.com','Cristo Rei','80050250',19070);
insert into Pessoa values (995,24,'Karina Pagani',2302876,'1982/09/20',4,'F','Paulo Setubal, 327','*','372-3166','karina@hotmail.com','Hauer','81630110',19070);
insert into Pessoa values (996,26,'Clayton Machado Gallego',4081448,'1982/06/21',4,'M','Rua Capitão Tenente Maris de Barros','n:122','372-1799','clayton@hotmail.com','Portão','80330340',19070);
insert into Pessoa values (997,28,'Marcos Rodrigo Jansson de Freitas',9725775,'1979/04/01',4,'M','mercedes strano vieria','n 55, casa','372-0432','marcos@hotmail.com','centro','88001510',25091);
insert into Pessoa values (998,30,'Camila Cristiane Carvalho  Savelli',2661263,'1980/12/16',4,'F','Rua Itacolomi','sobrado 02','372-9065','camila@hotmail.com','Portao','88070150',25091);
insert into Pessoa values (999,1,'Daniel Taketa dos Santos Lima',8203321,'1979/06/01',4,'M','Rua Francisco Rocha,365','Apto 34','372-7698','daniel@hotmail.com','Batel','80420130',19070);


insert into Idioma
            (CodIdioma, descricao)
     VALUES (1, 'Inglês');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (2, 'Francês');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (3, 'Alemão');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (4, 'Italiano');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (5, 'Espanhol');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (6, 'Japonês');

insert into Idioma
            (CodIdioma, descricao)
     VALUES (7, 'Chines');
insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (704, 'Regular', 1);


insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (704, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (705, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (706, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (707, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (707, 'Fluente', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (707, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (708, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (708, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (709, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (710, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (710, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (711, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (712, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (713, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (714, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (715, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (716, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (716, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (717, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (717, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (718, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (718, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (719, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (721, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (722, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (723, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (723, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (723, 'Regular', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (724, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (725, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (726, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (726, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (727, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (727, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (728, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (728, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (729, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (729, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (731, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (731, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (732, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (732, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (734, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (734, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (735, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (736, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (736, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (738, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (738, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (739, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (740, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (741, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (741, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (743, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (744, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (745, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (746, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (747, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (747, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (748, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (748, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (749, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (749, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (750, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (750, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (751, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (752, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (753, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (753, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (754, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (754, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (755, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (755, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (756, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (756, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (757, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (757, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (758, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (759, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (759, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (761, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (761, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (762, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (763, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (764, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (766, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (766, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (767, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (767, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (768, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (770, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (771, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (771, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (772, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (772, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (773, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (774, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (774, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (774, 'Bom', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (776, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (776, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (777, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (778, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (779, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (781, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (781, 'Regular', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (782, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (782, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (783, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (783, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (784, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (784, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (785, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (785, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (786, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (786, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (787, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (787, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (789, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (789, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (790, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (790, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (792, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (793, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (793, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (794, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (795, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (797, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (797, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (798, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (799, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (800, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (800, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (801, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (802, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (802, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (803, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (803, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (804, 'Fluente', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (804, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (806, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (806, 'Fluente', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (807, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (807, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (808, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (808, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (810, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (811, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (811, 'Fluente', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (812, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (812, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (814, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (814, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (815, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (816, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (817, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (817, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (817, 'Bom', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (818, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (819, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (819, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (820, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (820, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (821, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (822, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (823, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (823, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (824, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (826, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (826, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (826, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (827, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (828, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (829, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (829, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (830, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (830, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (831, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (831, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (832, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (832, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (833, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (833, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (834, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (834, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (835, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (836, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (836, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (837, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (837, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (838, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (839, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (839, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (840, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (840, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (841, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (843, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (843, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (843, 'Bom', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (844, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (844, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (845, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (845, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (846, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (846, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (847, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (847, 'Bom', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (849, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (850, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (851, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (851, 'Fluente', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (852, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (852, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (853, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (854, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (855, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (856, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (856, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (856, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (857, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (857, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (858, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (859, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (860, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (861, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (861, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (863, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (863, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (864, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (865, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (866, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (867, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (867, 'Regular', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (867, 'Fluente', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (868, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (869, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (870, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (870, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (871, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (871, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (873, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (874, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (874, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (877, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (878, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (878, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (879, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (880, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (880, 'Bom', 3);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (880, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (880, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (881, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (881, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (882, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (882, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (883, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (885, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (885, 'Bom', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (886, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (886, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (887, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (887, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (888, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (889, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (890, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (890, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (890, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (891, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (891, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (892, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (892, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (893, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (894, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (894, 'Bom', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (895, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (895, 'Regular', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (895, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (896, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (897, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (897, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (898, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (899, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (899, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (899, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (899, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (900, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (901, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (901, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (902, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (902, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (903, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (903, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (904, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (904, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (905, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (906, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (907, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (907, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (908, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (909, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (909, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (910, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (910, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (910, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (911, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (911, 'Regular', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (911, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (913, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (914, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (916, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (916, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (917, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (918, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (918, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (919, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (920, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (920, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (921, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (921, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (922, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (922, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (924, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (924, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (925, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (925, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (926, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (926, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (927, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (927, 'Bom', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (928, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (928, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (929, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (929, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (930, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (931, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (932, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (933, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (934, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (934, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (934, 'Regular', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (935, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (935, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (936, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (936, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (937, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (938, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (939, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (939, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (940, 'Fluente', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (941, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (941, 'Bom', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (941, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (942, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (942, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (943, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (943, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (944, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (944, 'Bom', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (945, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (945, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (946, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (947, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (948, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (948, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (949, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (950, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (951, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (951, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (952, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (952, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (953, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (953, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (954, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (955, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (955, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (956, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (956, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (957, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (957, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (958, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (958, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (958, 'Fluente', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (959, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (959, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (960, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (960, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (961, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (961, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (962, 'Regular', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (964, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (964, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (965, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (965, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (966, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (968, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (968, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (969, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (969, 'Bom', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (970, 'Fluente', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (970, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (971, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (971, 'Regular', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (972, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (972, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (974, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (974, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (975, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (975, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (976, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (977, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (978, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (979, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (979, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (979, 'Bom', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (980, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (980, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (981, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (981, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (982, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (982, 'Regular', 3);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (982, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (983, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (983, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (985, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (985, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (986, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (986, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (987, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (988, 'Bom', 1);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (988, 'Regular', 2);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (989, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (989, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (990, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (990, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (990, 'Regular', 6);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (991, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (991, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (992, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (992, 'Regular', 5);




insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (993, 'Bom', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (994, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (995, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (995, 'Regular', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (997, 'Bom', 5);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (998, 'Regular', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (998, 'Regular', 4);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (999, 'Fluente', 1);



insert into PessoaIdioma
            (CodPessoa, NivelConhecimento, CodIdioma)
     VALUES (999, 'Regular', 5);

commit;

DROP procedure IF EXISTS `novo_idioma`;

DELIMITER $$
USE `corp`$$
CREATE PROCEDURE `novo_idioma`( descricao varchar(30))
BEGIN
	declare novo_codigo int;
    
    select ifnull(max(codIdioma), 0) +1 into novo_codigo
    from Idioma;
    
	insert into idioma (codIdioma, Descricao) 
    values
      (novo_codigo, descricao);
      
     select  novo_codigo as codIdioma;
      
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BEFORE_CURSO_INSERT
    AFTER INSERT ON curso
    FOR EACH ROW
BEGIN
   declare message varchar(50);
   if new.Nome = 'Astrologia' then
        set message = concat( 'Curso ', new.Nome, ' não permitido');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = message;
   end if;
    
END$$
DELIMITER ;


DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  KEY `productLine` (`productLine`)
  
  
) ENGINE=InnoDB;

/*Data for the table `products` */

insert  into `products`(`productCode`,`productName`,`productLine`,`productScale`,`productVendor`,`productDescription`,`quantityInStock`,`buyPrice`,`MSRP`) values 

('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',7933,'48.81','95.70'),

('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',7305,'98.58','214.30'),

('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',6625,'68.99','118.94'),

('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine',5582,'91.02','193.66'),

('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3252,'85.68','136.00'),

('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Second Gear Diecast','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6791,'103.42','147.74'),

('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.',68,'95.34','194.57'),

('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3619,'95.59','207.80'),

('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos',1579,'77.90','136.67'),

('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',9997,'66.27','150.62'),

('S12_3148','1969 Corvair Monza','Classic Cars','1:18','Welly Diecast Productions','1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll',6906,'89.14','151.08'),

('S12_3380','1968 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black',9123,'75.16','117.44'),

('S12_3891','1969 Ford Falcon','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',1049,'83.05','173.02'),

('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Studio M Art Models','Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.',5663,'31.92','79.80'),

('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','Exoto Designs','1:12 scale die-cast about 20\" long Hood opens, Rubber wheels',6125,'55.70','118.50'),

('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.',7323,'58.73','115.16'),

('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','Studio M Art Models','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',2613,'58.33','116.67'),

('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.',3975,'83.51','141.54'),

('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics','Features opening engine cover, doors, trunk, and fuel filler cap. Color black',8693,'60.62','102.74'),

('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','Studio M Art Models','This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.',8635,'24.26','53.91'),

('S18_1589','1965 Aston Martin DB5','Classic Cars','1:18','Classic Metal Creations','Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.',9042,'65.96','124.44'),

('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','Red Start Diecast','1:18 scale replica of actual Army\'s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.',5330,'77.27','157.69'),

('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','Welly Diecast Productions','This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.',2724,'86.70','170.00'),

('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','1:18','Gearbox Collectibles','This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',8826,'53.90','77.00'),

('S18_1984','1995 Honda Civic','Classic Cars','1:18','Min Lin Diecast','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.',9772,'93.89','142.25'),

('S18_2238','1998 Chrysler Plymouth Prowler','Classic Cars','1:18','Gearbox Collectibles','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',4724,'101.51','163.73'),

('S18_2248','1911 Ford Town Car','Vintage Cars','1:18','Motor City Art Classics','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.',540,'33.30','60.54'),

('S18_2319','1964 Mercedes Tour Bus','Trucks and Buses','1:18','Unimax Art Galleries','Exact replica. 100+ parts. working steering system, original logos',8258,'74.86','122.73'),

('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','1:18','Autoart Studio Design','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine',9354,'58.48','127.13'),

('S18_2432','1926 Ford Fire Engine','Trucks and Buses','1:18','Carousel DieCast Legends','Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.',2018,'24.92','60.77'),

('S18_2581','P-51-D Mustang','Planes','1:72','Gearbox Collectibles','Has retractable wheels and comes with a stand',992,'49.00','84.48'),

('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','1:18','Welly Diecast Productions','Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.',4357,'24.23','60.57'),

('S18_2795','1928 Mercedes-Benz SSK','Vintage Cars','1:18','Gearbox Collectibles','This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.',548,'72.56','168.75'),

('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','1:18','Red Start Diecast','Features include opening and closing doors. Color: Red',8164,'56.76','132.00'),

('S18_2949','1913 Ford Model T Speedster','Vintage Cars','1:18','Carousel DieCast Legends','This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.',4189,'60.78','101.31'),

('S18_2957','1934 Ford V8 Coupe','Vintage Cars','1:18','Min Lin Diecast','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System',5649,'34.35','62.46'),

('S18_3029','1999 Yamaha Speed Boat','Ships','1:18','Min Lin Diecast','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',4259,'51.61','86.02'),

('S18_3136','18th Century Vintage Horse Carriage','Vintage Cars','1:18','Red Start Diecast','Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.',5992,'60.74','104.72'),

('S18_3140','1903 Ford Model A','Vintage Cars','1:18','Unimax Art Galleries','Features opening trunk,  working steering system',3913,'68.30','136.59'),

('S18_3232','1992 Ferrari 360 Spider red','Classic Cars','1:18','Unimax Art Galleries','his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',8347,'77.90','169.34'),

('S18_3233','1985 Toyota Supra','Classic Cars','1:18','Highway 66 Mini Classics','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',7733,'57.01','107.57'),

('S18_3259','Collectable Wooden Train','Trains','1:18','Carousel DieCast Legends','Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.',6450,'67.56','100.84'),

('S18_3278','1969 Dodge Super Bee','Classic Cars','1:18','Min Lin Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',1917,'49.05','80.41'),

('S18_3320','1917 Maxwell Touring Car','Vintage Cars','1:18','Exoto Designs','Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System',7913,'57.54','99.21'),

('S18_3482','1976 Ford Gran Torino','Classic Cars','1:18','Gearbox Collectibles','Highly detailed 1976 Ford Gran Torino \"Starsky and Hutch\" diecast model. Very well constructed and painted in red and white patterns.',9127,'73.49','146.99'),

('S18_3685','1948 Porsche Type 356 Roadster','Classic Cars','1:18','Gearbox Collectibles','This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.',8990,'62.16','141.28'),

('S18_3782','1957 Vespa GS150','Motorcycles','1:18','Studio M Art Models','Features rotating wheels , working kick stand. Comes with stand.',7689,'32.95','62.17'),

('S18_3856','1941 Chevrolet Special Deluxe Cabriolet','Vintage Cars','1:18','Exoto Designs','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.',2378,'64.58','105.87'),

('S18_4027','1970 Triumph Spitfire','Classic Cars','1:18','Min Lin Diecast','Features include opening and closing doors. Color: White.',5545,'91.92','143.62'),

('S18_4409','1932 Alfa Romeo 8C2300 Spider Sport','Vintage Cars','1:18','Exoto Designs','This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.',6553,'43.26','92.03'),

('S18_4522','1904 Buick Runabout','Vintage Cars','1:18','Exoto Designs','Features opening trunk,  working steering system',8290,'52.66','87.77'),

('S18_4600','1940s Ford truck','Trucks and Buses','1:18','Motor City Art Classics','This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940\'s Pick-Up truck is painted in classic dark green color, and features rotating wheels.',3128,'84.76','121.08'),

('S18_4668','1939 Cadillac Limousine','Vintage Cars','1:18','Studio M Art Models','Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles',6645,'23.14','50.31'),

('S18_4721','1957 Corvette Convertible','Classic Cars','1:18','Classic Metal Creations','1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.',1249,'69.93','148.80'),

('S18_4933','1957 Ford Thunderbird','Classic Cars','1:18','Studio M Art Models','This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.',3209,'34.21','71.27'),

('S24_1046','1970 Chevy Chevelle SS 454','Classic Cars','1:24','Unimax Art Galleries','This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.',1005,'49.24','73.49'),

('S24_1444','1970 Dodge Coronet','Classic Cars','1:24','Highway 66 Mini Classics','1:24 scale die-cast about 18\" long doors open, hood opens and rubber wheels',4074,'32.37','57.80'),

('S24_1578','1997 BMW R 1100 S','Motorcycles','1:24','Autoart Studio Design','Detailed scale replica with working suspension and constructed from over 70 parts',7003,'60.86','112.70'),

('S24_1628','1966 Shelby Cobra 427 S/C','Classic Cars','1:24','Carousel DieCast Legends','This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it\'s own display case.',8197,'29.18','50.31'),

('S24_1785','1928 British Royal Navy Airplane','Planes','1:24','Classic Metal Creations','Official logos and insignias',3627,'66.74','109.42'),

('S24_1937','1939 Chevrolet Deluxe Coupe','Vintage Cars','1:24','Motor City Art Classics','This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.',7332,'22.57','33.19'),

('S24_2000','1960 BSA Gold Star DBD34','Motorcycles','1:24','Highway 66 Mini Classics','Detailed scale replica with working suspension and constructed from over 70 parts',15,'37.32','76.17'),

('S24_2011','18th century schooner','Ships','1:24','Carousel DieCast Legends','All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.',1898,'82.34','122.89'),

('S24_2022','1938 Cadillac V-16 Presidential Limousine','Vintage Cars','1:24','Classic Metal Creations','This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.',2847,'20.61','44.80'),

('S24_2300','1962 Volkswagen Microbus','Trucks and Buses','1:24','Autoart Studio Design','This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.',2327,'61.34','127.79'),

('S24_2360','1982 Ducati 900 Monster','Motorcycles','1:24','Highway 66 Mini Classics','Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand',6840,'47.10','69.26'),

('S24_2766','1949 Jaguar XK 120','Classic Cars','1:24','Classic Metal Creations','Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',2350,'47.25','90.87'),

('S24_2840','1958 Chevy Corvette Limited Edition','Classic Cars','1:24','Carousel DieCast Legends','The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.',2542,'15.91','35.36'),

('S24_2841','1900s Vintage Bi-Plane','Planes','1:24','Autoart Studio Design','Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.',5942,'34.25','68.51'),

('S24_2887','1952 Citroen-15CV','Classic Cars','1:24','Exoto Designs','Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.',1452,'72.82','117.44'),

('S24_2972','1982 Lamborghini Diablo','Classic Cars','1:24','Second Gear Diecast','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',7723,'16.24','37.76'),

('S24_3151','1912 Ford Model T Delivery Wagon','Vintage Cars','1:24','Min Lin Diecast','This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.',9173,'46.91','88.51'),

('S24_3191','1969 Chevrolet Camaro Z28','Classic Cars','1:24','Exoto Designs','1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.',4695,'50.51','85.61'),

('S24_3371','1971 Alpine Renault 1600s','Classic Cars','1:24','Welly Diecast Productions','This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',7995,'38.58','61.23'),

('S24_3420','1937 Horch 930V Limousine','Vintage Cars','1:24','Autoart Studio Design','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system',2902,'26.30','65.75'),

('S24_3432','2002 Chevy Corvette','Classic Cars','1:24','Gearbox Collectibles','The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.',9446,'62.11','107.08'),

('S24_3816','1940 Ford Delivery Sedan','Vintage Cars','1:24','Carousel DieCast Legends','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.',6621,'48.64','83.86'),

('S24_3856','1956 Porsche 356A Coupe','Classic Cars','1:18','Classic Metal Creations','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6600,'98.30','140.43'),

('S24_3949','Corsair F4U ( Bird Cage)','Planes','1:24','Second Gear Diecast','Has retractable wheels and comes with a stand. Official logos and insignias.',6812,'29.34','68.24'),

('S24_3969','1936 Mercedes Benz 500k Roadster','Vintage Cars','1:24','Red Start Diecast','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.',2081,'21.75','41.03'),

('S24_4048','1992 Porsche Cayenne Turbo Silver','Classic Cars','1:24','Exoto Designs','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',6582,'69.78','118.28'),

('S24_4258','1936 Chrysler Airflow','Vintage Cars','1:24','Second Gear Diecast','Features opening trunk,  working steering system. Color dark green.',4710,'57.46','97.39'),

('S24_4278','1900s Vintage Tri-Plane','Planes','1:24','Unimax Art Galleries','Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.',2756,'36.23','72.45'),

('S24_4620','1961 Chevrolet Impala','Classic Cars','1:18','Classic Metal Creations','This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.',7869,'32.33','80.84'),

('S32_1268','1980’s GM Manhattan Express','Trucks and Buses','1:32','Motor City Art Classics','This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.',5099,'53.93','96.31'),

('S32_1374','1997 BMW F650 ST','Motorcycles','1:32','Exoto Designs','Features official die-struck logos and baked enamel finish. Comes with stand.',178,'66.92','99.89'),

('S32_2206','1982 Ducati 996 R','Motorcycles','1:32','Gearbox Collectibles','Features rotating wheels , working kick stand. Comes with stand.',9241,'24.14','40.23'),

('S32_2509','1954 Greyhound Scenicruiser','Trucks and Buses','1:32','Classic Metal Creations','Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos',2874,'25.98','54.11'),

('S32_3207','1950\'s Chicago Surface Lines Streetcar','Trains','1:32','Gearbox Collectibles','This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).',8601,'26.72','62.14'),

('S32_3522','1996 Peterbilt 379 Stake Bed with Outrigger','Trucks and Buses','1:32','Red Start Diecast','This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab',814,'33.61','64.64'),

('S32_4289','1928 Ford Phaeton Deluxe','Vintage Cars','1:32','Highway 66 Mini Classics','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system',136,'33.02','68.79'),

('S32_4485','1974 Ducati 350 Mk3 Desmo','Motorcycles','1:32','Second Gear Diecast','This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand',3341,'56.13','102.05'),

('S50_1341','1930 Buick Marquette Phaeton','Vintage Cars','1:50','Studio M Art Models','Features opening trunk,  working steering system',7062,'27.06','43.64'),

('S50_1392','Diamond T620 Semi-Skirted Tanker','Trucks and Buses','1:50','Highway 66 Mini Classics','This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.',1016,'68.29','115.75'),

('S50_1514','1962 City of Detroit Streetcar','Trains','1:50','Classic Metal Creations','This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).',1645,'37.49','58.58'),

('S50_4713','2002 Yamaha YZR M1','Motorcycles','1:50','Autoart Studio Design','Features rotating wheels , working kick stand. Comes with stand.',600,'34.17','81.36'),

('S700_1138','The Schooner Bluenose','Ships','1:700','Autoart Studio Design','All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.',1897,'34.00','66.67'),

('S700_1691','American Airlines: B767-300','Planes','1:700','Min Lin Diecast','Exact replia with official logos and insignias and retractable wheels',5841,'51.15','91.34'),

('S700_1938','The Mayflower','Ships','1:700','Studio M Art Models','Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.',737,'43.30','86.61'),

('S700_2047','HMS Bounty','Ships','1:700','Unimax Art Galleries','Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',3501,'39.83','90.52'),

('S700_2466','America West Airlines B757-200','Planes','1:700','Motor City Art Classics','Official logos and insignias. Working steering system. Rotating jet engines',9653,'68.80','99.72'),

('S700_2610','The USS Constitution Ship','Ships','1:700','Red Start Diecast','All wood with canvas sails. Measures 31 1/2\" Length x 22 3/8\" High x 8 1/4\" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.',7083,'33.97','72.28'),

('S700_2824','1982 Camaro Z28','Classic Cars','1:18','Carousel DieCast Legends','Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2\" Long.',6934,'46.53','101.15'),

('S700_2834','ATA: B757-300','Planes','1:700','Highway 66 Mini Classics','Exact replia with official logos and insignias and retractable wheels',7106,'59.33','118.65'),

('S700_3167','F/A 18 Hornet 1/72','Planes','1:72','Motor City Art Classics','10\" Wingspan with retractable landing gears.Comes with pilot',551,'54.40','80.00'),

('S700_3505','The Titanic','Ships','1:700','Carousel DieCast Legends','Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.',1956,'51.09','100.17'),

('S700_3962','The Queen Mary','Ships','1:700','Welly Diecast Productions','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',5088,'53.63','99.31'),

('S700_4002','American Airlines: MD-11S','Planes','1:700','Second Gear Diecast','Polished finish. Exact replia with official logos and insignias and retractable wheels',8820,'36.27','74.03'),

('S72_1253','Boeing X-32A JSF','Planes','1:72','Motor City Art Classics','10\" Wingspan with retractable landing gears.Comes with pilot',4857,'32.77','49.66'),

('S72_3212','Pont Yacht','Ships','1:72','Unimax Art Galleries','Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged',414,'33.30','54.60');

commit;