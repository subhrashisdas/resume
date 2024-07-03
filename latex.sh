docker run -v "$(pwd)":/app -w /app latex xelatex "$1";
rm -rf *.log *.aux;