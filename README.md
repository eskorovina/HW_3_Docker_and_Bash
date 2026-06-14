# Домашняя работа 3
Проект по генерации csv файлов с данными и выдача html отчёта
# Как скопировать всё?
Надо в терминале написать:

git clone https://github.com/eskorovina/HW_3_Docker_and_Bash.git

cd HW_3_Docker_and_Bash

chmod +x run.sh

# Как запустить bash скрипт run.sh

1. ./run.sh build_generator
2. ./run.sh run_generator
3. ./run.sh build_reporter
4. ./run.sh run_reporter

Для просмотра отчётности в браузере необходимо:

1. cp data/report.html data/index.html
2. chmod 755 data/
3. ./run.sh report_server

Для прсмотра характеристик:

1. ./run.sh structure
2. ./run.sh inside_generator
3. ./run.sh inside_reporter

Удаление сгенерированной информации:

1. ./run.sh clear_data
