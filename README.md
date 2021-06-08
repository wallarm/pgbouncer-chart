Pgbouncer
=========

PgBouncer is a lightweight connection pooler for PostgreSQL.

Install the Chart
-----------------

To install the chart with the releases name `my-release` in namespace `my-namespace`:
```bash
 $ git clone git@github.com:wallarm/pgbouncer-chart.git
 $ cd pgbouncer-chart
 $ helm install -n my-release --namespace my-namespace .
```

Configuration example
---------------------

```yaml
imagePullSecrets:
  - name: <Secretname>
config:
  adminPassword: <SomePassword>
  databases:
    <DBName1>:
      host: <HostName1>.mdb.yandexcloud.net
      port: 6432
    <DBName2>:
      host: <HostName2>.mdb.yandexcloud.net
      port: 6432
    <DBName3>:
      host: <HostName3>.mdb.yandexcloud.net
      port: 6432
  pgbouncer:
    server_tls_sslmode: prefer
    max_client_conn: 500
    ignore_startup_parameters: extra_float_digits
    pool_mode: transaction
  userlist:
    <DBUser1>: <md5MD5HashOfPassword1>
    <DBUser2>: <md5MD5HashOfPassword2>
    <DBUSer3>: <md5MD5HashOfPassword3>
```

Configuration
-------------

The following table lists the configurable parameters of the Prometheus chart and their default values.

Parameter | Description | Default
--------- | ----------- | -------
`replicaCount`      | Desired number of pgbouncer pods | `1`
`updateStrategy`    | Deploy strategy of the Deployment | `{}`
`minReadySeconds`   | Interval between discrete pods transitions | `0`
`revisionHistoryLimit` | Rollback limit | `10`
`imagePullSecrets`  | Container image pull secrets | `[]`
`image.registry`    | Pgbouncer container image registry | `""`
`image.repository`  | Pgbouncer container image repository | `pgbouncer/pgbouncer`
`image.tag`         | Pgbouncer container image tag | `1.15.0`
`image.pullPolicy`  | Pgbouncer container image pull policy | `IfNotPresent`
`service.type`      | Type of pgbouncer service to create | `ClusterIP`
`service.port`      | Pgbouncer service port | `5432`
`podLabels`         | Labels to add to the pod metadata | `{}`
`podAnnotations`    | Annotations to add to the pod metadata | `{}`
`extraEnvs`         | Additional environment variables to set | `[]`
`resources`         | Pgbouncer pod resource requests & limits | `{}`
`nodeSelector`      | Node labels for pgbouncer pod assignment | `{}`
`lifecycle`         | Lifecycle hooks | `{}`
`tolerations`       | Node taints to tolerate (requires Kubernetes >=1.6) | `[]`
`affinity`          | Pod affinity | `{}`
`priorityClassName` | Priority of pods | `""`
`runtimeClassName`  | Runtime class for pods | `""`
`config.adminUser`  | Set pgbouncer `admin_user` option. `admin_user` - database user that are allowed to connect and run all commands on console. | `admin`
`config.adminPassword` | Set password for `admin_user` | `""`, required
`config.authUser`   | Set pgbouncer `auth_user` option. If `auth_user` is set, any user not specified in `auth_file` will be queried through the `auth_query` query from `pg_shadow` in the database using `auth_user` | `""`
`config.authPassword` | Set password for `auth_user` | `""`
`config.databases`  | Dict of database connections string described in section `[databases]` in pgbouncer.ini file | `{}`
`config.pgbouncer`  | Dict of pgbouncer options described in section `[pgbouncer]` in pgbouncer.ini file | 
`config.userlist`   | Dict of users for `userlist.txt` file | `{}`
`extraContainers`   | Additional containers to be added to the pods | `[]`
`extraInitContainers` | Containers, which are run before the app containers are started | `[]`
`extraVolumeMounts` | Additional volumeMounts to the main container | `[]`
`extraVolumes`      | Additional volumes to the pods | `[]`
`pgbouncerExporter.enabled` | Enables pgbouncer exporter in pod | `false`
`pgbouncerExporter.port` | Pgbouncer exporter port | `9127`
`pgbouncerExporter.image.registry` | Pgbouncer exporter image registry | `""`
`pgbouncerExporter.image.repository` | Pgbouncer exporter image repository | `prometheuscommunity/pgbouncer-exporter`
`pgbouncerExporter.image.tag` | Pgbouncer exporter image tag | `2.0.1`
`pgbouncerExporter.image.pullPolicy` | Pgbouncer exporter image pull policy | `IfNotPresent`
`pgbouncerExporter.resources` | Pgbouncer exporter resources | `{"limits":{"cpu":"250m","memory":"150Mi"},"requests":{"cpu":"30m","memory":"40Mi"}}`
`podSecurityPolicy.enabled` | Enables PodSecurityPolicy object creation | `false`
`podDisruptionBudget.enabled` | Enables PodDisruptionBudget object creation | `true`
`serviceAccount.name` | Kubernetes ServiceAccount for service. Creates new if empty | `""`
`serviceAccount.annotations` | Annotations to set for ServiceAccount | `{}`
