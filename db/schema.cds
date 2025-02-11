namespace servicesdesk_dm;

using
{
    managed,
    sap.common.CodeList
}
from '@sap/cds/common';

entity solicitudes : managed
{
    key ID : UUID;
    motivo : String(100);
    tipo_solicitud : Association to one tipo_solicitud;
    Estado : Association to one estado default 'PENDIENTE';
    Urgencia : Association to one urgencia default 'MEDIA';
    usuario : type of managed:createdBy
        @cds.on.insert : $user
        @readonly
        @title : '{i18n>CreatedBy}'
        @Core.Immutable
        @UI.ExcludeFromNavigationContext
        @UI.HiddenFilter;
    comunicaciones : Composition of many 
    {
        key ID : UUID;
        timestamp : type of managed:createdAt
            @cds.on.insert : $now
            @readonly
            @title : '{i18n>CreatedAt}'
            @Core.Immutable
            @UI.ExcludeFromNavigationContext
            @UI.HiddenFilter;
        author : type of managed:createdBy
            @cds.on.insert : $user
            @readonly
            @title : '{i18n>CreatedBy}'
            @Core.Immutable
            @UI.ExcludeFromNavigationContext
            @UI.HiddenFilter;
        message : String;
    };
    persona_soporte : Association to one persona_soporte;
}

entity persona_soporte
{
    key ID : String;
    Nombre : String;
}

entity tipo_solicitud
{
    key ID : String;
    Nombre : String;
}

entity estado : CodeList
{
    key code : String enum
    {
        Pendiente = 'PENDIENTE';
        En_Proceso = 'PROCESO';
        Resuelta = 'RESUELTA';
        Cerrada = 'CERRADA';
    };
    criticality : Integer;
}

entity urgencia : CodeList
{
    key code : String enum
    {
        Alta = 'ALTA';
        Media = 'MEDIA';
        Baja = 'BAJA';
    };
    criticality : Integer;
}

