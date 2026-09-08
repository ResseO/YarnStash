-- postgreSQL v18
-- ════════════════════════════════════════
-- 🧶 PERSONAL YARN STASH DATABASE
-- COMPLETED SCHEMA
-- ════════════════════════════════════════

-- ── TABLE 1: BRANDS ──
CREATE TABLE Brands(
  ID            INT          PRIMARY KEY,
  Brand         VARCHAR(30)  NOT NULL,
  Purchase_Place VARCHAR(30) NOT NULL,
  Website       TEXT,
  Notes         TEXT);

-- ── TABLE 2: YARN ──
CREATE TABLE Yarn(
  ID           INT          PRIMARY KEY,
  Brand_ID     INT,
  Yarn_Name    VARCHAR(30)  NOT NULL,
  Yarn_Weight  INT          NOT NULL,
  Yardage      INT          NOT NULL,
  Skein_Weight DECIMAL(4,2) NOT NULL,
  Needle_Size  DECIMAL(4,2));
-- Yarn_Weight is yarn weight category (e.g. 4 = worsted, 6 = bulky)
-- Skein_Weight is in ounces
-- Needle_Size added via ALTER TABLE; included here for cleanliness

ALTER TABLE Yarn
  ADD FOREIGN KEY (Brand_ID) REFERENCES Brands(ID);

-- ── TABLE 3: STASH ──
CREATE TABLE Stash(
  ID           INT          PRIMARY KEY,
  YARN_ID      INT          NOT NULL,
  COLOR_NAME   VARCHAR(45)  NOT NULL,
  DYE_LOT      VARCHAR(30),
  QTY          INT          NOT NULL,
  SCRAP_WEIGHT DECIMAL(4,2),
  AVAILABLE    BOOLEAN      DEFAULT TRUE);
-- AVAILABLE added via ALTER TABLE; included here for cleanliness

ALTER TABLE Stash
  ADD FOREIGN KEY (YARN_ID) REFERENCES Yarn(ID);

ALTER TABLE Stash
  ADD COLUMN Notes TEXT;
-- added to capture colorway descriptions and other stash-level details


-- ════════════════════════════════════════
-- INSERT BRANDS
-- ════════════════════════════════════════

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(1, 'Loops and Threads', 'Micheals', 'www.micheals.com', NULL);

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(2, 'Caron', 'Hobby Lobby', 'yarnspirations.com', NULL);

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(3, 'Premier', 'Dollar Tree', 'dollartree.com', NULL);

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(4, 'Velvet', 'Amazon', 'amazon.com', 'found in amazon haul');

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(5, 'Lion Brand', 'Capital Ministries Thrift', NULL,
    'cannot be repurchased and its a bit itchy soak finished product in fabric softener');

INSERT INTO Brands(ID, Brand, Purchase_Place, Website, Notes)
  VALUES(6, 'Yarn Bee', 'Hobby Lobby', 'hobbylobby.com', NULL);


-- ════════════════════════════════════════
-- INSERT YARN
-- ════════════════════════════════════════

-- Loops and Threads (Brand_ID 1)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(1, 1, 'Soft Classic', 4, 354, 7, 5.5);

INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(2, 1, 'Impeccable', 4, 280, 8, 5.0);

-- Caron (Brand_ID 2)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(3, 2, 'Cloud Cakes Perfect Phasing', 4, 720, 8, 4.5);

INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(4, 2, 'Slice of Anniversary Cake', 6, 285, 8.8, 8.0);

INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(5, 2, 'Simply Soft', 4, 315, 6, 5.0);

-- Premier (Brand_ID 3)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(6, 3, 'Just Chenille', 6, 65, 2, 8.0);

-- Velvet (Brand_ID 4)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(7, 4, 'Soft Chenille', 6, 66, 3.53, 7.0);

-- Lion Brand (Brand_ID 5)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(8, 5, 'Wool Ease Chunky', 5, 153, 4.94, 6.5);

-- Loops and Threads continued (Brand_ID 1)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(9, 1, 'Charisma', 5, 109, 3.5, 8.0);

INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(11, 1, 'Bulky Twist Multi', 6, 130, 2.9, 6.5);

-- Yarn Bee (Brand_ID 6)
INSERT INTO Yarn(ID, Brand_ID, Yarn_Name, Yarn_Weight, Yardage, Skein_Weight, Needle_Size)
  VALUES(10, 6, 'Yarntopia', 2, 312, 4.0, 4.5);


-- ════════════════════════════════════════
-- INSERT STASH
-- ════════════════════════════════════════

