-- Descriptors for the switches that had none, read off their milktooth.com product pages
-- (milktooth exposes them as switches_by_descriptor on each product page).
--
-- milktooth now uses a wider vocabulary than SwitchSchema.descriptors, so its terms are
-- folded onto our 14 as follows:
--   accented       -> (no MxMatrix equivalent, dropped)
--   bassy          -> deep
--   bouncy         -> snappy
--   buttery        -> smooth
--   chirpy         -> high-pitched
--   clacky         -> clacky
--   creamy         -> smooth
--   crunchy        -> clacky
--   easy-to-press  -> light
--   feathery       -> light
--   frictionless   -> smooth
--   gummy          -> mushy
--   high-pitched   -> high-pitched
--   invigorating   -> snappy
--   low-pitched    -> deep
--   marbly         -> marbly
--   mild           -> neutral
--   muted          -> muted
--   neutral        -> neutral
--   polished       -> smooth
--   resonant       -> marbly
--   sharp          -> snappy
--   silky          -> smooth
--   snappy         -> snappy
--   stepped        -> (no MxMatrix equivalent, dropped)
--   stiff          -> heavy
--   subdued        -> muted
--   subtle         -> light, muted
--   textured       -> scratchy
--   thocky         -> thocky
--
--
-- 'shallow' is not a milktooth term: it is applied here to any switch with a total
-- travel under 3.5mm, from SwitchSchema.switches.total_travel.
--
-- Each switch's source URL and its raw milktooth terms are in the comment above its rows.
-- Inserts are idempotent; run inside the transaction and review before COMMIT.
-- Join table name per DbContextEF: SwitchSchema.switch_descriptor (switch_id, descriptor_id).

BEGIN TRANSACTION;

-- 62: Durock Sea Glass  <- https://milktooth.com/products/sea-glass  [mild, feathery, easy-to-press, frictionless]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 62, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 62 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 62, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 62 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 62, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 62 AND descriptor_id = 8);  -- smooth

-- 102: Gateron LongJing  <- https://milktooth.com/products/longjing  [snappy, neutral, subtle]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 102, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 102 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 102, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 102 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 102, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 102 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 102, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 102 AND descriptor_id = 6);  -- muted

-- 106: Gateron Mini i  <- https://milktooth.com/products/mini-i  [bouncy, easy-to-press, mild, snappy, subtle, stepped, neutral]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 106, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 106 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 106, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 106 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 106, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 106 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 106, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 106 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 106, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 106 AND descriptor_id = 10);  -- shallow

-- 107: Everglide Sunset Yellow  <- https://milktooth.com/products/sunset-yellow  [creamy, frictionless, polished, thocky, bassy]  travel 3.2mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 107, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 107 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 107, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 107 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 107, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 107 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 107, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 107 AND descriptor_id = 10);  -- shallow

-- 108: HMX 1989  <- https://milktooth.com/products/1989  [high-pitched, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 108, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 108 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 108, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 108 AND descriptor_id = 8);  -- smooth

-- 109: PH Studio Aniya  <- https://milktooth.com/products/aniya  [clacky, creamy, high-pitched, marbly, silky, resonant, polished]  travel 3.2mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 109, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 109 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 109, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 109 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 109, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 109 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 109, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 109 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 109, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 109 AND descriptor_id = 10);  -- shallow

-- 110: Dareu Aqua  <- https://milktooth.com/products/aqua  [chirpy, clacky, easy-to-press, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 110, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 110 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 110, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 110 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 110, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 110 AND descriptor_id = 15);  -- light

-- 112: KTT Ash Gray  <- https://milktooth.com/products/ash-gray  [easy-to-press, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 112, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 112 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 112, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 112 AND descriptor_id = 4);  -- neutral

-- 113: Gateron Azure Dragon V4  <- https://milktooth.com/products/azure-dragon-v4  [high-pitched, clacky, accented, invigorating, snappy]  travel 3.0mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 113, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 113 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 113, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 113 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 113, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 113 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 113, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 113 AND descriptor_id = 10);  -- shallow

-- 116: HMX Bad Sweetheart  <- https://milktooth.com/products/bad-sweetheart  [thocky, bassy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 116, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 116 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 116, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 116 AND descriptor_id = 5);  -- deep

-- 117: Gateron Banana Smoothie  <- https://milktooth.com/products/banana-smoothie  [sharp, polished, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 117, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 117 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 117, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 117 AND descriptor_id = 8);  -- smooth

-- 118: Wuque Studio Biglucky Linear  <- https://milktooth.com/products/biglucky-linear  [buttery, polished, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 118, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 118 AND descriptor_id = 8);  -- smooth

-- 119: Wuque Studio Biglucky Tactile  <- https://milktooth.com/products/biglucky-tactile  [mild, polished, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 119, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 119 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 119, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 119 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 119, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 119 AND descriptor_id = 11);  -- snappy

-- 120: HMX Bleed  <- https://milktooth.com/products/bleed  [high-pitched, snappy, subdued, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 120, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 120 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 120, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 120 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 120, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 120 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 120, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 120 AND descriptor_id = 4);  -- neutral

-- 121: Aflion Blue Sky  <- https://milktooth.com/products/blue-sky  [high-pitched, neutral, mild, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 121, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 121 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 121, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 121 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 121, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 121 AND descriptor_id = 8);  -- smooth

-- 122: HMX Blue Star  <- https://milktooth.com/products/blue-star  [muted, snappy, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 122, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 122 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 122, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 122 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 122, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 122 AND descriptor_id = 8);  -- smooth

-- 123: HMX Blue Topaz  <- https://milktooth.com/products/blue-topaz  [easy-to-press, clacky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 123, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 123 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 123, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 123 AND descriptor_id = 2);  -- clacky

