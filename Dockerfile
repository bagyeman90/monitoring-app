# Set the base image
FROM --platform=linux/amd64 python:3.9-slim-buster

# The working directory
WORKDIR /app

# Copy the requirements file to the directory
COPY requirements.txt .

# Install gcc and python3-dev
RUN apt-get update -y && apt-get install -y gcc python3-dev

# Run the requirements file
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application to the working directory
COPY . .

# Set an environment variable
ENV FLASK_RUN_HOST=0.0.0.0

# Expose a port
EXPOSE 5000

# Run the application
CMD ["flask", "run"]