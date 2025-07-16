FROM python:3.11-slim

# Set working directory
WORKDIR /code

# Install dependencies early for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Entrypoint command handled by docker-compose
