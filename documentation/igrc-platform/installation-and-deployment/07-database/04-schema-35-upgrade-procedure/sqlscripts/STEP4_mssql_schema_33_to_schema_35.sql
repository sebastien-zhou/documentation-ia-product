/* 
COPYRIGHT BRAINWAVE, all rights reserved.
This computer program is protected by copyright law and international treaties.
Unauthorized duplication or distribution of this program, or any portion of it, may result in severe civil or criminal penalties, and will be prosecuted to the maximum extent possible under the law.

Usage: Upgrades The database schema from version Braille R1 to Curie R1

(c) Brainwave 2021

1) Powershell

To execute the commande in powershell use the following command syntax:

Invoke-Sqlcmd -InputFile <String> -ServerInstance <String> -database <database> -Username <String> -Password <String>

This requires the "SqlServer" powershell module

2) SQL Server management

To excute in SQL Server management studio directly please uncomment the folling block and replace the parameters between "<>" accordingly.

*/
/* 
use "<DATABASE>" ;
execute as login='<USER>' ;
*/

-- Upgrade script to version 35
-- --------

GO
CREATE TABLE tconfitem (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemuid          NVARCHAR(64)   NOT NULL,
  cfamily               NVARCHAR(100)  NOT NULL,
  ctype                 NVARCHAR(100)  NOT NULL,
  cenvironment          NVARCHAR(100),
  ccode                 NVARCHAR(1000) NOT NULL,
  cdisplayname          NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  cdn                   NVARCHAR(500),
  ccanonicalname        NVARCHAR(500),
  ccountrycode          NVARCHAR(20),
  cruntimename          NVARCHAR(100),
  cruntimeversion       NVARCHAR(100),
  cdnsname              NVARCHAR(150),
  cipv4address          NVARCHAR(15),
  cipv6address          NVARCHAR(50),
  cenabled              NVARCHAR(1),
  cstate                NVARCHAR(50),
  carch                 NVARCHAR(50),
  cnbcputhreads         INTEGER,
  cmemorysize           INTEGER,
  callocatedstorage     INTEGER,
  cstorageencrypted     NVARCHAR(1),
  curn                  NVARCHAR(200),
  ccriticalobject        NVARCHAR(1),
  ccreationdate         NVARCHAR(15),
  ccreationday          INTEGER,
  cmodifydate           NVARCHAR(15),
  cmodifyday            INTEGER,
  cpasswordnotrequired  NVARCHAR(1),
  cpasswordneverexpires NVARCHAR(1),
  cpasswordexpired      NVARCHAR(1),
  clogoncount           INTEGER,
  clastlogondate        NVARCHAR(15),
  clastlogonday         INTEGER,
  cbadlogoncount        INTEGER,
  clastbadpassworddate  NVARCHAR(15),
  clastbadpasswordday   INTEGER,
  cpasswordlastsetdate  NVARCHAR(15),
  cpasswordlastsetday   INTEGER,
  cdetails              NVARCHAR(MAX),
  caddress              NVARCHAR(1000),
  clocationfk           BIGINT,
  cimportaction         NVARCHAR(1)       NOT NULL,
  cdeletedaction        NVARCHAR(1),
  CONSTRAINT confitem_uid_pk PRIMARY KEY (crecorduid),
  CONSTRAINT confitem_timeslot_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid),
  CONSTRAINT confitem_uid_uk UNIQUE (ctimeslotfk, cconfitemuid)
);



GO
CREATE TABLE tconfitemlink (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemlinkuid      NVARCHAR(64)   NOT NULL,
  corigin               NVARCHAR(1)       NOT NULL,
  cjointypes            NVARCHAR(32)   NOT NULL,
  csemantic             NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  cindirect             NVARCHAR(1)       NOT NULL,
  csourceconfitemfk     BIGINT,
  csourcerepofk         BIGINT,
  csourceapplifk        BIGINT,
  csourceaccountfk      BIGINT,
  csourceidentityfk     BIGINT,
  csourceorgfk          BIGINT,
  ctargetconfitemfk     BIGINT,
  ctargetrepofk         BIGINT,
  ctargetapplifk        BIGINT,
  ctargetaccountfk      BIGINT,
  ctargetidentityfk     BIGINT,
  ctargetorgfk          BIGINT,
  CONSTRAINT confitemlink_uid_pk PRIMARY KEY (crecorduid),
  CONSTRAINT confitemlink_timeslot_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid),
  CONSTRAINT confitemlink_uid_uk UNIQUE (ctimeslotfk, cconfitemlinkuid)
);


