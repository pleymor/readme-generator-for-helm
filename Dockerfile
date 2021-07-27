#
# Copyright 2021-2021 VMware, Inc.
# SPDX-License-Identifier: Apache-2.0
#
FROM bitnami/node:12-prod
LABEL maintainer "Bitnami <containers@bitnami.com>"

COPY . /app
WORKDIR /app
RUN npm install

FROM bitnami/node:12-prod

COPY . /app
WORKDIR /app
COPY --from=builder /app /app
WORKDIR /app

RUN ln -s /app/bin/index.js /app/bin/readme-generator

ENV PATH="/app/bin:$PATH"

CMD ["readme-generator"]
