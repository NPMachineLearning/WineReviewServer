FROM python:3.9.6-slim

# Set the working directory to /app/
WORKDIR /app/

# Copy the necessary files to /app/
COPY ./fastapi_app.py /app/
COPY ./predictor.py /app/
COPY ./trained-model.joblib /app/
COPY ./requirements.txt /tmp/

# Upgrade pip
RUN pip install --upgrade pip

# Install the nltk package and set NLTK data path
RUN pip install nltk && \
    python -m nltk.downloader -d $NLTK_DATA stopwords punkt

# Install the required packages from requirements.txt
RUN pip install --no-cache-dir --upgrade -r /tmp/requirements.txt

# Expose port 8080
EXPOSE 8080

# Set the command for running the FastAPI app
CMD ["uvicorn", "fastapi_app:app", "--host", "0.0.0.0", "--port", "8080"]