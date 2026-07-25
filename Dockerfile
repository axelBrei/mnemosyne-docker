FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y sqlite3 curl && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir 'mnemosyne-memory[all]'

RUN mkdir -p /data

EXPOSE 8090

ENV MNEMOSYNE_DATA_DIR=/data

CMD ["python", "-m", "mnemosyne"]