-- 124: Jerrzi Blueberry Mousse  <- https://milktooth.com/products/blueberry-mousse  [clacky, snappy]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 124, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 124 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 124, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 124 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 124, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 124 AND descriptor_id = 10);  -- shallow

-- 125: Akko Botany  <- https://milktooth.com/products/botany  [polished, high-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 125, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 125 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 125, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 125 AND descriptor_id = 3);  -- high-pitched

-- 126: Keygeek Briny  <- https://milktooth.com/products/briny  [frictionless, low-pitched, neutral, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 126, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 126 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 126, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 126 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 126, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 126 AND descriptor_id = 4);  -- neutral

-- 127: TTC Brother  <- https://milktooth.com/products/brother  [crunchy, stepped, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 127, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 127 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 127, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 127 AND descriptor_id = 15);  -- light

-- 128: Jerrzi Brownie  <- https://milktooth.com/products/brownie  [buttery, clacky]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 128, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 128 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 128, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 128 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 128, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 128 AND descriptor_id = 10);  -- shallow

-- 129: HMX Bruise  <- https://milktooth.com/products/bruise  [high-pitched, snappy, subdued, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 129, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 129 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 129, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 129 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 129, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 129 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 129, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 129 AND descriptor_id = 4);  -- neutral

-- 130: Bsun Bsun Pine  <- https://milktooth.com/products/bsun-pine  [accented, invigorating, sharp, snappy]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 130, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 130 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 130, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 130 AND descriptor_id = 10);  -- shallow

-- 132: KTT Cabbage Tofu  <- https://milktooth.com/products/cabbage-tofu  [clacky, creamy, high-pitched, silky, snappy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 132, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 132 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 132, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 132 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 132, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 132 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 132, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 132 AND descriptor_id = 11);  -- snappy

-- 133: HMX Canglan V3  <- https://milktooth.com/products/canglan-v3  [thocky, silky, low-pitched, feathery, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 133, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 133 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 133, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 133 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 133, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 133 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 133, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 133 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 133, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 133 AND descriptor_id = 11);  -- snappy

-- 134: HMX Caramel Pudding  <- https://milktooth.com/products/caramel-pudding  [clacky, high-pitched, bouncy, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 134, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 134 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 134, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 134 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 134, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 134 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 134, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 134 AND descriptor_id = 8);  -- smooth

-- 135: Aflion Carrot  <- https://milktooth.com/products/carrot  [clacky, high-pitched, bouncy, snappy, stepped, feathery, subtle, marbly]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 135, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 135 AND descriptor_id = 7);  -- marbly

-- 136: HMX Cheese  <- https://milktooth.com/products/cheese  [easy-to-press, clacky, feathery, silky, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 136, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 136 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 136, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 136 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 136, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 136 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 136, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 136 AND descriptor_id = 11);  -- snappy

-- 138: Gateron Chocolate Smoothie  <- https://milktooth.com/products/chocolate-smoothie  [mild, buttery, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 138, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 138 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 138, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 138 AND descriptor_id = 8);  -- smooth

-- 139: Gateron CJ  <- https://milktooth.com/products/cj  [chirpy, neutral, low-pitched, thocky, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 139, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 139 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 139, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 139 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 139, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 139 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 139, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 139 AND descriptor_id = 1);  -- thocky

-- 140: HMX Cloud Light  <- https://milktooth.com/products/cloud-light  [clacky, high-pitched, bouncy, silky, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 140, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 140 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 140, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 140 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 140, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 140 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 140, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 140 AND descriptor_id = 8);  -- smooth

-- 141: HMX Cloud V2  <- https://milktooth.com/products/cloud-v2  [clacky, polished, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 141, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 141 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 141, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 141 AND descriptor_id = 8);  -- smooth

-- 142: Aflion Cloudy Shadow  <- https://milktooth.com/products/cloudy-shadow  [low-pitched, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 142, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 142 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 142, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 142 AND descriptor_id = 4);  -- neutral

-- 143: Jerrzi Coral  <- https://milktooth.com/products/coral  [low-pitched, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 143, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 143 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 143, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 143 AND descriptor_id = 8);  -- smooth

-- 144: HMX Coral Sea  <- https://milktooth.com/products/coral-sea  [buttery, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 144, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 144 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 144, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 144 AND descriptor_id = 15);  -- light

-- 148: Keygeek Cyan  <- https://milktooth.com/products/cyan  [polished, feathery, silky, mild, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 148, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 148 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 148, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 148 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 148, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 148 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 148, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 148 AND descriptor_id = 5);  -- deep

-- 149: Durock Daybreak  <- https://milktooth.com/products/daybreak  [polished, low-pitched, muted]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 149, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 149 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 149, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 149 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 149, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 149 AND descriptor_id = 6);  -- muted

-- 150: HMX Dino  <- https://milktooth.com/products/dino  [polished, silky, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 150, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 150 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 150, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 150 AND descriptor_id = 4);  -- neutral

-- 151: Durock Dolphin  <- https://milktooth.com/products/dolphin  [polished, muted, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 151, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 151 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 151, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 151 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 151, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 151 AND descriptor_id = 5);  -- deep

-- 152: Keygeek Dusk Horizon  <- https://milktooth.com/products/dusk-horizon  [buttery, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 152, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 152 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 152, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 152 AND descriptor_id = 5);  -- deep

-- 153: Wuque Studio EF Dopamine  <- https://milktooth.com/products/ef-dopamine  [mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 153, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 153 AND descriptor_id = 4);  -- neutral

-- 154: Gateron EF Yellow  <- https://milktooth.com/products/ef-yellow  [muted, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 154, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 154 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 154, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 154 AND descriptor_id = 4);  -- neutral

-- 155: HMX Emo  <- https://milktooth.com/products/emo  [bouncy, polished, easy-to-press, high-pitched, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 155, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 155 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 155, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 155 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 155, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 155 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 155, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 155 AND descriptor_id = 3);  -- high-pitched

