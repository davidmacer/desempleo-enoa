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
# Install fluxbox.
RUN apt-get install --yes fluxbox
# Install wget.
RUN apt-get install --yes wget
# Install wmctrl.
RUN apt-get install --yes wmctrl
# Set the Chrome repo.
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Install Chrome.
RUN apt install ./google-chrome-stable_current_amd64.deb
RUN sed '$d' /usr/bin/google-chrome > exit.txt
RUN echo 'exec -a "$0" "$HERE/chrome" "$@" --no-sandbox' >> exit.txt
RUN mv exit.txt /usr/bin/google-chrome