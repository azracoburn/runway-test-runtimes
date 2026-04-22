# ── Frontend build ────────────────────────────────────────────────────────────
FROM node:20-alpine AS frontend
WORKDIR /app/frontend
COPY package.json .
RUN npm install
COPY src/ ./src/

# ── Backend ───────────────────────────────────────────────────────────────────
FROM python:3.12-slim AS backend
WORKDIR /app/backend
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY api/ ./api/

CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
