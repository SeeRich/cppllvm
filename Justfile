default:
    just --list

docker-build:
    docker build --progress=plain -t cppllvm:latest . 2>&1 | tee build.log

docker-run:
    docker run --rm -it cppllvm:latest

docker-push tagname:
    @docker tag cppllvm:latest seerich/cpp-llvm:{{tagname}}
    @docker push seerich/cpp-llvm:{{tagname}}