GO
CREATE TABLE timportconfitem (
  cimportlogfk          NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemuid          NVARCHAR(64)   NOT NULL,
  csilofk               NVARCHAR(64),
  cfamily               NVARCHAR(100)  NOT NULL,
  ctype                 NVARCHAR(100)  NOT NULL,
  cenvironment          NVARCHAR(100),
  ccode                 NVARCHAR(1000) NOT NULL,
  cdisplayname          NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  cdn                   NVARCHAR(500),
  ccanonicalname        NVARCHAR(500),
  ccountrycode          NVARCHAR(20),
  cruntimename          NVARCHAR(100),
  cruntimeversion       NVARCHAR(100),
  cdnsname              NVARCHAR(150),
  cipv4address          NVARCHAR(15),
  cipv6address          NVARCHAR(50),
  cenabled              NVARCHAR(1),
  cstate                NVARCHAR(50),
  carch                 NVARCHAR(50),
  cnbcputhreads         INTEGER,
  cmemorysize           INTEGER,
  callocatedstorage     INTEGER,
  cstorageencrypted     NVARCHAR(1),
  curn                  NVARCHAR(200),
  ccriticalobject        NVARCHAR(1),
  ccreationdate         NVARCHAR(15),
  ccreationday          INTEGER,
  cmodifydate           NVARCHAR(15),
  cmodifyday            INTEGER,
  cpasswordnotrequired  NVARCHAR(1),
  cpasswordneverexpires NVARCHAR(1),
  cpasswordexpired      NVARCHAR(1),
  clogoncount           INTEGER,
  clastlogondate        NVARCHAR(15),
  clastlogonday         INTEGER,
  cbadlogoncount        INTEGER,
  clastbadpassworddate  NVARCHAR(15),
  clastbadpasswordday   INTEGER,
  cpasswordlastsetdate  NVARCHAR(15),
  cpasswordlastsetday   INTEGER,
  cdetails              NVARCHAR(MAX),
  caddress              NVARCHAR(1000),
  clocationuid          NVARCHAR(64),
  cimportaction         NVARCHAR(1)       NOT NULL,
  CONSTRAINT importconfitem_uid_pk PRIMARY KEY (cconfitemuid, cimportlogfk),
  CONSTRAINT importconfitem_timeslot_fk FOREIGN KEY (cimportlogfk) REFERENCES timportlog(cimportloguid)
);

GO
CREATE TABLE timportconfitemlink (
  cimportlogfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemlinkuid      NVARCHAR(64)   NOT NULL,
  csilofk               NVARCHAR(64),
  corigin               NVARCHAR(1)       NOT NULL,
  cjointypes            NVARCHAR(32)   NOT NULL,
  csemantic             NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  csourceconfitemfk     NVARCHAR(64),
  csourcerepofk         NVARCHAR(64),
  csourceapplifk        NVARCHAR(64),
  csourceaccountfk      NVARCHAR(64),
  csourceidentityfk     NVARCHAR(64),
  csourceorgfk          NVARCHAR(64),
  ctargetconfitemfk     NVARCHAR(64),
  ctargetrepofk         NVARCHAR(64),
  ctargetapplifk        NVARCHAR(64),
  ctargetaccountfk      NVARCHAR(64),
  ctargetidentityfk     NVARCHAR(64),
  ctargetorgfk          NVARCHAR(64),
  CONSTRAINT importconfitemlink_uid_pk PRIMARY KEY (cconfitemlinkuid, cimportlogfk),
  CONSTRAINT importconfitemlink_timeslot_fk FOREIGN KEY (cimportlogfk) REFERENCES timportlog(cimportloguid)
);

