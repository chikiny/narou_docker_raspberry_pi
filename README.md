# narou_docker_raspberry_pi
Docker image of narou.rb for raspberry pi
## Reference
##### Raspberry PI でnarou.rbのkindle(mobi)形式を作れるようにする
https://qiita.com/hirohiro77/items/13ef7354042967e352c4
##### Narou.rb Docker Image
https://github.com/whiteleaf7/narou-docker

## How to use
docker run --rm -it -p 127.0.0.1:33000-33001:33000-33001 -v [your_novel_folder]/:/novel:cached chikiny/narou_docker_raspberry_pi
