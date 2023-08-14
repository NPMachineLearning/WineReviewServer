FROM python:3.9.6-alpine
WORKDIR /app/
COPY ./fastapi_app.py /app/
COPY ./predictor.py /app/
COPY ./trained-model.joblib /app/
COPY ./requirements.txt /tmp/
EXPOSE 80
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /tmp/requirements.txt
CMD ["uvicorn", "fastapi_app:app", "--host", "0.0.0.0", "--port", "80"]