GO
CREATE TABLE tportalconfitem (
  -- Database primary key
  crecorduid            BIGINT NOT NULL,
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemuid          NVARCHAR(64)   NOT NULL,
  cfamily               NVARCHAR(100)  NOT NULL,
  ctype                 NVARCHAR(100)  NOT NULL,
  cenvironment          NVARCHAR(100),
  ccode                 NVARCHAR(1000) NOT NULL,
  cdisplayname          NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  cdn                   NVARCHAR(500),
  ccanonicalname        NVARCHAR(500),
  ccountrycode          NVARCHAR(20),
  cruntimename          NVARCHAR(100),
  cruntimeversion       NVARCHAR(100),
  cdnsname              NVARCHAR(150),
  cipv4address          NVARCHAR(15),
  cipv6address          NVARCHAR(50),
  cenabled              NVARCHAR(1),
  cstate                NVARCHAR(50),
  carch                 NVARCHAR(50),
  cnbcputhreads         INTEGER,
  cmemorysize           INTEGER,
  callocatedstorage     INTEGER,
  cstorageencrypted     NVARCHAR(1),
  curn                  NVARCHAR(200),
  ccriticalobject        NVARCHAR(1),
  ccreationdate         NVARCHAR(15),
  ccreationday          INTEGER,
  cmodifydate           NVARCHAR(15),
  cmodifyday            INTEGER,
  cpasswordnotrequired  NVARCHAR(1),
  cpasswordneverexpires NVARCHAR(1),
  cpasswordexpired      NVARCHAR(1),
  clogoncount           INTEGER,
  clastlogondate        NVARCHAR(15),
  clastlogonday         INTEGER,
  cbadlogoncount        INTEGER,
  clastbadpassworddate  NVARCHAR(15),
  clastbadpasswordday   INTEGER,
  cpasswordlastsetdate  NVARCHAR(15),
  cpasswordlastsetday   INTEGER,
  cdetails              NVARCHAR(MAX),
  caddress              NVARCHAR(1000),
  clocationfk           BIGINT,
  cimportaction         NVARCHAR(1)       NOT NULL,
  cdeletedaction        NVARCHAR(1),
  CONSTRAINT pconfitem_uid_pk PRIMARY KEY (crecorduid),
  CONSTRAINT pconfitem_timeslot_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid),
  CONSTRAINT pconfitem_uid_uk UNIQUE (ctimeslotfk, cconfitemuid)
);

GO
CREATE TABLE tportalconfitemlink (
  -- Database primary key
  crecorduid            BIGINT NOT NULL,
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cconfitemlinkuid      NVARCHAR(64)   NOT NULL,
  corigin               NVARCHAR(1)       NOT NULL,
  cjointypes            NVARCHAR(32)   NOT NULL,
  csemantic             NVARCHAR(1000),
  cdescription          NVARCHAR(4000),
  cindirect             NVARCHAR(1)       NOT NULL,
  csourceconfitemfk     BIGINT,
  csourcerepofk         BIGINT,
  csourceapplifk        BIGINT,
  csourceaccountfk      BIGINT,
  csourceidentityfk     BIGINT,
  csourceorgfk          BIGINT,
  ctargetconfitemfk     BIGINT,
  ctargetrepofk         BIGINT,
  ctargetapplifk        BIGINT,
  ctargetaccountfk      BIGINT,
  ctargetidentityfk     BIGINT,
  ctargetorgfk          BIGINT,
  CONSTRAINT pconfitemlink_uid_pk PRIMARY KEY (crecorduid),
  CONSTRAINT pconfitemlink_timeslot_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid),
  CONSTRAINT pconfitemlink_uid_uk UNIQUE (ctimeslotfk, cconfitemlinkuid)
);

GO
ALTER TABLE tmetadata ADD cconfitemfk BIGINT;
GO
ALTER TABLE tmetadatavalue ADD cvalueconfitemuid NVARCHAR(64);
GO
ALTER TABLE tmetadatavalue ADD cvalueconfitemfk BIGINT;

GO
ALTER TABLE tmetadata ADD csearchlogfk BIGINT;
GO
ALTER TABLE tmetadata ADD csearchloguid NVARCHAR(250);
GO
ALTER TABLE tmetadatavalue ADD cvaluesearchlogfk BIGINT;
GO
ALTER TABLE tmetadatavalue ADD cvaluesearchloguid NVARCHAR(250);

