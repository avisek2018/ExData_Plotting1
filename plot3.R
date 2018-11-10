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

#Plot the Sub Metering 1 with Datetime
plot(survey_df$Sub_metering_1~survey_df$dateTime, type="l", xlab="", ylab="Energy sub metering");
#Add the Sub Metering 2 with Datetime
lines(survey_df$Sub_metering_2~survey_df$dateTime,col="red");
#Add the Sub Metering 3 with Datetime
lines(survey_df$Sub_metering_3~survey_df$dateTime,col="blue");
#Add the legends in the plot
legend("topright" , col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1));

#Copy it to PNG
dev.copy(png,"plot3.png", width=480, height=480);
#Close the graphic device
dev.off();