-- 156: Gateron Everfree Cedar  <- https://milktooth.com/products/everfree-cedar  [snappy, polished, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 156, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 156 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 156, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 156 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 156, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 156 AND descriptor_id = 4);  -- neutral

-- 157: Gateron Everfree Curry  <- https://milktooth.com/products/everfree-curry  [snappy, polished, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 157, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 157 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 157, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 157 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 157, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 157 AND descriptor_id = 4);  -- neutral

-- 158: Keygeek Explosion  <- https://milktooth.com/products/explosion  [clacky, high-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 158, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 158 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 158, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 158 AND descriptor_id = 3);  -- high-pitched

-- 160: HMX Firecracker  <- https://milktooth.com/products/firecracker  [clacky, snappy, accented]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 160, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 160 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 160, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 160 AND descriptor_id = 11);  -- snappy

-- 161: TTC Flame Red  <- https://milktooth.com/products/flame-red  [neutral, mild, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 161, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 161 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 161, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 161 AND descriptor_id = 8);  -- smooth

-- 162: TTC Flaming Pink  <- https://milktooth.com/products/flaming-pink  [clacky, silky, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 162, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 162 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 162, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 162 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 162, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 162 AND descriptor_id = 11);  -- snappy

-- 163: Aflion Foggy Shadow  <- https://milktooth.com/products/foggy-shadow  [low-pitched, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 163, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 163 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 163, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 163 AND descriptor_id = 4);  -- neutral

-- 168: HMX Gachapon  <- https://milktooth.com/products/gachapon  [creamy, polished, silky, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 168, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 168 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 168, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 168 AND descriptor_id = 4);  -- neutral

-- 169: Jwick Ginger Milk  <- https://milktooth.com/products/ginger-milk  [neutral, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 169, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 169 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 169, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 169 AND descriptor_id = 8);  -- smooth

-- 170: KTT Glimp  <- https://milktooth.com/products/glimp  [clacky, creamy, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 170, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 170 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 170, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 170 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 170, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 170 AND descriptor_id = 4);  -- neutral

-- 173: Invokeys Goji Reserve  <- https://milktooth.com/products/goji-reserve  [mild, polished, snappy, subtle]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 173, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 173 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 173, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 173 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 173, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 173 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 173, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 173 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 173, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 173 AND descriptor_id = 6);  -- muted

-- 174: TTC Gold Brown Pro  <- https://milktooth.com/products/gold-brown-pro  [polished, thocky, silky, mild, neutral, subtle, stepped, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 174, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 174 AND descriptor_id = 5);  -- deep

-- 175: TTC Gold Red Pro  <- https://milktooth.com/products/gold-red-pro  [polished, thocky, low-pitched, mild, neutral, subtle, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 175, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 175 AND descriptor_id = 6);  -- muted

-- 176: TTC Gold Silver  <- https://milktooth.com/products/gold-silver  [polished, low-pitched, silky, mild, neutral, subtle, thocky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 176, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 176 AND descriptor_id = 1);  -- thocky

-- 178: HMX Gravel  <- https://milktooth.com/products/gravel  [bouncy, creamy, clacky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 178, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 178 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 178, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 178 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 178, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 178 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 178, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 178 AND descriptor_id = 15);  -- light

-- 179: Gateron Green Apple  <- https://milktooth.com/products/green-apple  [snappy, buttery, stepped]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 179, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 179 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 179, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 179 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 179, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 179 AND descriptor_id = 10);  -- shallow

-- 180: HMX Gulf  <- https://milktooth.com/products/gulf  [clacky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 180, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 180 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 180, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 180 AND descriptor_id = 8);  -- smooth

-- 181: Keygeek Hachiware 32G  <- https://milktooth.com/products/hachiware-32g  [thocky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 181, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 181 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 181, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 181 AND descriptor_id = 15);  -- light

-- 182: Keygeek Hachiware 40G  <- https://milktooth.com/products/hachiware-40g  [thocky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 182, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 182 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 182, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 182 AND descriptor_id = 15);  -- light

-- 183: HMX Hades V2 42G  <- https://milktooth.com/products/hades-v2-42g  [low-pitched, thocky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 183, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 183 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 183, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 183 AND descriptor_id = 1);  -- thocky

-- 184: HMX Hibiscus  <- https://milktooth.com/products/hibiscus  [bouncy, clacky, feathery, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 184, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 184 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 184, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 184 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 184, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 184 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 184, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 184 AND descriptor_id = 8);  -- smooth

-- 185: Keygeek Higanbana V2  <- https://milktooth.com/products/higanbana-v2  [clacky, high-pitched, resonant]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 185, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 185 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 185, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 185 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 185, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 185 AND descriptor_id = 7);  -- marbly

-- 186: Bsun Hutt  <- https://milktooth.com/products/hutt  [snappy, invigorating, sharp, accented, resonant, bouncy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 186, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 186 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 186, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 186 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 186, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 186 AND descriptor_id = 8);  -- smooth

-- 187: TTC Ice  <- https://milktooth.com/products/ice  [clacky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 187, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 187 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 187, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 187 AND descriptor_id = 15);  -- light

-- 188: HMX Ice Lotus  <- https://milktooth.com/products/ice-lotus  [accented, clacky, snappy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 188, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 188 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 188, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 188 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 188, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 188 AND descriptor_id = 8);  -- smooth

-- 189: HMX Ice Lotus Heavy  <- https://milktooth.com/products/ice-lotus-heavy  [accented, clacky, snappy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 189, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 189 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 189, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 189 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 189, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 189 AND descriptor_id = 8);  -- smooth

-- 190: Keygeek Iced Latte  <- https://milktooth.com/products/iced-latte  [low-pitched, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 190, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 190 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 190, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 190 AND descriptor_id = 8);  -- smooth

