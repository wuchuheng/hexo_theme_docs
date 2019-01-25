FROM    node:8.2.0

#install hexo-cli
RUN     mkdir /hexo_theme_docs \
        && npm install hexo-cli@1.1.0 -g; 

#load the config of dependence
COPY    package.json /hexo_theme_docs/
COPY    yarn.lock    /hexo_theme_docs/

#install all of dependence
RUN     cd /hexo_theme_docs \
        && yarn install;

WORKDIR /hexo_theme_docs

EXPOSE 4000
EXPOSE 3001

ENTRYPOINT ["hexo", "server", "--debug"]

