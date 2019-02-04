# new-york-times-api

### Description
I have created a service object model that takes data from New York Times Developers Network; specifically the movie reviews API and have created unit tests that test the individual datasets and their data types using rspec.

### Languages used
Ruby

### How to download
1. Copy/Clone the URL on GitHub
2. Open selected text editor
3. In selected text editor, open up in-built terminal and type 'git clone' followed by the URL copied from GitHub 

### How to run tests
1. Install gems using 'bundle install' in the terminal if gems in the gemfile are not already installed
2. Navigate to the root directory
3. Run rspec in your terminal 

### How to set up .env file with an api key
1. Create a '.env' file in the terminal using 'touch .env'
2. Navigate to https://developer.nytimes.com/
3. Click on 'Get Started' and follow the steps to create an account and obtain an api key for the different api datasets
4. Copy the created key and paste it into the .env file as follows 'API_KEY=yourkey'
5. In the .gitignore file add the following '.env' 

### Challenges
1. Calling from the API in order to retrieve movie reviews by name
2. Creating tests that loop through the dataset 
3. Creating unit tests for each individual data point which is time consuming 

### Learning points
1. Better understanding of using external APIs and creating service object models
2. Creating loops that test multiple sets of data for larger datasets
3. Targeting specific data points in a data set using an OOP approach