-- 193: Gateron Ink Box Black  <- https://milktooth.com/products/ink-box-black  [clacky, high-pitched, silky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 193, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 193 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 193, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 193 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 193, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 193 AND descriptor_id = 8);  -- smooth

-- 194: Gateron Ink Box Pink  <- https://milktooth.com/products/ink-box-pink  [clacky, high-pitched, silky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 194, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 194 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 194, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 194 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 194, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 194 AND descriptor_id = 8);  -- smooth

-- 195: Gateron Ink Yellow  <- https://milktooth.com/products/ink-yellow  [neutral, clacky, mild, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 195, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 195 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 195, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 195 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 195, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 195 AND descriptor_id = 8);  -- smooth

-- 196: TTC Iron  <- https://milktooth.com/products/iron  [easy-to-press, clacky, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 196, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 196 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 196, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 196 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 196, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 196 AND descriptor_id = 4);  -- neutral

-- 197: PH Studio Jacaranda  <- https://milktooth.com/products/jacaranda  [clacky, silky, resonant, high-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 197, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 197 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 197, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 197 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 197, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 197 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 197, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 197 AND descriptor_id = 3);  -- high-pitched

-- 198: Bsun Jade Rosales  <- https://milktooth.com/products/jade-rosales  [bouncy, clacky, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 198, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 198 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 198, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 198 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 198, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 198 AND descriptor_id = 8);  -- smooth

-- 199: HMX Jelly  <- https://milktooth.com/products/jelly  [bassy, creamy, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 199, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 199 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 199, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 199 AND descriptor_id = 8);  -- smooth

-- 200: Jerrzi Jerrzi Orange  <- https://milktooth.com/products/jerrzi-orange  [easy-to-press, subdued, clacky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 200, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 200 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 200, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 200 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 200, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 200 AND descriptor_id = 2);  -- clacky

-- 201: HMX Joker  <- https://milktooth.com/products/joker  [clacky, high-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 201, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 201 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 201, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 201 AND descriptor_id = 3);  -- high-pitched

-- 202: Gateron Jupiter Red  <- https://milktooth.com/products/jupiter-red  [polished, creamy, silky, neutral, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 202, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 202 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 202, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 202 AND descriptor_id = 4);  -- neutral

-- 203: HMX K01  <- https://milktooth.com/products/k01  [mild, textured, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 203, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 203 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 203, 9 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 203 AND descriptor_id = 9);  -- scratchy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 203, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 203 AND descriptor_id = 15);  -- light

-- 204: Bsun K1 37G  <- https://milktooth.com/products/k1-37g  [thocky, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 204, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 204 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 204, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 204 AND descriptor_id = 5);  -- deep

-- 205: Keygeek Keylin  <- https://milktooth.com/products/keylin  [frictionless, neutral, mild, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 205, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 205 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 205, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 205 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 205, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 205 AND descriptor_id = 5);  -- deep

-- 206: KTT Laurel  <- https://milktooth.com/products/laurel  [low-pitched, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 206, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 206 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 206, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 206 AND descriptor_id = 11);  -- snappy

-- 207: Gateron Lemon Seabreeze  <- https://milktooth.com/products/lemon-seabreeze  [silky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 207, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 207 AND descriptor_id = 8);  -- smooth

-- 208: Bsun Light Sakura  <- https://milktooth.com/products/light-sakura  [silky, muted, subdued]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 208, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 208 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 208, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 208 AND descriptor_id = 6);  -- muted

-- 209: KTT Lightning  <- https://milktooth.com/products/lightning  [clacky, high-pitched, subtle, polished, chirpy]  travel 3.0mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 209, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 209 AND descriptor_id = 10);  -- shallow

-- 210: Everglide Lightning Silver V3  <- https://milktooth.com/products/lightning-silver-v3  [clacky, high-pitched, silky]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 210, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 210 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 210, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 210 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 210, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 210 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 210, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 210 AND descriptor_id = 10);  -- shallow

-- 211: Keygeek Lila  <- https://milktooth.com/products/lila  [polished, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 211, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 211 AND descriptor_id = 8);  -- smooth

-- 213: HMX Lotus  <- https://milktooth.com/products/lotus  [clacky, bouncy, feathery, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 213, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 213 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 213, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 213 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 213, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 213 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 213, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 213 AND descriptor_id = 8);  -- smooth

-- 214: Gateron Luciola  <- https://milktooth.com/products/luciola  [snappy, clacky, marbly, buttery, high-pitched, polished, chirpy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 214, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 214 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 214, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 214 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 214, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 214 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 214, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 214 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 214, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 214 AND descriptor_id = 3);  -- high-pitched

-- 215: HMX Lucky  <- https://milktooth.com/products/lucky  [clacky, bouncy, silky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 215, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 215 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 215, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 215 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 215, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 215 AND descriptor_id = 8);  -- smooth

-- 216: Gateron Lunar Probe  <- https://milktooth.com/products/lunar-probe  [silky, polished, mild, subdued, subtle, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 216, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 216 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 216, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 216 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 216, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 216 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 216, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 216 AND descriptor_id = 15);  -- light

-- 217: Durock Lupine  <- https://milktooth.com/products/lupine  [neutral, mild, high-pitched, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 217, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 217 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 217, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 217 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 217, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 217 AND descriptor_id = 8);  -- smooth

-- 218: Keygeek M1  <- https://milktooth.com/products/m1  [mild, creamy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 218, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 218 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 218, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 218 AND descriptor_id = 8);  -- smooth

-- 219: KTT Mannan Pipefish  <- https://milktooth.com/products/mannan-pipefish  [neutral, polished, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 219, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 219 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 219, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 219 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 219, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 219 AND descriptor_id = 15);  -- light

