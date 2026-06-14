#!/bin/bash

DATA_DIR="$(pwd)/data"
LOCAL_DATA_DIR="$(pwd)/local_data"

build_generator() {
    docker build -t my_generator -f Dockerfile.generator .
}

run_generator() {
    docker run --rm -v "$DATA_DIR":/data my_generator
}

build_reporter() {
    docker build -t my_reporter -f Dockerfile.reporter .
}

run_reporter() {
    docker run --rm -v "$DATA_DIR":/data my_reporter
}

structure() {
    find . -not -path './.git/*' | sed 's|\./||' | sort
}

clear_data() {
    rm -f data/*.csv data/*.html
    echo "Папка data/ очищена"
}

inside_generator() {
    docker run --rm -v "$DATA_DIR":/data my_generator ls -la /data
}

inside_reporter() {
    docker run --rm -v "$DATA_DIR":/data my_reporter ls -la /data
}

create_local_data() {

    mkdir -p "$LOCAL_DATA_DIR"
    python3 generate.py "$LOCAL_DATA_DIR"
}

report_server() {
    docker run --rm -v "$DATA_DIR":/usr/share/nginx/html:ro -p 8080:80 nginx:alpine
}

case "$1" in
    build_generator)
        build_generator;;
    run_generator)
        run_generator;;
    build_reporter)
        build_reporter;;
    run_reporter)
        run_reporter;;
    structure)
        structure;;
    clear_data)
        clear_data;;
    inside_generator)
        inside_generator;;
    inside_reporter)
        inside_reporter;;
    create_local_data)
        create_local_data;;
    report_server)
        report_server;;
    *)

    echo "Доступные команды: build_generator, run_generator, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter, create_local_data, report_server"
    exit 1
        ;;
esac