GO
CREATE INDEX idx_metadata_confitem ON tmetadata(cconfitemfk);
GO
CREATE INDEX idx_metadatav_confitem ON tmetadatavalue(cmetadatafk,cvalueconfitemfk);

GO
CREATE INDEX idx_metadata_searchlog ON tmetadata(csearchlogfk);
GO
CREATE INDEX idx_metadatav_searchlog ON tmetadatavalue(cmetadatafk,cvaluesearchlogfk);

GO
ALTER TABLE timportmetadata ADD cconfitemfk NVARCHAR(64);
GO
ALTER TABLE timportmetadatavalue ADD cvalueconfitemfk NVARCHAR(64);

GO
ALTER TABLE tportalmetadata ADD cconfitemfk BIGINT;
GO
ALTER TABLE tportalmetadatavalue ADD cvalueconfitemuid NVARCHAR(64);
GO
ALTER TABLE tportalmetadatavalue ADD cvalueconfitemfk BIGINT;

GO
ALTER TABLE tportalmetadata ADD csearchlogfk BIGINT;
GO
ALTER TABLE tportalmetadata ADD csearchloguid NVARCHAR(250);
GO
ALTER TABLE tportalmetadatavalue ADD cvaluesearchlogfk BIGINT;
GO
ALTER TABLE tportalmetadatavalue ADD cvaluesearchloguid NVARCHAR(250);

GO
CREATE INDEX idx_pmetadata_confitem ON tportalmetadata(cconfitemfk);
GO
CREATE INDEX idx_pmetadatav_confitem ON tportalmetadatavalue(cmetadatafk,cvalueconfitemfk);

GO
CREATE INDEX idx_pmetadata_searchlog ON tportalmetadata(csearchlogfk);
GO
CREATE INDEX idx_pmetadatav_searchlog ON tportalmetadatavalue(cmetadatafk,cvaluesearchlogfk);


GO
CREATE TABLE tpamprogram (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Object information
  cname                 NVARCHAR(250) NOT NULL,
  cdescription          NVARCHAR(4000),
  cdeadline             NVARCHAR(15),
  CONSTRAINT pamprogram_uid_pk PRIMARY KEY (crecorduid)
);



GO
CREATE TABLE tpamscope (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Object information
  cprogramfk            BIGINT NOT NULL,
  cname                 NVARCHAR(250) NOT NULL,
  cdescription          NVARCHAR(4000),
  cstartdate            NVARCHAR(15),
  cdeadline             NVARCHAR(15),
  cstatus               NVARCHAR(100),
  ctimeslotuid          NVARCHAR(64),
  cimportance           INTEGER,
  crequestoruid         NVARCHAR(64),
  crequestorfullname    NVARCHAR(250),
  CONSTRAINT pamscope_uid_pk PRIMARY KEY (crecorduid)
);



GO
CREATE TABLE tpamscopeincl (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Object information
  cscopefk              BIGINT NOT NULL,
  ctype                 NVARCHAR(1)       NOT NULL,
  ctitle                NVARCHAR(1000) NOT NULL,
  cruleid               NVARCHAR(250),
  capplications         NVARCHAR(MAX),
  cconfitems            NVARCHAR(MAX),
  crepositories         NVARCHAR(MAX),
  CONSTRAINT pamscopeincl_uid_pk PRIMARY KEY (crecorduid)
);



GO
CREATE TABLE tpammilestone (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Object information
  cprogramfk            BIGINT,
  cscopefk              BIGINT,
  cname                 NVARCHAR(250),
  cdeadline             NVARCHAR(15),
  CONSTRAINT pammilestone_uid_pk PRIMARY KEY (crecorduid)
);


GO
DROP VIEW vuprightgroup;
GO
DROP VIEW vdownrightgroup;