-- 220: Gateron Mars  <- https://milktooth.com/products/mars  [snappy, bouncy, mild, subtle]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 220, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 220 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 220, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 220 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 220, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 220 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 220, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 220 AND descriptor_id = 6);  -- muted

-- 221: HMX Martini V2  <- https://milktooth.com/products/martini-v2  [subdued, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 221, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 221 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 221, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 221 AND descriptor_id = 4);  -- neutral

-- 222: Dareu Master  <- https://milktooth.com/products/master  [clacky, polished, mild]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 222, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 222 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 222, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 222 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 222, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 222 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 222, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 222 AND descriptor_id = 10);  -- shallow

-- 223: KTT Matcha  <- https://milktooth.com/products/matcha  [stepped, snappy, accented, clacky, feathery, subtle]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 223, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 223 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 223, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 223 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 223, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 223 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 223, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 223 AND descriptor_id = 6);  -- muted

-- 224: Akko Matcha Green Pro  <- https://milktooth.com/products/matcha-green-pro  [clacky, creamy, polished, resonant, silky, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 224, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 224 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 224, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 224 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 224, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 224 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 224, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 224 AND descriptor_id = 11);  -- snappy

-- 225: Huano Matcha Latte V2  <- https://milktooth.com/products/matcha-latte-v2  [bouncy, creamy, clacky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 225, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 225 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 225, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 225 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 225, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 225 AND descriptor_id = 2);  -- clacky

-- 227: Gateron Mint Smoothie  <- https://milktooth.com/products/mint-smoothie  [muted, buttery, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 227, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 227 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 227, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 227 AND descriptor_id = 8);  -- smooth

-- 228: Akko Mirror  <- https://milktooth.com/products/mirror  [thocky, stiff]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 228, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 228 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 228, 14 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 228 AND descriptor_id = 14);  -- heavy

-- 229: Durock Mocha Silk  <- https://milktooth.com/products/mocha-silk  [thocky, silky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 229, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 229 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 229, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 229 AND descriptor_id = 8);  -- smooth

-- 230: HMX Moksae  <- https://milktooth.com/products/moksae  [muted, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 230, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 230 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 230, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 230 AND descriptor_id = 8);  -- smooth

-- 231: Gateron Mountain Top  <- https://milktooth.com/products/mountain-top  [bouncy, easy-to-press, neutral, snappy, subtle, mild]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 231, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 231 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 231, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 231 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 231, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 231 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 231, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 231 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 231, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 231 AND descriptor_id = 10);  -- shallow

-- 232: Everglide Moyu Black  <- https://milktooth.com/products/moyu-black  [accented, resonant, sharp]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 232, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 232 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 232, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 232 AND descriptor_id = 11);  -- snappy

-- 233: Haimu Mulberry  <- https://milktooth.com/products/mulberry  [accented, high-pitched, resonant, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 233, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 233 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 233, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 233 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 233, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 233 AND descriptor_id = 11);  -- snappy

-- 234: Cherry Mx Speed Silver  <- https://milktooth.com/products/mx-speed-silver  [textured, low-pitched, thocky]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 234, 9 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 234 AND descriptor_id = 9);  -- scratchy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 234, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 234 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 234, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 234 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 234, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 234 AND descriptor_id = 10);  -- shallow

-- 235: HMX Neo Amber  <- https://milktooth.com/products/neo-amber  [clacky, high-pitched, polished]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 235, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 235 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 235, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 235 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 235, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 235 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 235, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 235 AND descriptor_id = 10);  -- shallow

-- 236: HMX Neo Azure  <- https://milktooth.com/products/neo-azure  [high-pitched, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 236, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 236 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 236, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 236 AND descriptor_id = 11);  -- snappy

-- 237: Keygeek Neo Oat  <- https://milktooth.com/products/neo-oat  [silky, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 237, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 237 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 237, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 237 AND descriptor_id = 4);  -- neutral

-- 238: Keygeek Neo Rye  <- https://milktooth.com/products/neo-rye  [thocky, low-pitched, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 238, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 238 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 238, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 238 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 238, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 238 AND descriptor_id = 8);  -- smooth

-- 239: SWK Neon  <- https://milktooth.com/products/neon  [neutral, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 239, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 239 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 239, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 239 AND descriptor_id = 11);  -- snappy

-- 240: Bsun Ocean  <- https://milktooth.com/products/ocean  [accented, clacky]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 240, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 240 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 240, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 240 AND descriptor_id = 10);  -- shallow

-- 241: Bsun Olive  <- https://milktooth.com/products/olive  [accented, invigorating, sharp, snappy]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 241, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 241 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 241, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 241 AND descriptor_id = 10);  -- shallow

-- 242: KTT Orange  <- https://milktooth.com/products/orange  [bouncy, frictionless, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 242, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 242 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 242, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 242 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 242, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 242 AND descriptor_id = 5);  -- deep

-- 243: Haimu Orange Sea  <- https://milktooth.com/products/orange-sea  [accented, invigorating]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 243, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 243 AND descriptor_id = 11);  -- snappy

-- 246: Outemu Cold Plum  <- https://milktooth.com/products/outemu-cold-plum  []  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 246, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 246 AND descriptor_id = 10);  -- shallow

-- 249: Outemu Cream Yellow  <- https://milktooth.com/products/outemu-cream-yellow  [sharp, muted, thocky, low-pitched]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 249, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 249 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 249, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 249 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 249, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 249 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 249, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 249 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 249, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 249 AND descriptor_id = 10);  -- shallow

-- 256: Outemu Dustproof Silent Ocean  <- https://milktooth.com/products/outemu-dustproof-silent-ocean  [muted, subdued]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 256, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 256 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 256, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 256 AND descriptor_id = 10);  -- shallow

