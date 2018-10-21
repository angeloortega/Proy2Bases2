DROP VIEW TOTALESANUALES;
DROP VIEW FALTANTESXSOLICITUD;
drop table lineaxsolicitudhistorico;
drop table ordencompramp;
drop table ordenfaltante;
drop table bitacoraerrores;
drop table ordencompramp;
drop table osxop;
drop table ordenproduccion;
drop table lineaxsolicitud;
drop table lineaxsolicitudhistorico
drop table prenda;
drop table talla;
drop table estilo;
drop table cliente;
drop table pais;
drop table solicitudcliente;
drop table solicitudclientehistorico;
drop table proveedor;
drop table materiaprimaproveedor;
drop table matpxmatpprov;
drop table recetaprenda;
drop table inventariomateriaprima;
drop table conversionesunitarias;
drop table unidadmedida;
drop table banco;
drop table cuentabanco;
drop table inventariomateriaprima;
drop table lineaordencompramp;
drop table matpxmatpprov;
drop table ordencompramp;
drop table pais;
drop table proveedor;
drop table proveedorinternacional;
drop table proveedornacional;
drop table solicitudclientehistorico;
drop table unidadmedida;
drop table conjunto;

drop view lineaxsolicitudhistorico_VIEW;
drop view ordencompramp_VIEW;
drop view ordenfaltante_VIEW;
drop view bitacoraerrores_VIEW;
drop view ordencompramp_VIEW;
drop view osxop_VIEW;
drop view ordenproduccion_VIEW;
drop view lineaxsolicitud_VIEW;
drop view prenda_VIEW;
drop view talla_VIEW;
drop view estilo_VIEW;
drop view cliente_VIEW;
drop view pais_VIEW;
drop view solicitudcliente_VIEW;
drop view proveedor_VIEW;
drop view materiaprimaproveedor_VIEW;
drop view matpxmatpprov_VIEW;
drop view recetaprenda_VIEW;
drop view inventariomateriaprima_VIEW;
drop view conversionesunitarias_VIEW;
drop view unidadmedida_VIEW;
drop view banco_VIEW;
drop view cuentabanco_VIEW;
drop view inventariomateriaprima_VIEW;
drop view lineaordencompramp_VIEW;
drop view matpxmatpprov_VIEW;
drop view ordencompramp_VIEW;
drop view pais_VIEW;
drop view proveedor_VIEW;
drop view proveedorinternacional_VIEW;
drop view proveedornacional_VIEW;
drop view solicitudclientehistorico_VIEW;
drop view unidadmedida_VIEW;
drop view conjunto_VIEW;

DROP TYPE BANCO_TYPE force;
DROP TYPE CLIENTE_TYPE force;
DROP TYPE collectionlineaordencompramp force;
DROP TYPE collectionlineassolicitud force;
DROP TYPE collectionmpprov force;
DROP TYPE collectionordenfaltante force;
DROP TYPE collectionprenda force;
DROP TYPE collectionsolicitud force;
DROP TYPE conjuntoprenda_type force;
DROP TYPE conversionesunitarias_type force;
DROP TYPE cuentabanco_type force;
DROP TYPE estilo_type force;
DROP TYPE inventariomateriaprima_type force;
DROP TYPE lineaordencompramp_type force;
DROP TYPE lineasolicitud_type force;
DROP TYPE materiaprimaproveedor_type force;
DROP TYPE matpxmatpprov_type force;
DROP TYPE ordencompramp_type force;
DROP TYPE ordenfaltante_type force;
DROP TYPE ordenproduccion_type force;
DROP TYPE pais_type force;
DROP TYPE prenda_type force;
DROP TYPE proveedor_type force;
DROP TYPE proveedorinternacional_type force;
DROP TYPE proveedornacional_type force;
DROP TYPE recetaprenda_type force;
DROP TYPE solicitud_type force;
DROP TYPE talla_type force;
DROP TYPE unidadMedida_type force;
DROP TYPE COLLECTIONCUENTASBANCO FORCE;
DROP TYPE collectionlordcommp FORCE
DROP TYPE COLLECTIONMATPRiPROV FORCE;
DROP TYPE SOLICITUDCLIENTE_TYPE FORCE;

CREATE OR REPLACE TYPE pais_type;
/

CREATE OR REPLACE TYPE unidadmedida_type;
/

CREATE OR REPLACE TYPE banco_type;
/

CREATE OR REPLACE TYPE proveedorinternacional_type;
/

CREATE OR REPLACE TYPE matpxmatpprov_type;
/

CREATE OR REPLACE TYPE ordencompramp_type;
/

CREATE OR REPLACE TYPE prenda_type;
/

CREATE OR REPLACE TYPE solicitudcliente_type;
/

CREATE OR REPLACE TYPE ordenproduccion_type;
/

CREATE OR REPLACE TYPE proveedor_type;
/

CREATE OR REPLACE TYPE inventariomateriaprima_type;
/

CREATE OR REPLACE TYPE materiaprimaproveedor_type;
/

CREATE OR REPLACE TYPE estilo_type;
/

CREATE OR REPLACE TYPE talla_type;
/

CREATE OR REPLACE TYPE cliente_type;
/

CREATE OR REPLACE TYPE cuentabanco_type;
/

CREATE OR REPLACE TYPE lineasolicitud_type;
/

CREATE OR REPLACE TYPE lineaordencompramp_type;
/

CREATE OR REPLACE TYPE ordenfaltante_type;
/

CREATE OR REPLACE TYPE bitacoraErrores_type AS OBJECT(
    fechaError DATE,
    codigoError VARCHAR2(10),
    mensajeError VARCHAR2(240),
    idFila numeric(6)
) FINAL;
/

