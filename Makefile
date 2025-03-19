all: test

test:
	@echo "Running tests..."
	uv run pytest -v -s --cov ./unfazed_sentry --cov-report term-missing

format:
	@echo "Formatting code..."
	ruff format tests/ unfazed_sentry/
	ruff check tests/ unfazed_sentry/  --fix
	mypy --check-untyped-defs --explicit-package-bases --ignore-missing-imports tests/ unfazed_sentry/

publish:
	@echo "Publishing package..."
	uv build
	uv publish
