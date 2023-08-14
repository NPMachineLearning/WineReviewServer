FROM python:3.9.6-slim
COPY ./fastapi_app.py /deploy/
COPY ./predictor.py /deploy/
COPY ./trained-model.joblib /deploy/
COPY ./requirements.txt /tmp/
WORKDIR /deploy/
EXPOSE 80
RUN pip install --no-cache-dir -r /tmp/requirements.txt
ENTRYPOINT uvicorn fastapi_app:app --host=0.0.0.0
