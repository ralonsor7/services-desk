sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'servicesdesk.solicitudesuser',
            componentId: 'solicitudesUser_comunicacionesObjectPage',
            contextPath: '/solicitudesUser/comunicaciones'
        },
        CustomPageDefinitions
    );
});