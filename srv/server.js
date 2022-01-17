const cds = require("@sap/cds");
const express = require('express');

const proxy = require("@sap/cds-odata-v2-adapter-proxy"); //enable OData 2 support
cds.on("bootstrap", (app) => {
    app.use(proxy())
    app.use(express.json())

    // Here you can define as many endpoints as you want 
    // We won't need any get requests it is just for example
    app.get('/tile', (req, res) => {
        // do stuff using the req.user.id and return whatever you'd like
        res.json({
            tileType: 'sap.sf.homepage3.tiles.DynamicTile',
            properties: {
            title: 'Flashy Tile',
            subtitle: 'Best Run Company',
            numberValue: '8.67',
            numberState: 'Positive',
            numberDigits: 2,
            stateArrow: 'Up',
            numberFactor: '$',
            icon: 'sap-icon://line-chart',
            info: 'NASDAQ',
            subinfo: 'BSTR'
            }
        })
    })

    // You can directly define your endpoint here and it will be reachable directly <domain>/<endpoint>
    // You will be getting the whole chatbot memory and necessary information in the body. You can check https://help.sap.com/doc/9b639cad3d734675971ab22ed10bbf28/latest/en-US/UserGuideToConceptsOfSAPConversationalAI.pdf
    // to see response format(4.12.6 Getting Response Using Webhook)
    // 
    // You will also get the fields in requirements in the body.conversation.body.<field>
    // We have all the necessary information from CAI and just need to return in correct form. Be careful about updating memory and language.
    // See example-service.js to see how to connect to OData service and use it.
    app.post('/salesOrderWithIds', (req, res) => {
        console.log(req.body)
        const json = req.body
        console.log(json.orders)
        res.send(req.body)
    })
}) 

module.exports = cds.server