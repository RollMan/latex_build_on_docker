# platex Builder on Docker

## What's This?
This builds `main.tex` following IEEE format.

## How to Use
At the first time you have to create directories on `sty/` and put depending and not-existing style files on the created directories for each style files. If necessarry (no .sty file but .dtx and .ins files), create makefiles to build the style files. Then, build and install the styles at the project root directory:

```
make styles
```

This command builds them and put the style file on where `latex` looks for. The installed style files will be removed when `make clean` executes. Then you again have to `make styles`.

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
まずはじめに依存するかつ不足するスタイルファイルを`sty/`にディレクトリを作成し設置する。必要があれば (styファイルでなくdtxファイルとinsフィアルしかなければ) そのディレクトリの中にそれらをビルドするためのMakefileを書く。

```
make styles
```

で、スタイルファイルをlatexが読み込みに行くpathへ設置する。これは`make clean`で消えるので注意。消したら再度`make styles`をする。

```
docker build . -t alpine-texlive-ja
./build.sh
```

でmain.texがビルドされる。

## 注意
日本語に対応する場合はMakefileのplatexをuplatexに置換すること。 (TODO: うまいことやる)
