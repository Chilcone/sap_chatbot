sap.ui.define([
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "ui5chatbot/model/models"
],

    // Section 1:  UI5 Application Component.js
    // Function 1.1: Main component of the UI5 application
    /**
     * Bootstraps the main component of an UI5 application.
     * To enable chatbot window, renderRecastChatbot() function is called. Thus, the chatbot
     * panel is visible in the lower right corner of the page immediately when the UI5 is opened.
     *
     * It is necessary to paste SAP CAI Web Client credentials in the designated places in the
     * renderRecastChatbot() function.
     *
     * @param {*} UIComponent
     * @param {*} Device
     * @param {*} models
     * @returns
     */

    function (UIComponent, Device, models) {
        "use strict";

        return UIComponent.extend("ui5chatbot.Component", {
            metadata: {
                manifest: "json"
            },

            /**
            * The component is initialized by UI5 automatically during the startup of the app and 
            *   calls the init method once.
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

            /* Embed chatbot into a webpage using Web Client CAI */
            renderRecastChatbot: function () {
                if (!document.getElementById("cai-webchat")) {
                    var s = document.createElement("script");
                    s.setAttribute("id", "cai-webchat");
                    s.setAttribute("src", "https://cdn.cai.tools.sap/webchat/webchat.js");
                    s.setAttribute("apiRoot", ""); // copy from SAP CAI cockpit
                    document.body.appendChild(s);
                }
                s.setAttribute("channelId", ""); // copy from SAP CAI cockpit
                s.setAttribute("token", ""); // copy from SAP CAI cockpit
            }
        });
    }
);



