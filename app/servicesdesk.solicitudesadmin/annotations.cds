using servicesdesk_srv as service from '../../srv/service';
using from '../../db/schema';

annotate service.solicitudesAdmin with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : '{i18n>Id3}',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
                Label : '{i18n>CreatedAt4}',
            },
            {
                $Type : 'UI.DataField',
                Value : usuario,
                Label : '{i18n>Usuarioobj}',
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
                Label : '{i18n>Modify1}',
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Urgenciacode4}',
                Value : Urgencia_code,
                Criticality : Urgencia.criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Estadocode4}',
                Value : Estado_code,
                Criticality : Estado.criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Tiposolicitudid4}',
                Value : tipo_solicitud_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Motivo3}',
                Value : motivo,
            },
            {
                $Type : 'UI.DataField',
                Value : persona_soporte_ID,
                Label : '{i18n>Personasoporteid2}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Id2}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : '{i18n>CreatedAt3}',
        },
        {
            $Type : 'UI.DataField',
            Value : usuario,
            Label : '{i18n>Usuario32}',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
            Label : '{i18n>Modify}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Tiposolicitudid3}',
            Value : tipo_solicitud_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Estadocode3}',
            Value : Estado_code,
            Criticality : Estado.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Urgenciacode3}',
            Value : Urgencia_code,
            Criticality : Urgencia.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Motivo2}',
            Value : motivo,
        },
        {
            $Type : 'UI.DataField',
            Value : persona_soporte_ID,
            Label : '{i18n>Personasoporteid}',
        },
    ],
    UI.FieldGroup #Comunicaciones : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Comunicaciones1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.author,
            },
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.timestamp,
                Label : 'timestamp',
            },
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.message,
                Label : 'message',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://activity-individual',
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : usuario,
        },
    },
    UI.SelectionFields : [
        Estado_code,
        Urgencia_code,
        tipo_solicitud_ID,
        usuario,
    ],
);

annotate service.solicitudesAdmin with {
    tipo_solicitud @(
        Common.Label : '{i18n>Tiposolicitudid2}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'tipo_solicitud',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : tipo_solicitud_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Nombre',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.solicitudesAdmin.comunicaciones with @(
    UI.LineItem #Comunicaciones : [
    ],
    UI.LineItem #Comunicaciones1 : [
        {
            $Type : 'UI.DataField',
            Value : author,
        },
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },
    ],
);

annotate service.solicitudesAdmin.comunicaciones with {
    author @Common.FieldControl : #ReadOnly
};

annotate service.solicitudesAdmin.comunicaciones with {
    timestamp @Common.FieldControl : #ReadOnly
};

annotate service.solicitudesAdmin.comunicaciones with {
    message @Common.FieldControl : #ReadOnly
};

annotate service.solicitudesAdmin with {
    Estado @(
        Common.Label : '{i18n>Estadocode2}',
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.solicitudesAdmin with {
    Urgencia @(
        Common.Label : '{i18n>Urgenciacode2}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'urgencia',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Urgencia_code,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};
annotate service.solicitudesAdmin with {
    persona_soporte @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'persona_soporte',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : persona_soporte_ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.solicitudesAdmin with {
    usuario @Common.Label : '{i18n>UsuarioFilter}'
};

