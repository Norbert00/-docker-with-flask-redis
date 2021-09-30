# Variabel with image version
ARG PYTHON_VERSION=3.7-alpine

# Base image with specified version
FROM python:${PYTHON_VERSION}

# Copy requirements file to target directory
COPY requirements.txt .

# Install dependencies from requirements file
RUN pip install -r requirements.txt

# Copy all file from source to target directory
COPY . .

# Running the application command
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "main:app"]


