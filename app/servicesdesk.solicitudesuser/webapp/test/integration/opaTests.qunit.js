sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'servicesdesk/solicitudesuser/test/integration/FirstJourney',
		'servicesdesk/solicitudesuser/test/integration/pages/solicitudesUserList',
		'servicesdesk/solicitudesuser/test/integration/pages/solicitudesUserObjectPage',
		'servicesdesk/solicitudesuser/test/integration/pages/solicitudesUser_comunicacionesObjectPage'
    ],
    function(JourneyRunner, opaJourney, solicitudesUserList, solicitudesUserObjectPage, solicitudesUser_comunicacionesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('servicesdesk/solicitudesuser') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThesolicitudesUserList: solicitudesUserList,
					onThesolicitudesUserObjectPage: solicitudesUserObjectPage,
					onThesolicitudesUser_comunicacionesObjectPage: solicitudesUser_comunicacionesObjectPage
                }
            },
            opaJourney.run
        );
    }
);