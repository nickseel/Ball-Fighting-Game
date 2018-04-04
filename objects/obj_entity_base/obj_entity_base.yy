{
    "id": "a14974b9-b32e-4932-b44b-4bb950405038",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_entity_base",
    "eventList": [
        {
            "id": "df127c1f-f24d-4e7f-872a-8835e13e7467",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "a14974b9-b32e-4932-b44b-4bb950405038"
        },
        {
            "id": "7031fc94-9582-4a39-8680-28680a0b4a13",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "a14974b9-b32e-4932-b44b-4bb950405038"
        },
        {
            "id": "8a69800f-6e5e-438f-a2cf-f2eeaddb4e1e",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 2,
            "eventtype": 3,
            "m_owner": "a14974b9-b32e-4932-b44b-4bb950405038"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "0dd46bc1-44a0-4e8a-90eb-2e8df7b949e0",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "250",
            "varName": "max_speed",
            "varType": 0
        },
        {
            "id": "afb337e7-95f3-4447-bfab-644e0dade231",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "max_speed * 8",
            "varName": "accel",
            "varType": 0
        },
        {
            "id": "be4debd1-79ad-43d4-b56f-934776049a7a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3",
            "varName": "slide",
            "varType": 0
        },
        {
            "id": "45481175-9308-4495-92b2-ec19b4f565c3",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "bounce",
            "varType": 0
        },
        {
            "id": "87a24261-6862-4c4c-9584-6caaa510b06c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "MovementState.FREE",
            "varName": "movement_state",
            "varType": 4
        },
        {
            "id": "c372cb84-73f1-48cc-b80f-1d096b7111fc",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "True",
            "varName": "player_controlled",
            "varType": 3
        },
        {
            "id": "dad2af41-b08b-41b5-8463-f9473c83f2b7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "True",
            "varName": "has_friction",
            "varType": 3
        },
        {
            "id": "72b676b2-2221-43d2-986e-0229f6af40e2",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "false",
            "varName": "collide_center",
            "varType": 3
        },
        {
            "id": "f13d8c6c-2792-4862-b34f-4bb01cdaab98",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "x_vel",
            "varType": 0
        },
        {
            "id": "116e260d-c1bb-4529-945d-5e33a494498b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "y_vel",
            "varType": 0
        },
        {
            "id": "2bbf9ccb-8a51-463e-814f-c948884c1e03",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dx",
            "varType": 0
        },
        {
            "id": "64bdbb27-e602-4a44-afb7-c3f1390afd06",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dy",
            "varType": 0
        },
        {
            "id": "28e7433b-1ff5-4342-9d1c-88c50711b40b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dx_fraction",
            "varType": 0
        },
        {
            "id": "4d80d5bd-80bf-4b2c-a711-371fc5a8c860",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dy_fraction",
            "varType": 0
        },
        {
            "id": "5baa1c0b-836b-4f44-a3f6-d8597ee5f2e4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "input_move_x",
            "varType": 0
        },
        {
            "id": "26b98ce6-02d5-4b89-b8a8-38af4212b630",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "input_move_y",
            "varType": 0
        },
        {
            "id": "55692d5a-99ff-4a43-8fa8-941865274479",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "collide_vertical",
            "varType": 1
        },
        {
            "id": "0c643d39-7fb8-481c-85e2-d15e7951b94f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "collide_horizontal",
            "varType": 1
        },
        {
            "id": "ba984628-df42-41c3-850d-85a04910175a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "health_pct",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}