from fastapi import FastAPI, HTTPException, Query
from pydantic import BaseModel
from typing import List
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

# Allow requests from all origins
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    allow_headers=["*"],
)

class Flight(BaseModel):
    flight_id: str
    origin: str
    destination: str
    departure: str
    arrival: str
    price: float

class BookingRequest(BaseModel):
    flight_id: int
    passenger_name: str
    passenger_email: str


flights_db = [
  {
    "id": 1,
    "flight_id": "ABC123",
    "origin": "New York (JFK)",
    "destination": "Los Angeles (LAX)",
    "departure": "2024-04-03T08:00:00",
    "arrival": "2024-04-03T11:30:00",
    "price": 200.00
  },
  {
      "id": 2,
    "flight_id": "DEF456",
    "origin": "London (LHR)",
    "destination": "Tokyo (HND)",
    "departure": "2024-04-03T13:45:00",
    "arrival": "2024-04-04T08:20:00",
    "price": 500.00
  },
  {
      "id": 3,
    "flight_id": "GHI789",
    "origin": "Dubai (DXB)",
    "destination": "Sydney (SYD)",
    "departure": "2024-04-03T22:30:00",
    "arrival": "2024-04-04T18:15:00",
    "price": 600.00
  },
  {
      "id": 4,
    "flight_id": "JKL012",
    "origin": "Paris (CDG)",
    "destination": "Singapore (SIN)",
    "departure": "2024-04-03T09:15:00",
    "arrival": "2024-04-04T03:40:00",
    "price": 400.00
  },
  {
      "id": 5,
    "flight_id": "MNO345",
    "origin": "Los Angeles (LAX)",
    "destination": "Mexico City (MEX)",
    "departure": "2024-04-03T16:30:00",
    "arrival": "2024-04-03T19:45:00",
    "price": 150.00
  },
  {
      "id": 6,
    "flight_id": "PQR678",
    "origin": "Tokyo (HND)",
    "destination": "Seoul (ICN)",
    "departure": "2024-04-03T11:00:00",
    "arrival": "2024-04-03T13:25:00",
    "price": 100.00
  }
]

booked_flights_db = []


@app.get("/flights", response_model=List[Flight])
def get_flights():
    return flights_db


@app.post("/flights")
def add_flight(flight: Flight):
    newFlight = flight.copy().dict()
    # get largest id and increment by 1
    max_id = max([flight["id"] for flight in flights_db])
    newFlight["id"] = max_id + 1
    flights_db.append(newFlight)
    return {"message" : "flight added"}


@app.post("/book-flight/", response_model=Flight)
def book_flight(booking_request: BookingRequest):
    flight_id = booking_request.flight_id
    
    # Check if the flight exists
    flight = next((flight for flight in flights_db if flight["id"] == flight_id), None)
    if flight is None:
        raise HTTPException(status_code=404, detail="Flight not found")
    else:
        booked_flights_db.append(booking_request.dict())

    # Assuming some booking logic here, e.g., sending confirmation email
    # In real-world scenario, you'd perform the actual booking process
    
    # For demonstration, let's just return the booked flight
    return flight


@app.get("/booked-flights", response_model=List[BookingRequest])
def get_booked_flights():
    return booked_flights_db