GO
CREATE VIEW vuprightgroup AS
    SELECT
      ctimeslotfk, crightgroupuid, crepositoryfk,
      cpermissionfk, cgroupfk, cperimeterfk, '1' as cfromgroup, '0' AS cindirect,
      cdisplayname, caction, climit, cinherited,
      crighttype, cdefault, ccontext,
      ccustom1, ccustom2, ccustom3, ccustom4, ccustom5, ccustom6, ccustom7, ccustom8, ccustom9
    FROM
      trightgroup
    WHERE cindirect = '0'
  UNION ALL
    SELECT DISTINCT
      A.ctimeslotfk, A.crightgroupuid, A.crepositoryfk,
      A.cpermissionfk, R.cparentgroupfk AS cgroupfk, A.cperimeterfk, '1' as cfromgroup, '1' AS cindirect,
      A.cdisplayname, A.caction, A.climit, A.cinherited,
      A.crighttype, A.cdefault, A.ccontext,
      A.ccustom1, A.ccustom2, A.ccustom3, A.ccustom4, A.ccustom5, A.ccustom6, A.ccustom7, A.ccustom8, A.ccustom9
    FROM
      trightgroup A
      INNER JOIN tgrouplink R ON R.cgroupfk = A.cgroupfk
    WHERE A.cindirect = '0';

GO
CREATE VIEW vdownrightgroup AS
    SELECT
      ctimeslotfk, crightgroupuid, crepositoryfk,
      cpermissionfk, cgroupfk, cperimeterfk, '1' as cfromgroup, cindirect,
      cdisplayname, caction, climit, cinherited,
      crighttype, cdefault, ccontext,
      ccustom1, ccustom2, ccustom3, ccustom4, ccustom5, ccustom6, ccustom7, ccustom8, ccustom9
    FROM
      trightgroup;

GO
DROP VIEW vportaluprightgroup;
GO
DROP VIEW vportaldownrightgroup;

GO
CREATE VIEW vportaluprightgroup AS
    SELECT
      ctimeslotfk, crightgroupuid, crepositoryfk,
      cpermissionfk, cgroupfk, cperimeterfk, '1' as cfromgroup, '0' AS cindirect,
      cdisplayname, caction, climit, cinherited,
      crighttype, cdefault, ccontext,
      ccustom1, ccustom2, ccustom3, ccustom4, ccustom5, ccustom6, ccustom7, ccustom8, ccustom9
    FROM
      tportalrightgroup
    WHERE cindirect = '0'
  UNION ALL
    SELECT DISTINCT
      A.ctimeslotfk, A.crightgroupuid, A.crepositoryfk,
      A.cpermissionfk, R.cparentgroupfk AS cgroupfk, A.cperimeterfk, '1' as cfromgroup, '1' AS cindirect,
      A.cdisplayname, A.caction, A.climit, A.cinherited,
      A.crighttype, A.cdefault, A.ccontext,
      A.ccustom1, A.ccustom2, A.ccustom3, A.ccustom4, A.ccustom5, A.ccustom6, A.ccustom7, A.ccustom8, A.ccustom9
    FROM
      tportalrightgroup A
      INNER JOIN tportalgrouplink R ON R.cgroupfk = A.cgroupfk
    WHERE A.cindirect = '0';

GO
CREATE VIEW vportaldownrightgroup AS
    SELECT
      ctimeslotfk, crightgroupuid, crepositoryfk,
      cpermissionfk, cgroupfk, cperimeterfk, '1' as cfromgroup, cindirect,
      cdisplayname, caction, climit, cinherited,
      crighttype, cdefault, ccontext,
      ccustom1, ccustom2, ccustom3, ccustom4, ccustom5, ccustom6, ccustom7, ccustom8, ccustom9
    FROM
      tportalrightgroup;

-- REVIEWACTOR table

GO
CREATE TABLE treviewactor (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cticketreviewfk       BIGINT NOT NULL,
  cactorfk            BIGINT NOT NULL,
  CONSTRAINT reviewactor_ts_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid)
);



-- REVIEWACCOUNTABLE table

GO
CREATE TABLE treviewaccountable (
  -- Database primary key
  crecorduid            BIGINT NOT NULL IDENTITY (1, 1),
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cticketreviewfk       BIGINT NOT NULL,
  caccountablefk            BIGINT NOT NULL,
  CONSTRAINT reviewaccountable_ts_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid)
);


