FROM library/python:3.7-alpine

RUN apk update
RUN apk upgrade
RUN apk add bash

ADD test.py .

CMD ["python", "test.py"]
