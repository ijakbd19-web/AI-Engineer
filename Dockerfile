FROM python:3.11-slim

WORKDIR /app

# Install system dependencies if needed, and upgrade pip
RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

# Copy and install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy your script
COPY infra_guardian_railway.py .

# Run your background script
CMD ["python", "infra_guardian_railway.py"]