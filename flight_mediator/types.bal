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