-- PORTALREVIEWACTOR table
GO
CREATE TABLE tportalreviewactor (
  -- Database primary key
  crecorduid            BIGINT NOT NULL,
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cticketreviewfk       BIGINT NOT NULL,
  cactorfk            BIGINT NOT NULL,
  CONSTRAINT previewactor_ts_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid)
);

-- PortalREVIEWACCOUNTABLE table
GO
CREATE TABLE tportalreviewaccountable (
  -- Database primary key
  crecorduid            BIGINT NOT NULL,
  -- Archive information
  ctimeslotfk           NVARCHAR(64)   NOT NULL,
  -- Object information
  cticketreviewfk       BIGINT NOT NULL,
  caccountablefk            BIGINT NOT NULL,
  CONSTRAINT previewaccountable_ts_fk FOREIGN KEY (ctimeslotfk) REFERENCES timportlog(cimportloguid)
);

-- delete cactorfk, caccountablefk from ttickerreview
GO
ALTER TABLE tticketreview DROP COLUMN cactorfk;

GO
ALTER TABLE tticketreview DROP COLUMN caccountablefk;

-- migrate actor accountable data to new tables
GO
INSERT INTO treviewactor (ctimeslotfk, cticketreviewfk, cactorfk)
	SELECT i.ctimeslotfk, t.crecorduid AS cticketreviewfk, i.crecorduid AS cactorfk FROM tticketreview t
	INNER JOIN tidentity i on i.cidentityuid=t.cactoruid;

GO
INSERT INTO treviewaccountable (ctimeslotfk, cticketreviewfk, caccountablefk) 
	SELECT i.ctimeslotfk, t.crecorduid AS cticketreviewfk, i.crecorduid AS caccountablefk FROM tticketreview t
	INNER JOIN tidentity i on i.cidentityuid=t.caccountableuid;

GO
INSERT INTO tportalreviewactor (crecorduid, ctimeslotfk, cticketreviewfk, cactorfk)
	SELECT crecorduid, ctimeslotfk, cticketreviewfk, cactorfk FROM treviewactor a
	INNER JOIN timportlog i on i.cimportloguid = a.ctimeslotfk
	where i.cportal='1';
	
GO
INSERT INTO tportalreviewaccountable (crecorduid, ctimeslotfk, cticketreviewfk, caccountablefk)
	SELECT crecorduid, ctimeslotfk, cticketreviewfk, caccountablefk FROM treviewaccountable a
	INNER JOIN timportlog i on i.cimportloguid = a.ctimeslotfk
	where i.cportal='1';

GO
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'idx_metadata_ts_master') CREATE INDEX idx_metadata_ts_master ON tmetadata(ctimeslotfk, cmastermetadatafk);
GO
IF NOT EXISTS (SELECT name FROM sysindexes WHERE name = 'idx_pmetadata_ts_master') CREATE INDEX idx_pmetadata_ts_master ON tportalmetadata(ctimeslotfk, cmastermetadatafk);

GO
CREATE INDEX idx_tr_actor_timeslot ON treviewactor(ctimeslotfk);
GO
CREATE INDEX idx_tr_actor_ticket ON treviewactor(cticketreviewfk);
GO
CREATE INDEX idx_tr_actor ON treviewactor(cactorfk);

GO
CREATE INDEX idx_ptr_actor_timeslot ON tportalreviewactor(ctimeslotfk);
GO
CREATE INDEX idx_ptr_actor_ticket ON tportalreviewactor(cticketreviewfk);
GO
CREATE INDEX idx_ptr_actor ON tportalreviewactor(cactorfk);

GO
CREATE INDEX idx_tr_accountable_timeslot ON treviewaccountable(ctimeslotfk);
GO
CREATE INDEX idx_tr_accountable_ticket ON treviewaccountable(cticketreviewfk);
GO
CREATE INDEX idx_tr_accountable ON treviewaccountable(caccountablefk);

GO
CREATE INDEX idx_ptr_accountable_timeslot ON tportalreviewaccountable(ctimeslotfk);
GO
CREATE INDEX idx_ptr_accountable_ticket ON tportalreviewaccountable(cticketreviewfk);
GO
CREATE INDEX idx_ptr_accountable ON tportalreviewaccountable(caccountablefk);

GO

UPDATE tproperties SET cvalue='35' WHERE cpropertiesuid='VERSION';