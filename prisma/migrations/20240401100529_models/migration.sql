-- CreateTable
CREATE TABLE `Staff` (
    `Staff_id` INTEGER NOT NULL AUTO_INCREMENT,
    `Staff_name` VARCHAR(191) NOT NULL,
    `Staff_CNIC` VARCHAR(191) NOT NULL,
    `Staff_Phone` VARCHAR(191) NOT NULL,
    `Staff_Designation` VARCHAR(191) NOT NULL,
    `Staff_Address` VARCHAR(191) NOT NULL,
    `Joining_date` VARCHAR(191) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Staff_Staff_CNIC_key`(`Staff_CNIC`),
    UNIQUE INDEX `Staff_Staff_Phone_key`(`Staff_Phone`),
    PRIMARY KEY (`Staff_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Visitor` (
    `Guest_No` INTEGER NOT NULL AUTO_INCREMENT,
    `Guest_CNIC` VARCHAR(191) NOT NULL,
    `Guest_Name` VARCHAR(191) NOT NULL DEFAULT '',
    `Vehicle_Plate` VARCHAR(191) NOT NULL,
    `User_Id` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`Guest_No`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Complain` (
    `Complain_No` INTEGER NOT NULL AUTO_INCREMENT,
    `Complain` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `User_Id` INTEGER NOT NULL,
    `Desccription` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Complain_No`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Users` (
    `User_Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Email` VARCHAR(191) NOT NULL,
    `Phone` VARCHAR(191) NOT NULL,
    `fname` VARCHAR(191) NOT NULL DEFAULT '',
    `lname` VARCHAR(191) NOT NULL,
    `CNIC` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',

    UNIQUE INDEX `Users_Email_key`(`Email`),
    UNIQUE INDEX `Users_Phone_key`(`Phone`),
    PRIMARY KEY (`User_Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Event` (
    `Event_Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Address` VARCHAR(191) NOT NULL,
    `Description` VARCHAR(191) NOT NULL,
    `Date` VARCHAR(191) NOT NULL,
    `Time` VARCHAR(191) NOT NULL,
    `User_Id` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`Event_Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Visitor` ADD CONSTRAINT `Visitor_User_Id_fkey` FOREIGN KEY (`User_Id`) REFERENCES `Users`(`User_Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Complain` ADD CONSTRAINT `Complain_User_Id_fkey` FOREIGN KEY (`User_Id`) REFERENCES `Users`(`User_Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Event` ADD CONSTRAINT `Event_User_Id_fkey` FOREIGN KEY (`User_Id`) REFERENCES `Users`(`User_Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
