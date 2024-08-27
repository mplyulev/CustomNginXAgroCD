# Nebula Lobby

### The Imaged is used to serve static assets of [lobby app from nebula-monorepo](https://git.corp-apps.com/local/projects/NBL/repos/nebula-monorepo/browse/apps/lobby)

## Overview

This repository houses the Maven configuration for the Nebula Lobby, specifically tailored for internal Docker environments to facilitate our continuous integration and development processes.

## Parent Configuration

This project is based on the `docker-common-parent` with version `2.5`, ensuring consistent usage of core Docker settings across projects.

## Prerequisites

- Maven 3.6.0 or later
- Docker 19.03 or later
- Authorized access to internal Maven and NPM repositories

## Configuration

Significant properties include:

- Node.js version: `20`
- NPM version: `10.3.0`
- PNPM version: `8.9.0`
- Use of Maven resources, Fabric8, and other Docker-related plugins during the build.

## Building the Image

Execute the following command to build the Docker image:

```bash
mvn clean install
