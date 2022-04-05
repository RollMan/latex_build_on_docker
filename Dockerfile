FROM paperist/alpine-texlive-ja@sha256:8740b80015ff375df9ab904f9cda07a1f8db74ba216326eca8cddeb31e0d312e
RUN apk --no-cache update && apk --no-cache add make aspell aspell-en inkscape ghostscript

WORKDIR /fonts
RUN wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && unzip NotoSansCJKjp-hinted.zip \
    && wget -q https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
    && unzip -o NotoSerifCJKjp-hinted.zip \
    && mkdir -p /usr/share/fonts/TTF \
    && mv *.otf /usr/share/fonts/TTF \
    && rm *.zip \
    && fc-cache -f

WORKDIR /workdir
