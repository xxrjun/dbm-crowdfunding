CREATE DATABASE  IF NOT EXISTS `db_109403019` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_109403019`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_109403019
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'db_109403019'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CreateProposal`(
	IN in_member_id INT,
    IN in_title VARCHAR(120),
    IN in_content TEXT,
    IN in_goal INT,
    IN in_category_id INT,
    OUT affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;

	-- Check whether the input member exists in our member table
	IF EXISTS (SELECT member_id FROM tblmember
				WHERE member_id = in_member_id)
	THEN
		-- Check whether the input category is valid
		IF EXISTS (SELECT category_id FROM tblcategory
					WHERE category_id = in_category_id)
		THEN
			-- Insert new proposal into proposal table
			INSERT INTO tblproposal (category_id, title, content, amount, goal, status, viewed_num, create_time, is_deactivated)
			VALUES (in_category_id, in_title, in_content, 0, in_goal, 1, 0, NOW(), 0);
			
			-- update affected_row_num
			SELECT ROW_COUNT() INTO temp;
            
			-- Insert new data into proposalmember table
			INSERT INTO tblproposalmember(proposal_id, member_id)
			VALUES ((SELECT MAX(proposal_id) FROM tblproposal), in_member_id);
			
            -- update affected_row_num
			SELECT ROW_COUNT() + temp INTO temp;
            
			-- Show result
			SELECT pp.proposal_id, pp.title as proposal_title, 
					pp.content as proposal_content, pp.amount, pp.goal,
					pp.status, pp.viewed_num, pp.create_time, pp.due_time,
					catg.category_name as category
			FROM
				tblproposal as pp
			JOIN
				tblcategory catg ON pp.category_id = catg.category_id
			ORDER BY pp.proposal_id DESC
            LIMIT 1;

		END IF;
    END IF;
    
     -- put temp to out_affected_row_num
	SELECT temp INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DeleteMember`(
	IN in_member_id INT,
    OUT affected_row_num INT
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;
    
	-- Check whether the input user exists in our database and hadn't been deleted
	IF EXISTS (SELECT member_id FROM tblmember 
				WHERE member_id = in_member_id)
	THEN
		-- Input user exists, then update member table
        UPDATE tblmember
        SET
			name = "USER_DELETED",
            email = CONCAT("USER_DELETED__@@_", in_member_id),
            salt = '',
            address = NOW()
		WHERE 
			member_id = in_member_id AND email NOT LIKE 'USER_DELETED__@@_%';
		
        SELECT ROW_COUNT() INTO temp;
		
		IF temp > 0
        THEN
		UPDATE tblmembercredential
        SET
			hashed_pwd_string = ''
		WHERE
			hashed_user_id = in_member_id;
            
		SELECT ROW_COUNT() + temp INTO temp;
		END IF;
        
        IF temp > 0
        THEN
			-- Show deleted user
			SELECT * FROM tblmember WHERE member_id = in_member_id;
		END IF;
	END IF;
    
    SELECT temp INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT fr.member_id, pp.title as proposal_title,
			pp.amount as proposal_amount, pp.goal as proposal_goal
	FROM
		tblfollowingrecord fr
	JOIN
		tblproposal pp ON pp.proposal_id = fr.proposal_id
	WHERE
		member_id = in_member_id;
	
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT sr.member_id, ppo.proposal_id , 
			pp.title as proposal_title, ppo.title as proposal_option_title, 
            sr.amount, pp.status
	FROM 
		tblsponsorrecord sr
    JOIN 
		tblproposaloption ppo ON sr.proposal_option_id = ppo.proposal_option_id
	JOIN
		tblproposal pp ON pp.proposal_id = ppo.proposal_id
	WHERE
		sr.member_id = in_member_id;
        
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN in_ratio FLOAT,
    OUT outNumFound int
)
BEGIN
	SELECT pp.proposal_id, title as proposal_title, amount, 
			goal, amount / goal as ratio
	FROM tblproposal pp
    WHERE amount / goal >= in_ratio
    ORDER BY amount / goal DESC;
    
    SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetProposalsByKeyword`(
	IN in_keyword VARCHAR(64),
    OUT outNumFound int
)
BEGIN
	SELECT proposal_id, title as proposal_title, 
			due_time, amount
    FROM tblproposal
    WHERE title LIKE CONCAT('%', in_keyword, '%');
    
    SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetRecommendedProposals`(
	IN in_member_id INT
)
BEGIN
	IF in_member_id NOT IN (SELECT member_id FROM member)
    THEN
		SELECT proposal_id, title as proposal_title,
				status, viewed_num
		FROM
			tblproposal
		ORDER BY viewed_num
        LIMIT 5;
	ELSE
		SELECT proposal_id, title as proposal_title,
				status, viewed_num
		FROM
			tblproposal
		ORDER BY viewed_num
        LIMIT 5;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetUnrepliedComments`(
	IN in_member_id INT,
    OUT outNumFound int
)
BEGIN
	SELECT c.member_id, c.proposal_id, pp.title as proposal_title,
			c.comment_id, c.user_comment as member_comment,
            c.comment_time, c.proposer_response
	FROM 
		tblcomment c
	JOIN tblproposal pp ON pp.proposal_id = c.proposal_id
    WHERE c.member_id = in_member_id
    AND c.proposer_response = '' OR c.proposer_response IS NULL;
    
	SELECT FOUND_ROWS() INTO outNumFound;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(
	IN in_email VARCHAR(64),
    IN in_hashedpwd VARCHAR(200),
    OUT status_code INT
)
BEGIN
	-- Check whether the input email is exists or is valid
    IF NOT EXISTS (SELECT email FROM tblmember WHERE email = in_email)
    THEN
		-- email does not exists
		SET status_code = 3;
	ELSEIF in_email LIKE 'USER_DELETED__@@_%' 
    THEN
		-- deleted user cannot login
		SET status_code = 3;
	ELSEIF EXISTS (SELECT email, hashed_pwd_string FROM tblmember 
    JOIN tblmembercredential mc ON member_id = mc.credential_id
    WHERE email = in_email AND hashed_pwd_string = in_hashedpwd)
    THEN
		-- Login Successfully
		SET status_code = 1;
	ELSEIF EXISTS (SELECT email, hashed_pwd_string FROM tblmember 
    JOIN tblmembercredential mc ON member_id = mc.credential_id
    WHERE email = in_email AND hashed_pwd_string != in_hashedpwd)
    THEN
		-- email exists, but  with wrong password
        SET status_code = 2;
	ELSE
		SET status_code = 3;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegisterMember`(
	IN in_email VARCHAR(64),
    IN in_hashedPwd VARCHAR(200),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(64),
    IN in_address VARCHAR(255),
    IN in_phone VARCHAR(64),
    OUT affected_row_num int
)
BEGIN
	DECLARE temp INT DEFAULT 0;
    
	IF NOT EXISTS(SELECT email FROM tblmember WHERE email = in_email)
	THEN
		INSERT INTO tblmember(name, phone, email, salt, address)
        VALUES (in_name, in_phone, in_email, in_salt, in_address);
        
        SELECT ROW_COUNT() INTO temp;
        
        INSERT INTO tblmembercredential(
			hashed_user_id,
            hashed_pwd_string
        )
        SELECT
			member_id,
            in_hashedPwd
		FROM
			tblmember
        WHERE
			email = in_email;
            
		SELECT ROW_COUNT() + temp INTO temp;
            
		SELECT m.member_id, m.name, m.email, mc.hashed_pwd_string as password,
				m.salt, m.phone, m.address
		FROM
			tblmember m
		JOIN
			tblmembercredential mc ON m.member_id = mc.hashed_user_id
		WHERE m.email = in_email;
	END IF;
    
	-- Get affected_row_num
	SELECT temp INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateProposalStatus`(
	IN in_proposal_id INT,
    IN in_status INT,
    OUT affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;
    
    IF (in_status <= 3 AND in_status >= 1) 
    THEN
		UPDATE tblproposal
		SET 
			status = in_status,
            due_time = IF(in_status = 2, DATE_ADD(create_time, INTERVAL +90 DAY), due_time)
		WHERE proposal_id = in_proposal_id AND status = in_status - 1;
			
		-- update affected_row_num
		SELECT ROW_COUNT() INTO temp;
        
        -- show result if the change is valid
        IF ROW_COUNT() > 0
        THEN
			SELECT proposal_id, status
			FROM
				tblproposal
			WHERE proposal_id = in_proposal_id;
		END IF;
	END IF;
    
    -- put temp to affected_row_num
	SELECT temp INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdatePwd`(
	IN in_member_id INT,
    IN in_hashedPwd VARCHAR(200),
    IN in_salt CHAR(64),
    OUT affected_row_num int
)
BEGIN
	-- Declare a variable to store affected_row_num
	DECLARE temp INT DEFAULT 0;
    
	-- check whether the salt and the password is same as before
    IF NOT EXISTS(SELECT * FROM tblmember
			JOIN tblmembercredential ON hashed_user_id = member_id
			WHERE member_id = in_member_id
            AND (salt = in_salt OR hashed_pwd_string = in_hashedPwd)
            )
    THEN
		-- update salt in member
		UPDATE 
			tblmember
		SET
			salt = in_salt
		WHERE
			member_id = in_member_id;
            
		-- update affected_row_num
		SELECT ROW_COUNT() INTO temp;

		-- update hashed password in membercredential
		UPDATE
			tblmembercredential
		SET
			hashed_pwd_string = in_hashedPwd
		WHERE
			hashed_user_id = in_member_id;
            
		-- update affected_row_num
		SELECT ROW_COUNT() + temp INTO temp;
		END IF;

		-- show result if the update is valid
		IF ROW_COUNT() > 0
		THEN
		SELECT member_id, name, email, hashed_pwd_string as password, 
				salt, phone, address
		FROM tblmember
		JOIN tblmembercredential mc ON member_id = mc.hashed_user_id
		WHERE 
			member_id = in_member_id
		LIMIT 1;
	END IF;
    
    -- put temp to affected_row_num
	SELECT temp INTO affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14  3:17:56
