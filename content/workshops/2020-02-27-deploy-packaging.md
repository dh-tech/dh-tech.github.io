---
title: 'Deployment, Release, and Packaging Workflows'
date: '2020-02-27'
excerpt: "On February 27, 2020, a total of 11 DHTech members met for a webinar on the topic of deployment, release, and packaging workflows. Several people described the workflows and tools they employ at their organizations followed by a lively (and interesting) discussion of questions and answers."
---

## Webinar Summary

On February 27, 2020, a total of 11 DHTech members met for a webinar on the topic of deployment, release, and packaging workflows. Several people described the workflows and tools they employ at their organizations followed by a lively (and interesting) discussion of questions and answers.

### CESSDA ERIC

First, John (supported by Matthew, Joshua, and Carsten) from CESSDA ERIC described their infrastructure setup. Their applications run on a [Kubernetes](https://kubernetes.io/)/[Docker](https://www.docker.com/) cluster on [Google Cloud](https://cloud.google.com/kubernetes-engine). Their code is hosted on Bitbucket and they have set up a [Jenkins](https://jenkins.io/) pipeline that deploys to their development, staging, and production environments. They pointed out that one of their lessons learnt has been to build one container for all environments, rather than a separate built for each environment to avoid any differences or deviations between the multiple environments and thus surprises in production that could not be reproduced in test environments.

Some of the other technologies they use are [SonarQube](https://www.sonarqube.org/) to combine test results, [Helm](https://helm.sh/) to manage their multiple Kubernetes resources, [Grafana](https://grafana.com/) with [Prometheus](https://prometheus.io/) and [Graylog](https://www.graylog.org/) for monitoring and log management, [Weblate](https://weblate.org/) for interface translations, [Nexus repository](https://www.sonatype.com/nexus-repository-oss) for artifact hosting and [HAProxy]().

Moreover, to ensure sustainability and maintainability, CESSDA ERIC requires the guidelines published [here](https://doi.org/10.5281/zenodo.2614050) to be followed by any component to be deployed on their infrastructure. One of their requirements is that any component needs to be provided as a Docker container, which can then be added to their clusters.

### Center for Digital Humanities at Princeton University

Next, Rebecca and Nick from the [Center for Digital Humanities at Princeton University](https://cdh.princeton.edu/) talked about their deployment/publishing workflow of Python/Django apps and Python packages. Their [code is hosted on GibHub](https://github.com/Princeton-CDH) and unit tests are executed using [Travis CI](https://travis-ci.org/). They use [Pa11y CI](https://github.com/pa11y/pa11y-ci) to check for accessibility issues as they develop. Their applications are manually deployed using [Ansible](https://www.ansible.com/), which they have integrated with their Slack workspace to alert them of running deployments. They also have a [few Python packages that are published on PyPI](https://pypi.org/user/cdhdevteam/).

To ensure code quality, they use [CodeFactor](https://www.codefactor.io/), which even provides them with a measurement of technical debt! They have local development environments plus staging and production environments.

### Max Planck Institute for the History of Science

Lastly, Malte briefly talked about one of their setups at the Max Planck Institute for the History of Science. They have a small and limited setup of Python/Django applications that uses uWSGI. Due to the size and scope of the applications and thanks to uWSGI, they do manual deploys by pulling specific branches that are easy to handle. uWSGI is run in emperor mode as a service, such that rebooting the server is no problem, cf. Tutorial [here](https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-16-04).

Robert from the Max Planck Institute for the History of Science mentioned that they also used GitLab and GitLab CI for some applications.

### Digital Innovation Group

Julia from the Digital Innovation Group at Arizona State University briefly stated that their workflows include GitHub and Jenkins, and for Python apps Docker containers.

### King's Digital Lab

The King's Digital Lab, for historical reasons, hosts a variety of projects based around different technologies: Java web projects, TEI projects, and Python/Django projects. For quite a while now they have been standardising their technology stack and most of the recent and new projects are built with Python/Django, Foundation for UI, and Vue.js for certain frontend functionality.

They have their own VMWare based infrastructure for hosting the projects, but that may change in the future. Each project has at most 3 instances, dev, staging and live. They use [Vagrant](https://www.vagrantup.com/) for local development.

King’s Digital Lab mostly uses [GitHub](https://github.com/kingsdigitallab/) for source control, but they also have some projects in [Gitlab](https://gitlab.com/kingsdigitallab/), when they need more control over the CI pipeline or for private repositories. For continuous integration they use both Travis and Gitlab CI. The projects are deployed manually using a [Fabric](http://www.fabfile.org/) script.

They make use of a startup configuration to start new projects to ensure they all follow the same guidelines that can be found [here](https://github.com/kingsdigitallab/django-bare-bones).

To increase security and maintainability they are moving to a Docker based stack, and using [Cookiecutter Django fork](https://gitlab.com/kingsdigitallab/cookiecutter-django) for new projects, and some of the above will have to change, but for now this is still very much work in progress.

### Conclusion

In summary it can be said that (not very surprisingly) there seem to be many different deployment/publishing setups that are specific to the individual infrastructures. While some run their services exclusively in the cloud, others customized their workflows to the available organizational infrastructures and requirements. It might also be worth noting that in many cases, developers are also responsible for the deployment processes, which might have an influence on how these deployment processes are designed.
