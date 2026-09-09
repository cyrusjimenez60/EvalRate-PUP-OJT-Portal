-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.5.0-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbInternshipEvalSys
CREATE DATABASE IF NOT EXISTS `dbInternshipEvalSys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `dbInternshipEvalSys`;

-- Dumping structure for table dbInternshipEvalSys.tblClassroom
CREATE TABLE IF NOT EXISTS `tblClassroom` (
  `intClassroomID` int(11) NOT NULL AUTO_INCREMENT,
  `intRequiredHours` int(11) NOT NULL,
  `intTermID` int(11) NOT NULL,
  `intFacultyID` int(11) NOT NULL,
  `intSectionID` int(11) NOT NULL,
  PRIMARY KEY (`intClassroomID`),
  KEY `fkTermID` (`intTermID`),
  KEY `fkFacultyID` (`intFacultyID`),
  KEY `fkSectionIDClass` (`intSectionID`),
  CONSTRAINT `fkFacultyID` FOREIGN KEY (`intFacultyID`) REFERENCES `tblInternAdviser` (`intFacultyID`) ON UPDATE CASCADE,
  CONSTRAINT `fkSectionIDClass` FOREIGN KEY (`intSectionID`) REFERENCES `tblSection` (`intSectionID`) ON UPDATE CASCADE,
  CONSTRAINT `fkTermID` FOREIGN KEY (`intTermID`) REFERENCES `tblSemesterTerm` (`intTermID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblClassroom: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblDepartment
