##################################################################
### INFINALITY ENVIRONMENT VARIABLES FOR EXTRA RUN-TIME OPTIONS ##
##################################################################
#
# These environment variables require that their respective patches
# from http://www.infinality.net have been applied to the Freetype
# installation you are using.  They will do abolutely
# nothing otherwise!
#

# This file should be copied to /etc/profile.d/ for system-wide
# effects and/or included in ~/.bashrc or ~/.bash_profile for per-user
# effects:
# 
#   . ~/path/to/this/file/infinality-settings.sh
#
# Of course, the per-user settings will override the system-wide
# settings.  Default values indicated below will be used when the
# environment variables below are not defined.
#
# When I say "Default:" below, I'm referring to the default if no
# environment variables are set.  Generally this ends up being
# whatever Freetype's default is set to.
#


##################################################################
# EXAMPLES
#
# Please see 3/4 down in this file for examples of different settings.
#






#################################################################
################## EXPLANATION OF SETTINGS ######################
#################################################################



##################################################################
# SET_XFT_SETTINGS
#
# Should the below Xft settings be set globally by this script?  (true/false)

SET_XFT_SETTINGS=true

# XFT settings are like a red-headed stepchild that should be beaten severely.  
# These only affect legacy programs, and *parts* of some modern programs like 
# google-chrome.  We only deal with these settings because we have to, otherwise 
# crap will slip by.  I recommend using hintslight and autohint as the defaults
# normally in /etc/fonts/.  The reason hintfull and autohint:0 is needed here  
# because otherwise some programs will occassionally request slight hinting for 
# a truetype font. When a program does this, Freetype automatically uses the 
# autohinter, when you may actually want it to be rendered with the TT hinter, 
# (if specified in /etc/fonts/).  So setting this to hintfull guarantees that the 
# TT font will be rendered with the TT hinter (assuming it is specified in 
# /etc/fonts/ to be rendered that way.)  For TT fonts that you want 
# rendered with autohint, specifiying that in the /etc/fonts/ 
# should be enough.  But you might think that by setting this to hintfull 
# that it's going to use Freetype's full autohinting (which we *completely* 
# avoid) for fonts you want autohinted.  This is where 
# INFINALITY_FT_AUTOFIT_FORCE_SLIGHT_HINTING comes in.  It tells freetype to 
# use slight hinting on fonts set for autohinting, even if the program requests 
# full autohinting.  Freetype's full hinting only looks OK under certain
# circumstances.  The goal of infinality is to make infinality hinting look 
# good all the time.

XFT_SETTINGS="
Xft.antialias:  1
Xft.autohint:   0
Xft.dpi:        96
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
" 

if [ "$SET_XFT_SETTINGS" = "true" ]; then
  echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1
fi



##################################################################
# INFINALITY_FT_FILTER_PARAMS
#
# This is a modified version of the patch here:
# http://levelsofdetail.kendeeter.com/2008/12/dynamic_fir_filter_patch.html
#
# Allows you to adjust the FIR filter at runtime instead of at
# compile time.  The idea is to have values add up to 100, and be
# symmetrical around the middle value.  If the values add up to 
# more than 100, the glyphs will appear darker.  If less than 100,
# lighter.  I recommend using this method to make glyphs darker
# or lighter globally as opposed to using the gamma option (see note in 
# the gamma option).
#
# Here are some samples of various filter parameters:
#
# (this has been changed to use integers between 0 and 100 to
#  avoid problems with regional differences like comma for decimal point)
#
#
# Strong Extra Smooth  "15 20 30 20 15"  (extra smooth, natural weight)
# Extra Smooth         "20 20 30 20 20"  (extra smooth, extra weight)
# Smooth               "15 20 32 20 15"  (smooth, natural weight)
# Stronger Gibson      "11 22 38 22 11"  (smooth, extra weight)          
# Gibson               "11 22 33 22 11"  (smooth, natural weight)
# Freetype Light       "00 33 34 33 00"  (sharp, natural weight)         # freetype's "light" LCD filter
# Freetype Default     "06 25 44 25 06"  (sharp, extra weight)           # freetype's default
# Extra Sharp          "00 35 35 35 00"  (extra sharp, extra weight)     # freetype's "light" LCD filter on acid
#
#
# Windows uses something more sharp, maybe along the lines of Freetype's default
#
# Default if no ENV_VARS present:     [Freetype's default]
# Recommended: "11 22 38 22 11"       (too dark / smooth for some)
#
# Example 1:  export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
#

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"



