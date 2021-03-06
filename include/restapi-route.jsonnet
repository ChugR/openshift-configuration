{
    generate(admin)::
    {
        "kind": "Route",
        "apiVersion": "v1",
        "metadata": {
            "labels": {
              "app": "enmasse"
            },
            "name": "restapi"
        },
        "spec": {
            "path": "/v1/enmasse/addresses",
            "host": "${RESTAPI_HOSTNAME}",
            "to": {
                "kind": "Service",
                "name": if (admin) then "admin" else "restapi"
            },
            "port": {
                "targetPort": if (admin) then "restapi" else "http"
            }
        }
    }
}
