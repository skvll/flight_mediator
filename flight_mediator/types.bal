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

type Data record {|
    Flights flights;
|};

type FlightBackendGraphQLResponse record {|
    Data data;
    map<json> extensions?;
    record {}[] errors?;
|};

type RequestResponse record {|
    string api_version;
    int size;
    Flights data;
|};
