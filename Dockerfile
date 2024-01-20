FROM python:3

LABEL "com.github.actions.name"="yapf-formatter"
LABEL "com.github.actions.description"="Run YAPF formatter for Python codes."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="gray-dark"
LABEL "repository"="https://github.com/diegovalenzuelaiturra/yapf-action.git"
LABEL "homepage"="https://github.com/diegovalenzuelaiturra/yapf-action"
LABEL "maintainer"="Diego Valenzuela Iturra <diegovalenzuelaiturra@gmail.com>"

RUN env
RUN ls -la

# upgrade pip
RUN pip install --upgrade pip

# upgrade yapf
RUN \
  if [ -z "$INPUTS_YAPF_VERSION" ]; then \
    pip install --upgrade yapf; \
  else \
    pip install "yapf==$INPUTS_YAPF_VERSION"; \
  fi

# show YAPF version
RUN echo $(yapf --version)

# adds entrypoint.sh script to the container
ADD entrypoint.sh /entrypoint.sh

# update entrypoint.sh permissions
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
