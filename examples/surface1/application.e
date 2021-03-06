note
	description : "[
						Show how to use a {GAME_WINDOW_SURFACED}.
						Note that with {GAME_WINDOW_SURFACED} you have less control and less
						possible effect. But it is easyer to use. For enabling every feature
						of the game library, you must use the renderer system with a
						{GAME_WINDOW_RENDERED}.
					]"
	author		: "Louis Marchand"
	date        : "Fri, 13 Jan 2017 16:38:24 +0000"
	revision    : "1.1"

class
	APPLICATION

inherit
	GAME_LIBRARY_SHARED		-- To use the `game_library' object (very important).

create
	make

feature {NONE} -- Initialization

	make
			-- Run the application.
		local
			l_window_builder:GAME_WINDOW_SURFACED_BUILDER
			l_window:GAME_WINDOW_SURFACED
			l_background, l_bird:GAME_SURFACE
			l_bk_source, l_bird_source:GAME_IMAGE_BMP_FILE
			l_bird_transparent_color:GAME_COLOR
		do
			game_library.enable_video	-- Enable the video functionnality of the library
			create l_window_builder		-- Used to generate {GAME_WINDOW}.
			l_window := l_window_builder.generate_window		-- Create the {GAME_WINDOW} using default attributes

			create l_bk_source.make ("bk.bmp")		-- Make the image background. The image is not loaded yet.
			l_bk_source.open		-- Load the image
			create l_background.share_from_image (l_bk_source)		-- Create the background surface using the image source.

			create l_bird_source.make ("pingus.bmp")	-- Make the image bird. The image is not loaded yet.
			l_bird_source.open		-- Load the image
			create l_bird.share_from_image (l_bird_source)	-- Create the bird surface using the image source.

			create l_bird_transparent_color.make_rgb (255, 0, 255)
			l_bird.transparent_color:=l_bird_transparent_color		-- Remove the pink color from the image.

			l_window.surface.draw_surface (l_background, 0, 0)		-- Drawing a background on the window surface
			l_window.surface.draw_surface (l_bird, 500, 400)		-- Drawing a bird on the window surface (over the background)

			l_window.update-- Show the modifications of the window surface

			game_library.delay (3000)	-- Wait 3 seconds before closing


		end

end