##################################################################
# INFINALITY_FT_STEM_ALIGNMENT_STRENGTH
#
# This performs analysis on each glyph and determines an amount
# to shift the glyph, left or right, so that it aligns better to
# pixel boundaries.
#
# This results in subtley cleaner looking stems, at the expense of
# proper distances between glyphs.  This is only active for sizes
# 10 px or greater and does not apply to bold or italic fonts.
# 
# There are also exceptions on a small number of fonts that I've
# not been able to render nicely with alignment enabled.  In those
# cases, a forced translation is applied instead.
#
# Possible values:
# 0 through 100 - think of as percentage of strength
# 
# 0 corresponds to no shifting whatsoever.  In other words, OFF.
# 
# 100 corresponds to a full move to a snap zone defined by
#   the snapping algorithm, be it left or right.  This
#   is the full amount any glyph could be moved in order to make it
#   align to the pixel.
#
# Values inbetween act as caps.  If the algorithm determines that it
# wants to move the glyph .33 of a pixel to the left, but the value
# is set to 50 (i.e. 50%), then the maximum move that would be allowed
# is 50% of half a pixel, in other words .25.  So instead of .33 the 
# glyph is moved .25 of a pixel.
#
# For a subtle effect that doesn't dramatically affect the glyph, use
# 25 for this and 25 for INFINALITY_FT_STEM_FITTING_STRENGTH
#
# Default if no ENV_VARS present:     0
# Recommended if you want to use it:   100

export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=25



##################################################################
# INFINALITY_FT_STEM_FITTING_STRENGTH
#
# This performs analysis on each glyph and determines an amount
# to horizontally scale the glyph, so that stems align better to
# pixel boundaries.  An emboldening (or anti-emboldening) is
# performed afterward to account for stem width exaggeration.
#
# This results in subtley cleaner looking fonts, at the expense of
# proper distances between glyphs and slightly misshapen glyphs.  
# This is only active for sizes 10 px or greater and does not 
# apply to bold or italic fonts.
#
# There are also exceptions on a small number of fonts that I've
# not been able to render nicely with fitting enabled.  In those
# cases, a forced translation is applied instead.
# 
#
# Possible values:
# 0 through 100 - think of as percentage of strength
# 
# 0 corresponds to no stretching whatsoever.  In other words, OFF.
# 
# 100 corresponds to a full pixel stretch, be outward or inward.  This
#   is the full amount any glyph could be stretched in order to make it
#   align to a pixel boundary.  Which direction is chosen is part
#   of the art of what I'm trying to do in the code.  ;)
#
#
# Values inbetween act as caps.  If the algorithm determines that it
# wants to stretch the glyph .75 of a pixel outward, but the value
# is set to 50 (i.e. 50%), then the maximum move that would be allowed
# is 50% of a pixel, in other words .50.  So instead of .75 the 
# glyph is stretched .50 of a pixel.
#
# For a subtle effect that doesn't dramatically affect the glyph, use
# 25 for this and 25 for INFINALITY_FT_STEM_FITTING_STRENGTH
#
# Default if no ENV_VARS present:     0
# Recommended if you want to use it:   100

export INFINALITY_FT_STEM_FITTING_STRENGTH=25



