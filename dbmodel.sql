-- ------
-- BGA framework: © Gregory Isabelli <gisabelli@boardgamearena.com> & Emmanuel Colin <ecolin@boardgamearena.com>
-- Aura implementation : © <Marta Martín de Argenta Hernández> <martamargenta@gmail.com>
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
  `color` VARCHAR(10) NOT NULL COMMENT 'ED1651(pink), 392666 (purple), 91D4E4 (blue), 48BA7F (green), D3D0C1 (gray)',
  `value` TINYINT UNSIGNED NOT NULL COMMENT '1 to 8 for cards with numbers on them, 9 for wild card, 10 for action card',
  `owner` INT(10) UNSIGNED COMMENT 'ID of the player who owns the card (0 before player is assigned)',
  `location` VARCHAR(12) NOT NULL COMMENT 'deck, hand, board, discard',
  `position` TINYINT UNSIGNED COMMENT 'Position in the given location (bottom of a pile is zero)',
  `selected` BOOLEAN NOT NULL COMMENT 'Temporary flag to indicate whether the card is selected by its owner or not',
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* Table used to manage the execution of nested effects */
CREATE TABLE IF NOT EXISTS `card2` (
 `card_id` SMALLINT UNSIGNED NOT NULL,
 `value` SMALLINT COMMENT '1 to 8 for cards with numbers on them, 9 for wild card, 0 for Aura card',
 `card_location` VARCHAR(12) DEFAULT NULL COMMENT 'The initial location of the card when its dogma was executed (deck, hand, board or NULL)',
 `owner_id` INT(10) NOT NULL COMMENT 'ID of the player who initially launched this card',
 `position` TINYINT COMMENT '-Position in the given location (bottom of a pile is zero)',
 `color` VARCHAR(10) COMMENT 'ED1651(pink), 392666 (purple), 91D4E4 (blue), 48BA7F (green), D3D0C1 (gray), AURA (Aura Card)',
 `selected` BOOLEAN NOT NULL COMMENT 'Temporary flag to indicate whether the card is selected by its owner or not',
  PRIMARY KEY(`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `random` (
 `card_id` SMALLINT UNSIGNED NOT NULL,
 `owner_id` TINYINT UNSIGNED,
 `random_number` DOUBLE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `shuffled` (
 `card_id` SMALLINT UNSIGNED NOT NULL,
 `new_position` TINYINT UNSIGNED 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `card` (`color`, `value`, `owner`, `location`, `position`, `selected`) VALUES
  ('ED1651', 2, 0, 'deck', 0, FALSE),
  ('ED1651', 2, 0, 'deck', 0, FALSE),
  ('ED1651', 3, 0, 'deck', 0, FALSE),
  ('ED1651', 4, 0, 'deck', 0, FALSE),
  ('ED1651', 5, 0, 'deck', 0, FALSE),
  ('ED1651', 6, 0, 'deck', 0, FALSE),
  ('ED1651', 7, 0, 'deck', 0, FALSE),
  ('ED1651', 8, 0, 'deck', 0, FALSE),
  ('392666', 1, 0, 'deck', 0, FALSE),
  ('392666', 2, 0, 'deck', 0, FALSE),
  ('392666', 3, 0, 'deck', 0, FALSE),
  ('392666', 4, 0, 'deck', 0, FALSE),
  ('392666', 5, 0, 'deck', 0, FALSE),
  ('392666', 6, 0, 'deck', 0, FALSE),
  ('392666', 7, 0, 'deck', 0, FALSE),
  ('392666', 8, 0, 'deck', 0, FALSE),
  ('91D4E4', 1, 0, 'deck', 0, FALSE),
  ('91D4E4', 2, 0, 'deck', 0, FALSE),
  ('91D4E4', 3, 0, 'deck', 0, FALSE),
  ('91D4E4', 4, 0, 'deck', 0, FALSE),
  ('91D4E4', 5, 0, 'deck', 0, FALSE),
  ('91D4E4', 6, 0, 'deck', 0, FALSE),
  ('91D4E4', 7, 0, 'deck', 0, FALSE),
  ('91D4E4', 8, 0, 'deck', 0, FALSE),
  ('48BA7F', 1, 0, 'deck', 0, FALSE),
  ('48BA7F', 2, 0, 'deck', 0, FALSE),
  ('48BA7F', 3, 0, 'deck', 0, FALSE),
  ('48BA7F', 4, 0, 'deck', 0, FALSE),
  ('48BA7F', 5, 0, 'deck', 0, FALSE),
  ('48BA7F', 6, 0, 'deck', 0, FALSE),
  ('48BA7F', 7, 0, 'deck', 0, FALSE),
  ('48BA7F', 8, 0, 'deck', 0, FALSE),
  ('D3D0C1', 1, 0, 'deck', 0, FALSE),
  ('D3D0C1', 2, 0, 'deck', 0, FALSE),
  ('D3D0C1', 3, 0, 'deck', 0, FALSE),
  ('D3D0C1', 4, 0, 'deck', 0, FALSE),
  ('D3D0C1', 5, 0, 'deck', 0, FALSE),
  ('D3D0C1', 6, 0, 'deck', 0, FALSE),
  ('D3D0C1', 7, 0, 'deck', 0, FALSE),
  ('D3D0C1', 8, 0, 'deck', 0, FALSE),
  ('ED1651', 1, 1, 'deck', 0, FALSE),
  ('ED1651', 2, 1, 'deck', 0, FALSE),
  ('ED1651', 3, 1, 'deck', 0, FALSE),
  ('ED1651', 4, 1, 'deck', 0, FALSE),
  ('ED1651', 5, 1, 'deck', 0, FALSE),
  ('ED1651', 6, 1, 'deck', 0, FALSE),
  ('ED1651', 7, 1, 'deck', 0, FALSE),
  ('ED1651', 8, 1, 'deck', 0, FALSE),
  ('392666', 1, 1, 'deck', 0, FALSE),
  ('392666', 2, 1, 'deck', 0, FALSE),
  ('392666', 3, 1, 'deck', 0, FALSE),
  ('392666', 4, 1, 'deck', 0, FALSE),
  ('392666', 5, 1, 'deck', 0, FALSE),
  ('392666', 6, 1, 'deck', 0, FALSE),
  ('392666', 7, 1, 'deck', 0, FALSE),
  ('392666', 8, 1, 'deck', 0, FALSE),
  ('91D4E4', 1, 1, 'deck', 0, FALSE),
  ('91D4E4', 2, 1, 'deck', 0, FALSE),
  ('91D4E4', 3, 1, 'deck', 0, FALSE),
  ('91D4E4', 4, 1, 'deck', 0, FALSE),
  ('91D4E4', 5, 1, 'deck', 0, FALSE),
  ('91D4E4', 6, 1, 'deck', 0, FALSE),
  ('91D4E4', 7, 1, 'deck', 0, FALSE),
  ('91D4E4', 8, 1, 'deck', 0, FALSE),
  ('48BA7F', 1, 1, 'deck', 0, FALSE),
  ('48BA7F', 2, 1, 'deck', 0, FALSE),
  ('48BA7F', 3, 1, 'deck', 0, FALSE),
  ('48BA7F', 4, 1, 'deck', 0, FALSE),
  ('48BA7F', 5, 1, 'deck', 0, FALSE),
  ('48BA7F', 6, 1, 'deck', 0, FALSE),
  ('48BA7F', 7, 1, 'deck', 0, FALSE),
  ('48BA7F', 8, 1, 'deck', 0, FALSE),
  ('D3D0C1', 1, 1, 'deck', 0, FALSE),
  ('D3D0C1', 2, 1, 'deck', 0, FALSE),
  ('D3D0C1', 3, 1, 'deck', 0, FALSE),
  ('D3D0C1', 4, 1, 'deck', 0, FALSE),
  ('D3D0C1', 5, 1, 'deck', 0, FALSE),
  ('D3D0C1', 6, 1, 'deck', 0, FALSE),
  ('D3D0C1', 7, 1, 'deck', 0, FALSE),
  ('D3D0C1', 8, 1, 'deck', 0, FALSE);