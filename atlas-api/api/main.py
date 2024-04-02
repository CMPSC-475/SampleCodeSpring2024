from fastapi import FastAPI
from pydantic import BaseModel
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
    id: int
    name: str
    origin: str
    destination: str
    departure: str
    arrival: str


flights_db = [
        {
            "id": 1,
            "name": 'NL1234',
            "origin": 'JFK',
            "destination": 'LAX',
            "departure": '10:00',
            "arrival": '13:00'
        },
        {
            "id": 2,
            "name": 'NL1234',
            "origin": 'LAX',
            "destination": 'JFK',
            "departure": '14:00',
            "arrival": '17:00'
        }
    ]

@app.get("/flights")
def get_flights():
    return flights_db


@app.post("/flights")
def add_flight(flight: Flight):
    flights_db.append(flight)
    return {"message" : "add flight"} 