-- 259: Outemu Peach  <- https://milktooth.com/products/outemu-peach  [mild, muted, subtle, polished, neutral]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 259, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 259 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 259, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 259 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 259, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 259 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 259, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 259 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 259, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 259 AND descriptor_id = 10);  -- shallow

-- 262: Outemu Silent Grey  <- https://milktooth.com/products/outemu-silent-grey  [muted, thocky, low-pitched, sharp]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 262, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 262 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 262, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 262 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 262, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 262 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 262, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 262 AND descriptor_id = 11);  -- snappy

-- 263: Outemu Silent White  <- https://milktooth.com/products/outemu-silent-white  []  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 263, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 263 AND descriptor_id = 10);  -- shallow

-- 265: Outemu Silent Yellow Jade  <- https://milktooth.com/products/outemu-silent-yellow-jade  [muted, thocky, sharp, low-pitched]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 265, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 265 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 265, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 265 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 265, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 265 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 265, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 265 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 265, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 265 AND descriptor_id = 10);  -- shallow

-- 268: KTT Peach  <- https://milktooth.com/products/peach  [low-pitched, neutral, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 268, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 268 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 268, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 268 AND descriptor_id = 4);  -- neutral

-- 269: Outemu Pear  <- https://milktooth.com/products/pear  [neutral, snappy, mild]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 269, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 269 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 269, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 269 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 269, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 269 AND descriptor_id = 10);  -- shallow

-- 271: KTT Pine  <- https://milktooth.com/products/pine  [bassy, buttery, creamy, low-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 271, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 271 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 271, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 271 AND descriptor_id = 8);  -- smooth

-- 272: HMX Pine Moon  <- https://milktooth.com/products/pine-moon  [thocky, silky]  travel 3.1mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 272, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 272 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 272, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 272 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 272, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 272 AND descriptor_id = 10);  -- shallow

-- 273: HMX Pink Pig  <- https://milktooth.com/products/pink-pig  [clacky, high-pitched]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 273, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 273 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 273, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 273 AND descriptor_id = 3);  -- high-pitched

-- 274: Huano Populus Yellow  <- https://milktooth.com/products/populus-yellow  [clacky, accented, resonant]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 274, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 274 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 274, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 274 AND descriptor_id = 7);  -- marbly

-- 275: HMX Poro  <- https://milktooth.com/products/poro  [bouncy, creamy, clacky, feathery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 275, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 275 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 275, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 275 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 275, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 275 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 275, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 275 AND descriptor_id = 15);  -- light

-- 276: MMD Princess Linear V4  <- https://milktooth.com/products/princess-linear-v4  [clacky, polished, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 276, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 276 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 276, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 276 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 276, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 276 AND descriptor_id = 11);  -- snappy

-- 277: Outemu Red Panda  <- https://milktooth.com/products/red-panda  [thocky, mild]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 277, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 277 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 277, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 277 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 277, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 277 AND descriptor_id = 10);  -- shallow

-- 278: SP-Star Redblue  <- https://milktooth.com/products/redblue  [low-pitched, mild, thocky, polished, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 278, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 278 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 278, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 278 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 278, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 278 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 278, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 278 AND descriptor_id = 8);  -- smooth

-- 279: HMX Retro C  <- https://milktooth.com/products/retro-c  [clacky, high-pitched, snappy, resonant]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 279, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 279 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 279, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 279 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 279, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 279 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 279, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 279 AND descriptor_id = 7);  -- marbly

-- 280: HMX Retro J  <- https://milktooth.com/products/retro-j  [clacky, sharp, invigorating]  travel 3.0mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 280, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 280 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 280, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 280 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 280, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 280 AND descriptor_id = 10);  -- shallow

-- 281: HMX Retro R  <- https://milktooth.com/products/retro-r  [clacky, high-pitched, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 281, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 281 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 281, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 281 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 281, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 281 AND descriptor_id = 11);  -- snappy

-- 282: HMX Retro Sakura  <- https://milktooth.com/products/retro-sakura  [muted, snappy, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 282, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 282 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 282, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 282 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 282, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 282 AND descriptor_id = 8);  -- smooth

-- 283: HMX Retro T  <- https://milktooth.com/products/retro-t  [high-pitched, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 283, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 283 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 283, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 283 AND descriptor_id = 4);  -- neutral

-- 284: Haimu Rock  <- https://milktooth.com/products/rock  [accented, high-pitched, resonant, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 284, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 284 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 284, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 284 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 284, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 284 AND descriptor_id = 11);  -- snappy

-- 285: HC Studio Roselle  <- https://milktooth.com/products/roselle  [bassy, low-pitched, mild, neutral, frictionless]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 285, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 285 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 285, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 285 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 285, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 285 AND descriptor_id = 8);  -- smooth

-- 286: Jerrzi Salt Ice  <- https://milktooth.com/products/salt-ice  []  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 286, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 286 AND descriptor_id = 10);  -- shallow

-- 287: HMX Sandstorm  <- https://milktooth.com/products/sandstorm  [clacky, snappy, polished]  travel 3.2mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 287, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 287 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 287, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 287 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 287, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 287 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 287, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 287 AND descriptor_id = 10);  -- shallow

-- 288: Jerrzi Sea Salt Mousse  <- https://milktooth.com/products/sea-salt-mousse  [silky, resonant]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 288, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 288 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 288, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 288 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 288, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 288 AND descriptor_id = 10);  -- shallow

-- 289: Gateron Sea Salt Smoothie  <- https://milktooth.com/products/sea-salt-smoothie  [low-pitched, creamy, silky, buttery, subdued, thocky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 289, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 289 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 289, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 289 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 289, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 289 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 289, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 289 AND descriptor_id = 1);  -- thocky

-- 290: Jerrzi Seashell  <- https://milktooth.com/products/seashell  [clacky, feathery, easy-to-press, polished, high-pitched]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 290, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 290 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 290, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 290 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 290, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 290 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 290, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 290 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 290, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 290 AND descriptor_id = 10);  -- shallow

