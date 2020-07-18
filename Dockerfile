FROM kingdonb/docker-rvm-support:latest-oci8 AS builder

LABEL version="2.0.0"
LABEL maintainer="kingdon.b@nd.edu"
ENV RUBY=2.6.6

# Get the app Gemfile and Gemfile.lock in place
USER root
RUN chown -R ${RVM_USER} ${APPDIR}
RUN chown -R ${RVM_USER} /usr/local
USER ${RVM_USER}

# WORKDIR ${APPDIR} - this is set upstream by docker-rvm-support
COPY --chown=${RVM_USER} Gemfile Gemfile.lock .ruby-version ${APPDIR}/
COPY --chown=${RVM_USER} vendor/gems ${APPDIR}/vendor/gems
RUN  rvm ${RUBY} do bash -c 'bundle config set frozen true && bundle install'

#######################################

FROM builder AS dev
ENV RAILS_ENV development

#RUN echo 'gem: --no-document' > /home/${RVM_USER}/.gemrc && bash --login -c 'gem update'
RUN  rvm ${RUBY} do bash -c 'bundle config set with development && bundle install'
ENV PORT 3000
EXPOSE 3000
