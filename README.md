# narou_docker_raspberry_pi
Docker image of narou.rb for raspberry pi
## Reference
##### Raspberry PI でnarou.rbのkindle(mobi)形式を作れるようにする
https://qiita.com/hirohiro77/items/13ef7354042967e352c4
##### Narou.rb Docker Image
https://github.com/whiteleaf7/narou-docker

## How to use
### docker
~~~
  docker run --rm -it -p 33000-33001:33000-33001 -v [your_novel_folder]:/novel:cached -v [your_epub_folder]:/output:cached chikiny/narou_docker_raspberry_pi
~~~
### docker-compose
~~~
version: "3.7"

services:
  app:
    image: chikiny/narou_docker_raspberry_pi
    environment:
      TZ: Asia/Tokyo
    command: ["narou", "web", "-np", "33000"]
    volumes:
      - [your_narou_folder]:/novel:cached
      - [your_epub_folder]:/output:cached
    tty: true
    stdin_open: true
    privileged: true
    ports:
      - "33000-33001:33000-33001"
~~~

## Limitation
Due to calibre problem, cannot generate vertical writing mobi file (as of now)  
So, I changed to output epub/mobi in another folder ([your_epub_folder]).  
If you want vertical writing mobi file, please copy [your_epub_folder] in your host machine (x86 or amd64) and convert them using kindlegen.  