##################################################################
# INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE
#
# This allows you to set a ppem at which alignment and fitting
# will reach 100%.  As glyphs become larger, more dramatic
# snapping will not affect the glyph shape as much, so it makes
# sense to allow this.  
#
# For fonts that are 10 ppem, the values set above for 
# INFINALITY_FT_STEM_ALIGNMENT_STRENGTH and 
# INFINALITY_FT_STEM_FITTING_STRENGTH will be used.  As the ppem
# gradually becomes larger, so will the strength settings, and
# they will reach 100% at the ppem you specify here.
#
# This is a simple linear scale.
#
# Possible values:
# 0 means to not use this feature
# 
# 11 and up will set the 100% level to that ppem value
#
# Anything else is officially undefined, but I still bound it internally.
#
# Default if no ENV_VARS present:     0

export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=40



##################################################################
# INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS
#
# This applies largely to certain MS fonts, but some others as well.
# it will apply known good settings on a font-by-font basis, regardless
# of the other settings above or below.
#
# - Use known values for selected fonts & ppems that are known to look
# ok with 100:
#
# INFINALITY_FT_STEM_ALIGNMENT_STRENGTH  
# INFINALITY_FT_STEM_FITTING_STRENGTH 
#
# - Use various internal tweaks like compatible widths and other
# font-specific hacks.
# - Use gamma, brightness or contrast adjustments automatically
#     on certain fonts.  Global settings will still apply afterwards.
# - Enable various forced settings on selective fonts during 
#     rasterization and stem_alignment. 
#
# If set to TRUE, this will use 100 regardless of the values you have
# specified above.  It will not affect fonts that are not in this
# small list.
#
# Possible values:
# FALSE means to not use this feature
# 
# TRUE will enable this feature
#
# Default if no ENV_VARS present:     FALSE
# Recommended:  TRUE
#

export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true



##################################################################
# INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH
#
# This enables an algorithm found in ChromeOS for sharpening the
# appearance of glyphs.  It is based off this patch:
#
# http://codereview.chromium.org/3298011/diff/9001/media-libs/freetype/files/freetype-2.3.11-lcd-sharpen.patches
#
# It gives glyphs a more "grainy" look through some gamma
#  correction.  It does tend to thin out vertical stems, which
#  may be a feature or a bug depending on your taste  ;)
# 
#
# Possible values:
# 0 through 100 - think of as percentage of strength
# 
# 0 corresponds to no sharpening whatsoever.  In other words, OFF.
#
# 25 is good for a subtle effect.
#
# 50 corresponds to the default ChromeOS value.
#
# 100 corresponds to maximum sharpening.  This usually results in 
#  something undesirable looking.
#
#
# As you increase this amount, it is good to decrease the gamma (2nd value)
# of INFINALITY_FT_PSEUDO_GAMMA, and possibly increase 
# INFINALITY_FT_STEM_FITTING_STRENGTH and 
# INFINALITY_FT_STEM_ALIGNMENT_STRENGTH, as it seems like the algorithm
# lightens stems that aren't fully on-pixel.
#
# Default if no ENV_VARS present:     0
# Recommended: If you're going to use this filter - 50

export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0



##################################################################
# INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH
#
# This enables an algorithm developed with the intention to sharpen
# fonts to look similarly to Windows.
#
# It gives glyphs a more "grainy" look, like the ChromeOS filter
# except it does so more selectively.  This prevents the thinning
# of vertical stems that is noticible when a blanket gamma filter
# like the ChromeOS filter is applied.
#
# I also get a "cleaner" impression from the fonts with this Windows
# style filter.  This filter was done by 100% experimentation,
# and there things that could probably be improved.
#
# Some may argue that I shouldn't be trying to take the shortcomings
# of the MS approach and bring them here.  I disagree, as part
# of freedom is having the right to make your fonts look as
# shitty as you'd like.  
#
# Using this filter does somewhat lessen the need to use stem
# fitting and stem alignment, as glyphs appear sharper.
#
# This setting can be used at the same time as the previous chromeOS
# sharpening, and happens after it in the code.
#
#
# Possible values:
# 0 through 100 - think of as percentage of strength
# 
# 0 corresponds to no sharpening whatsoever.  In other words, OFF.
#
# 10-25 is good for a subtle effect while not completely decimating glyphs.
#
# 50-75 corresponds to probably something in the range that Windows uses. 
#
# 100 corresponds to maximum sharpening.  
# 
#
# Using a high value for this variable along with enabling the
#  fringe filter (below) almost eliminates the need
#  for INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT to be set to 100,
#  and can instead be set at 0.  (Setting 
#  INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT to 0 prevents missing
#  stems in the middle of s.  The drawback is that many fonts just look
#  way too sharp and grainy at this setting.  Your call.)
#
# Default if no ENV_VARS present:              0
# Recommended if you want to use this filter:  65