CREATE OR REPLACE TYPE osxop_type AS OBJECT(
    idsolicitud NUMBER(12),
    idop NUMBER(6)
) FINAL;
/
CREATE OR REPLACE TYPE banco_type AS OBJECT (
    idbanco       NUMBER(3),
    nombre        VARCHAR2(30),
    descripcion   VARCHAR2(120),
    CONSTRUCTOR FUNCTION banco_type(
        idbanco       NUMBER,
        nombre        VARCHAR2,
        descripcion   VARCHAR2
    ) RETURN SELF AS RESULT,
   ORDER MEMBER FUNCTION compara (
        x in  banco_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE collectionsolicitud IS
    TABLE OF REF solicitudcliente_type;
/

CREATE OR REPLACE TYPE cliente_type AS OBJECT (
    cedula              NUMBER(12),
    direccionalcobro    VARCHAR2(240),
    telefono            NUMBER(16),
    correoelectronico   VARCHAR2(120),
    direccionexacta     VARCHAR2(240),
    paisnacimiento      REF pais_type,
    apellidos           VARCHAR2(42),
    nombre              VARCHAR2(20),
    solicitudes         collectionsolicitud,
    idpaisnacimiento    NUMBER(3),
    CONSTRUCTOR FUNCTION cliente_type(
        cedula              NUMBER,
        direccionalcobro    VARCHAR2,
        telefono            NUMBER,
        correoelectronico   VARCHAR2,
        direccionexacta     VARCHAR2,
        paisnacimiento      ref pais_type,
        apellidos           VARCHAR2,
        nombre              VARCHAR2,
        solicitudes         in collectionsolicitud,
        idpaisnacimiento    NUMBER
        ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  cliente_type
    ) RETURN INTEGER
) NOT FINAL;
/
/*
CREATE OR REPLACE TYPE dummy_type AS OBJECT (
    cedula              NUMBER(12),
    direccionalcobro    VARCHAR2(240),
    telefono            NUMBER(16),
    correoelectronico   VARCHAR2(120),
    direccionexacta     VARCHAR2(240),
    paisnacimiento      REF pais_type,
    apellidos           VARCHAR2(42),
    nombre              VARCHAR2(20),
    solicitudesDummy    collectionsolicitud,
    idpaisnacimiento    NUMBER(3),
    CONSTRUCTOR FUNCTION dummy_type(
        cedula              NUMBER,
        direccionalcobro    VARCHAR2,
        telefono            NUMBER,
        correoelectronico   VARCHAR2,
        direccionexacta     VARCHAR2,
        paisnacimiento      ref pais_type,
        apellidos           VARCHAR2,
        nombre              VARCHAR2,
        solicitudes         in collectionsolicitud,
        idpaisnacimiento    NUMBER
        ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  dummy_type
    ) RETURN INTEGER
) NOT FINAL;
/
*/

CREATE OR REPLACE TYPE collectionprenda IS
    TABLE OF REF prenda_type;
/

CREATE OR REPLACE TYPE conjuntoprenda_type AS OBJECT (
    idconjunto        NUMBER(3),
    prendasconjunto   collectionprenda,
    cantidad          NUMBER(2),
    idprenda          NUMBER(5),
    CONSTRUCTOR FUNCTION conjuntoprenda_type(
        idconjunto        NUMBER,
        prendasconjunto   in collectionprenda,
        cantidad          NUMBER,
        idprenda          NUMBER
        ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  conjuntoprenda_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE conversionesunitarias_type AS OBJECT (
    unidadorigen       REF unidadmedida_type,
    unidaddestino      REF unidadmedida_type,
    medidaconversion   NUMBER(8,2),
    idunidadorigen     NUMBER(3),
    idunidaddestino    NUMBER(3),
    CONSTRUCTOR FUNCTION conversionesunitarias_type(
    unidadorigen       ref unidadmedida_type,
    unidaddestino      ref unidadmedida_type,
    medidaconversion   NUMBER,
    idunidadorigen     NUMBER,
    idunidaddestino    NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  conversionesunitarias_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE cuentabanco_type AS OBJECT (
    banco         REF banco_type,
    proveedor     REF proveedorinternacional_type,
    idbanco       NUMBER(3),
    idproveedor   NUMBER(5),
    CONSTRUCTOR FUNCTION cuentabanco_type(
    banco         ref banco_type,
    proveedor     ref proveedorinternacional_type,
    idbanco       NUMBER,
    idproveedor   NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  cuentabanco_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE estilo_type AS OBJECT (
    idestilo      NUMBER(3),
    descripcion   VARCHAR2(120),
    color         VARCHAR2(20),
    CONSTRUCTOR FUNCTION estilo_type(
    idestilo      NUMBER,
    descripcion   VARCHAR2,
    color         VARCHAR2) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  estilo_type
    ) RETURN INTEGER
) NOT FINAL;
/

create or replace 
TYPE inventariomateriaprima_type AS OBJECT (
    idmateriaprima   NUMBER(5),
    udmedida         REF unidadmedida_type,
    ctdminima        NUMBER(4),
    existencia       NUMBER(4),
    precioxud        NUMBER(9,2),
    descripcion       VARCHAR2(120),
    idudmedida       NUMBER(3),
    CONSTRUCTOR FUNCTION inventariomateriaprima_type(
    idmateriaprima   NUMBER,
    udmedida         ref unidadmedida_type,
    ctdminima        NUMBER,
    existencia       NUMBER,
    precioxud        NUMBER,
    descripcion       VARCHAR2,
    idudmedida       NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  inventariomateriaprima_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE lineaordencompramp_type AS OBJECT (
    ordencorrespondiente     NUMBER(6),
    materiaprima             REF matpxmatpprov_type,
    ctdfaltante              NUMBER(8,3),
    idordencorrespondiente   NUMBER(6),
    ordencompramp            REF ordencompramp_type,
    idmateriaprima           NUMBER(5),
    idmateriaprimaprov       NUMBER(5),
    idproveedor              NUMBER(5),
    idordencompramp          NUMBER(6),
    CONSTRUCTOR FUNCTION lineaordencompramp_type(
        ordencorrespondiente     NUMBER,
        materiaprima             ref matpxmatpprov_type,
        ctdfaltante              NUMBER,
        idordencorrespondiente   NUMBER,
        ordencompramp            ref ordencompramp_type,
        idmateriaprima           NUMBER,
        idmateriaprimaprov       NUMBER,
        idproveedor              NUMBER,
        idordencompramp          NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  lineaordencompramp_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE lineasolicitud_type AS OBJECT (
    idlineasolicitud       NUMBER(8),
    prenda                 REF prenda_type,
    unidades               NUMBER(5),
    estadolineasolicitud   CHAR(1),
    solicitud              REF solicitudcliente_type,
    ordenproduccion        REF ordenproduccion_type,
    idsolicitud            NUMBER(12),
    idprenda               NUMBER(5),
    idordenproduccion      NUMBER(6),
    CONSTRUCTOR FUNCTION lineasolicitud_type(
            idlineasolicitud       NUMBER,
            prenda                 ref prenda_type,
            unidades               NUMBER,
            estadolineasolicitud   CHAR,
            solicitud              ref solicitudcliente_type,
            ordenproduccion        ref ordenproduccion_type,
            idsolicitud            NUMBER,
            idprenda               NUMBER,
            idordenproduccion      NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  lineasolicitud_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE materiaprimaproveedor_type AS OBJECT (
    idmateriaprima    NUMBER(5),
    udmedida          REF unidadmedida_type,
    ctdminimapedida   NUMBER(4),
    precioxud         NUMBER(9,2),
    diasdeentrega     NUMBER(3),
    proveedor         REF proveedor_type,
    idproveedor       NUMBER(5),
    idudmedida        NUMBER(3),
    CONSTRUCTOR FUNCTION materiaprimaproveedor_type(
        idmateriaprima    NUMBER,
        udmedida          ref unidadmedida_type,
        ctdminimapedida   NUMBER,
        precioxud         NUMBER,
        diasdeentrega     NUMBER,
        proveedor         ref proveedor_type,
        idproveedor       NUMBER,
        idudmedida        NUMBER
    ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  materiaprimaproveedor_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE matpxmatpprov_type AS OBJECT (
    materiaprima         REF inventariomateriaprima_type,
    materiaprimaprov     REF materiaprimaproveedor_type,
    idmateriaprima       NUMBER(5),
    idmateriaprimaprov   NUMBER(5),
    idproveedor          NUMBER(5),
    CONSTRUCTOR FUNCTION matpxmatpprov_type(
        materiaprima         ref inventariomateriaprima_type,
        materiaprimaprov     ref materiaprimaproveedor_type,
        idmateriaprima       NUMBER,
        idmateriaprimaprov   NUMBER,
        idproveedor          NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  matpxmatpprov_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE collectionlordcommp IS
    TABLE OF REF lineaordencompramp_type;
/

CREATE OR REPLACE TYPE ordencompramp_type AS OBJECT (
    idordencompramp       NUMBER(6),
    fchcompra             DATE,
    fchestimadarecibo     DATE,
    fchrealrecibo         DATE,
    lineasordencompramp   collectionlordcommp,
    CONSTRUCTOR FUNCTION ordencompramp_type(
        idordencompramp       NUMBER,
        fchcompra             DATE,
        fchestimadarecibo     DATE,
        fchrealrecibo         DATE,
        lineasordencompramp   in collectionlordcommp
        ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  ordencompramp_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE ordenfaltante_type AS OBJECT (
    materiaprima        ref inventariomateriaprima_type,
    cantidad            NUMBER(8,3),
    prenda              ref prenda_type,
    udmedida            ref unidadmedida_type,
    ordenproduccion     ref ordenproduccion_type,
    idordenproduccion   NUMBER(6),
    idmateriaprima      NUMBER(6),
    idprenda            NUMBER(5),
    idudmedida          NUMBER(4),
    idestilo            NUMBER(3),
    CONSTRUCTOR FUNCTION ordenfaltante_type(
        materiaprima        ref inventariomateriaprima_type,
        cantidad            NUMBER,
        prenda              ref prenda_type,
        udmedida            ref unidadmedida_type,
        ordenproduccion     ref ordenproduccion_type,
        idordenproduccion   NUMBER,
        idmateriaprima      NUMBER,
        idprenda            NUMBER,
        idudmedida          NUMBER,
        idestilo            NUMBER
    ) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  ordenfaltante_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE collectionlineassolicitud IS
    TABLE OF REF lineasolicitud_type;
/

CREATE OR REPLACE TYPE collectionordenfaltante IS
    TABLE OF REF ordenfaltante_type;
/

CREATE OR REPLACE TYPE ordenproduccion_type AS OBJECT (
    idordenproduccion       NUMBER(6),
    unidadesporproducir     NUMBER(5),
    fchprogramaproduccion   DATE,
    estadodeproduccion      CHAR(1),
    lineassolicitudop       collectionlineassolicitud,
    ordenesfaltantesop      collectionordenfaltante,
    CONSTRUCTOR FUNCTION ordenproduccion_type(
        idordenproduccion       NUMBER,
        unidadesporproducir     NUMBER,
        fchprogramaproduccion   DATE,
        estadodeproduccion      CHAR,
        lineassolicitudop       in collectionlineassolicitud,
        ordenesFaltantesop      in collectionordenfaltante) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  ordenproduccion_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE pais_type AS OBJECT (
    idpais    NUMBER(3),
    nbrpais   VARCHAR2(30),
    CONSTRUCTOR FUNCTION pais_type(
        idpais    NUMBER,
        nbrpais   VARCHAR2) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  pais_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE prenda_type AS OBJECT (
    idprenda        NUMBER(5),
    estilo          REF estilo_type,
    costounitario   NUMBER(8,2),
    imagen          BLOB,
    video           BLOB,
    descripcion     VARCHAR2(120),
    talla           REF talla_type,
    idtalla         NUMBER(2),
    idEstilo        NUMBER(3),
    CONSTRUCTOR FUNCTION prenda_type(
        idprenda        NUMBER,
        estilo          ref estilo_type,
        costounitario   NUMBER,
        imagen          BLOB,
        video           BLOB,
        descripcion     VARCHAR2,
        talla           ref talla_type,
        idtalla         NUMBER,
        idEstilo        NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  prenda_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE proveedor_type AS OBJECT (
    idproveedor        NUMBER(5),
    nombre             VARCHAR2(20),
    direccioncobro     VARCHAR2(120),
    correo             VARCHAR2(100),
    nbrcontacto        VARCHAR2(20),
    ctdminimaxpedido   NUMBER(5,2),
    CONSTRUCTOR FUNCTION proveedor_type(
        idproveedor        NUMBER,
        nombre             VARCHAR2,
        direccioncobro     VARCHAR2,
        correo             VARCHAR2,
        nbrcontacto        VARCHAR2,
        ctdminimaxpedido   NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  proveedor_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE collectioncuentasbanco IS
    TABLE OF REF cuentabanco_type;
/

CREATE OR REPLACE TYPE proveedorinternacional_type UNDER proveedor_type (
    pais             REF pais_type,
    idpais           NUMBER(3),
    cuentasbancopi   collectioncuentasbanco,
    CONSTRUCTOR FUNCTION proveedorinternacional_type(
        pais             ref pais_type,
        idpais           NUMBER,
        cuentasbancopi   in collectioncuentasbanco) RETURN SELF AS RESULT
) FINAL;
/

CREATE OR REPLACE TYPE proveedornacional_type UNDER proveedor_type (
    cedulajuridica    NUMBER(16),
    maxdiasxcredito   NUMBER(3),
    CONSTRUCTOR FUNCTION proveedornacional_type(
        cedulajuridica    NUMBER,
        maxdiasxcredito   NUMBER) RETURN SELF AS RESULT
) FINAL;
/

CREATE OR REPLACE TYPE recetaprenda_type AS OBJECT (
    prenda        REF prenda_type,
    material      REF inventariomateriaprima_type,
    ctdmaterial   NUMBER(8,3),
    udmedida      REF unidadmedida_type,
    idprenda      NUMBER(5),
    idmaterial    NUMBER(5),
    idudmedida    NUMBER(3),
    CONSTRUCTOR FUNCTION recetaprenda_type(    
    prenda        ref prenda_type,
    material      ref inventariomateriaprima_type,
    ctdmaterial   NUMBER,
    udmedida      ref unidadmedida_type,
    idprenda      NUMBER,
    idmaterial    NUMBER,
    idudmedida    NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  recetaprenda_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE solicitudcliente_type AS OBJECT (
    idsolicitud       NUMBER(12),
    lineassolicitud   collectionlineassolicitud,
    cliente          REF cliente_type,
    fchsolicitud      DATE,
    fchmaxima         DATE,
    idcliente         NUMBER(12),
    CONSTRUCTOR FUNCTION solicitudcliente_type(
    idsolicitud       NUMBER,
    lineassolicitud   in collectionlineassolicitud,
    cliente          ref cliente_type,
    fchsolicitud      DATE,
    fchmaxima         DATE,
    idcliente         NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  solicitudcliente_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE talla_type AS OBJECT (
    idtalla           NUMBER(2),
    talla             VARCHAR2(3),
    pctmateriaprima   NUMBER(4,3),
    CONSTRUCTOR FUNCTION talla_type(
        idtalla           NUMBER,
        talla             VARCHAR2,
        pctmateriaprima   NUMBER) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  talla_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE unidadmedida_type AS OBJECT (
    idunidad      NUMBER(3),
    descripcion   VARCHAR2(120),
    CONSTRUCTOR FUNCTION unidadmedida_type(
        idunidad      NUMBER,
        descripcion   VARCHAR2) RETURN SELF AS RESULT,
    ORDER MEMBER FUNCTION compara (
        x in  unidadmedida_type
    ) RETURN INTEGER
) NOT FINAL;
/

CREATE OR REPLACE TYPE collectionmatpriprov IS
    TABLE OF REF materiaprimaproveedor_type;
/

CREATE TABLE osxop of osxop_type(
    idsolicitud constraint nn_osxop_1 NOT NULL,
    idop constraint nn_osxop_2 NOT NULL
);

CREATE TABLE bitacoraErrores of bitacoraErrores_type(
    fechaError constraint nn_be_1 NOT NULL,
    codigoError constraint nn_be_2 NOT NULL,
    mensajeError constraint nn_be_3 NOT NULL,
    idFila constraint nn_be_4 NOT NULL
);

CREATE TABLE banco OF banco_type (
    idbanco constraint nn_ba_1 NOT NULL,
    nombre constraint nn_ba_2 NOT NULL,
    descripcion constraint nn_ba_3 NOT NULL,
    CONSTRAINT banco_pkv2 PRIMARY KEY ( idbanco )
);

CREATE TABLE cliente OF cliente_type (
    cedula constraint nn_cl_1 NOT NULL,
    direccionalcobro constraint nn_cl_2 NOT NULL,
    telefono constraint nn_cl_2 NOT NULL,
    correoelectronico constraint nn_cl_3 NOT NULL,
    direccionexacta constraint nn_cl_4 NOT NULL,
    paisnacimiento constraint nn_cl_5 NOT NULL,
    apellidos constraint nn_cl_6 NOT NULL,
    nombre constraint nn_cl_7 NOT NULL,
    idpaisnacimiento constraint nn_cl_8 NOT NULL,
    CONSTRAINT cliente_pkv2 PRIMARY KEY ( cedula )
)
NESTED TABLE solicitudes 
 STORE AS solicitudes;
 
CREATE TABLE conjunto OF conjuntoprenda_type (
    idconjunto constraint nn_conp_2 NOT NULL,
    cantidad constraint nn_conp_3 NOT NULL,
    idprenda constraint nn_conp_4 NOT NULL,
    CONSTRAINT conjunto_pkv2 PRIMARY KEY ( idconjunto, idprenda )
)
NESTED TABLE prendasconjunto 
 STORE AS prendasconjunto;

CREATE TABLE conversionesunitarias OF conversionesunitarias_type (
    unidadorigen constraint nn_cu_1 NOT NULL,
    unidaddestino constraint nn_cu_2 NOT NULL,
    medidaconversion constraint nn_cu_3 NOT NULL,
    idunidadorigen constraint nn_cu_4 NOT NULL,
    idunidaddestino constraint nn_cu_5 NOT NULL,
    CONSTRAINT conversionesunitarias_pkv2 PRIMARY KEY ( idunidadorigen,
                                                        idunidaddestino )
);

CREATE TABLE cuentabanco OF cuentabanco_type (
    banco constraint nn_cban_1 NOT NULL,
    proveedor constraint nn_cban_2 NOT NULL,
    idbanco constraint nn_cban_3 NOT NULL,
    idproveedor constraint nn_cban_4 NOT NULL,
    CONSTRAINT cuentabanco_pkv2 PRIMARY KEY ( idbanco,
                                              idproveedor )
);

CREATE TABLE estilo OF estilo_type (
    idestilo constraint nn_estilo_1 NOT NULL,
    descripcion constraint nn_estilo_2 NOT NULL,
    color constraint nn_estilo_3 NOT NULL,
    CONSTRAINT estilo_pk PRIMARY KEY ( idestilo )
);

CREATE TABLE inventariomateriaprima OF inventariomateriaprima_type (
    idmateriaprima constraint nn_invmp_1 NOT NULL,
    udmedida constraint nn_invmp_2 NOT NULL,
    ctdminima constraint nn_invmp_3 NOT NULL,
    existencia constraint nn_invmp_4 NOT NULL,
    precioxud constraint nn_invmp_5 NOT NULL,
    descripcion constraint nn_invmp_6 NOT NULL,
    idudmedida constraint nn_invmp_7 NOT NULL,
    CONSTRAINT inventariomateriaprima_pkv2 PRIMARY KEY ( idmateriaprima )
);

CREATE TABLE lineaordencompramp OF lineaordencompramp_type (
    ordencorrespondiente constraint nn_liordcom_1 NOT NULL,
    materiaprima constraint nn_liordcom_2 NOT NULL,
    ctdfaltante constraint nn_liordcom_3 NOT NULL,
    idordencorrespondiente constraint nn_liordcom_4 NOT NULL,
    ordencompramp constraint nn_liordcom_5 NOT NULL,
    idmateriaprima constraint nn_liordcom_6 NOT NULL,
    idmateriaprimaprov constraint nn_liordcom_7 NOT NULL,
    idproveedor constraint nn_liordcom_8 NOT NULL,
    idordencompramp constraint nn_liordcom_9 NOT NULL,
    CONSTRAINT lineaordencompramp_pkv2 PRIMARY KEY ( idmateriaprima,
                                                     idordencompramp )
);

CREATE TABLE lineaxsolicitud OF lineasolicitud_type (
    idlineasolicitud constraint nn_lisol_1 NOT NULL,
    prenda constraint nn_lisol_2 NOT NULL,
    unidades constraint nn_lisol_3 NOT NULL,
    estadolineasolicitud constraint nn_lisol_4 NOT NULL,
    solicitud constraint nn_lisol_5 NOT NULL,
    ordenproduccion constraint nn_lisol_6 NOT NULL,
    idsolicitud constraint nn_lisol_7 NOT NULL,
    idprenda constraint nn_lisol_8 NOT NULL,
    idordenproduccion constraint nn_lisol_9 NOT NULL,
    CONSTRAINT table_6_pkv2 PRIMARY KEY ( idlineasolicitud,
                                          idsolicitud )
);

CREATE TABLE lineaxsolicitudhistorico OF lineasolicitud_type (
    idlineasolicitud constraint nn_lisolh_1 NOT NULL,
    prenda constraint nn_lisolh_2 NOT NULL,
    unidades constraint nn_lisolh_3 NOT NULL,
    estadolineasolicitud constraint nn_lisolh_4 NOT NULL,
    solicitud constraint nn_lisolh_5 NOT NULL,
    ordenproduccion constraint nn_lisolh_6 NOT NULL,
    idsolicitud constraint nn_lisolh_7 NOT NULL,
    idprenda constraint nn_lisolh_8 NOT NULL,
    idordenproduccion constraint nn_lisolh_9 NOT NULL,
    CONSTRAINT historico2_pkv2 PRIMARY KEY ( idlineasolicitud,
                                          idsolicitud )
);

CREATE TABLE materiaprimaproveedor OF materiaprimaproveedor_type (
    idmateriaprima constraint nn_matpripro_1 NOT NULL,
    udmedida constraint nn_matpripro_2 NOT NULL,
    ctdminimapedida constraint nn_matpripro_3 NOT NULL,
    precioxud constraint nn_matpripro_4 NOT NULL,
    diasdeentrega constraint nn_matpripro_5 NOT NULL,
    proveedor constraint nn_matpripro_6 NOT NULL,
    idproveedor constraint nn_matpripro_7 NOT NULL,
    idudmedida constraint nn_matpripro_8 NOT NULL,
    CONSTRAINT materiaprimaproveedor_pkv2 PRIMARY KEY ( idmateriaprima,
                                                        idproveedor )
);

CREATE TABLE matpxmatpprov OF matpxmatpprov_type (
    materiaprima constraint nn_matpxmatpprov_1 NOT NULL,
    materiaprimaprov constraint nn_matpxmatpprov_2 NOT NULL,
    idmateriaprima constraint nn_matpxmatpprov_3 NOT NULL,
    idmateriaprimaprov constraint nn_matpxmatpprov_4 NOT NULL,
    idproveedor constraint nn_matpxmatpprov_5 NOT NULL,
    CONSTRAINT matpxmatppov_pkv2 PRIMARY KEY ( idmateriaprima,
                                               idmateriaprimaprov,
                                               idproveedor )
);

CREATE TABLE ordencompramp OF ordencompramp_type (
    idordencompramp constraint nn_ordcompmp_1 NOT NULL,
    fchcompra constraint nn_ordcompmp_2 NOT NULL,
    fchestimadarecibo constraint nn_ordcompmp_3 NOT NULL,
    CONSTRAINT ordencompramp_pkv2 PRIMARY KEY ( idordencompramp )
)
NESTED TABLE lineasordencompramp 
--  WARNING: Using column name as default storage_table name for nested column lineasOrdenCompraMP 
 STORE AS lineasordencompramp;

CREATE TABLE ordenfaltante OF ordenfaltante_type (
    materiaprima constraint nn_ordfal_1 NOT NULL,
    prenda constraint nn_ordfal_2 NOT NULL,
    udmedida constraint nn_ordfal_3 NOT NULL,
    ordenproduccion constraint nn_ordfal_4 NOT NULL,
    idordenproduccion constraint nn_ordfal_5 NOT NULL,
    idmateriaprima constraint nn_ordfal_6 NOT NULL,
    idprenda constraint nn_ordfal_7 NOT NULL,
    idudmedida constraint nn_ordfal_8 NOT NULL,
    CONSTRAINT ordenfaltante_pkv2 PRIMARY KEY ( idordenproduccion,
                                                idmateriaprima,
                                                idprenda )
);

CREATE TABLE ordenproduccion OF ordenproduccion_type (
    idordenproduccion constraint nn_ordprod_1 NOT NULL,
    unidadesporproducir constraint nn_ordprod_2 NOT NULL,
    fchprogramaproduccion constraint nn_ordprod_3 NOT NULL,
    estadodeproduccion constraint nn_ordprod_4 NOT NULL,
    CONSTRAINT ordenproduccion_pkv2 PRIMARY KEY ( idordenproduccion )
)
NESTED TABLE lineassolicitudop 
--  WARNING: Using column name as default storage_table name for nested column lineasSolicitudOP 
 STORE AS lineassolicitudop
NESTED TABLE ordenesfaltantesop 
--  WARNING: Using column name as default storage_table name for nested column ordenesFaltantesOP 
 STORE AS ordenesfaltantesop;

CREATE TABLE pais OF pais_type (
    idpais constraint nn_pais_1 NOT NULL,
    nbrpais constraint nn_pais_2 NOT NULL,
    CONSTRAINT pais_pkv2 PRIMARY KEY ( idpais )
);

CREATE TABLE prenda OF prenda_type (
    idprenda constraint nn_prenda_1 NOT NULL,
    estilo constraint nn_prenda_2 NOT NULL,
    costounitario constraint nn_prenda_3 NOT NULL,
    descripcion constraint nn_prenda_4 NOT NULL,
    talla constraint nn_prenda_5 NOT NULL,
    idtalla constraint nn_prenda_6 NOT NULL,
    idestilo constraint nn_prenda_7 NOT NULL,
    CONSTRAINT prenda_pk PRIMARY KEY ( idprenda )
);

CREATE TABLE proveedor OF proveedor_type (
    idproveedor constraint nn_proveedor_1 NOT NULL,
    nombre constraint nn_proveedor_2 NOT NULL,
    direccioncobro constraint nn_proveedor_3 NOT NULL,
    correo constraint nn_proveedor_4 NOT NULL,
    nbrcontacto constraint nn_proveedor_5 NOT NULL,
    ctdminimaxpedido constraint nn_proveedor_6 NOT NULL,
    CONSTRAINT proveedor_pkv2 PRIMARY KEY ( idproveedor )
);

CREATE TABLE proveedorinternacional OF proveedorinternacional_type (
    idproveedor constraint nn_proveedorint_1 NOT NULL,
    nombre constraint nn_proveedorint_2 NOT NULL,
    direccioncobro constraint nn_proveedorint_3 NOT NULL,
    correo constraint nn_proveedorint_4 NOT NULL,
    nbrcontacto constraint nn_proveedorint_5 NOT NULL,
    ctdminimaxpedido constraint nn_proveedorint_6 NOT NULL,
    pais constraint nn_proveedorint_7 NOT NULL,
    idpais constraint nn_proveedorint_8 NOT NULL,
    CONSTRAINT proveedorinternacion_pkv2 PRIMARY KEY ( idproveedor )
)
NESTED TABLE cuentasbancopi 
--  WARNING: Using column name as default storage_table name for nested column cuentasBancoPI 
 STORE AS cuentasbancopi;

CREATE TABLE proveedornacional OF proveedornacional_type (
    idproveedor constraint nn_proveedornac_1 NOT NULL,
    nombre constraint nn_proveedornac_2 NOT NULL,
    direccioncobro constraint nn_proveedornac_3 NOT NULL,
    correo constraint nn_proveedornac_4 NOT NULL,
    nbrcontacto constraint nn_proveedornac_5 NOT NULL,
    ctdminimaxpedido constraint nn_proveedornac_6 NOT NULL,
    cedulajuridica constraint nn_proveedornac_7 NOT NULL,
    maxdiasxcredito constraint nn_proveedornac_8 NOT NULL,
    CONSTRAINT proveedornacional_pkv2 PRIMARY KEY ( idproveedor )
);

CREATE TABLE recetaprenda OF recetaprenda_type (
    prenda constraint nn_receta_1 NOT NULL,
    material constraint nn_receta_2 NOT NULL,
    ctdmaterial constraint nn_receta_3 NOT NULL,
    udmedida constraint nn_receta_4 NOT NULL,
    idprenda constraint nn_receta_5 NOT NULL,
    idmaterial constraint nn_receta_6 NOT NULL,
    idudmedida constraint nn_receta_7 NOT NULL,
    CONSTRAINT recetaprenda_pkv2 PRIMARY KEY ( idprenda,
                                               idmaterial )
);

CREATE TABLE solicitudcliente OF solicitudcliente_type (
    idsolicitud constraint nn_solicitud_1 NOT NULL,
    cliente constraint nn_solicitud_2 NOT NULL,
    fchsolicitud constraint nn_solicitud_3 NOT NULL,
    fchmaxima constraint nn_solicitud_4 NOT NULL,
    idcliente constraint nn_solicitud_5 NOT NULL,
    CONSTRAINT table_5_pkv2 PRIMARY KEY ( idsolicitud )
)
NESTED TABLE lineassolicitud 
--  WARNING: Using column name as default storage_table name for nested column lineasSolicitud 
 STORE AS lineassolicitud;
 
 CREATE TABLE solicitudclientehistorico OF solicitudcliente_type (
    idsolicitud constraint nn_solicitudh_1 NOT NULL,
    cliente constraint nn_solicitudh_2 NOT NULL,
    fchsolicitud constraint nn_solicitudh_3 NOT NULL,
    fchmaxima constraint nn_solicitudh_4 NOT NULL,
    idcliente NOT NULL,
    CONSTRAINT historico1_pkv2 PRIMARY KEY ( idsolicitud )
)
NESTED TABLE lineassolicitud
--  WARNING: Using column name as default storage_table name for nested column lineasSolicitud 
 STORE AS lineassolicitudhistorico;

CREATE TABLE talla OF talla_type (
    idtalla constraint nn_talla_1 NOT NULL,
    talla constraint nn_talla_2 NOT NULL,
    pctmateriaprima constraint nn_talla_3 NOT NULL,
    CONSTRAINT talla_pkv2 PRIMARY KEY ( idtalla )
);

CREATE TABLE unidadmedida OF unidadmedida_type (
    idunidad constraint nn_udmedida_1 NOT NULL,
    descripcion constraint nn_udmedida_2 NOT NULL,
    CONSTRAINT unidadmedia_pkv2 PRIMARY KEY ( idunidad )
);

CREATE OR REPLACE TYPE BODY banco_type AS
    CONSTRUCTOR FUNCTION banco_type(idBanco NUMBER, nombre VARCHAR2, descripcion VARCHAR2) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idBanco := idBanco;
        self.nombre := nombre;
        self.descripcion := descripcion;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  banco_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idBanco - x.idBanco) >  0 THEN
                    return 1;
        ElSIF  (idBanco - x.idBanco) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY cliente_type AS
    CONSTRUCTOR FUNCTION cliente_type(
        cedula              NUMBER,
        direccionalcobro    VARCHAR2,
        telefono            NUMBER,
        correoelectronico   VARCHAR2,
        direccionexacta     VARCHAR2,
        paisnacimiento      ref pais_type,
        apellidos           VARCHAR2,
        nombre              VARCHAR2,
        solicitudes         in collectionsolicitud,
        idpaisnacimiento    NUMBER
        ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.cedula := cedula;
        self.direccionalcobro := direccionalcobro;
        self.telefono := telefono;
        self.correoelectronico := correoelectronico;
        self.direccionexacta := direccionexacta;
        self.paisnacimiento := paisnacimiento;
        self.apellidos := apellidos;
        self.nombre := nombre;
        self.solicitudes := solicitudes;
        self.idpaisnacimiento := idpaisnacimiento;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  cliente_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (cedula - x.cedula) >  0 THEN
                    return 1;
        ELSIF  (cedula - x.cedula) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/
/*
CREATE OR REPLACE TYPE BODY dummy_type AS
    CONSTRUCTOR FUNCTION dummy_type(
        cedula              NUMBER,
        direccionalcobro    VARCHAR2,
        telefono            NUMBER,
        correoelectronico   VARCHAR2,
        direccionexacta     VARCHAR2,
        paisnacimiento      ref pais_type,
        apellidos           VARCHAR2,
        nombre              VARCHAR2,
        solicitudes         in collectionsolicitud,
        idpaisnacimiento    NUMBER
        ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.cedula := cedula;
        self.direccionalcobro := direccionalcobro;
        self.telefono := telefono;
        self.correoelectronico := correoelectronico;
        self.direccionexacta := direccionexacta;
        self.paisnacimiento := paisnacimiento;
        self.apellidos := apellidos;
        self.nombre := nombre;
        self.solicitudesDummy := solicitudes;
        self.idpaisnacimiento := idpaisnacimiento;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  dummy_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (cedula - x.cedula) >  0 THEN
                    return 1;
        ELSIF  (cedula - x.cedula) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;

/
*/
create or replace 
TYPE BODY conjuntoprenda_type AS
    CONSTRUCTOR FUNCTION  conjuntoprenda_type(
        idconjunto        NUMBER,
        prendasconjunto   in collectionprenda,
        cantidad          NUMBER,
        idprenda          NUMBER
        ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idconjunto := idconjunto;
        self.prendasconjunto := prendasconjunto;
        self.cantidad := cantidad;
        self.idprenda := idprenda;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  conjuntoprenda_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idconjunto - x.idconjunto) >  0 THEN
                    return 1;
        ELSIF  (idconjunto - x.idconjunto) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/
create or replace 
TYPE BODY conversionesunitarias_type AS
    CONSTRUCTOR FUNCTION conversionesunitarias_type(
    unidadorigen       ref unidadmedida_type,
    unidaddestino      ref unidadmedida_type,
    medidaconversion   NUMBER,
    idunidadorigen     NUMBER,
    idunidaddestino    NUMBER) RETURN SELF AS RESULT
    AS 
    BEGIN
        self.unidadorigen := unidadorigen;
        self.unidaddestino := unidaddestino;
        self.medidaconversion := medidaconversion;
        self.idunidaddestino := idunidaddestino;
        self.idunidadorigen := idunidadorigen;
        RETURN;
    END;
    ORDER MEMBER FUNCTION compara( x in  conversionesunitarias_type)  RETURN INTEGER  
    AS
    BEGIN
        IF(idunidadorigen - x.idunidadorigen) > 0 THEN
                    return 1;
        ELSIF  (idunidadorigen - x.idunidadorigen) = 0 THEN
            IF(idunidaddestino - x.idunidaddestino) > 0 THEN
                return 1;
            ELSIF(idunidaddestino - x.idunidaddestino) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY cuentabanco_type AS
    CONSTRUCTOR FUNCTION cuentabanco_type(
    banco         ref banco_type,
    proveedor     ref proveedorinternacional_type,
    idbanco       NUMBER,
    idproveedor   NUMBER) RETURN SELF AS RESULT
    AS 
    BEGIN
        self.banco := banco;
        self.proveedor := proveedor;
        self.idBanco := idBanco;
        self.idproveedor := idproveedor;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  cuentabanco_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idproveedor - x.idproveedor) >  0 THEN
                    return 1;
        ELSIF  (idproveedor - x.idproveedor) = 0 THEN
            IF(idBanco - x.idBanco) > 0 THEN
                return 1;
            ELSIF(idBanco - x.idBanco) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY estilo_type AS
    CONSTRUCTOR FUNCTION estilo_type(
    idestilo      NUMBER,
    descripcion   VARCHAR2,
    color         VARCHAR2) RETURN SELF AS RESULT
    AS 
    BEGIN
        self.idestilo := idestilo;
        self.color := color;
        self.descripcion := descripcion;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  estilo_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idestilo - x.idestilo) >  0 THEN
                    return 1;
        ELSIF  (idestilo - x.idestilo) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/

CREATE OR REPLACE TYPE BODY inventariomateriaprima_type AS
    CONSTRUCTOR FUNCTION inventariomateriaprima_type(
    idmateriaprima   NUMBER,
    udmedida         ref unidadmedida_type,
    ctdminima        NUMBER,
    existencia       NUMBER,
    precioxud        NUMBER,
    descripcion       VARCHAR2,
    idudmedida       NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idmateriaprima := idmateriaprima;
        self.udmedida := udmedida;
        self.ctdminima := ctdminima;
        self.existencia := existencia;
        self.precioxud := precioxud;
        self.descripcion := descripcion;
        self.idudmedida := idudmedida;
        RETURN;
    END;
    ORDER MEMBER FUNCTION compara( x in  inventariomateriaprima_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idmateriaprima - x.idmateriaprima) >  0 THEN
                    return 1;
        ELSIF  (idmateriaprima - x.idmateriaprima) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/
create or replace 
TYPE BODY lineaordencompramp_type AS
    CONSTRUCTOR FUNCTION lineaordencompramp_type(
        ordencorrespondiente     NUMBER,
        materiaprima             ref matpxmatpprov_type,
        ctdfaltante              NUMBER,
        idordencorrespondiente   NUMBER,
        ordencompramp            ref ordencompramp_type,
        idmateriaprima           NUMBER,
        idmateriaprimaprov       NUMBER,
        idproveedor              NUMBER,
        idordencompramp          NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.ordencorrespondiente := ordencorrespondiente;
        self.materiaprima := materiaprima;
        self.ctdfaltante := ctdfaltante;
        self.idordencorrespondiente := self.idordencorrespondiente;
        self.ordencompramp := ordencompramp;
        self.idmateriaprima := idmateriaprima;
        self.idmateriaprimaprov := idmateriaprimaprov;
        self.idproveedor := idproveedor;
        self.idordencompramp := idordencompramp;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  lineaordencompramp_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idordencompramp - x.idordencompramp) >  0 THEN
                    return 1;
        ELSIF  (idordencompramp - x.idordencompramp) = 0 THEN
            IF(idmateriaprima - x.idmateriaprima) > 0 THEN
                return 1;
            ELSIF(idmateriaprima - x.idmateriaprima) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY lineasolicitud_type AS
    CONSTRUCTOR FUNCTION lineasolicitud_type(
            idlineasolicitud       NUMBER,
            prenda                 ref prenda_type,
            unidades               NUMBER,
            estadolineasolicitud   CHAR,
            solicitud              ref solicitudcliente_type,
            ordenproduccion        ref ordenproduccion_type,
            idsolicitud            NUMBER,
            idprenda               NUMBER,
            idordenproduccion      NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idlineasolicitud := idlineasolicitud;
        self.prenda := prenda;
        self.unidades := unidades;
        self.estadolineasolicitud := estadolineasolicitud;
        self.solicitud := solicitud;
        self.ordenproduccion:= ordenproduccion;
        self.idsolicitud := idsolicitud;
        self.idprenda := idprenda;
        self.idordenproduccion := idordenproduccion;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  lineasolicitud_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idsolicitud - x.idsolicitud) >  0 THEN
                    return 1;
        ELSIF  (idsolicitud - x.idsolicitud) = 0 THEN
            IF(idlineasolicitud - x.idlineasolicitud) > 0 THEN
                return 1;
            ELSIF(idlineasolicitud - x.idlineasolicitud) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;

END;
/

CREATE OR REPLACE TYPE BODY materiaprimaproveedor_type AS
    CONSTRUCTOR FUNCTION materiaprimaproveedor_type(
        idmateriaprima    NUMBER,
        udmedida          ref unidadmedida_type,
        ctdminimapedida   NUMBER,
        precioxud         NUMBER,
        diasdeentrega     NUMBER,
        proveedor         ref proveedor_type,
        idproveedor       NUMBER,
        idudmedida        NUMBER
    ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idmateriaprima := idmateriaprima;
        self.udmedida := udmedida;
        self.ctdminimapedida := ctdminimapedida;
        self.precioxud := precioxud;
        self.diasdeentrega := diasdeentrega;
        self.proveedor := proveedor;
        self.idproveedor := idproveedor;
        self.idudmedida := idudmedida;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  materiaprimaproveedor_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idproveedor - x.idproveedor) >  0 THEN
                    return 1;
        ELSIF  (idproveedor - x.idproveedor) = 0 THEN
            IF(idmateriaprima - x.idmateriaprima) > 0 THEN
                return 1;
            ELSIF(idmateriaprima - x.idmateriaprima) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;

END;
/
create or replace 
TYPE BODY matpxmatpprov_type AS
    CONSTRUCTOR FUNCTION matpxmatpprov_type(
        materiaprima         ref inventariomateriaprima_type,
        materiaprimaprov     ref materiaprimaproveedor_type,
        idmateriaprima       NUMBER,
        idmateriaprimaprov   NUMBER,
        idproveedor          NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.materiaprima := materiaprima;
        self.materiaprimaprov := materiaprimaprov;
        self.idmateriaprima := idmateriaprima;
        self.idmateriaprimaprov := idmateriaprimaprov;
        self.idproveedor := idproveedor;
        RETURN;
    END;
    ORDER MEMBER FUNCTION compara( x in  matpxmatpprov_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idmateriaprima - x.idmateriaprima) >  0 THEN
                    return 1;
        ELSIF  (idmateriaprima - x.idmateriaprima) = 0 THEN
            IF(idproveedor - x.idproveedor) > 0 THEN
                return 1;
            ELSIF(idproveedor - x.idproveedor) = 0 THEN
                IF(idmateriaprimaprov - x.idmateriaprimaprov) > 0 THEN
                return 1;
                ELSIF(idmateriaprimaprov - x.idmateriaprimaprov) = 0 THEN
                    return 0;

                ELSE
                    return -1;
                END IF;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY ordencompramp_type AS
        CONSTRUCTOR FUNCTION ordencompramp_type(
        idordencompramp       NUMBER,
        fchcompra             DATE,
        fchestimadarecibo     DATE,
        fchrealrecibo         DATE,
        lineasordencompramp   in collectionlordcommp
        ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idordencompramp := idordencompramp;
        self.fchcompra := fchcompra;
        self.fchestimadarecibo := fchestimadarecibo;
        self.fchrealrecibo := fchrealrecibo;
        self.lineasordencompramp := lineasordencompramp;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  ordencompramp_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idordencompramp - x.idordencompramp) >  0 THEN
                    return 1;
        ELSIF  (idordencompramp - x.idordencompramp) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/
create or replace 
TYPE BODY ordenfaltante_type AS
    CONSTRUCTOR FUNCTION ordenfaltante_type(
        materiaprima        ref inventariomateriaprima_type,
        cantidad            NUMBER,
        prenda              ref prenda_type,
        udmedida            ref unidadmedida_type,
        ordenproduccion     ref ordenproduccion_type,
        idordenproduccion   NUMBER,
        idmateriaprima      NUMBER,
        idprenda            NUMBER,
        idudmedida          NUMBER,
        idestilo            NUMBER
    ) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.materiaprima := materiaprima;
        self.cantidad := cantidad;
        self.prenda := prenda;
        self.udmedida := udmedida;
        self.ordenproduccion := ordenproduccion;
        self.idordenproduccion := idordenproduccion;
        self.idmateriaprima := idmateriaprima;
        self.idprenda := idprenda;
        self.idudmedida := idudmedida;
        self.idestilo := idestilo;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  ordenfaltante_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idordenproduccion - x.idordenproduccion) >  0 THEN
                    return 1;
        ELSIF  (idordenproduccion - x.idordenproduccion) = 0 THEN
            IF(idmateriaprima - x.idmateriaprima) > 0 THEN
                return 1;
            ELSIF(idmateriaprima - x.idmateriaprima) = 0 THEN
                IF(idprenda - x.idprenda) > 0 THEN
                return 1;
                ELSIF(idprenda - x.idprenda) = 0 THEN
                    return 0;

                ELSE
                    return -1;
                END IF;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;
    END;
END;
/
create or replace 
TYPE BODY ordenproduccion_type AS
    CONSTRUCTOR FUNCTION ordenproduccion_type(
        idordenproduccion       NUMBER,
        unidadesporproducir     NUMBER,
        fchprogramaproduccion   DATE,
        estadodeproduccion      CHAR,
        lineassolicitudop       in collectionlineassolicitud,
        ordenesFaltantesop      in collectionordenfaltante) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idordenproduccion := idordenproduccion;
        self.unidadesporproducir := unidadesporproducir;
        self.fchprogramaproduccion := fchprogramaproduccion;
        self.estadodeproduccion := estadodeproduccion;
        self.ordenesFaltantesop := ordenesFaltantesop;
        self.lineassolicitudop := lineassolicitudop;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  ordenproduccion_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idordenproduccion - x.idordenproduccion) >  0 THEN
                    return 1;
        ELSIF  (idordenproduccion - x.idordenproduccion) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/
create or replace 
TYPE BODY pais_type AS
    CONSTRUCTOR FUNCTION pais_type(
        idpais    NUMBER,
        nbrpais   VARCHAR2) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idpais := idpais;
        self.nbrpais := nbrpais;
        RETURN;
    END;
    ORDER MEMBER FUNCTION compara( x in  pais_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idpais - x.idpais) >  0 THEN
                    return 1;
        ELSIF  (idpais - x.idpais) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/
create or replace 
TYPE BODY prenda_type AS
    CONSTRUCTOR FUNCTION prenda_type(
        idprenda        NUMBER,
        estilo          ref estilo_type,
        costounitario   NUMBER,
        imagen          BLOB,
        video           BLOB,
        descripcion     VARCHAR2,
        talla           ref talla_type,
        idtalla         NUMBER,
        idestilo        NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idprenda := idprenda;
        self.estilo := estilo;
        self.costounitario := costounitario;
        self.imagen := imagen;
        self.video := video;
        self.descripcion := descripcion;
        self.talla := talla;
        self.idtalla := idtalla;
        self.idestilo := idestilo;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  prenda_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idprenda - x.idprenda) >  0 THEN
                    return 1;
        ELSIF  (idprenda - x.idprenda) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/

CREATE OR REPLACE TYPE BODY proveedor_type AS
    CONSTRUCTOR FUNCTION proveedor_type(
        idproveedor        NUMBER,
        nombre             VARCHAR2,
        direccioncobro     VARCHAR2,
        correo             VARCHAR2,
        nbrcontacto        VARCHAR2,
        ctdminimaxpedido   NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idproveedor := idproveedor;
        self.nombre := nombre;
        self.direccioncobro := direccioncobro;
        self.correo := correo;
        self.nbrcontacto := nbrcontacto;
        self.ctdminimaxpedido := ctdminimaxpedido;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  proveedor_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idproveedor - x.idproveedor) >  0 THEN
                    return 1;
        ELSIF  (idproveedor - x.idproveedor) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;
END;
/

create or replace 
TYPE BODY proveedorinternacional_type AS
    CONSTRUCTOR FUNCTION proveedorinternacional_type(
        pais             ref pais_type,
        idpais           NUMBER,
        cuentasbancopi   in collectioncuentasbanco) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.pais := pais;
        self.idpais := idpais;
        self.cuentasbancopi := cuentasbancopi;
        RETURN;
    END;
END;
/

create or replace 
TYPE BODY proveedornacional_type AS
    CONSTRUCTOR FUNCTION proveedornacional_type(
        cedulajuridica    NUMBER,
        maxdiasxcredito   NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.cedulajuridica := cedulajuridica;
        self.maxdiasxcredito := maxdiasxcredito;
        RETURN;
    END;
END;
/
create or replace 
TYPE BODY recetaprenda_type AS
    CONSTRUCTOR FUNCTION recetaprenda_type(  
    prenda        ref prenda_type,
    material      ref inventariomateriaprima_type,
    ctdmaterial   NUMBER,
    udmedida      ref unidadmedida_type,
    idprenda      NUMBER,
    idmaterial    NUMBER,
    idudmedida    NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.prenda := prenda;
        self.material := material;
        self.ctdmaterial := ctdmaterial;
        self.udmedida := udmedida;
        self.idprenda := idprenda;
        self.idmaterial := idmaterial;
        self.idudmedida := idudmedida;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  recetaprenda_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idprenda - x.idprenda) >  0 THEN
                    return 1;
        ELSIF  (idprenda - x.idprenda) = 0 THEN
            IF(idmaterial - x.idmaterial) > 0 THEN
                return 1;
            ELSIF(idmaterial - x.idmaterial) = 0 THEN
                return 0;

            ELSE
                return -1;
            END IF;

        ELSE
                return -1;
        END IF;

    END;

END;
/

CREATE OR REPLACE TYPE BODY solicitudcliente_type AS
     CONSTRUCTOR FUNCTION solicitudcliente_type(
            idsolicitud       NUMBER,
    lineassolicitud   collectionlineassolicitud,
    cliente          ref cliente_type,
    fchsolicitud      DATE,
    fchmaxima         DATE,
    idcliente         NUMBER) RETURN SELF AS RESULT
    AS 
    BEGIN
        self.idsolicitud := idsolicitud;
        self.lineasSolicitud := lineassolicitud;
        self.cliente := cliente;
        self.fchsolicitud := fchsolicitud;
        self.fchmaxima := fchmaxima;
        self.idcliente := idcliente;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  solicitudcliente_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idsolicitud - x.idsolicitud) >  0 THEN
                    return 1;
        ELSIF  (idsolicitud - x.idsolicitud) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/

CREATE OR REPLACE TYPE BODY talla_type AS
    CONSTRUCTOR FUNCTION talla_type(
        idtalla           NUMBER,
        talla             VARCHAR2,
        pctmateriaprima   NUMBER) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idtalla := idtalla;
        self.talla := talla;
        self.pctmateriaprima := pctmateriaprima;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  talla_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idtalla - x.idtalla) >  0 THEN
                    return 1;
        ELSIF  (idtalla - x.idtalla) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/

CREATE OR REPLACE TYPE BODY unidadmedida_type AS
    CONSTRUCTOR FUNCTION unidadmedida_type(
        idunidad      NUMBER,
        descripcion   VARCHAR2) RETURN SELF AS RESULT
        AS 
    BEGIN
        self.idunidad := idunidad;
        self.descripcion := descripcion;
        RETURN;
    END;

    ORDER MEMBER FUNCTION compara( x in  unidadmedida_type)  RETURN INTEGER  
    AS
    BEGIN
        IF  (idunidad - x.idunidad) >  0 THEN
                    return 1;
        ELSIF  (idunidad - x.idunidad) = 0 THEN
                        return 0;
        ELSE
                return -1;
        END IF;
    END;

END;
/

--Tipos y tablas historicos