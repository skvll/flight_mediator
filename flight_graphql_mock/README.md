# Flight GraphQL Mock Service

Mock GraphQL service for testing flight queries with simulated data.

Query Example:
```
curl -X POST http://localhost:9091/graphql \
  -H "Content-Type: application/json" \
  -d '{
    "query": "query { flights(operator: \"SkyWings Airlines\", boardPoint: \"CDG\", offPoint: \"JFK\") { flightId operator status departure { airport scheduledTime } arrival { airport scheduledTime } } }"
```

## Configuration

The service port can be configured using the `Config.toml` file:

```toml
[service]
port = 9091
```

## Service URL
- **GraphQL Endpoint**: `http://localhost:{configured_port}/graphql`
- **Default Port**: 9091 (configurable via Config.toml)

## Available Mock Data

## Disclaimer

All company names, brands, sample data, and scenarios used in this repository are purely fictitious and provided only for demonstration purposes.
Any resemblance to real companies, or data is purely coincidental.

### 1. Airlines (Operators)

| Operator | Number of Flights | Flight ID Prefix |
|----------|-------------------|------------------|
| SkyWings Airlines | 15 flights | SW |
| AeroVoyage | 16 flights | AV |
| OceanJet Airways | 20 flights | OJ |

### 2. Available Routes by Operator

#### SkyWings Airlines (European Focus)
| Departure | Arrival | Number of Flights | Example Flight ID |
|-----------|---------|-------------------|-------------------|
| CDG | JFK | 2 | SW1234, SW5678 |
| CDG | LAX | 1 | SW9012 |
| CDG | FCO | 1 | SW1357 |
| ORY | LHR | 1 | SW3456 |
| ORY | BCN | 1 | SW9753 |
| LHR | ORY | 1 | SW7890 |
| LHR | BRU | 1 | SW4681 |
| FCO | CDG | 1 | SW2468 |
| FCO | AMS | 1 | SW6803 |
| BCN | ORY | 1 | SW8642 |
| BCN | JFK | 1 | SW8025 |
| BRU | LHR | 1 | SW5792 |
| AMS | FCO | 1 | SW7914 |
| JFK | BCN | 1 | SW9136 |

#### AeroVoyage (Long-Haul International)
| Departure | Arrival | Number of Flights | Example Flight ID |
|-----------|---------|-------------------|-------------------|
| FRA | LAX | 1 | AV2468 |
| FRA | JFK | 1 | AV1357 |
| ORY | LAX | 1 | AV3691 |
| ORY | SIN | 1 | AV7035 |
| ORY | NRT | 1 | AV2479 |
| ORY | MEL | 1 | AV6813 |
| CDG | SFO | 1 | AV5813 |
| CDG | HKG | 1 | AV9257 |
| CDG | SYD | 1 | AV4691 |
| LAX | ORY | 1 | AV4702 |
| SFO | CDG | 1 | AV6924 |
| SIN | ORY | 1 | AV8146 |
| HKG | CDG | 1 | AV1368 |
| NRT | ORY | 1 | AV3580 |
| SYD | CDG | 1 | AV5702 |
| MEL | ORY | 1 | AV7924 |

#### OceanJet Airways (Asia-Pacific Focus)
| Departure | Arrival | Number of Flights | Example Flight ID |
|-----------|---------|-------------------|-------------------|
| CDG | ICN | 1 | OJ1234 |
| CDG | KUL | 1 | OJ3691 |
| CDG | DEL | 1 | OJ7035 |
| CDG | PEK | 1 | OJ2479 |
| CDG | HKG | 1 | OJ6813 |
| ORY | TPE | 1 | OJ2468 |
| ORY | BKK | 1 | OJ5813 |
| ORY | BOM | 1 | OJ9257 |
| ORY | SIN | 1 | OJ4691 |
| FXR | DXB | 1 | OJ8642 |
| FXR | JFK | 1 | OJ9753 |
| ICN | CDG | 1 | OJ5678 |
| TPE | ORY | 1 | OJ1357 |
| KUL | CDG | 1 | OJ4702 |
| BKK | ORY | 1 | OJ6924 |
| DEL | CDG | 1 | OJ8146 |
| BOM | ORY | 1 | OJ1368 |
| PEK | CDG | 1 | OJ3580 |
| SIN | ORY | 1 | OJ5702 |
| HKG | CDG | 1 | OJ7924 |

### 3. Available Airport Codes

| Code | Airport Name | City/Country |
|------|--------------|--------------|
| CDG | Charles de Gaulle | Paris, France |
| ORY | Orly | Paris, France |
| JFK | John F. Kennedy | New York, USA |
| LAX | Los Angeles International | Los Angeles, USA |
| LHR | Heathrow | London, UK |
| FCO | Leonardo da Vinci–Fiumicino | Rome, Italy |
| BCN | Barcelona–El Prat | Barcelona, Spain |
| BRU | Brussels Airport | Brussels, Belgium |
| AMS | Amsterdam Airport Schiphol | Amsterdam, Netherlands |
| SFO | San Francisco International | San Francisco, USA |
| FRA | Frankfurt am Main | Frankfurt, Germany |
| SIN | Singapore Changi | Singapore |
| HKG | Hong Kong International | Hong Kong |
| NRT | Narita International | Tokyo, Japan |
| SYD | Kingsford Smith | Sydney, Australia |
| MEL | Melbourne Airport | Melbourne, Australia |
| ICN | Incheon International | Seoul, South Korea |
| TPE | Taiwan Taoyuan International | Taipei, Taiwan |
| KUL | Kuala Lumpur International | Kuala Lumpur, Malaysia |
| BKK | Suvarnabhumi | Bangkok, Thailand |
| DEL | Indira Gandhi International | New Delhi, India |
| BOM | Chhatrapati Shivaji Maharaj International | Mumbai, India |
| PEK | Beijing Capital International | Beijing, China |
| FXR | Fictional Airport | Fictional Location |
| DXB | Dubai International | Dubai, UAE |

