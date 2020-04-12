FROM hasura/graphql-engine:v1.1.1

COPY ./run.sh /bin/run.sh
ENV SERVER localhost
CMD run.sh ${SERVER} 5432