create database `TIMEAT`;
use `TIMEAT`;

drop table if exists `USER`;
create table `USER`(
	`User_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(50) NOT NULL,
	`Lname` varchar(50) NOT NULL,
	`Password` varchar(50) NOT NULL,
	PRIMARY KEY (`User_Id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `RESTAURANT`;
create table `RESTAURANT`(
	`Name` varchar(100) NOT NULL,
	`Location` varchar(100) NOT NULL,
	`Contact` varchar(100) NOT NULL,
	`Opening_Closing_Time` varchar(100) NOT NULL,
	`Details` varchar(500) default NULL,
	PRIMARY KEY (`Name`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `OWNER1`;
create table `OWNER`(
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(100) NOT NULL,
	`Rest_Name` varchar(100) NOT NULL,
	PRIMARY KEY (`Fname`,`Lname`,`Contact`),
	FOREIGN KEY (`Rest_Name`) REFERENCES `RESTAURANT`(`Name`)
	ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `CUSTOMER`;
create table `CUSTOMER`(
	`Customer_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) DEFAULT NULL,
	`Email_Id` varchar(50) DEFAULT NULL,	
	PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MANAGER`;
create table `MANAGER`(
	`Manager_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
 	`Address` varchar(30) DEFAULT NULL,
  	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Manager_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `MENU`;
create table `MENU`(
	`Menu_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL,
	`Price` varchar(20) NOT NULL,	
	`Type` varchar(20) DEFAULT NULL,
	`Category` varchar(30) NOT NULL,
	PRIMARY KEY(`Menu_Id`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `TABLES`;
create table `TABLES`(
	`Table_Number` varchar(9) NOT NULL,
	`Details` varchar(200) DEFAULT NULL,
	PRIMARY KEY (`Table_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists `BOOKING`;
create table `BOOKING`(
	`Booking_Id` int NOT NULL AUTO_INCREMENT,
	`Table_Num` varchar(30) NOT NULL,
	`Date` varchar(30) NOT NULL,
	`Time` varchar(30) NOT NULL,
	`Cust_Id` int NOT NULL,
	PRIMARY KEY (`Booking_Id`),
	FOREIGN KEY (`Cust_Id`) REFERENCES `CUSTOMER`(`Customer_Id`),
	FOREIGN KEY (`Table_Num`) REFERENCES `TABLES`(`Table_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
