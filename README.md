# WingsForLife

Scrap the results of [Wings For Life World Run](https://www.wingsforlifeworldrun.com/) to CSV file.

## Installation and run

```bash
cd wings-run-to-csv

mix deps.get
mix compile
```
Select the year (list of years: 2014 - first edition - to current year) and run:
```
mix scrap 2020
```
After scraped - check `data/results.csv`