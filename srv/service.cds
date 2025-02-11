using { servicesdesk_dm as my } from '../db/schema.cds';

@path : '/service/servicesdesk_srv'
service servicesdesk_srv
{
    annotate solicitudesAdmin with @restrict :
    [
        { grant : [ '*' ], to : [ 'Admin' ] },
    ];

    annotate solicitudesUser with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'Admin' ] },
        { grant : [ 'CREATE' ], to : [ 'User' ], where : 'createdBy = $user' },
        { grant : [ 'READ' ], to : [ 'User' ], where : 'createdBy = $user' },
        { grant : [ 'UPDATE' ], to : [ 'User' ], where : 'createdBy = $user' }
    ];

    annotate tipo_solicitud with @restrict :
    [
        { grant : [ '*' ], to : [ 'Admin' ] },
        { grant : [ 'READ' ], to : [ 'User' ] }
    ];

    @odata.draft.enabled
    entity solicitudesUser as
        projection on my.solicitudes;

    @cds.redirection.target : false
    @odata.draft.enabled
    entity solicitudesAdmin as
        projection on my.solicitudes;

    @odata.draft.enabled
    entity tipo_solicitud as
        projection on my.tipo_solicitud;

    @odata.draft.enabled
    entity persona_soporte as
        projection on my.persona_soporte;

}

annotate servicesdesk_srv with @requires :
[
    'authenticated-user',
    'Admin',
    'User'
];
