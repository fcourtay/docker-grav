docker build -t grab:latest .
docker run -v ~/git-misc/dockersite/code/:/app:rw -p 8080:80 -it grab bash