-- 291: HMX Serene Green  <- https://milktooth.com/products/serene-green  [polished, marbly]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 291, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 291 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 291, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 291 AND descriptor_id = 7);  -- marbly

-- 292: TTC Silent Bluish White  <- https://milktooth.com/products/silent-bluish-white  [buttery, stepped, muted, subtle, polished, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 292, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 292 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 292, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 292 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 292, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 292 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 292, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 292 AND descriptor_id = 4);  -- neutral

-- 293: TTC Silent Brown  <- https://milktooth.com/products/silent-brown  [buttery, muted, polished, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 293, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 293 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 293, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 293 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 293, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 293 AND descriptor_id = 4);  -- neutral

-- 294: TTC Silent Frozen  <- https://milktooth.com/products/silent-frozen  [thocky, low-pitched, buttery, muted, feathery, subtle, creamy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 294, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 294 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 294, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 294 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 294, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 294 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 294, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 294 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 294, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 294 AND descriptor_id = 15);  -- light

-- 295: Gateron Silent Ink Black  <- https://milktooth.com/products/silent-ink-black  [silky, muted, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 295, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 295 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 295, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 295 AND descriptor_id = 6);  -- muted

-- 296: TTC Silent Red  <- https://milktooth.com/products/silent-red  [mild, muted, polished, buttery]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 296, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 296 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 296, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 296 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 296, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 296 AND descriptor_id = 8);  -- smooth

-- 297: HMX Silent Sakura 53G  <- https://milktooth.com/products/silent-sakura-53g  [muted, subtle, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 297, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 297 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 297, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 297 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 297, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 297 AND descriptor_id = 8);  -- smooth

-- 298: Durock Silent T1  <- https://milktooth.com/products/silent-t1  [stepped, muted, accented, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 298, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 298 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 298, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 298 AND descriptor_id = 8);  -- smooth

-- 299: HMX Silent Taro  <- https://milktooth.com/products/silent-taro  [muted, buttery, subtle]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 299, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 299 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 299, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 299 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 299, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 299 AND descriptor_id = 15);  -- light

-- 300: Akko Silver Pro  <- https://milktooth.com/products/silver-pro  [easy-to-press, creamy, feathery, polished, silky, high-pitched]  travel 3.3mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 300, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 300 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 300, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 300 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 300, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 300 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 300, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 300 AND descriptor_id = 10);  -- shallow

-- 301: Dareu Sky V3  <- https://milktooth.com/products/sky-v3  [neutral, subdued, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 301, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 301 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 301, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 301 AND descriptor_id = 6);  -- muted

-- 302: Dareu Sky V4  <- https://milktooth.com/products/sky-v4  [thocky, neutral, low-pitched, bouncy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 302, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 302 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 302, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 302 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 302, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 302 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 302, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 302 AND descriptor_id = 11);  -- snappy

-- 303: Gateron Smoothie Silver  <- https://milktooth.com/products/smoothie-silver  [buttery, thocky, low-pitched, creamy, subdued, silky]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 303, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 303 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 303, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 303 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 303, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 303 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 303, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 303 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 303, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 303 AND descriptor_id = 10);  -- shallow

-- 304: HMX Sonja Hc  <- https://milktooth.com/products/sonja-hc  [textured, neutral, low-pitched, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 304, 9 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 304 AND descriptor_id = 9);  -- scratchy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 304, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 304 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 304, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 304 AND descriptor_id = 5);  -- deep

-- 305: TTC Speed Silver  <- https://milktooth.com/products/speed-silver  [mild, neutral, polished]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 305, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 305 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 305, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 305 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 305, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 305 AND descriptor_id = 10);  -- shallow

-- 306: Akko Stellar Rose  <- https://milktooth.com/products/stellar-rose  [neutral, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 306, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 306 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 306, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 306 AND descriptor_id = 8);  -- smooth

-- 307: Gateron Strawberry Smoothie  <- https://milktooth.com/products/strawberry-smoothie  [buttery, polished, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 307, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 307 AND descriptor_id = 8);  -- smooth

-- 308: HMX Su  <- https://milktooth.com/products/su  [mild, neutral, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 308, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 308 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 308, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 308 AND descriptor_id = 8);  -- smooth

-- 309: HMX Sunny V2  <- https://milktooth.com/products/sunny-v2  [clacky, buttery, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 309, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 309 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 309, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 309 AND descriptor_id = 8);  -- smooth

-- 310: HMX Swift  <- https://milktooth.com/products/swift  [easy-to-press, feathery, bouncy, creamy, high-pitched, silky, clacky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 310, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 310 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 310, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 310 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 310, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 310 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 310, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 310 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 310, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 310 AND descriptor_id = 2);  -- clacky

-- 312: Durock T1  <- https://milktooth.com/products/t1  [stepped, low-pitched, accented, polished, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 312, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 312 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 312, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 312 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 312, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 312 AND descriptor_id = 4);  -- neutral

-- 314: Gateron Type L  <- https://milktooth.com/products/type-l  [subdued, feathery, easy-to-press, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 314, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 314 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 314, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 314 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 314, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 314 AND descriptor_id = 4);  -- neutral

-- 315: Gateron Type S  <- https://milktooth.com/products/type-s  [neutral, subdued]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 315, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 315 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 315, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 315 AND descriptor_id = 6);  -- muted

-- 316: Gazzew U4 Black 62G  <- https://milktooth.com/products/u4-black-62g  [muted, low-pitched, sharp]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 316, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 316 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 316, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 316 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 316, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 316 AND descriptor_id = 11);  -- snappy

-- 318: Gazzew U4T Black 62G  <- https://milktooth.com/products/u4t-black-62g  [bassy, thocky, sharp]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 318, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 318 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 318, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 318 AND descriptor_id = 1);  -- thocky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 318, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 318 AND descriptor_id = 11);  -- snappy

