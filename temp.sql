-- Tutorial revision
-- IGNORE ALL (")
-- *MAKING TABLE*
-- DROP TABLE IF EXISTS "YOUR TABLE NAME";
-- CREATE TABLE "YOUR TABLE NAME'(eventId INT(20)
-- 								 ,eventName VARCHAR(40)
--                               ,PRIMARY KEY (eventId)
--                               );
-- *INSERTING VALUES*
-- INSERT INTO general_event_info (COLUMN NAME
-- 							   )
-- VALUES 						   ("ENTRY"
-- 							   );
-- *INSERTING COLUMN*
-- ALTER TABLE "TABLE NAME" 
-- ADD COLUMN "COLUMN NAME" "COLUMN DEFINITION" AFTER "EXSITING COLUMN NAME"
--USE event_information;

DROP TABLE IF EXISTS contactInfo;
DROP TABLE IF EXISTS subEventInfo;
DROP TABLE IF EXISTS generalEventInfo;

CREATE TABLE generalEventInfo (eventId 					INT(20) 		AUTO_INCREMENT
							  ,eventName 				VARCHAR(40)
                              ,PRIMARY KEY (eventId)
                              );
CREATE TABLE subEventInfo	  (eventId					INT(20)
							  ,subEventName 			VARCHAR(40)
                              ,subEventInfo 			VARCHAR(500)
							  ,contactName1 			VARCHAR(40)
                              ,contactNum1 				VARCHAR(40)
                              ,contactName2 			VARCHAR(40)
                              ,contactNum2 				VARCHAR(40)
                              ,subEventLong				DECIMAL(10, 8)
                              ,subEventLat				DECIMAL(10, 8)
                              ,subEventLocation			VARCHAR(40)
                              ,PRIMARY KEY (eventId)
					,FOREIGN KEY (eventId) 	REFERENCES generalEventInfo(eventId)
                              );
CREATE TABLE contactInfo 	  (eventId 					INT(20)
							  ,generalOrganizers 		VARCHAR(40)
                              ,FOREIGN KEY (eventId) 	REFERENCES generalEventInfo(eventId)
                              ,PRIMARY KEY (eventId)
                              );

-- ALTER TABLE generalEventInfo AUTO_INCREMENT=1001;

-- INSERT INTO generalEventInfo (eventName
-- 							 )
-- VALUES 						 ("TAKE HOME"
-- 							 );
-- INSERT INTO contactInfo 	 (eventId
-- 							 ,generalOrganizers
-- 							 )
-- VALUES 						 (1001
-- 							 ,"THE REPO"
-- 							 );

-- UPDATE generalEventInfo
-- SET contactTeam="THE REPO"
-- WHERE eventId=1001;
-- UPDATE contactInfo
-- SET contactPerson="MR. REPO"
-- WHERE generalOrganizers="THE REPO";
-- SELECT * FROM generalEventInfo;
-- SELECT * FROM contactInfo;

