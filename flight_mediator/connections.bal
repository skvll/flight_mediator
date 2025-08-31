import ballerina/graphql;

final graphql:Client FlightBackendCnx = check new (FlightBackendUrl);