CREATE TABLE IF NOT EXISTS `tblDepartment` (
  `intDepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `strDeptName` varchar(100) NOT NULL,
  PRIMARY KEY (`intDepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblDepartment: ~5 rows (approximately)
INSERT INTO `tblDepartment` (`intDepartmentID`, `strDeptName`) VALUES
	(1, 'Department of Biology'),
	(2, 'Department of Food Technology'),
	(3, 'Department of Mathematics and Statistics'),
	(4, 'Department of Nutrition and Dietetics'),
	(5, 'Department of Physical Science');

-- Dumping structure for table dbInternshipEvalSys.tblEFormHTEHeader
CREATE TABLE IF NOT EXISTS `tblEFormHTEHeader` (
  `intEFormHTEID` int(11) NOT NULL AUTO_INCREMENT,
  `intCompanyID` int(11) NOT NULL,
  `intFacultyID` int(11) NOT NULL,
  `strEvalStrength` text NOT NULL,
  `strEvalImprovement` text NOT NULL,
  `strEvalRecommendation` text NOT NULL,
  PRIMARY KEY (`intEFormHTEID`),
  KEY `fkCompanyID_FormHTEHeader` (`intCompanyID`),
  KEY `fkFacultyID_FormHTEHeader` (`intFacultyID`),
  CONSTRAINT `fkCompanyID_FormHTEHeader` FOREIGN KEY (`intCompanyID`) REFERENCES `tblHTE` (`intCompanyID`) ON UPDATE CASCADE,
  CONSTRAINT `fkFacultyID_FormHTEHeader` FOREIGN KEY (`intFacultyID`) REFERENCES `tblInternAdviser` (`intFacultyID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormHTEHeader: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblEFormHTEQuestion
CREATE TABLE IF NOT EXISTS `tblEFormHTEQuestion` (
  `intEFHTEQuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `strEFHTEQuestionText` text NOT NULL,
  PRIMARY KEY (`intEFHTEQuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormHTEQuestion: ~9 rows (approximately)
INSERT INTO `tblEFormHTEQuestion` (`intEFHTEQuestionID`, `strEFHTEQuestionText`) VALUES
	(1, 'Provides comprehensive Internship Plan to student-interns (company profile, objectives, job description, knowledge, and competencies, journal/DTR, list of equivalencies, and focal person)'),
	(2, 'Orients student-interns on the standard rules and regulations, policies, potential projects, and respective work assignments in the HTE'),
	(3, 'Commits to let student-interns undergo an Internship Program consistent with the requirements of the University:  Online Training (web-based) or be subjected to Work-from-Home arrangements as delegated by the HTE and under the policies of the University'),
	(4, 'Ensures that student-interns are rendering the training hours within the regular working hours'),
	(5, 'Provides free relevant instruction, exposure, and training to the student-intern, consistent with its policies, rules, and regulations'),
	(6, 'Treats the student-interns in a professional manner, and ensures that the student-interns are not exposed to any form of harassment/unethical practices or tasks and work assignments that are unreasonably risky, dangerous, or unrelated to the purposes of the Internship Program'),
	(7, 'Observes safety measures for the student-interns and ensures quality of training'),
	(8, 'Issues Certificate of Completion to the student-interns not later than two weeks after the completion of internship'),
	(9, 'Attends appreciation dialogue/exit conference/culminating activity conducted by the College/Branch/Satellite Campuses');

-- Dumping structure for table dbInternshipEvalSys.tblEFormHTERating
CREATE TABLE IF NOT EXISTS `tblEFormHTERating` (
  `intEFHTERatingID` int(11) NOT NULL AUTO_INCREMENT,
  `intEFHTERatingValue` int(11) NOT NULL,
  `strEFHTERatingRemark` varchar(50) NOT NULL,
  PRIMARY KEY (`intEFHTERatingID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormHTERating: ~5 rows (approximately)
INSERT INTO `tblEFormHTERating` (`intEFHTERatingID`, `intEFHTERatingValue`, `strEFHTERatingRemark`) VALUES
	(1, 1, 'Fully Not Compliant (0%-10%)'),
	(2, 2, 'Not Compliant (11%-40%)'),
	(3, 3, 'Somewhat Compliant (41%-65%)'),
	(4, 4, 'Compliant (66%-90%)'),
	(5, 5, 'Fully Compliant (91-100%)');

-- Dumping structure for table dbInternshipEvalSys.tblEFormHTEResponse
CREATE TABLE IF NOT EXISTS `tblEFormHTEResponse` (
  `intEFHTEResponseID` int(11) NOT NULL AUTO_INCREMENT,
  `intEFormHTEID` int(11) NOT NULL,
  `intEFHTEQuestionID` int(11) NOT NULL,
  `intEFHTERatingID` int(11) NOT NULL,
  PRIMARY KEY (`intEFHTEResponseID`),
  KEY `fkEFormHTEID` (`intEFormHTEID`),
  KEY `fkEFHTEQuestionID` (`intEFHTEQuestionID`),
  KEY `fkEFHTERatingID` (`intEFHTERatingID`),
  CONSTRAINT `fkEFHTEQuestionID` FOREIGN KEY (`intEFHTEQuestionID`) REFERENCES `tblEFormHTEQuestion` (`intEFHTEQuestionID`) ON UPDATE CASCADE,
  CONSTRAINT `fkEFHTERatingID` FOREIGN KEY (`intEFHTERatingID`) REFERENCES `tblEFormHTERating` (`intEFHTERatingID`) ON UPDATE CASCADE,
  CONSTRAINT `fkEFormHTEID` FOREIGN KEY (`intEFormHTEID`) REFERENCES `tblEFormHTEHeader` (`intEFormHTEID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormHTEResponse: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblEFormInternCategory
CREATE TABLE IF NOT EXISTS `tblEFormInternCategory` (
  `intEFInternCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `strEFInternCategoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`intEFInternCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormInternCategory: ~2 rows (approximately)
INSERT INTO `tblEFormInternCategory` (`intEFInternCategoryID`, `strEFInternCategoryName`) VALUES
	(1, 'Character'),
	(2, 'Competence');

-- Dumping structure for table dbInternshipEvalSys.tblEFormInternHeader
CREATE TABLE IF NOT EXISTS `tblEFormInternHeader` (
  `intEFormInternID` int(11) NOT NULL AUTO_INCREMENT,
  `strStudentID` char(20) NOT NULL,
  `intSupervisorID` int(11) NOT NULL,
  `datEvalDate` date NOT NULL,
  `strEvalComment` text DEFAULT NULL,
  PRIMARY KEY (`intEFormInternID`),
  KEY `fkStudentID_FormInternHeader` (`strStudentID`),
  KEY `fkSupervisorID_FormInternHeader` (`intSupervisorID`),
  CONSTRAINT `fkStudentID_FormInternHeader` FOREIGN KEY (`strStudentID`) REFERENCES `tblStudentIntern` (`strStudentID`) ON UPDATE CASCADE,
  CONSTRAINT `fkSupervisorID_FormInternHeader` FOREIGN KEY (`intSupervisorID`) REFERENCES `tblSupervisor` (`intSupervisorID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormInternHeader: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblEFormInternQuestion
CREATE TABLE IF NOT EXISTS `tblEFormInternQuestion` (
  `intEFInternQuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `strEFInternQuestionText` text NOT NULL,
  `intEFInternCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`intEFInternQuestionID`),
  KEY `fkEFInternCategoryID` (`intEFInternCategoryID`),
  CONSTRAINT `fkEFInternCategoryID` FOREIGN KEY (`intEFInternCategoryID`) REFERENCES `tblEFormInternCategory` (`intEFInternCategoryID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormInternQuestion: ~10 rows (approximately)
INSERT INTO `tblEFormInternQuestion` (`intEFInternQuestionID`, `strEFInternQuestionText`, `intEFInternCategoryID`) VALUES
	(1, 'The intern can be trusted with important and confidential information.', 1),
	(2, 'The intern shows courtesy and transparency in his/ her dealings with superiors and colleagues.', 1),
	(3, 'The intern displays responsibility and accountability in doing the assigned tasks.', 1),
	(4, 'The intern manifests resiliency during critical and difficult circumstances.', 1),
	(5, 'The intern shows commitment and hard work in the workplace.', 1),
	(6, 'The intern displays thoroughness, accuracy, and completeness in work output.', 2),
	(7, 'The intern practices timeliness in the completion of assigned tasks.', 2),
	(8, 'The intern manifests sound decision-making and logical thinking in dealing with simple problems related to his/her tasks.', 2),
	(9, 'The intern exhibits initiative and perseverance in the performance of duties and responsibilities.', 2),
	(10, 'The intern meets the technical skills required of the student intern by the HTE.', 2);

-- Dumping structure for table dbInternshipEvalSys.tblEFormInternResponse
CREATE TABLE IF NOT EXISTS `tblEFormInternResponse` (
  `intEFInternResponseID` int(11) NOT NULL AUTO_INCREMENT,
  `intEFormInternID` int(11) NOT NULL,
  `intEFInternQuestionID` int(11) NOT NULL,
  `flEFInternCustomRating` float NOT NULL,
  PRIMARY KEY (`intEFInternResponseID`),
  KEY `fkEFormInternID` (`intEFormInternID`),
  KEY `fkEFInternQuestionID` (`intEFInternQuestionID`),
  CONSTRAINT `fkEFInternQuestionID` FOREIGN KEY (`intEFInternQuestionID`) REFERENCES `tblEFormInternQuestion` (`intEFInternQuestionID`) ON UPDATE CASCADE,
  CONSTRAINT `fkEFormInternID` FOREIGN KEY (`intEFormInternID`) REFERENCES `tblEFormInternHeader` (`intEFormInternID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormInternResponse: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblEFormSupervisorCategory
CREATE TABLE IF NOT EXISTS `tblEFormSupervisorCategory` (
  `intEFSupervisorCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `strEFSupervisorCategoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`intEFSupervisorCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormSupervisorCategory: ~5 rows (approximately)
INSERT INTO `tblEFormSupervisorCategory` (`intEFSupervisorCategoryID`, `strEFSupervisorCategoryName`) VALUES
	(1, 'Mentoring/Coaching'),
	(2, 'Interpersonal Skills'),
	(3, 'Work Ethics'),
	(4, 'Assistance'),
	(5, 'Feedback Mechanism');

-- Dumping structure for table dbInternshipEvalSys.tblEFormSupervisorHeader
CREATE TABLE IF NOT EXISTS `tblEFormSupervisorHeader` (
  `intEFormSupervisorID` int(11) NOT NULL AUTO_INCREMENT,
  `intSupervisorID` int(11) NOT NULL,
  `strStudentID` char(20) NOT NULL,
  `datEvalDate` date NOT NULL,
  `strEvalComment` text DEFAULT NULL,
  PRIMARY KEY (`intEFormSupervisorID`),
  KEY `fkSupervisorID_FormSupervisorHeader` (`intSupervisorID`),
  KEY `fkStudentID_FormSupervisorHeader` (`strStudentID`),
  CONSTRAINT `fkStudentID_FormSupervisorHeader` FOREIGN KEY (`strStudentID`) REFERENCES `tblStudentIntern` (`strStudentID`) ON UPDATE CASCADE,
  CONSTRAINT `fkSupervisorID_FormSupervisorHeader` FOREIGN KEY (`intSupervisorID`) REFERENCES `tblSupervisor` (`intSupervisorID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormSupervisorHeader: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblEFormSupervisorQuestion
CREATE TABLE IF NOT EXISTS `tblEFormSupervisorQuestion` (
  `intEFSupervisorQuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `strEFSupervisorQuestionText` text NOT NULL,
  `intEFSupervisorCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`intEFSupervisorQuestionID`),
  KEY `fkEFSupervisorCategoryID` (`intEFSupervisorCategoryID`),
  CONSTRAINT `fkEFSupervisorCategoryID` FOREIGN KEY (`intEFSupervisorCategoryID`) REFERENCES `tblEFormSupervisorCategory` (`intEFSupervisorCategoryID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormSupervisorQuestion: ~27 rows (approximately)
INSERT INTO `tblEFormSupervisorQuestion` (`intEFSupervisorQuestionID`, `strEFSupervisorQuestionText`, `intEFSupervisorCategoryID`) VALUES
	(1, 'Orients the students on the company goals, objectives, and policies', 1),
	(2, 'Discusses the duties, responsibilities, and specific tasks related to internship training program outcomes', 1),
	(3, 'Provides clear instructions, tips, and advice on job-related tasks', 1),
	(4, 'Encourages student-intern’s initiative, creativity, and innovativeness in the workplace when necessary', 1),
	(5, 'Gives student-intern the opportunity to raise issues and/or concerns to be addressed', 1),
	(6, 'Reports to the concerned internship adviser the status of the student-intern’s training exposure', 1),
	(7, 'Builds an environment of trust and encouragement that allows student interns to foster their ideas and to cooperate', 2),
	(8, 'Encourages the trainee to interact with colleagues', 2),
	(9, 'Builds healthy working relationships with the student-intern to facilitate accomplishment of goals', 2),
	(10, 'Encourages collaboration and communication in the work station', 2),
	(11, 'Promotes professional and positive workplace behavior in terms of punctuality and productivity', 3),
	(12, 'Ensures that all interactions are conducted with respect towards every individual', 3),
	(13, 'Accepts responsibility and accountability for decisions and actions taken', 3),
	(14, 'Uses appropriate oral and written communication in the workplace', 3),
	(15, 'Respects inclusivity and diversity in the workplace', 3),
	(16, 'Provides the necessary resources to do the job successfully', 4),
	(17, 'Sets clear expectations and standard measures for deliverables', 4),
	(18, 'Allows the student-intern to participate in the work that directly correlates to their field of specialization', 4),
	(19, 'Assists the student-intern in the technical and actual aspects of the training', 4),
	(20, 'Assigns a regular schedule for consultation', 4),
	(21, 'Maintains objectivity in evaluating and assessing the student intern', 4),
	(22, 'Provides opportunities for learning and professional growth', 4),
	(23, 'Conducts weekly routine feedback on performance and expectations', 5),
	(24, 'Gives constructive and regular descriptive feedback on student-intern’s progress', 5),
	(25, 'Communicates to the internship adviser any concern, query, or issue regarding the internship', 5),
	(26, 'Provides written evaluation of student-intern’s performance to further improve competitiveness', 5),
	(27, 'Gives credit and recognition for a job well-done', 5);

-- Dumping structure for table dbInternshipEvalSys.tblEFormSupervisorRating
CREATE TABLE IF NOT EXISTS `tblEFormSupervisorRating` (
  `intEFSupervisorRatingID` int(11) NOT NULL AUTO_INCREMENT,
  `intEFSupervisorRatingValue` int(11) NOT NULL,
  `strEFSupervisorRatingRemark` varchar(30) NOT NULL,
  PRIMARY KEY (`intEFSupervisorRatingID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormSupervisorRating: ~5 rows (approximately)
INSERT INTO `tblEFormSupervisorRating` (`intEFSupervisorRatingID`, `intEFSupervisorRatingValue`, `strEFSupervisorRatingRemark`) VALUES
	(1, 1, 'Strongly Disagree'),
	(2, 2, 'Disagree'),
	(3, 3, 'Moderately Agree'),
	(4, 4, 'Agree'),
	(5, 5, 'Strongly Agree');

-- Dumping structure for table dbInternshipEvalSys.tblEFormSupervisorResponse
CREATE TABLE IF NOT EXISTS `tblEFormSupervisorResponse` (
  `intEFSupervisorResponseID` int(11) NOT NULL AUTO_INCREMENT,
  `intEFormSupervisorID` int(11) NOT NULL,
  `intEFSupervisorQuestionID` int(11) NOT NULL,
  `intEFSupervisorRatingID` int(11) NOT NULL,
  PRIMARY KEY (`intEFSupervisorResponseID`),
  KEY `fkEFormSupervisorID` (`intEFormSupervisorID`),
  KEY `fkEFSupervisorQuestionID` (`intEFSupervisorQuestionID`),
  KEY `fkEFSupervisorRatingID` (`intEFSupervisorRatingID`),
  CONSTRAINT `fkEFSupervisorQuestionID` FOREIGN KEY (`intEFSupervisorQuestionID`) REFERENCES `tblEFormSupervisorQuestion` (`intEFSupervisorQuestionID`) ON UPDATE CASCADE,
  CONSTRAINT `fkEFSupervisorRatingID` FOREIGN KEY (`intEFSupervisorRatingID`) REFERENCES `tblEFormSupervisorRating` (`intEFSupervisorRatingID`) ON UPDATE CASCADE,
  CONSTRAINT `fkEFormSupervisorID` FOREIGN KEY (`intEFormSupervisorID`) REFERENCES `tblEFormSupervisorHeader` (`intEFormSupervisorID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblEFormSupervisorResponse: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblHTE
CREATE TABLE IF NOT EXISTS `tblHTE` (
  `intCompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `strCompanyName` varchar(100) NOT NULL,
  `strCompanyAddress` varchar(250) NOT NULL,
  `strBusinessNature` varchar(100) NOT NULL,
  PRIMARY KEY (`intCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblHTE: ~0 rows (approximately)
INSERT INTO `tblHTE` (`intCompanyID`, `strCompanyName`, `strCompanyAddress`, `strBusinessNature`) VALUES
	(1, 'Hogwarts Incorporation', 'Hogwarts Castle, Scottish Highlands, United Kingdom', 'Witchcraft and Wizardry');

-- Dumping structure for table dbInternshipEvalSys.tblInternAdviser
CREATE TABLE IF NOT EXISTS `tblInternAdviser` (
  `intFacultyID` int(11) NOT NULL AUTO_INCREMENT,
  `strFacultyLast` varchar(50) NOT NULL,
  `strFacultyFirst` varchar(50) NOT NULL,
  `strFacultyMiddle` varchar(50) DEFAULT NULL,
  `strFacultyEmail` varchar(100) NOT NULL,
  `strFacultyPassHash` varchar(255) NOT NULL,
  `strFacultyPassSalt` varchar(64) NOT NULL,
  `strFacultyContact` varchar(20) NOT NULL,
  PRIMARY KEY (`intFacultyID`),
  UNIQUE KEY `strFacultyEmail` (`strFacultyEmail`),
  UNIQUE KEY `strFacultyContact` (`strFacultyContact`),
  UNIQUE KEY `idxFacultyName` (`strFacultyLast`,`strFacultyFirst`,`strFacultyMiddle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblInternAdviser: ~0 rows (approximately)

-- Dumping structure for table dbInternshipEvalSys.tblSection
CREATE TABLE IF NOT EXISTS `tblSection` (
  `intSectionID` int(11) NOT NULL AUTO_INCREMENT,
  `strAcadProg` varchar(50) NOT NULL,
  `strSectionCode` varchar(10) NOT NULL,
  `intDepartmentID` int(11) NOT NULL,
  `strAcadYear` varchar(20) NOT NULL,
  PRIMARY KEY (`intSectionID`),
  KEY `fkDeptID` (`intDepartmentID`),
  CONSTRAINT `fkDeptID` FOREIGN KEY (`intDepartmentID`) REFERENCES `tblDepartment` (`intDepartmentID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblSection: ~2 rows (approximately)
INSERT INTO `tblSection` (`intSectionID`, `strAcadProg`, `strSectionCode`, `intDepartmentID`, `strAcadYear`) VALUES
	(1, 'BS Biology', '3-5', 1, '2023-2024'),
	(2, 'BS Biology', '3-4', 1, '2023-2024'),
	(3, 'BS Chemistry', '3-2', 5, '2022-2023');

-- Dumping structure for table dbInternshipEvalSys.tblSemesterTerm
CREATE TABLE IF NOT EXISTS `tblSemesterTerm` (
  `intTermID` int(11) NOT NULL AUTO_INCREMENT,
  `strTermName` varchar(50) NOT NULL,
  PRIMARY KEY (`intTermID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblSemesterTerm: ~3 rows (approximately)
INSERT INTO `tblSemesterTerm` (`intTermID`, `strTermName`) VALUES
	(1, '1st Semester'),
	(2, '2nd Semester'),
	(3, 'Summer');

-- Dumping structure for table dbInternshipEvalSys.tblStudentIntern
CREATE TABLE IF NOT EXISTS `tblStudentIntern` (
  `strStudentID` char(20) NOT NULL,
  `strStudLast` varchar(50) NOT NULL,
  `strStudFirst` varchar(50) NOT NULL,
  `strStudMiddle` varchar(50) DEFAULT NULL,
  `strStudEmail` varchar(100) NOT NULL,
  `strStudPassHash` varchar(255) NOT NULL,
  `strStudPassSalt` varchar(64) NOT NULL,
  `strStudContact` varchar(20) NOT NULL,
  `intSectionID` int(11) NOT NULL,
  PRIMARY KEY (`strStudentID`),
  UNIQUE KEY `strStudEmail` (`strStudEmail`),
  UNIQUE KEY `strStudContact` (`strStudContact`),
  KEY `fkSectionID` (`intSectionID`),
  CONSTRAINT `fkSectionID` FOREIGN KEY (`intSectionID`) REFERENCES `tblSection` (`intSectionID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblStudentIntern: ~2 rows (approximately)
INSERT INTO `tblStudentIntern` (`strStudentID`, `strStudLast`, `strStudFirst`, `strStudMiddle`, `strStudEmail`, `strStudPassHash`, `strStudPassSalt`, `strStudContact`, `intSectionID`) VALUES
	('2022-09235-MN-0', 'Firme', 'Jhon Denard', 'Pilar', 'firme.jhondenard@gmail.com', '$2b$12$G5Ajct2bw0HQedlsr1OyJebg2uhyB3Ny.zTgDMDmvgo4bpt8VM/py', '$2b$12$G5Ajct2bw0HQedlsr1OyJe', '09218393890', 3),
	('2022-12345-MN-0', 'Jimenez', 'Cyrus', 'Lalata', 'cyrusjimenez60@gmail.com', '$2b$12$g8DBoyZEuIf/RmLYJrYpMuovclWCxwUdX6pbAjZaU7WmfaMiK2vJu', '$2b$12$g8DBoyZEuIf/RmLYJrYpMu', '09123456789', 1),
	('2023-24678-MN-0', 'Potter', 'Harry', 'James', 'harrypotter38@gmail.com', '$2b$12$iKX8ADcIvJ.tEnDTbl/bP.2LBQzb8arz4HTgumxpDpVUuk/iZjTSe', '$2b$12$iKX8ADcIvJ.tEnDTbl/bP.', '09456127891', 2);

-- Dumping structure for table dbInternshipEvalSys.tblSupervisor
CREATE TABLE IF NOT EXISTS `tblSupervisor` (
  `intSupervisorID` int(11) NOT NULL AUTO_INCREMENT,
  `strSupervisorLast` varchar(50) NOT NULL,
  `strSupervisorFirst` varchar(50) NOT NULL,
  `strSupervisorMiddle` varchar(50) DEFAULT NULL,
  `strSupervisorEmail` varchar(100) NOT NULL,
  `strSupervisorPassHash` varchar(255) NOT NULL,
  `strSupervisorPassSalt` varchar(64) NOT NULL,
  `strSupervisorContact` varchar(20) NOT NULL,
  `strSupervisorPosition` varchar(100) NOT NULL,
  `intCompanyID` int(11) NOT NULL,
  PRIMARY KEY (`intSupervisorID`),
  UNIQUE KEY `strSupervisorEmail` (`strSupervisorEmail`),
  UNIQUE KEY `strSupervisorContact` (`strSupervisorContact`),
  UNIQUE KEY `idxSupervisorName` (`strSupervisorLast`,`strSupervisorFirst`,`strSupervisorMiddle`),
  KEY `fkCompanyID` (`intCompanyID`),
  CONSTRAINT `fkCompanyID` FOREIGN KEY (`intCompanyID`) REFERENCES `tblHTE` (`intCompanyID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table dbInternshipEvalSys.tblSupervisor: ~2 rows (approximately)
INSERT INTO `tblSupervisor` (`intSupervisorID`, `strSupervisorLast`, `strSupervisorFirst`, `strSupervisorMiddle`, `strSupervisorEmail`, `strSupervisorPassHash`, `strSupervisorPassSalt`, `strSupervisorContact`, `strSupervisorPosition`, `intCompanyID`) VALUES
	(1, 'McGonagall', 'Minerva', 'Gimber', 'minervag@gmail.com', 'f6773d201ee45d6f5c156f63768151a5456fda198051f9a1bdc7773e32980f7e', 'e76e3a9253b19134417fcbcb2cbecc78', '09987654321', 'Professor', 1),
	(2, 'Hagrid', 'Rubeus', 'Rowlane', 'hagrid57@gmail.com', '00a9d5d8d12e72e11977e1f53e384ac8f71e6b034bb08f91122fb928c654b2ab', 'a2c1f8057819a3fbb5e21f987fd7c1e3', '09567891234', 'Keeper of Keys', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
