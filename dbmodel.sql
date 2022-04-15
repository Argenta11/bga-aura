
-- ------
-- BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
-- Aura implementation : © <Your name here> <Your email address here>
-- 
-- This code has been produced on the BGA studio platform for use on http://boardgamearena.com.
-- See http://en.boardgamearena.com/#!doc/Studio for more information.
-- -----

-- dbmodel.sql

-- This is the file where you are describing the database schema of your game
-- Basically, you just have to export from PhpMyAdmin your table structure and copy/paste
-- this export here.
-- Note that the database itself and the standard tables ("global", "stats", "gamelog" and "player") are
-- already created and must not be created here

-- Note: The database schema is created from this file when the game starts. If you modify this file,
--       you have to restart a game to see your changes in database.

CREATE TABLE IF NOT EXISTS `card` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `color` TINYINT UNSIGNED NOT NULL COMMENT '0 (beige), 1 (blue), 2 (green), 3 (purple), 4 (red)',
  `value` TINYINT UNSIGNED NOT NULL COMMENT '1 to 8 for cards with numbers on them, 9 for wild card, 10 for action card',
  `owner` INT(10) UNSIGNED COMMENT 'ID of the player who owns the card (0 before player is assigned)',
  `location` VARCHAR(12) NOT NULL COMMENT 'deck, hand, board, discard',
  `position` TINYINT UNSIGNED COMMENT 'Position in the given location (bottom of a pile is zero)',
  `selected` BOOLEAN NOT NULL COMMENT 'Temporary flag to indicate whether the card is selected by its owner or not',
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `card` (`color`, `value`, `owner`, `location`, `position`, `selected`) VALUES
  (0, 1, 0, 'deck', 0, FALSE),
  (0, 2, 0, 'deck', 0, FALSE),
  (0, 3, 0, 'deck', 0, FALSE),
  (0, 4, 0, 'deck', 0, FALSE),
  (0, 5, 0, 'deck', 0, FALSE),
  (0, 6, 0, 'deck', 0, FALSE),
  (0, 7, 0, 'deck', 0, FALSE),
  (0, 8, 0, 'deck', 0, FALSE),
  (0, 9, 0, 'deck', 0, FALSE),
  (0, 10, 0, 'deck', 0, FALSE),
  (1, 1, 0, 'deck', 0, FALSE),
  (1, 2, 0, 'deck', 0, FALSE),
  (1, 3, 0, 'deck', 0, FALSE),
  (1, 4, 0, 'deck', 0, FALSE),
  (1, 5, 0, 'deck', 0, FALSE),
  (1, 6, 0, 'deck', 0, FALSE),
  (1, 7, 0, 'deck', 0, FALSE),
  (1, 8, 0, 'deck', 0, FALSE),
  (1, 9, 0, 'deck', 0, FALSE),
  (1, 10, 0, 'deck', 0, FALSE),
  (2, 1, 0, 'deck', 0, FALSE),
  (2, 2, 0, 'deck', 0, FALSE),
  (2, 3, 0, 'deck', 0, FALSE),
  (2, 4, 0, 'deck', 0, FALSE),
  (2, 5, 0, 'deck', 0, FALSE),
  (2, 6, 0, 'deck', 0, FALSE),
  (2, 7, 0, 'deck', 0, FALSE),
  (2, 8, 0, 'deck', 0, FALSE),
  (2, 9, 0, 'deck', 0, FALSE),
  (2, 10, 0, 'deck', 0, FALSE),
  (3, 1, 0, 'deck', 0, FALSE),
  (3, 2, 0, 'deck', 0, FALSE),
  (3, 3, 0, 'deck', 0, FALSE),
  (3, 4, 0, 'deck', 0, FALSE),
  (3, 5, 0, 'deck', 0, FALSE),
  (3, 6, 0, 'deck', 0, FALSE),
  (3, 7, 0, 'deck', 0, FALSE),
  (3, 8, 0, 'deck', 0, FALSE),
  (3, 9, 0, 'deck', 0, FALSE),
  (3, 10, 0, 'deck', 0, FALSE),
  (4, 1, 0, 'deck', 0, FALSE),
  (4, 2, 0, 'deck', 0, FALSE),
  (4, 3, 0, 'deck', 0, FALSE),
  (4, 4, 0, 'deck', 0, FALSE),
  (4, 5, 0, 'deck', 0, FALSE),
  (4, 6, 0, 'deck', 0, FALSE),
  (4, 7, 0, 'deck', 0, FALSE),
  (4, 8, 0, 'deck', 0, FALSE),
  (4, 9, 0, 'deck', 0, FALSE),
  (4, 10, 0, 'deck', 0, FALSE);