export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=10



##################################################################
# INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT
#
# When using autohinting, horizontal stems you'd find in E, f, T, -, 
# etc. are normally not snapped to full integer pixel heights, meaning
# that you will get a semi-dark fringe on these stems, above or
# below the black line of pixels:
#
# ##########
# ##
# ##-------
# #########
# ##
# ##--------
# ##########
#
# (- represents the semi-dark pixels)
#
# Setting this to 100 will force integer pixel heights.  Setting it to
# zero will do what Freetype does by default.  Anything inbetween will
# act as a weighted average of the two.  
#
# This is disabled when the standard width is found (via voodoo) to be
# less than 1 pixel, in order to prevent the vanishing stem issues on
# letters with diagonal stems like a and s. 
#
# Under most circumstances, this should be set at 100.  If you choose to
# not set it to 100, you may want to set INFINALITY_FT_FRINGE_FILTER_STRENGTH
# to a non-zero value in order to reduce fringing.
#
#
# Possible values:
# 0              - default Freetype value
# 100            - a full pixel
#
#
# Default if no ENV_VARS present:     0
# Recommended:                        100

export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100



##################################################################
# INFINALITY_FT_USE_VARIOUS_TWEAKS
#
# - Force autohint when no TT instructions present.
# - Artificially embolden horizontally only.
# - When artificially emboldening, maintain the glyph width.
# - Embolden light and thin-stemmed glyphs automatically.
# - Don't sharpen italics. 
#
# Some fonts look bad when stem aligned at certain ppems, no matter
# what. I've put exceptions in to deal with these, included in
# these tweaks.  Georgia and Lucida Grande are examples.
#
#
# Possible values:
# true             - enable tweaks
# false            - do not enable tweaks (do Freetype default)
#
#
# Default if no ENV_VARS present:     false
# Recommended:                        true

export INFINALITY_FT_USE_VARIOUS_TWEAKS=true



##################################################################
# INFINALITY_FT_GAMMA_CORRECTION
#
# This does a weighted gamma correction at the LCD filter phase
# PRIOR to the LCD filter.  Unfortunately it does not however
# take into account the color on which the glyph is being rendered
# (or for that matter the color of the glyph),
# which would need to happen in X rendering.  It is actually
# using the gamma function in calculations though.
#
# The first value indicates a px value, the second indicates a
# "gamma" value.  All sizes less than the px value will be corrected
# on a weighted scale based on the second value.
#
# The gamma value is commonly between 0.0 and 3.0.  Due to localization
# issues, the gamma value should be specified as it's actual value
# multiplied by 100.  So a gamma of 1.3 would be 130.  In practice,
# I'd stay between 40 and 250.
#
#
# Values 1 through 100 will darken the glyph
# Values greater than 100 will lighten the glyph
#
#
# Example 1:  Darken glyphs that are less than 10 px. With some fonts
#             even 5 or 6px is readable!
# export INFINALITY_FT_GAMMA_CORRECTION="10 60"
#
# Example 2:  Lighten all glyphs (below 100px)
# export INFINALITY_FT_GAMMA_CORRECTION="100 150"
#
# Example 3:  Do nothing
# export INFINALITY_FT_GAMMA_CORRECTION="0 100"
#
# Default:     [No gamma correction]

export INFINALITY_FT_GAMMA_CORRECTION="0 100"



