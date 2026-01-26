FROM python:3.13-slim

# Install system dependencies
# wget is needed to download the data, libpq-dev for postgres connection
RUN apt-get update && apt-get install -y wget libpq-dev gcc

# Install Python libraries
RUN pip install pandas sqlalchemy psycopg2 pyarrow click

# Set the working directory
WORKDIR /app

# Copy the ingestion script into the image
COPY ingest_data.py ingest_data.py

# Define what happens when the container starts
ENTRYPOINT [ "python", "ingest_data.py" ]


