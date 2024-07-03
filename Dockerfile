FROM ubuntu:latest

COPY . /app

WORKDIR /app

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    wget \
    perl \
    fontconfig \
    ca-certificates \
    make && \
    # Cleanup
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /tinytex && \
    wget "https://yihui.org/gh/tinytex/tools/install-unx.sh" && \
    chmod +x install-unx.sh && \
    ./install-unx.sh

ENV PATH="/root/bin:${PATH}"

RUN tlmgr install preprint enumitem ragged2e fancyhdr xifthen \
  ifmtarg setspace parskip tocloft titlesec textpos babel-english \
  isodate substr xltxtra realscripts hyphenat microtype koma-script \
  moderncv colortbl pgf multirow arydshln tabu changepage sectsty
