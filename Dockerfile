# שלב 1: הגדר את שלב הבניה
FROM python:3.8-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# שלב 2: העבר את קבצי הקוד לתמונה ריקה
FROM python:3.8-slim AS app_base

WORKDIR /app

COPY --from=builder /app /app

# שלב 3: הוסף את הקוד השארי
COPY . .

# הגדרת יציאה, נפח ורשת
EXPOSE 5000
VOLUME /app/data
NETWORK user_network

# הגדר את משתני הסביבה
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# הרץ את האפליקציה
CMD ["flask", "run"]