-- Soft Classic (YARN_ID 1)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(1,  1, 'GRAY',       '680',  2, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(2,  1, 'GRAY',       '3351', 1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(3,  1, 'WHITE',      '147',  3, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(4,  1, 'BLUE',       '1160', 1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(5,  1, 'CHARCOAL',   '697',  3, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(6,  1, 'BLACK',      '3944', 2, 12.38, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(7,  1, 'LIGHT GRAY', '676',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(8,  1, 'LIGHT GRAY', '619',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(9,  1, 'BISQUE',     '3572', 1, 3.71,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(10, 1, 'BUTTER',     '3955', 1, 2.58,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(11, 1, 'PINK',       '613',  1, 5.5,   TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(12, 1, 'PINK',       '669',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(13, 1, 'CORAL',      '3581', 1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(14, 1, 'AMETHYST',   '229',  1, 4.0,   TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(15, 1, 'MINT',       '645',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(16, 1, 'DARK TAUPE', '701',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(17, 1, 'SAGE',       '667',  1, NULL,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(18, 1, 'BRIGHT RED', '3948', 1, 3.99,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(19, 1, 'ARTIC',      '683',  1, NULL,  TRUE);

-- Impeccable (YARN_ID 2)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(20, 2, 'PETUNIA',   '369756',        1, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(21, 2, 'AMETHYST',  '2024-04-100999',1, NULL, TRUE);

-- Simply Soft (YARN_ID 5)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(22, 5, 'BLACK',     NULL, 1, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(23, 5, 'SOFT PINK', NULL, 0, NULL, FALSE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(24, 5, 'PAGODA',    NULL, 1, 1.09, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(25, 5, 'WHITE',     NULL, 0, 4.0,  TRUE);

-- Just Chenille (YARN_ID 6)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(26, 6, 'AQUA',        '2017-13', 2, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(27, 6, 'SALMON',      '2017-16', 1, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(28, 6, 'LIGHT MAUVE', '2017-35', 2, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(29, 6, 'GRAY',        '2767',    1, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(30, 6, 'WHITE',       '537',     2, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(31, 6, 'BLACK',       NULL,      1, NULL, TRUE);

-- Soft Chenille (YARN_ID 7)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(32, 7, 'LIGHT BROWN', NULL, 2, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(33, 7, 'DARK BROWN',  NULL, 2, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(34, 7, 'SOFT PINK',   NULL, 6, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(35, 7, 'WHITE',       NULL, 3, NULL, TRUE);

-- Cloud Cakes Perfect Phasing (YARN_ID 3)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(36, 3, 'ROYAL', NULL, 1, NULL, FALSE);

-- Slice of Anniversary Cake (YARN_ID 4)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(37, 4, 'CROCUS', NULL, 1, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(38, 4, 'WAVE',   NULL, 1, NULL, TRUE);

-- Scraps Only (QTY = 0)
-- Soft Classic scraps (YARN_ID 1)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(39, 1, 'LIGHT BLUE',   NULL, 0, 3.35, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(40, 1, 'MOCHA',        NULL, 0, 2.5,  TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(41, 1, 'CHOCOLATE',    NULL, 0, 7.09, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(42, 1, 'LIGHT PURPLE', NULL, 0, 2.72, TRUE);

-- Simply Soft scraps (YARN_ID 5)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(43, 5, 'WINE',         NULL, 0, 2.08, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(44, 5, 'BURNT ORANGE', NULL, 0, 1.16, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(45, 5, 'ORANGE',       NULL, 0, 1.23, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(46, 5, 'PERIWINKLE',   NULL, 0, 0.74, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(47, 5, 'YELLOW',       NULL, 0, 0.85, TRUE);

-- Wool Ease Chunky (YARN_ID 8)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(48, 8, 'INDIGO', '45726', 2, 4.0, TRUE);

-- Charisma (YARN_ID 9)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE, Notes)
  VALUES(49, 9, 'BLACK RASPBERRY', '4063', 8, NULL, TRUE, 'multi color pink grey black');

-- Yarntopia (YARN_ID 10)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(50, 10, 'HEATHER', '73719535', 3, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(51, 10, 'ANCHOR', '73719544', 3, NULL, TRUE);
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(52, 10, 'BLUSH', NULL, 3, NULL, FALSE);

-- Bulky Twist Multi (YARN_ID 11)
INSERT INTO Stash(ID, YARN_ID, COLOR_NAME, DYE_LOT, QTY, SCRAP_WEIGHT, AVAILABLE)
  VALUES(53, 11, 'SAND DUNE', NULL, 6, NULL, TRUE);
