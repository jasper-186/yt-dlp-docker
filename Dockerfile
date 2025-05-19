FROM python:alpine
RUN apk add --update --no-cache gcc musl-dev 
RUN apk add --update --no-cache ffmpeg

RUN pip install --upgrade pip 

RUN chmod o+w /media 
RUN adduser -D yt-dlp
COPY ./yt-dlp.conf /etc/yt-dlp.conf
WORKDIR /media
USER yt-dlp
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["/home/yt-dlp/.local/bin/yt-dlp"]