FROM islasgeci/base
WORKDIR /workdir
COPY . .
RUN R -e "install.packages(c('lintr', 'rjson', 'styler'), repos='http://cran.rstudio.com')"
RUN R -e "devtools::install_github('gadenbuie/tweetrmd', upgrade=true)"
RUN R -e "devtools::install_github('rstudio/webshot2', upgrade=true)"
RUN pip install \
    black \
    clean_enoa \
    flake8