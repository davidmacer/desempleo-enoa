FROM islasgeci/base
WORKDIR /workdir
COPY . .
RUN R -e "install.packages(c('lintr', 'rjson', 'styler'), repos='http://cran.rstudio.com')"
RUN pip install \
    black \
    clean_enoa \
    flake8