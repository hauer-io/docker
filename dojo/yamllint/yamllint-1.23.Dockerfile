FROM hauer/dojo:python3

COPY config /home/dojo/.config/yamllint/config
ENV YAMLLINT_VERSION 1.23.0
RUN pip install yamllint==$YAMLLINT_VERSION