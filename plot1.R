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
#Plot the histogram
hist(survey_df$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red");
#Copy it to a PNG
dev.copy(png,"plot1.png", width=480, height=480);
#Close the graphic device
dev.off();
