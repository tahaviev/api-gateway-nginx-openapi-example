FROM node:14.15.0 as builder
RUN npm install openapi-merge-cli@1.1.25 --global
COPY openapi-service1.yml openapi-service1.yml
COPY openapi-service2.yml openapi-service2.yml
COPY openapi-merge.json openapi-merge.json
RUN openapi-merge-cli

FROM swaggerapi/swagger-ui:v3.41.1
COPY --from=builder /full.json /app/swagger.json
