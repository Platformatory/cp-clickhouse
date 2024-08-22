from confluent_kafka import Producer
import json
import time
import random

# Kafka configuration
conf = {
    'bootstrap.servers': 'kafka1:9092',  # Kafka broker address
    'client.id': 'kafka-producer'
}

producer = Producer(conf)

def produce_message(topic, message):
    producer.produce(topic, key=None, value=message)
    producer.flush()

def generate_message():
    names = ["Alice", "Bob", "Charlie", "David", "Eve"]
    movies = ["Movie A", "Movie B", "Movie C", "Movie D"]
    
    name = random.choice(names)
    age = random.randint(18, 65)
    movie_name = random.choice(movies)
    number_of_tickets = random.randint(1, 10)

    message = {
        "name": name,
        "age": age,
        "movie_name": movie_name,
        "number_of_tickets": number_of_tickets
    }

    return json.dumps(message)

if __name__ == "__main__":
    topic = "movie-tickets"  # The Kafka topic to which messages will be sent

    while True:
        message = generate_message()
        print(f"Producing message: {message}")
        produce_message(topic, message)
        time.sleep(5)  # Wait for 5 seconds before producing the next message

