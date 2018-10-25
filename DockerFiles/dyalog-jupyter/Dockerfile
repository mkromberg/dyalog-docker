FROM dyalog/dyalog:17.1-dbg

RUN apt-get update && apt-get install -y locales locales-all

ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN apt-get install -y git jupyter-notebook && \
    apt-get clean && rm -Rf /var/lib/apt/lists/*

RUN git clone https://github.com/Dyalog/dyalog-jupyter-kernel.git /dyalog-jupyter-kernel
ADD kernel.py /dyalog-jupyter-kernel/dyalog_kernel/kernel.py
RUN /dyalog-jupyter-kernel/install.sh

RUN mkdir /app
RUN git clone https://github.com/Dyalog/dyalog-jupyter-notebooks.git /app/

EXPOSE 8888

ADD mapl /opt/mdyalog/17.1/64/unicode/

ADD run /
