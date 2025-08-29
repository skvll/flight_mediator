import ballerina/graphql;
import ballerina/http;

final graphql:Client flightGraphQLServiceClient = check new (FlightGraphQLService);

listener http:Listener httpDefaultListener = new (HttpServicePort);

service /flight_mediator on httpDefaultListener {

    resource function get flights(
            string companyId,
            string boardPoint,
            string offPoint,
            string departureDateFrom,
            string departureDateTo
    ) returns Flights|error {

        string graphqlQuery = string `
            query GetFlights($operator: String!, $boardPoint: String!, $offPoint: String!) {
                flights(operator: $operator, boardPoint: $boardPoint, offPoint: $offPoint) {
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
        `;

        map<anydata> graphQLVariables = {
            "operator": companyId,
            "boardPoint": boardPoint,
            "offPoint": offPoint
        };

        graphql:GenericResponseWithErrors graphqlResponse = check flightGraphQLServiceClient->execute(
            document = graphqlQuery, 
            variables = graphQLVariables
        );

        record {}|map<json>? responseData = graphqlResponse.data;
        if responseData is () {
            return [];
        }

        GraphQLFlightData flightData = check responseData.cloneWithType(GraphQLFlightData);
        return flightData.flights;
    }
}