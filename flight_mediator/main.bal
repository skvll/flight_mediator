import ballerina/http;

listener http:Listener restListener = new (port = RestServicePort);

service /flight_mediator on restListener {
    resource function get flights(string companyId,
            string boardPoint,
            string offPoint,
            string departureDateFrom,
            string departureDateTo
        )returns RequestResponse|http:InternalServerError|error {
        do {
            FlightBackendGraphQLResponse myFlightBackendResponse = check FlightBackendCnx->execute(string `
                query {
                    flights(operator: "${companyId}", boardPoint: "${boardPoint}", offPoint: "${offPoint}") {
                        flightId
                        operator
                        status
                        departure {
                            airport
                            scheduledTime
                        }
                        arrival {
                            airport
                            scheduledTime
                        }
                    }
                }
            `);

            RequestResponse myResponse = mapFlightBackendResponse(myFlightBackendResponse);
            return myResponse;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
