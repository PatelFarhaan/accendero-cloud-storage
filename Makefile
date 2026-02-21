.PHONY: install run test clean docker-up docker-down create-admin

install:
	python3 -m venv venv
	. venv/bin/activate && pip install -r requirements.txt

run:
	. venv/bin/activate && python app.py

test:
	. venv/bin/activate && python -m pytest tests/

create-admin:
	. venv/bin/activate && python project/admin/admin_cred.py

docker-up:
	docker compose up -d --build

docker-down:
	docker compose down -v

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	rm -rf venv tmp/ .coverage
