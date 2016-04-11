# docker-consul-proxy

Browse the consul web ui securely in a triton container.

Example use:
```bash
$ docker run -d -P --link consul:consul papertigers/consul-proxy
```

Creating hash for authentication:
```
$ npm install -g hashp
$ echo -n 'password' | hashp username > passhash.txt
$ cat passhash.txt
username:QLZ6oPKVhm:swQfzk8F6gVhPrA3k2/1CTzitYo+LdZ8Qx+pmwBV7CFk/pZwsiunjYxmgzkXpJK+22mF4fvqI7t3neFXBi6SpQ==:89
```