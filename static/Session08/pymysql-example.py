# First install the package
# pip install pymysql

import pymysql

# Replace the connection details with your actual MySQL connection details
HOST = "localhost"
USER = "root"
PASSWORD = "1377"
DATABASE = "comp353lab"

def main():
    # Connect to the MySQL database
    connection = pymysql.connect(
        host=HOST,
        user=USER,
        password=PASSWORD,
        db=DATABASE
    )

    try:
        # Create a cursor object
        cursor = connection.cursor()

        # Example query
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

    finally:
        # Close the cursor and connection
        cursor.close()
        connection.close()

# Run the main function
if __name__ == "__main__":
    main()