sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'servicesdesk.tipossolicitud',
            componentId: 'tipo_solicitudList',
            contextPath: '/tipo_solicitud'
        },
        CustomPageDefinitions
    );
});