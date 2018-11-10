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
#Divide the plotting region in 2 rows 2 columns
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0));
#Plot all the 4 graphs by using with function
with(survey_df, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
});

#Copy it to PNG
dev.copy(png,"plot4.png", width=480, height=480);
#Close the graphic device
dev.off();
