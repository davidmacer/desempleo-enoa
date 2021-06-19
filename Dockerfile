FROM islasgeci/base
WORKDIR /workdir
COPY . .
RUN R -e "install.packages(c('lintr', 'magick', 'rjson', 'styler'), repos='http://cran.rstudio.com')"
RUN R -e "devtools::install_github('gadenbuie/tweetrmd')"
RUN R -e "devtools::install_github('rstudio/webshot2')"
RUN pip install \
    black \
    clean_enoa \
    flake8
RUN apt-get update; apt-get clean
RUN apt-get install --yes x11vnc
RUN apt-get install --yes xvfb
RUN apt-get install --yes fluxbox
RUN apt-get install --yes wmctrl
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install --yes ./google-chrome-stable_current_amd64.deb
RUN apt --yes install chromium-browser
RUN sed '$d' /usr/bin/google-chrome > exit.txt
RUN echo 'exec -a "$0" "$HERE/chrome" "$@" --no-sandbox' >> exit.txt && chmod +x exit.txt
RUN mv exit.txt /opt/google/chrome/google-chrome