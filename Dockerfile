FROM python:alpine
RUN apk add --update --no-cache --virtual .build-deps gcc musl-dev 
RUN apk add --update --no-cache --virtual .build-deps ffmpeg
RUN apk del .build-deps 

RUN pip install --upgrade pip 



RUN chmod o+w /media 
RUN adduser -D yt-dlp
COPY ./yt-dlp.conf /etc/yt-dlp.conf
WORKDIR /media
USER yt-dlp
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["yt-dlp"]