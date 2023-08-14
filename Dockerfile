FROM python:3.9.6-slim
WORKDIR /app/
COPY ./fastapi_app.py /app/
COPY ./predictor.py /app/
COPY ./trained-model.joblib /app/
COPY ./requirements.txt /tmp/
RUN pip install --upgrade pip
# Install the nltk package
RUN pip install nltk

# Set NLTK data path
ENV NLTK_DATA="/app/nltk_data"

# Download the required nltk data
RUN python -m nltk.downloader -d $NLTK_DATA stopwords punkt
RUN pip install --no-cache-dir --upgrade -r /tmp/requirements.txt
EXPOSE 8080
CMD ["uvicorn", "fastapi_app:app", "--host", "0.0.0.0", "--port", "8080"]
