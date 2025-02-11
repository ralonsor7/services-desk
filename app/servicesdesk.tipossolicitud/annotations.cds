using servicesdesk_srv as service from '../../srv/service';
annotate service.tipo_solicitud with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Idts2}',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Nombre2}',
                Value : Nombre,
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
            Label : '{i18n>Idts}',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Nombre}',
            Value : Nombre,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Nombre,
        },
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'sap-icon://add-document',
    },
);


annotate service.tipo_solicitud with {
    ID @Common.FieldControl : #Optional
};

