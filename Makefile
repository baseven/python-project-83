PORT ?= 8000

install:
	uv sync

install-prod:
	uv sync --no-dev

dev:
	uv run flask --app page_analyzer:app --debug run --port $(PORT)

start:
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

build:
	./build.sh

render-start:
	gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

test:
	uv run pytest

test-coverage:
	uv run pytest --cov=page_analyzer --cov-report xml

lint:
	uv run ruff check page_analyzer

lint-fix:
	uv run ruff check --fix page_analyzer

check: test lint

.PHONY: install install-prod build dev start render-start test test-coverage lint lint-fix check