-- 319: Gazzew U4Tx Rgb  <- https://milktooth.com/products/u4tx-rgb  [muted, bassy, sharp]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 319, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 319 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 319, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 319 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 319, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 319 AND descriptor_id = 11);  -- snappy

-- 320: Haimu Viola Tricolor  <- https://milktooth.com/products/viola-tricolor  [accented, bassy, low-pitched, invigorating]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 320, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 320 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 320, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 320 AND descriptor_id = 11);  -- snappy

-- 321: HMX Volume 0 T  <- https://milktooth.com/products/volume-0-t  [muted, snappy, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 321, 6 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 321 AND descriptor_id = 6);  -- muted
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 321, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 321 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 321, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 321 AND descriptor_id = 8);  -- smooth

-- 322: Gateron Weightlessness  <- https://milktooth.com/products/weightlessness  [snappy, bouncy, mild, stepped]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 322, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 322 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 322, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 322 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 322, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 322 AND descriptor_id = 10);  -- shallow

-- 323: Aflion Windy Shadow  <- https://milktooth.com/products/windy-shadow  [low-pitched, mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 323, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 323 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 323, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 323 AND descriptor_id = 4);  -- neutral

-- 324: Wuque Studio WS Black Arowana  <- https://milktooth.com/products/ws-black-arowana  [frictionless, resonant]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 324, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 324 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 324, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 324 AND descriptor_id = 7);  -- marbly

-- 325: Wuque Studio WS Brown  <- https://milktooth.com/products/ws-brown  [snappy, stepped, stiff]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 325, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 325 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 325, 14 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 325 AND descriptor_id = 14);  -- heavy

-- 326: Wuque Studio WS Gold Arowana  <- https://milktooth.com/products/ws-gold-arowana  [frictionless, resonant]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 326, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 326 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 326, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 326 AND descriptor_id = 7);  -- marbly

-- 327: Wuque Studio WS Jade  <- https://milktooth.com/products/ws-jade  [clacky, resonant, silky, creamy, marbly]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 327, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 327 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 327, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 327 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 327, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 327 AND descriptor_id = 8);  -- smooth

-- 328: Wuque Studio WS Light Tactile  <- https://milktooth.com/products/ws-light-tactile  [stepped, neutral, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 328, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 328 AND descriptor_id = 4);  -- neutral
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 328, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 328 AND descriptor_id = 15);  -- light

-- 329: Wuque Studio WS Pearl  <- https://milktooth.com/products/ws-pearl  [silky, creamy, high-pitched, marbly, clacky, polished]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 329, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 329 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 329, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 329 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 329, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 329 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 329, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 329 AND descriptor_id = 2);  -- clacky

-- 331: Wuque Studio WS Red Arowana  <- https://milktooth.com/products/ws-red-arowana  [clacky, high-pitched, silky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 331, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 331 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 331, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 331 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 331, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 331 AND descriptor_id = 8);  -- smooth

-- 332: Wuque Studio WS Yellow  <- https://milktooth.com/products/ws-yellow  [creamy, polished, mild]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 332, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 332 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 332, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 332 AND descriptor_id = 4);  -- neutral

-- 333: Wuque Studio WS Yellow Arowana  <- https://milktooth.com/products/ws-yellow-arowana  [frictionless, resonant, easy-to-press]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 333, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 333 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 333, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 333 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 333, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 333 AND descriptor_id = 15);  -- light

-- 334: HMX Xinhai Heavy  <- https://milktooth.com/products/xinhai-heavy  [clacky, bouncy, creamy]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 334, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 334 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 334, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 334 AND descriptor_id = 11);  -- snappy
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 334, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 334 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 334, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 334 AND descriptor_id = 10);  -- shallow

-- 335: Keygeek Y2  <- https://milktooth.com/products/y2  [bassy, resonant, thocky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 335, 5 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 335 AND descriptor_id = 5);  -- deep
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 335, 7 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 335 AND descriptor_id = 7);  -- marbly
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 335, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 335 AND descriptor_id = 1);  -- thocky

-- 336: Keygeek Y3  <- https://milktooth.com/products/y3  [mild, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 336, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 336 AND descriptor_id = 4);  -- neutral

-- 337: HMX Yamatake  <- https://milktooth.com/products/yamatake  [clacky, silky, snappy]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 337, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 337 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 337, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 337 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 337, 11 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 337 AND descriptor_id = 11);  -- snappy

-- 338: Outemu Yellow Silver  <- https://milktooth.com/products/yellow-silver  [neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 338, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 338 AND descriptor_id = 4);  -- neutral

-- 339: HMX Yogurt  <- https://milktooth.com/products/yogurt  [clacky, frictionless, high-pitched]  travel 3.4mm
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 339, 2 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 339 AND descriptor_id = 2);  -- clacky
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 339, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 339 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 339, 3 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 339 AND descriptor_id = 3);  -- high-pitched
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 339, 10 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 339 AND descriptor_id = 10);  -- shallow

-- 340: TTC Yunhai  <- https://milktooth.com/products/yunhai  [feathery, thocky]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 340, 15 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 340 AND descriptor_id = 15);  -- light
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 340, 1 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 340 AND descriptor_id = 1);  -- thocky

-- 341: HMX Yunying  <- https://milktooth.com/products/yunying  [frictionless, neutral]
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 341, 8 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 341 AND descriptor_id = 8);  -- smooth
INSERT INTO SwitchSchema.switch_descriptor (switch_id, descriptor_id) SELECT 341, 4 WHERE NOT EXISTS (SELECT 1 FROM SwitchSchema.switch_descriptor WHERE switch_id = 341 AND descriptor_id = 4);  -- neutral

COMMIT;