##################################################################
# INFINALITY_FT_BRIGHTNESS
#
# This filter adjusts brightness, using the standard algorithm
# for brightness.  It is applied AFTER the LCD filtering.
#
# For a Windows XP look, set brightness to something and contrast to 50
# This will also tend to increase its sharpness.
# These values are relative and don't really mean anything
# however they are satisfactory for a range of appearances. 
# Another tip is to use a gamma setting of "1000 110" or something
# over 100 to lighten things before processing.
#
# Default if no ENV_VARS present:       0
# Dark XP Experience:                 -25
# Light XP Experience:                 40
#
# Example: export INFINALITY_FT_BRIGHTNESS="-20"

export INFINALITY_FT_BRIGHTNESS="0"



##################################################################
# INFINALITY_FT_CONTRAST
#
# This filter adjusts contrast, using the standard algorithm
# for contrast.  It is applied AFTER the LCD filtering.
#
# For a Windows XP look, set brightness to -25 and contrast to 50
# This will also tend to increase its sharpness.
# These values are relative and don't really mean anything
# however they are satisfactory for a range of appearances. 
# Another tip is to use a gamma setting of "1000 110" or something
# over 100 to lighten things before processing.
#
# Default if no ENV_VARS present:     0
# Dark or Light XP Experience:        50
#
# Example: export INFINALITY_FT_CONTRAST="50"

export INFINALITY_FT_CONTRAST="0"



##################################################################
# INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH
#
# This filter adjusts subpixel-rendered glyphs toward grayscale.
# Sometimes this is useful in getting a rendering more like
# OSX.  
#
# Range:  Integers 0 through 100
#   0 represents no filtering
#   50 represents halfway between subpixel and grayscale
#   100 represents completely grayscale
#
# Default if no ENV_VARS present:       0
# Recommended, if you want to use it:  30
#
# Example: export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH="33"

export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH="0"



##################################################################
# INFINALITY_FT_FRINGE_FILTER_STRENGTH
#
# This filter tries to remove the horizontal fringing that is found on
# default autohinted glyphs (similar to OSX-rendered glyphs).
# For example, an E may be rendered so that the middle horizontal
# stem is 100% black, but also has a horizonal row of pixels above
# it that is at 50% intensity.  This makes the glyph look dirty, 
# however it is technically accurate.  
#
# This would be useful in cases where you have
# INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT set to something less than 100
# but also can affect glyphs at 100, to some degree. 
#
# Unless fonts are showing fringes in a way that annoys you, I recommend
# keeping it disabled, as it can slightly interfere with smooth appearance 
# sometimes.
#
#
# Range:  Integers 0 through 100
#   0 represents no filtering
#   50 represents a 50% reduction of detected fringes
#   100 represents completely removing detected fringes
#
#
# Default if no ENV_VARS present:       0
# Recommended, if you want to use it:  100
#
# Example: export INFINALITY_FT_FRINGE_FILTER_STRENGTH="100"

export INFINALITY_FT_FRINGE_FILTER_STRENGTH="0"



##################################################################
# INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH
#
# This post-filter darkens horizontal stems that autohint renders as semi-dark.
# Freetype will by default not force stems to render to pixel boundaries
# because it results in "vanishing stems".  This happens on things like 
# s S a and other glyphs with center diagonal stems.  
#
# If you have INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT set to 100,
# you're telling it to force pixel boundaries, which can result in the
# vanishing stems.  To get around this problem,  I internally override the
# INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT setting if the stem width
# is less than a full pixel, regardless.  This causes semi-dark stems, but
# at least there are stems there.
#
# This filter is intended to darken those semi-dark stems.  I highly 
# recommend using this, but setting to a low value like 10, because
# it is particularly sensitive right now, and can make thin fonts
# look weird otherwise.
#
#
# Range:  Integers 0 through 100
#   0 represents no darkening
#   50 represents a 50% increase toward 1 pixel in height
#   100 represents a full pixel of height
#
#
# Default if no ENV_VARS present:       0
# Recommended, if you want to use it:  10
#
# Example: export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH="10"

export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH="10"



