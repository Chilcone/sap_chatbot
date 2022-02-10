sap.ui.define([
		"sap/ui/core/UIComponent",
		"sap/ui/Device",
		"ui5chatbot/model/models"
	],
    function (UIComponent, Device, models) {
        "use strict";

        return UIComponent.extend("ui5chatbot.Component", {
            metadata: {
                manifest: "json"
            },

            /**
             * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
             * @public
             * @override
             */
            init: function () {
                // call the base component's init function
                UIComponent.prototype.init.apply(this, arguments);

                // enable routing
                this.getRouter().initialize();

				// set the device model
				this.setModel(models.createDeviceModel(), "device");
                this.renderRecastChatbot();
            },

            /* Embedd chatbot into a webpage using Web Client CAI */
            renderRecastChatbot: function() {
                if (!document.getElementById("cai-webchat")) {
                    var s = document.createElement("script");
                    s.setAttribute("id", "cai-webchat");
                    s.setAttribute("src", "https://cdn.cai.tools.sap/webchat/webchat.js");
                    s.setAttribute("apiRoot", "https://ibsolution-dev.sapcai.eu10.hana.ondemand.com/public/api");
                    document.body.appendChild(s);
                }
                    s.setAttribute("channelId", ""); // copy from SAP CAI cockpit
                    s.setAttribute("token", ""); // copy from SAP CAI cockpit
            }
        });
    }
);