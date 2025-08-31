function mapFlightBackendResponse(FlightBackendGraphQLResponse myFlights) returns RequestResponse => {
    api_version: "1.0",
    size: myFlights.data.flights.length(),
    data: myFlights.data.flights
};
