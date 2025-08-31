import ballerina/graphql;

// Configurable port for the GraphQL service
configurable int servicePort = 9091;

listener graphql:Listener mockGraphqlListener = new (servicePort);

// Mock GraphQL service for testing
service /graphql on mockGraphqlListener {

    resource function get flights(string operator, string boardPoint, string offPoint) returns FlightsItem[] {
        return getFlightsByRoute(operator = operator, boardPoint = boardPoint, offPoint = offPoint);
    }
}

function getFlightsByRoute(string operator, string boardPoint, string offPoint) returns FlightsItem[] {
    FlightsItem[] allFlights = getAllMockFlights();
    FlightsItem[] filteredFlights = [];

    foreach FlightsItem flight in allFlights {
        if flight.operator == operator && 
           flight.departure.airport == boardPoint && 
           flight.arrival.airport == offPoint {
            filteredFlights.push(flight);
        }
    }

    return filteredFlights;
}

function getAllMockFlights() returns FlightsItem[] {
    return [
        // SkyWings Airlines flights - European focus
        {
            flightId: "SW1234",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T10:30:00Z"
            },
            arrival: {
                airport: "JFK",
                scheduledTime: "2024-01-15T14:45:00Z"
            }
        },
        {
            flightId: "SW5678",
            operator: "SkyWings Airlines",
            status: "Delayed",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T14:20:00Z"
            },
            arrival: {
                airport: "JFK",
                scheduledTime: "2024-01-15T18:35:00Z"
            }
        },
        {
            flightId: "SW9012",
            operator: "SkyWings Airlines",
            status: "Boarding",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T16:45:00Z"
            },
            arrival: {
                airport: "LAX",
                scheduledTime: "2024-01-15T20:30:00Z"
            }
        },
        {
            flightId: "SW3456",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T07:15:00Z"
            },
            arrival: {
                airport: "LHR",
                scheduledTime: "2024-01-15T08:30:00Z"
            }
        },
        {
            flightId: "SW7890",
            operator: "SkyWings Airlines",
            status: "Scheduled",
            departure: {
                airport: "LHR",
                scheduledTime: "2024-01-15T17:45:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-15T19:20:00Z"
            }
        },
        {
            flightId: "SW2468",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "FCO",
                scheduledTime: "2024-01-15T09:30:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-15T11:45:00Z"
            }
        },
        {
            flightId: "SW1357",
            operator: "SkyWings Airlines",
            status: "Delayed",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T22:15:00Z"
            },
            arrival: {
                airport: "FCO",
                scheduledTime: "2024-01-16T00:30:00Z"
            }
        },
        {
            flightId: "SW8642",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "BCN",
                scheduledTime: "2024-01-15T11:20:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-15T12:35:00Z"
            }
        },
        {
            flightId: "SW9753",
            operator: "SkyWings Airlines",
            status: "Boarding",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T19:40:00Z"
            },
            arrival: {
                airport: "BCN",
                scheduledTime: "2024-01-15T20:55:00Z"
            }
        },
        {
            flightId: "SW4681",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "LHR",
                scheduledTime: "2024-01-15T13:25:00Z"
            },
            arrival: {
                airport: "BRU",
                scheduledTime: "2024-01-15T14:40:00Z"
            }
        },
        {
            flightId: "SW5792",
            operator: "SkyWings Airlines",
            status: "Scheduled",
            departure: {
                airport: "BRU",
                scheduledTime: "2024-01-15T18:50:00Z"
            },
            arrival: {
                airport: "LHR",
                scheduledTime: "2024-01-15T19:05:00Z"
            }
        },
        {
            flightId: "SW6803",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "FCO",
                scheduledTime: "2024-01-15T14:15:00Z"
            },
            arrival: {
                airport: "AMS",
                scheduledTime: "2024-01-15T16:30:00Z"
            }
        },
        {
            flightId: "SW7914",
            operator: "SkyWings Airlines",
            status: "Delayed",
            departure: {
                airport: "AMS",
                scheduledTime: "2024-01-15T21:25:00Z"
            },
            arrival: {
                airport: "FCO",
                scheduledTime: "2024-01-15T23:40:00Z"
            }
        },
        {
            flightId: "SW8025",
            operator: "SkyWings Airlines",
            status: "On Time",
            departure: {
                airport: "BCN",
                scheduledTime: "2024-01-15T15:35:00Z"
            },
            arrival: {
                airport: "JFK",
                scheduledTime: "2024-01-15T23:50:00Z"
            }
        },
        {
            flightId: "SW9136",
            operator: "SkyWings Airlines",
            status: "Boarding",
            departure: {
                airport: "JFK",
                scheduledTime: "2024-01-15T21:45:00Z"
            },
            arrival: {
                airport: "BCN",
                scheduledTime: "2024-01-16T10:00:00Z"
            }
        },

        // AeroVoyage flights - Updated with international destinations
        {
            flightId: "AV2468",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "FRA",
                scheduledTime: "2024-01-15T12:15:00Z"
            },
            arrival: {
                airport: "LAX",
                scheduledTime: "2024-01-15T16:30:00Z"
            }
        },
        {
            flightId: "AV1357",
            operator: "AeroVoyage",
            status: "Scheduled",
            departure: {
                airport: "FRA",
                scheduledTime: "2024-01-15T18:00:00Z"
            },
            arrival: {
                airport: "JFK",
                scheduledTime: "2024-01-15T22:15:00Z"
            }
        },
        {
            flightId: "AV3691",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T08:45:00Z"
            },
            arrival: {
                airport: "LAX",
                scheduledTime: "2024-01-15T12:20:00Z"
            }
        },
        {
            flightId: "AV4702",
            operator: "AeroVoyage",
            status: "Delayed",
            departure: {
                airport: "LAX",
                scheduledTime: "2024-01-15T14:30:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-16T09:45:00Z"
            }
        },
        {
            flightId: "AV5813",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T11:20:00Z"
            },
            arrival: {
                airport: "SFO",
                scheduledTime: "2024-01-15T14:35:00Z"
            }
        },
        {
            flightId: "AV6924",
            operator: "AeroVoyage",
            status: "Boarding",
            departure: {
                airport: "SFO",
                scheduledTime: "2024-01-15T16:50:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-16T12:05:00Z"
            }
        },
        {
            flightId: "AV7035",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T13:15:00Z"
            },
            arrival: {
                airport: "SIN",
                scheduledTime: "2024-01-16T08:30:00Z"
            }
        },
        {
            flightId: "AV8146",
            operator: "AeroVoyage",
            status: "Scheduled",
            departure: {
                airport: "SIN",
                scheduledTime: "2024-01-16T10:45:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-16T23:00:00Z"
            }
        },
        {
            flightId: "AV9257",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T15:40:00Z"
            },
            arrival: {
                airport: "HKG",
                scheduledTime: "2024-01-16T10:55:00Z"
            }
        },
        {
            flightId: "AV1368",
            operator: "AeroVoyage",
            status: "Delayed",
            departure: {
                airport: "HKG",
                scheduledTime: "2024-01-16T13:10:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-17T01:25:00Z"
            }
        },
        {
            flightId: "AV2479",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T17:25:00Z"
            },
            arrival: {
                airport: "NRT",
                scheduledTime: "2024-01-16T21:40:00Z"
            }
        },
        {
            flightId: "AV3580",
            operator: "AeroVoyage",
            status: "Boarding",
            departure: {
                airport: "NRT",
                scheduledTime: "2024-01-17T00:55:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-17T23:10:00Z"
            }
        },
        {
            flightId: "AV4691",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T19:30:00Z"
            },
            arrival: {
                airport: "SYD",
                scheduledTime: "2024-01-17T11:45:00Z"
            }
        },
        {
            flightId: "AV5702",
            operator: "AeroVoyage",
            status: "Scheduled",
            departure: {
                airport: "SYD",
                scheduledTime: "2024-01-17T14:00:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-18T00:15:00Z"
            }
        },
        {
            flightId: "AV6813",
            operator: "AeroVoyage",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T21:35:00Z"
            },
            arrival: {
                airport: "MEL",
                scheduledTime: "2024-01-17T16:50:00Z"
            }
        },
        {
            flightId: "AV7924",
            operator: "AeroVoyage",
            status: "Delayed",
            departure: {
                airport: "MEL",
                scheduledTime: "2024-01-17T19:05:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-18T08:20:00Z"
            }
        },

        // OceanJet Airways flights - Updated with Asian destinations
        {
            flightId: "OJ8642",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "FXR",
                scheduledTime: "2024-01-15T08:30:00Z"
            },
            arrival: {
                airport: "DXB",
                scheduledTime: "2024-01-15T18:45:00Z"
            }
        },
        {
            flightId: "OJ9753",
            operator: "OceanJet Airways",
            status: "Delayed",
            departure: {
                airport: "FXR",
                scheduledTime: "2024-01-15T13:20:00Z"
            },
            arrival: {
                airport: "JFK",
                scheduledTime: "2024-01-15T17:35:00Z"
            }
        },
        {
            flightId: "OJ1234",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T10:15:00Z"
            },
            arrival: {
                airport: "ICN",
                scheduledTime: "2024-01-16T05:30:00Z"
            }
        },
        {
            flightId: "OJ5678",
            operator: "OceanJet Airways",
            status: "Boarding",
            departure: {
                airport: "ICN",
                scheduledTime: "2024-01-16T07:45:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-16T17:00:00Z"
            }
        },
        {
            flightId: "OJ2468",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T12:40:00Z"
            },
            arrival: {
                airport: "TPE",
                scheduledTime: "2024-01-16T08:55:00Z"
            }
        },
        {
            flightId: "OJ1357",
            operator: "OceanJet Airways",
            status: "Scheduled",
            departure: {
                airport: "TPE",
                scheduledTime: "2024-01-16T11:10:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-16T23:25:00Z"
            }
        },
        {
            flightId: "OJ3691",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T14:25:00Z"
            },
            arrival: {
                airport: "KUL",
                scheduledTime: "2024-01-16T10:40:00Z"
            }
        },
        {
            flightId: "OJ4702",
            operator: "OceanJet Airways",
            status: "Delayed",
            departure: {
                airport: "KUL",
                scheduledTime: "2024-01-16T12:55:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-17T01:10:00Z"
            }
        },
        {
            flightId: "OJ5813",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T16:30:00Z"
            },
            arrival: {
                airport: "BKK",
                scheduledTime: "2024-01-16T12:45:00Z"
            }
        },
        {
            flightId: "OJ6924",
            operator: "OceanJet Airways",
            status: "Boarding",
            departure: {
                airport: "BKK",
                scheduledTime: "2024-01-16T15:00:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-17T03:15:00Z"
            }
        },
        {
            flightId: "OJ7035",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T18:35:00Z"
            },
            arrival: {
                airport: "DEL",
                scheduledTime: "2024-01-16T14:50:00Z"
            }
        },
        {
            flightId: "OJ8146",
            operator: "OceanJet Airways",
            status: "Scheduled",
            departure: {
                airport: "DEL",
                scheduledTime: "2024-01-16T17:05:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-17T05:20:00Z"
            }
        },
        {
            flightId: "OJ9257",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T20:40:00Z"
            },
            arrival: {
                airport: "BOM",
                scheduledTime: "2024-01-16T16:55:00Z"
            }
        },
        {
            flightId: "OJ1368",
            operator: "OceanJet Airways",
            status: "Delayed",
            departure: {
                airport: "BOM",
                scheduledTime: "2024-01-16T19:10:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-17T07:25:00Z"
            }
        },
        {
            flightId: "OJ2479",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T22:45:00Z"
            },
            arrival: {
                airport: "PEK",
                scheduledTime: "2024-01-16T19:00:00Z"
            }
        },
        {
            flightId: "OJ3580",
            operator: "OceanJet Airways",
            status: "Boarding",
            departure: {
                airport: "PEK",
                scheduledTime: "2024-01-16T21:15:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-17T09:30:00Z"
            }
        },
        {
            flightId: "OJ4691",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "ORY",
                scheduledTime: "2024-01-15T06:50:00Z"
            },
            arrival: {
                airport: "SIN",
                scheduledTime: "2024-01-16T03:05:00Z"
            }
        },
        {
            flightId: "OJ5702",
            operator: "OceanJet Airways",
            status: "Scheduled",
            departure: {
                airport: "SIN",
                scheduledTime: "2024-01-16T05:20:00Z"
            },
            arrival: {
                airport: "ORY",
                scheduledTime: "2024-01-16T17:35:00Z"
            }
        },
        {
            flightId: "OJ6813",
            operator: "OceanJet Airways",
            status: "On Time",
            departure: {
                airport: "CDG",
                scheduledTime: "2024-01-15T08:55:00Z"
            },
            arrival: {
                airport: "HKG",
                scheduledTime: "2024-01-16T05:10:00Z"
            }
        },
        {
            flightId: "OJ7924",
            operator: "OceanJet Airways",
            status: "Delayed",
            departure: {
                airport: "HKG",
                scheduledTime: "2024-01-16T07:25:00Z"
            },
            arrival: {
                airport: "CDG",
                scheduledTime: "2024-01-16T19:40:00Z"
            }
        }
    ];
}