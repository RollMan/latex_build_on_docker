# platex Builder on Docker

## What's This?
This builds `main.tex` following IEEE format.

## How to Use
To build `main.tex`:
```
docker build . -t alpine-texlive-ja
./build.sh
```

## Note
Replace `platex` in `Makefile` to support Japanese. (TODO: change this feature into better one)

## 概要
IEEEに準拠してmain.texをビルドします。

## 使いかた
```
docker build . -t alpine-texlive-ja
./build.sh
```

でmain.texがビルドされる。

## 注意
日本語に対応する場合はMakefileのplatexをuplatexに置換すること。 (TODO: うまいことやる)
