sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicesdesk/tipossolicitud/test/integration/FirstJourney',
		'servicesdesk/tipossolicitud/test/integration/pages/tipo_solicitudList',
		'servicesdesk/tipossolicitud/test/integration/pages/tipo_solicitudObjectPage'
    ],
    function(JourneyRunner, opaJourney, tipo_solicitudList, tipo_solicitudObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicesdesk/tipossolicitud') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThetipo_solicitudList: tipo_solicitudList,
					onThetipo_solicitudObjectPage: tipo_solicitudObjectPage
                }
            },
            opaJourney.run
        );
    }
);