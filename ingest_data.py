#!/usr/bin/env python
# coding: utf-8

import pandas as pd 
from sqlalchemy import create_engine
import click    

@click.command()
@click.option('--user', help='username for Postgres')
@click.option('--password', help='password for Postgres')
@click.option('--host', help='host for Postgres')
@click.option('--port', help='port for Postgres')
@click.option('--db', help='database name for Postgres')
@click.option('--table_name', help='name of the table where we will write the results to')

def run(user, password, host, port, db, table_name):
    # Create the database engine
    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')

    # Download the parquet file
    url = " https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet"
    df = pd.read_parquet(url)
   
    # Ingest to Postgres
    print(f"Inserting data into table '{table_name}'...")
    df.to_sql(name=table_name, con=engine, if_exists='replace', index=False)
    print("Done!")
    # Download the csv file
    url = f"https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv"
    df_zones = pd.read_csv(url)
    # Ingest to Postgres
    print(f"Inserting data into table 'zones'...")
    df_zones.to_sql(name='zones', con=engine, if_exists='replace', index=False)
    print("Done!")

if __name__ == '__main__':
    run()



   