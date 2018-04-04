{
    "id": "ac0b6dfd-243f-4196-ba2a-60ad76df7372",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_orb",
    "eventList": [
        {
            "id": "346ed451-7648-4c42-954e-24e3016b255e",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "ac0b6dfd-243f-4196-ba2a-60ad76df7372"
        },
        {
            "id": "7cd65753-17f8-45a3-8521-f070cbf462db",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "ac0b6dfd-243f-4196-ba2a-60ad76df7372"
        },
        {
            "id": "0a7e08c9-2075-494c-a14c-e1ee696da348",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 2,
            "eventtype": 3,
            "m_owner": "ac0b6dfd-243f-4196-ba2a-60ad76df7372"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": [
        {
            "id": "e9c5e5ee-8493-4ce8-8dee-635b6ea99e20",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "a14974b9-b32e-4932-b44b-4bb950405038",
            "propertyId": "45481175-9308-4495-92b2-ec19b4f565c3",
            "value": "0.2"
        }
    ],
    "parentObjectId": "a14974b9-b32e-4932-b44b-4bb950405038",
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
            "id": "29fdc7f8-ae7f-4f83-82be-0d2f7dfa15b6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "noone",
            "varName": "controller",
            "varType": 4
        },
        {
            "id": "7cafb820-733d-43fa-84ec-b55f0ac8184b",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "OrbMovementState.ORBITING",
            "varName": "orb_movement_state",
            "varType": 4
        },
        {
            "id": "46393898-7cf1-4874-af06-2bf35537e110",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "orb_index",
            "varType": 1
        },
        {
            "id": "0fde9c35-427f-486d-9adc-c4161e59658c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "",
            "varName": "movement_data",
            "varType": 6
        },
        {
            "id": "8a63f8b2-a4fa-4c49-ad9d-502a47d93cec",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "orbiting_angle",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "9547b967-a80f-4b2b-8981-1c33222bc8a0",
    "visible": true
}