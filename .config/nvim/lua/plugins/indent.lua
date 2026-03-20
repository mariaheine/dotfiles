-- return {
-- 	{
-- 		"lukas-reineke/indent-blankline.nvim",
-- 		main = "ibl",
-- 		opts = function(_, opts)
-- 			-- Other blankline configuration here
-- 			return require("indent-rainbowline").make_opts(opts, {
-- 				color_transparency = 1.0,
-- 				colors = {
-- 					0xB8E1FF, -- Level 1: "Moonlight Mist" - Soft, ethereal pale blue
-- 					0x8FCBFF, -- Level 2: "Lunar Glow" - Gentle, dreamy sky blue
-- 					0x66B5FF, -- Level 3: "Serenity Blue" - Clear, serene medium blue
-- 					0x3D9FFF, -- Level 4: "Tuxedo Blue" - Rich, noble blue
-- 					0x1469CC, -- Level 5: "Midnight Secret" - Deep, mysterious indigo
-- 					0x003399, -- Level 6: "Crystal Tokyo Night" - Profound, dark navy
-- 				},
-- 			})
-- 		end,
-- 		dependencies = {
-- 			"TheGLander/indent-rainbowline.nvim",
-- 		},
-- 	},
-- }

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│" }, -- Uses a thin vertical line character
			whitespace = {
				remove_blankline_trail = false, -- Keeps guides on blank lines
			},
		},
	},
}
