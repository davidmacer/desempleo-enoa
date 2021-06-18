FROM islasgeci/base
WORKDIR /workdir
COPY . .
RUN R -e "install.packages(c('lintr', 'rjson', 'styler'), repos='http://cran.rstudio.com')"
RUN R -e "install.packages('magick')"
RUN R -e "devtools::install_github('gadenbuie/tweetrmd')"
RUN R -e "devtools::install_github('rstudio/webshot2')"
RUN pip install \
    black \
    clean_enoa \
    flake8