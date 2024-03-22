-- Create database if not exists
CREATE DATABASE IF NOT EXISTS Optiloans;
USE Optiloans;

-- Table for admin
CREATE TABLE IF NOT EXISTS `admin` (
                                       `id` INT(4) NOT NULL AUTO_INCREMENT,
                                       `userName` VARCHAR(15) NOT NULL,
                                       `password` VARCHAR(15) NOT NULL,
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into admin table
INSERT INTO `admin` (`id`, `userName`, `password`) VALUES
    (1, 'admin', 'Admin@123');

-- Table for loan
CREATE TABLE IF NOT EXISTS `loan` (
                                      `loanId` INT(6) NOT NULL AUTO_INCREMENT,
                                      `memberId` INT(8) NOT NULL,
                                      `loanType` VARCHAR(15) NOT NULL,
                                      `income` INT(8) NOT NULL,
                                      `amount` INT(8) NOT NULL,
                                      `interest` VARCHAR(5) NOT NULL,
                                      `payment_term` INT(3) NOT NULL,
                                      `total_paid` INT(8) NOT NULL,
                                      `emi_per_month` INT(8) NOT NULL,
                                      `bankStatementPhoto` VARCHAR(250) NOT NULL,
                                      `security` VARCHAR(250) NOT NULL,
                                      `posting_date` DATE NOT NULL,
                                      `status` VARCHAR(15) NOT NULL,
                                      `adminRemark` VARCHAR(100) NOT NULL,
                                      `adminRemarkDate` DATE NOT NULL,
                                      PRIMARY KEY (`loanId`),
                                      KEY `n` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into loan table
INSERT INTO `loan` (`loanId`, `memberId`, `loanType`, `income`, `amount`, `interest`, `payment_term`, `total_paid`, `emi_per_month`, `bankStatementPhoto`, `security`, `posting_date`, `status`, `adminRemark`, `adminRemarkDate`) VALUES
                                                                                                                                                                                                                                       (7, 32328507, 'School fees', 15000, 10000, '7', 1, 10700, 891, '', 'customer.jpg', '2019-06-03', 'Approved', 'adr', '2019-06-03'),
                                                                                                                                                                                                                                       (8, 2777680, 'School fees', 20000, 15000, '7', 1, 16050, 1337, '', 'download (1).jpg', '2019-06-03', 'pending', '', '0000-00-00');

-- Table for loantype
CREATE TABLE IF NOT EXISTS `loantype` (
                                          `id` INT(4) NOT NULL AUTO_INCREMENT,
                                          `loanType` VARCHAR(15) NOT NULL,
                                          `description` VARCHAR(200) NOT NULL,
                                          `creationDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table for member
CREATE TABLE IF NOT EXISTS `member` (
                                        `id` INT(5) NOT NULL AUTO_INCREMENT,
                                        `memberId` INT(8) NOT NULL,
                                        `fName` VARCHAR(15) NOT NULL,
                                        `lName` VARCHAR(15) NOT NULL,
                                        `gender` VARCHAR(6) NOT NULL,
                                        `phone` VARCHAR(10) NOT NULL,
                                        `occupation` VARCHAR(20) NOT NULL,
                                        `email` VARCHAR(30) NOT NULL,
                                        `password` VARCHAR(15) NOT NULL,
                                        `county` VARCHAR(20) NOT NULL,
                                        `location` VARCHAR(20) NOT NULL,
                                        `dob` DATE NOT NULL,
                                        `regDate` DATE NOT NULL,
                                        PRIMARY KEY (`memberId`),
                                        UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into member table
INSERT INTO `member` (`id`, `memberId`, `fName`, `lName`, `gender`, `phone`, `occupation`, `email`, `password`, `county`, `location`, `dob`, `regDate`) VALUES
                                                                                                                                                            (6, 2777680, 'Randu', 'Karisa', 'M', '0738242338', 'teacher', 'karisa@example.com', 'Admin_123', 'bungoma', 'bungoma',  '2019-06-03', '2019-06-03'),
                                                                                                                                                            (1, 32328507, 'Edward', 'Mutahi', 'M', '0718533226', 'student', 'eddyzahil@gmail.com', 'Admin@123', 'nyeri', 'mukurweini',  '1995-01-09', '2019-05-24');

-- Table for payment
CREATE TABLE IF NOT EXISTS `payment` (
                                         `id` INT(6) NOT NULL AUTO_INCREMENT,
                                         `paymentId` VARCHAR(20) NOT NULL,
                                         `memberId` INT(8) NOT NULL,
                                         `fName` VARCHAR(15) NOT NULL,
                                         `lName` VARCHAR(15) NOT NULL,
                                         `amount` INT(8) NOT NULL,
                                         `phone` VARCHAR(13) NOT NULL,
                                         `payment_date` DATE NOT NULL,
                                         PRIMARY KEY (`paymentId`),
                                         UNIQUE KEY `id` (`id`),
                                         KEY `m` (`memberId`),
                                         CONSTRAINT `m` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