##################################################################
# INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH
#
# This post-filter darkens vertical stems less than 1 pixel that autohint 
# renders as semi-dark.  This applies mostly to thin fonts like 
# Courier New, Raleway, and fonts with the word "Light" in the title or
# style.  Although what autohint is doing is technically correct, it
# results in a bad looking rendering because it's too light, at small 
# ppems.  This filter tries to correct that. 
#
# There is an aspect of this that is automatic, so it's safer to use
# larger values for this than the above horizontal ENV_VAR.  However
# setting this higher has more impact on thinner fonts.  So, I still
# recommend lower values.
#
#
# Range:  Integers 0 through 100
#   0 represents no darkening
#   50 represents a 50% increase (from current strength) toward 1 pixel
#   100 represents a full pixel of width
#
#
# Default if no ENV_VARS present:       0
# Recommended, if you want to use it:  25
#
# Example: export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH="25"

export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH="25"



##################################################################
# INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS
#
# This will slightly stretch some glyphs vertically between 9px
# and 14px (inclusive).  Some people may find this more
# aesthetically pleasing.  This only applies to fonts that are
# using autohint.  I used to recommend this to be set true, but
# it does mess with some (less popular) glyphs in a nasty way.
#
# The goal here is to increase the height of some fonts by 1 px
# but leave the x-height where it is.  Arial is a good example
# of this working properly.  Compare the heights of Arial, Times
# and Freesans with this on, vs. TT hinted versions of Arial and
# Times.
#
#
# Possible values:
# true             - enable height adjustment
# false            - do not enable height adjustment
#
#
# Default:     false

export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true


# Experimental emboldening values for OSX mode
export INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE=0
export INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE=0     # This one seems to crash at anything other than 0
export INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE=0

#################################################################
########################### EXAMPLES ############################
#################################################################
#
# Set the USE_STYLE variable below to try each example.
# Make sure to set your style in /etc/fonts/infinality.conf too.
#
# Possible options: 
# 
# DEFAULT      - Use above settings.  A compromise that should please most people.
# OSX          - Simulate OSX rendering
# IPAD         - Simulate iPad rendering
# UBUNTU       - Simulate Ubuntu rendering
# LINUX        - Generic "Linux" style - no snapping or certain other tweaks
# WINDOWS      - Simulate Windows rendering
# WINDOWS7     - Simulate Windows rendering with normal glyphs
# WINDOWS7LIGHT- Simulate Windows 7 rendering with lighter glyphs
# WINDOWS      - Simulate Windows rendering
# VANILLA      - Just subpixel hinting
# CUSTOM       - Your own choice.  See below
# ----- Infinality styles -----
# CLASSIC      - Infinality rendering circa 2010.  No snapping.
# NUDGE        - CLASSIC with lightly stem snapping and tweaks
# PUSH         - CLASSIC with medium stem snapping and tweaks
# SHOVE        - Full stem snapping and tweaks without sharpening
# SHARPENED    - Full stem snapping, tweaks, and Windows-style sharpening
# INFINALITY   - Settings I use
# DISABLED     - Act as though running without the extra infinality enhancements (just subpixel hinting).

USE_STYLE="DEFAULT"



### WARNING - NEEDS WORK - ALSO LIABLE TO CRASH APPLICATIONS ###
################# OSX STYLE #################
if [ "$USE_STYLE" = "OSX" ]; then

export INFINALITY_FT_FILTER_PARAMS="03 32 38 32 03"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=25
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="1000 80"
export INFINALITY_FT_BRIGHTNESS="10"
export INFINALITY_FT_CONTRAST="20"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=false
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false
export INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE=8
export INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE=0

fi



################# IPAD STYLE #################
if [ "$USE_STYLE" = "IPAD" ]; then

export INFINALITY_FT_FILTER_PARAMS="00 00 100 00 00"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=100
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="1000 80"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=false
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false
export INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE=0
export INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE=0
export INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE=0

fi



