#Define the file path
fname <- "C:/Users/Avisek/Documents/JHU Data Science Specialisation/Exploratory Data Analysis/Week 1/household_power_consumption.txt";
#Read the data
survey_df <- read.table(fname, header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'));
#Format the date
survey_df$Date <- as.Date(survey_df$Date, "%d/%m/%Y");
#Filter the data
survey_df <- survey_df[(survey_df$Date >= as.Date("2007-02-01")) & (survey_df$Date <= as.Date("2007-02-02")), ];
#Remove the incomplete rows
survey_df <- survey_df[complete.cases(survey_df),];
#Create a new Datetime column
survey_df$dateTime <- paste(survey_df$Date, survey_df$Time);
#Format the Datetime column
survey_df$dateTime <- as.POSIXct(survey_df$dateTime);
#Plot the data
plot(survey_df$Global_active_power~survey_df$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="");
#Copy it to PNG
dev.copy(png,"plot2.png", width=480, height=480);
#Close the graphic device
dev.off();
