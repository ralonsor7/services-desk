sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicesdesk/solicitudesadmin/test/integration/FirstJourney',
		'servicesdesk/solicitudesadmin/test/integration/pages/solicitudesAdminList',
		'servicesdesk/solicitudesadmin/test/integration/pages/solicitudesAdminObjectPage',
		'servicesdesk/solicitudesadmin/test/integration/pages/solicitudesAdmin_comunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, solicitudesAdminList, solicitudesAdminObjectPage, solicitudesAdmin_comunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicesdesk/solicitudesadmin') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThesolicitudesAdminList: solicitudesAdminList,
					onThesolicitudesAdminObjectPage: solicitudesAdminObjectPage,
					onThesolicitudesAdmin_comunicacionesObjectPage: solicitudesAdmin_comunicacionesObjectPage
                }
            },
            opaJourney.run
        );
    }
);