### 4. Available Flight Statuses

| Status | Description | Number of Occurrences |
|--------|-------------|----------------------|
| On Time | Flight on schedule | 28 |
| Delayed | Flight delayed | 11 |
| Boarding | Boarding in progress | 7 |
| Scheduled | Flight scheduled | 5 |

### 5. Complete Mock Flight List

#### SkyWings Airlines (SW) - European Focus
| Flight ID | Route | Status | Departure | Arrival |
|-----------|-------|--------|-----------|---------|
| SW1234 | CDG→JFK | On Time | 10:30 | 14:45 |
| SW5678 | CDG→JFK | Delayed | 14:20 | 18:35 |
| SW9012 | CDG→LAX | Boarding | 16:45 | 20:30 |
| SW3456 | ORY→LHR | On Time | 07:15 | 08:30 |
| SW7890 | LHR→ORY | Scheduled | 17:45 | 19:20 |
| SW2468 | FCO→CDG | On Time | 09:30 | 11:45 |
| SW1357 | CDG→FCO | Delayed | 22:15 | 00:30+1 |
| SW8642 | BCN→ORY | On Time | 11:20 | 12:35 |
| SW9753 | ORY→BCN | Boarding | 19:40 | 20:55 |
| SW4681 | LHR→BRU | On Time | 13:25 | 14:40 |
| SW5792 | BRU→LHR | Scheduled | 18:50 | 19:05 |
| SW6803 | FCO→AMS | On Time | 14:15 | 16:30 |
| SW7914 | AMS→FCO | Delayed | 21:25 | 23:40 |
| SW8025 | BCN→JFK | On Time | 15:35 | 23:50 |
| SW9136 | JFK→BCN | Boarding | 21:45 | 10:00+1 |

#### AeroVoyage (AV) - Long-Haul International
| Flight ID | Route | Status | Departure | Arrival |
|-----------|-------|--------|-----------|---------|
| AV2468 | FRA→LAX | On Time | 12:15 | 16:30 |
| AV1357 | FRA→JFK | Scheduled | 18:00 | 22:15 |
| AV3691 | ORY→LAX | On Time | 08:45 | 12:20 |
| AV4702 | LAX→ORY | Delayed | 14:30 | 09:45+1 |
| AV5813 | CDG→SFO | On Time | 11:20 | 14:35 |
| AV6924 | SFO→CDG | Boarding | 16:50 | 12:05+1 |
| AV7035 | ORY→SIN | On Time | 13:15 | 08:30+1 |
| AV8146 | SIN→ORY | Scheduled | 10:45+1 | 23:00+1 |
| AV9257 | CDG→HKG | On Time | 15:40 | 10:55+1 |
| AV1368 | HKG→CDG | Delayed | 13:10+1 | 01:25+2 |
| AV2479 | ORY→NRT | On Time | 17:25 | 21:40+1 |
| AV3580 | NRT→ORY | Boarding | 00:55+2 | 23:10+2 |
| AV4691 | CDG→SYD | On Time | 19:30 | 11:45+2 |
| AV5702 | SYD→CDG | Scheduled | 14:00+2 | 00:15+3 |
| AV6813 | ORY→MEL | On Time | 21:35 | 16:50+2 |
| AV7924 | MEL→ORY | Delayed | 19:05+2 | 08:20+3 |

#### OceanJet Airways (OJ) - Asia-Pacific Focus
| Flight ID | Route | Status | Departure | Arrival |
|-----------|-------|--------|-----------|---------|
| OJ8642 | FXR→DXB | On Time | 08:30 | 18:45 |
| OJ9753 | FXR→JFK | Delayed | 13:20 | 17:35 |
| OJ1234 | CDG→ICN | On Time | 10:15 | 05:30+1 |
| OJ5678 | ICN→CDG | Boarding | 07:45+1 | 17:00+1 |
| OJ2468 | ORY→TPE | On Time | 12:40 | 08:55+1 |
| OJ1357 | TPE→ORY | Scheduled | 11:10+1 | 23:25+1 |
| OJ3691 | CDG→KUL | On Time | 14:25 | 10:40+1 |
| OJ4702 | KUL→CDG | Delayed | 12:55+1 | 01:10+2 |
| OJ5813 | ORY→BKK | On Time | 16:30 | 12:45+1 |
| OJ6924 | BKK→ORY | Boarding | 15:00+1 | 03:15+2 |
| OJ7035 | CDG→DEL | On Time | 18:35 | 14:50+1 |
| OJ8146 | DEL→CDG | Scheduled | 17:05+1 | 05:20+2 |
| OJ9257 | ORY→BOM | On Time | 20:40 | 16:55+1 |
| OJ1368 | BOM→ORY | Delayed | 19:10+1 | 07:25+2 |
| OJ2479 | CDG→PEK | On Time | 22:45 | 19:00+1 |
| OJ3580 | PEK→CDG | Boarding | 21:15+1 | 09:30+2 |
| OJ4691 | ORY→SIN | On Time | 06:50 | 03:05+1 |
| OJ5702 | SIN→ORY | Scheduled | 05:20+1 | 17:35+1 |
| OJ6813 | CDG→HKG | On Time | 08:55 | 05:10+1 |
| OJ7924 | HKG→CDG | Delayed | 07:25+1 | 19:40+1 |
