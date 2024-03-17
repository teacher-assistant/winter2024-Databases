# First install the package
# pip install databases

# isntall with th required drivers
# pip install databases[aiomysql]

import asyncio
from databases import Database

async def main():
    # database = Database('mysql+aiomysql://root:1377@localhost/comp353lab')
    # database = Database("sqlite+aiosqlite:///example.db")

    try:
        await database.connect()
        query = """
        create table customers(
            id int primary key auto_increment,
            first_name varchar(50),
            last_name varchar(50),
            email varchar(50),
            password varchar(50),
            country varchar(50),
            balance int,
            last_huge_order_data datetime
        );
        """
        await database.execute(query=query)

    finally:
        await database.disconnect()

if __name__ == "__main__":
    asyncio.run(main())