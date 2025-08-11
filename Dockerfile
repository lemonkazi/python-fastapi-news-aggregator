FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    unzip

WORKDIR /var/www

# Copy requirements.txt first (for better caching)
#COPY requirements.txt ./

# Copy requirements.txt first (for better caching)
#COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# CMD ["python", "app.py"]

COPY . .

# Set permissions for Laravel storage and cache directories
RUN chown -R www-data:www-data

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5001", "--reload"]
