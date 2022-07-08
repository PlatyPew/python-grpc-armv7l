FROM python:3.10-slim-bullseye

RUN apt-get update && apt-get install g++ -y
RUN MAKEFLAGS="-j$(nproc)" pip install --verbose --no-cache-dir -r \
        requirements.txt --no-binary=grpcio --no-binary=grpcio-tools
RUN apt-get remove --autoremove --purge g++ -y && apt-get clean
