import ballerina/graphql;

type Departure record {|
    string airport;
    string scheduledTime;
|};

type Arrival record {|
    string airport;
    string scheduledTime;
|};

type FlightsItem record {|
    string flightId;
    string operator;
    string status;
    Departure departure;
    Arrival arrival;
|};

type Flights FlightsItem[];

type GraphQLFlightData record {|
    Flights flights;
|};

type GraphQLFlightResponse record {|
    GraphQLFlightData? data;
    map<json?> extensions?;
    graphql:ErrorDetail[]? errors;
|};