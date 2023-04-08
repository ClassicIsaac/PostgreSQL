This project analyzes the UK Road Safety data for the year 2015. The data contains information about road accidents and the vehicles involved in those accidents.
The aim of this project is to demonstrate how to use Pandas to preprocess and PostgreSQL to analyze the data. Additionally, the project uses visualization tools such as Matplotlib and Seaborn to provide insights from the data.

## Requirements
PostgreSQL 12 or higher
Python 3
pandas, seaborn and matplotlib python libraries

## Dataset
The dataset used in this project is from the UK government's data.gov.uk website and contains information on road accidents in Great Britain in 2015. The data is available at data.gov.uk/dataset/road-accidents-safety-data. The data is licensed under the Open Government Licence.

## Files in the repository
- data_analysis.sql: contains the SQL commands to load the data into the database and analyze the data
- accidents_processed.csv: contains the preprocessed data for road accidents in 2015
- vehicles_preprocessed.csv: contains the preprocessed data for vehicles involved in accidents in 2015
- Accidents_2015.csv: contains the raw data for road accidents in 2015
- vehicle_type.csv: contains the data for the type of vehicles involved in the accident (e.g. car, motorcycle, bus, etc.).
- Vehicles_2015.csv: contains the raw data for vehicles involved in accidents in 2015
- accidents_preprocessing.ipynb: contains the Python code for cleaning the accident data
- vehicles_preprocessing.ipynb: contains the Python code for cleaning the vehicle data
- accidents_visualization.ipynb: contains the Python code for visualizing the accident data
- vehicles_visualization.ipynb: contains the Python code for visualizing the vehicle data

## How to use
- Clone the repository to your local machine
- Open a terminal and navigate to the cloned directory.
- Open the accidents_preprocessing.ipynb notebook to clean the accident data
- Open the vehicles_preprocessing.ipynb notebook to clean the vehicle data.
- Create a new PostgreSQL database and load the data into the database by executing the SQL commands in the data_analysis.sql file.
- Open the accidents_visualization.ipynb notebook to visualize the accident data or open the vehicles_visualization.ipynb notebook to visualize the vehicle data.
## Conclusion
This project has shown how to use PostgreSQL to preprocess and analyze the UK Road Safety data for the year 2015. The visualizations generated provide insights into the data that can be used to improve road safety.

## License
This project is licensed under the MIT License - see the LICENSE file for details. 