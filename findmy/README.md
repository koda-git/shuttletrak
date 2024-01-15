# FindMy
Query Apple's Find My network and adds Longitude and Latitiude, Timestamp data into a database, then sends it to a set custom web server. based on all the hard work of https://github.com/seemoo-lab/openhaystack/ and @hatomist and @JJTech0130 and @Dadoum and @biemster

## Installation and initial setup
Only a free Apple ID is required, with SMS 2FA properly setup. If you don't have any, follow one of the many guides found on the internet.

1. Run `ansiette-v3-server` from docker :
```bash
docker run -d --restart always --name anisette-v3 -p 6969:6969 dadoum/anisette-v3-server:latest
```
2. Follow the installation instructions for `anisette-v3-server` and make sure it works.
3. Create the database where the reports will be stored:
```bash
sqlite3 reports.db 'CREATE TABLE reports (id_short TEXT, timestamp INTEGER, datePublished INTEGER, payload TEXT, id TEXT, statusCode INTEGER, PRIMARY KEY(id_short,timestamp))'
```

## Run
1. `cd` into the `FindMy` directory and generate keys using `./generate_keys.py`.
2. Deploy your advertisement keys on devices supported by OpenHaystack. 
3. run
```
in the same directory as your `.keys` files.