################# UBUNTU STYLE #################
if [ "$USE_STYLE" = "UBUNTU" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="1000 80"
export INFINALITY_FT_BRIGHTNESS="-10"
export INFINALITY_FT_CONTRAST="15"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi



################# LINUX STYLE #################
if [ "$USE_STYLE" = "LINUX" ]; then

export INFINALITY_FT_FILTER_PARAMS="06 25 44 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi


################# WINDOWS XP STYLE LIGHT #################
if [ "$USE_STYLE" = "WINDOWSXPLIGHT" ]; then

export INFINALITY_FT_FILTER_PARAMS="06 25 44 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=100
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=65
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=15
export INFINALITY_FT_STEM_FITTING_STRENGTH=15
export INFINALITY_FT_GAMMA_CORRECTION="1000 120"
export INFINALITY_FT_BRIGHTNESS="20"
export INFINALITY_FT_CONTRAST="30"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=30
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# WINDOWS 7 STYLE LIGHT #################
if [ "$USE_STYLE" = "WINDOWS7LIGHT" ]; then

export INFINALITY_FT_FILTER_PARAMS="20 25 38 25 05"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=100
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=100
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="1000 160"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="20"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=30
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# WINDOWS XP STYLE #################
if [ "$USE_STYLE" = "WINDOWSXP" ]; then

export INFINALITY_FT_FILTER_PARAMS="06 25 44 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=100
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=65
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=15
export INFINALITY_FT_STEM_FITTING_STRENGTH=15
export INFINALITY_FT_GAMMA_CORRECTION="1000 120"
export INFINALITY_FT_BRIGHTNESS="10"
export INFINALITY_FT_CONTRAST="20"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=30
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# WINDOWS 7 STYLE #################
if [ "$USE_STYLE" = "WINDOWS7" ]; then

export INFINALITY_FT_FILTER_PARAMS="20 25 42 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=100
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=65
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="1000 120"
export INFINALITY_FT_BRIGHTNESS="10"
export INFINALITY_FT_CONTRAST="20"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


############### VANILLA STYLE ##############
if [ "$USE_STYLE" = "VANILLA" ]; then

export INFINALITY_FT_FILTER_PARAMS="06 25 38 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=false
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi


############### CLASSIC INFINALITY STYLE ##############
if [ "$USE_STYLE" = "CLASSIC" ]; then

export INFINALITY_FT_FILTER_PARAMS="06 25 38 25 06"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi


################# NUDGE STYLE #################
if [ "$USE_STYLE" = "NUDGE" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=25
export INFINALITY_FT_STEM_FITTING_STRENGTH=15
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=30
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi


################# PUSH STYLE #################
if [ "$USE_STYLE" = "PUSH" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=75
export INFINALITY_FT_STEM_FITTING_STRENGTH=50
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=30
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# INFINALITY STYLE #################
if [ "$USE_STYLE" = "INFINALITY" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=5
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=25
export INFINALITY_FT_STEM_FITTING_STRENGTH=25
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=40
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# SHOVE STYLE #################
if [ "$USE_STYLE" = "SHOVE" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=100
export INFINALITY_FT_STEM_FITTING_STRENGTH=100
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# SHARPENED INFINALITY STYLE #################
if [ "$USE_STYLE" = "SHARPENED" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=65
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=25
export INFINALITY_FT_STEM_FITTING_STRENGTH=25
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=40
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


################# DISABLED STYLE #################
if [ "$USE_STYLE" = "DISABLED" ]; then

export INFINALITY_FT_FILTER_PARAMS=
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=
export INFINALITY_FT_STEM_FITTING_STRENGTH=
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=false
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=false

fi


################# CUSTOM STYLE #################
if [ "$USE_STYLE" = "CUSTOM" ]; then

export INFINALITY_FT_FILTER_PARAMS="11 22 38 22 11"
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=100
export INFINALITY_FT_STEM_FITTING_STRENGTH=100
export INFINALITY_FT_GAMMA_CORRECTION="0 100"
export INFINALITY_FT_BRIGHTNESS="0"
export INFINALITY_FT_CONTRAST="0"
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true

fi


