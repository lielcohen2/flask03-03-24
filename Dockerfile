# שלב 1: הגדר את שלב הבניה
FROM python:3.8-slim 

WORKDIR /app

COPY  . /app

RUN pip install --no-cache-dir -r requirements.txt

# הגדרת יציאה, נפח ורשת
EXPOSE 5000

# הגדר את משתני הסביבה
ENV FLASK_APP=app.py


# הרץ את האפליקציה
CMD ["flask", "run", "--host=0.0.0.0"]