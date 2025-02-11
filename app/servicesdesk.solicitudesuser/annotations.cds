using servicesdesk_srv as service from '../../srv/service';
using from '../../db/schema';

annotate service.solicitudesUser with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : '{i18n>Id1}',
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
                Label : '{i18n>CreatedAt2}',
            },
            {
                $Type : 'UI.DataField',
                Value : usuario,
                Label : '{i18n>Usuario17}',
            },
            {
                $Type : 'UI.DataField',
                Value : Urgencia_code,
                Label : '{i18n>Urgenciacode1}',
                Criticality : Urgencia.criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Estadocode1}',
                Value : Estado_code,
                Criticality : Estado.criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Tiposolicitudid1}',
                Value : tipo_solicitud_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Motivo1}',
                Value : motivo,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Comunicaciones',
            ID : 'Comunicaciones1',
            Target : 'comunicaciones/@UI.LineItem#Comunicaciones',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>Id}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : '{i18n>CreatedAt1}',
        },
        {
            $Type : 'UI.DataField',
            Value : usuario,
            Label : '{i18n>Usuario32}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Tiposolicitudid}',
            Value : tipo_solicitud_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Estadocode}',
            Value : Estado_code,
            Criticality : Estado.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Urgenciacode}',
            Value : Urgencia_code,
            Criticality : Urgencia.criticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Motivo}',
            Value : motivo,
        },
    ],
    UI.FieldGroup #Comunicaciones : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.author,
            },
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.message,
                Label : 'message',
            },
            {
                $Type : 'UI.DataField',
                Value : comunicaciones.timestamp,
                Label : 'timestamp',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'sap-icon://activity-individual',
        Title : {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
    },
);

annotate service.solicitudesUser with {
    tipo_solicitud @(
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

annotate service.solicitudesUser with {
    Estado @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'estado',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Estado_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.solicitudesUser with {
    Urgencia @(Common.ValueListWithFixedValues : true,
        )};

annotate service.solicitudesUser.comunicaciones with @(
    UI.LineItem #Comunicaciones : [
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : '{i18n>UserID3}',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : '{i18n>Timestamp}',
        },
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : '{i18n>Message}',
        },
    ]
);

