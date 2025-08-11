# Python FastAPI News Aggregator

This is a news aggregator API built with Python, FastAPI, and SQLAlchemy.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

*   Python 3.10+
*   Docker and Docker Compose
*   pip

### Installation

1.  Clone the repository:
    ```bash
    git clone
    ```

2.  Install the required Python packages:
    ```bash
    pip install -r requirements.txt
    ```

### Configuration

1.  Create a `.env` file by copying the example file:
    ```bash
    cp .env.example .env
    ```

2.  Open the `.env` file and update the environment variables with your database credentials and other settings.

### Database Migration

To set up the database schema, run the following command:

```bash
docker-compose exec python alembic upgrade head
```

## Usage

To run the application, you can use Docker Compose:

```bash
docker-compose up -d
```

The API will be available at `http://localhost:5001`.

## Running Tests

To run the test suite, use the following command:

```bash
pytest
```
