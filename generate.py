import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["price", "score", "remaining_quantity", "category"]

def generate_row():

    return {
        "price": round(random.uniform(5.09, 999.99), 2),
        "score": round(random.uniform(1.0, 10.0), 2),
        "remaining_quantity": random.randint(0, 500),
        "category": random.choice(["Food", "Household chemicals", "Chancellery"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)