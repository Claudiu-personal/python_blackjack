#!/usr/bin/env bash
set -e

echo "Starting game runner..."

# Lista de nume comune pentru fișierul principal
candidates=("main.py" "app.py" "joc.py" "game.py")

for f in "${candidates[@]}"; do
  if [ -f "$f" ]; then
    echo "Found $f — running with python3"
    python3 "$f"
    exit 0
  fi
done

# Daca nu a fost gasit niciunul din numele comune, ruleaza primul .py din folder (daca exista)
first_py=$(ls *.py 2>/dev/null | head -n 1 || true)

if [ -n "$first_py" ]; then
  echo "Found $first_py — running with python3"
  python3 "$first_py"
  exit 0
fi

echo "No Python file found to run. Adaugă fișierul jocului (de ex. main.py sau joc.py) în repo."
exit 1
