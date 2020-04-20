Airlock microgateway
============

Web Application firewall (WAF) as a container to protect other containers.

## Adding the Repository

To add the chart repository:

```console
helm repo add airlock https://libuweber.github.io/microgateway/
```

## Installing the Chart

To install the chart with the release name `airlock-waf`:

```console
helm upgrade -i airlock-waf airlock/microgateway
```

## Uninstalling the Chart

To uninstall the chart with the release name `airlock-waf`:

```console
helm uninstall airlock-waf
```

## DSL Methodes
### Default DSL
The Helm chart provides a simple configuration which can be configured with `config.default.*` parameters.

### Custom DSL
In case that the default config is not sufficient, create a custom config using `config.dsl.*`. All the configuration of the DSL can be used.

## Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | string | `nil` | Assign custom [affinity rules](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/) (multiline string) |
| commonLabels | object | `{}` | Labels to apply to all resources |
| config.IPHeader.header | string | `"X-Forwarded-For"` | Header from which to read the client IP |
| config.IPHeader.trustedProxies | list | `[]` | IP networkds which to trust to set the header (load balancers). Required for the IPHeader configuration. |
| config.apps | list | `[]` | Custom apps definition (YAML array). Overwrites default apps of this chart |
| config.default.backend.hostname | string | `"backend-service"` | Backend Hostname |
| config.default.backend.port | int | `8080` | Backend Port |
| config.default.backend.protocol | string | `"http"` | Backend Protocol |
| config.default.mapping.denyRules.enabled | bool | `true` | If deny rules should be enabled |
| config.default.mapping.denyRules.level | string | `"standard"` | Deny rule level (`basic`, `standard`, `strict`) |
| config.default.mapping.denyRules.logOnly | bool | `false` | Deny rule log only |
| config.default.mapping.entryPath | string | `"/"` | The `entry_path` for this app |
| config.default.mapping.operationalMode | string | `"production"` | Specifies the operational mode of this mapping (`production`, `integration`) |
| config.default.mapping.sessionHandling | string | `""` | Session handling for this app. If redis enabled this value is `enforce_session`, if redis disabled false this value is `ignore_session`. |
| config.dsl | object | `{}` | Custom DSL to load (YAML). Overwrites all defaults of this chart |
| config.env | list | `[]` | List of environment variables (YAML array) |
| config.existingSecret | string | `nil` | An existing secret to be used, must contain the keys `license` and `passphrase` |
| config.expert.apache | string | `nil` | Expert settings for Apache (multiline string) |
| config.expert.security_gate | string | `nil` | Expert settings for security gateway (multiline string) |
| config.license | string | `nil` | License for the Microgateway (multiline string) |
| config.logLevel | string | `"info"` |  |
| config.passphrase | string | `nil` | Encryption passphrase used for the session. A random one is generated on each upgrade if not specified here or in `config.existingSecret` |
| config.redisService | string | `"redis-master"` | Redis service hostname |
| config.tlsSecretName | string | `nil` | Name of an existing secret containing the TLS key, certificate and CA for the Microgateway. Needs the keys `tls.crt`, `tls.key` and `ca.crt`. Make sure to update `route.tls.destinationCACertificate` accordingly, if used |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"docker.ergon.ch/airlock/microgateway"` | Pull policy (`Always`, `IfNotPresent`, `Never`) |
| image.tag | string | `"7.4.sprint10_Build008"` |  |
| imagePullSecrets | list | `[]` | Reference to one or more secrets to be used when pulling images |
| ingress.annotations | object | `{"nginx.ingress.kubernetes.io/rewrite-target":"/"}` | Annotations to set on the ingress |
| ingress.enabled | bool | `false` | If an ingress should be created |
| ingress.hosts | list | `["chart-example.local"]` | List of host names |
| ingress.labels | object | `{}` | Labels to set on the ingress |
| ingress.path | string | `"/"` | Path the ingress serves |
| ingress.targetPort | string | `"http"` | Target port of the service (`http`, `https` or number) |
| ingress.tls | list | `[]` | [Ingress TLS](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) configuration (YAML array) |
| livenessProbe.enabled | bool | `true` | Enable liveness probes |
| livenessProbe.initialDelaySeconds | int | `90` | Initial delay in seconds |
| nameOverride | string | `""` | Provide a name in place of `microgateway` |
| nodeSelector | object | `{}` | Define which nodes the pods are scheduled on (YAML) |
| podSecurityContext | object | `{}` | Security context for the pods (see [link](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod)) |
| readinessProbe.enabled | bool | `true` | Enable readiness probes |
| readinessProbe.initialDelaySeconds | int | `30` | Initial delay in seconds |
| redis.cluster.enabled | bool | `true` |  |
| redis.enabled | bool | `false` | If true, the Redis chart will be installed. See [Redis chart](https://github.com/bitnami/charts/tree/master/bitnami/redis) for further documentation and available parameters |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.image.repository | string | `"redis"` |  |
| redis.image.tag | string | `"5.0.8"` |  |
| redis.master.command | string | `"redis-server"` |  |
| redis.master.disableCommands[0] | string | `"FLUSHDB"` |  |
| redis.persistence.enabled | bool | `false` |  |
| redis.securityContext.fsGroup | int | `1000140000` |  |
| redis.securityContext.runAsUser | int | `1000140000` |  |
| redis.slave.command | string | `"redis-server"` |  |
| redis.usePassword | bool | `false` |  |
| replicaCount | int | `1` | Desired number of Microgateway pods |
| resources | object | `{}` | [Resource limits](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#resource-requests-and-limits-of-pod-and-container) for Microgateway |
| route.annotations | object | `{}` | Annotations to set on the route |
| route.enabled | bool | `false` | If a route should be created |
| route.hosts | list | `["chart-example.local"]` |  List of host names |
| route.labels | object | `{}` | Labels to set on the route |
| route.path | string | `"/"` | Path the route serves |
| route.targetPort | string | `"https"` | Target port of the service (`http`, `https` or number) |
| route.tls.certificate | string | `nil` | Certificate to be used (multiline string) |
| route.tls.destinationCACertificate | string | Microgateway default certificate | Backend CA to trust with termination `reencrypt` (multiline string) |
| route.tls.enabled | bool | `true` | Enable TLS for the route |
| route.tls.insecureEdgeTerminationPolicy | string | `"Redirect"` | Define the insecureEdgeTerminationPolicy of the route (`Allow`, `Redirect`, `None`) |
| route.tls.key | string | `nil` | Private key to be used for certificate (multiline string) |
| route.tls.termination | string | `"reencrypt"` | Termination of the route (`edge`, `reencrypt`, `passthrough`) |
| securityContext | object | `{}` | Security context for the microgateway container (see [link](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container)) |
| service.annotations | object | `{}` | Annotations to set on the service |
| service.labels | object | `{}` | Labels to set on the service |
| service.port | int | `80` | Service port |
| service.tlsPort | int | `443` | Service TLS port |
| service.type | string | `"ClusterIP"` | [Service type](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types) |
| tolerations | list | `[]` | Tolerations for use with node [taints](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) (YAML array) |

## Chart dependencies
The helm chart has optional dependencies which can be activated.

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 10.6.0 |

### Redis
To use redis the value `redis.enabled` must be set to true

```console
helm upgrade -i airlock-waf airlock/microgateway --set redis.enabled=true
```

To see all possible settings for this dependency please go to the following URL: [Helm Hub bitnami/redis](https://hub.helm.sh/charts/bitnami/redis)

:warning: **Adjustments of the default settings**: The Redis was tested only with this default settings. With all changes to these settings it cannot be assured that the Redis will work as expected.
