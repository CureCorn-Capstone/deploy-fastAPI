# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.11-slim

# Allow statements and log messages to immediately appear in the logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the FastAPI application will run on
EXPOSE 8000

# Start the FastAPI application
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
