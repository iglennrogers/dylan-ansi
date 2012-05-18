module: dylan-user

define library dylan-ansi
  use common-dylan;
  use io;
end library;

define module ansi
  use common-dylan;
  use format-out;
  
	export *reset-attr*
		, *bold-on*
		, *bold-off*
		, *blink-on*
		, *blink-off*
		, *underline-on*
		, *underline-off*
		, *inverse-on*
		, *inverse-off*
		, *fg-black*
		, *fg-red*
		, *fg-green*
		, *fg-yellow*
		, *fg-blue*
		, *fg-magenta*
		, *fg-cyan*
		, *fg-white*
		, *bg-black*
		, *bg-red*
		, *bg-green*
		, *bg-yellow*
		, *bg-blue*
		, *bg-magenta*
		, *bg-cyan*
		, *bg-white*
		, *save-position*
		, *restore-position*
		, *show-cursor*
		, *hide-cursor*
		, set-cursor-pos
		, set-cursor-col
		, move-cursor
		, $clear-to-end
		, $clear-to-beginning
		, $clear-all
		, clear-screen
		, clear-line
		, scroll
end module;
