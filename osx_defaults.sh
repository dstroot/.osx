#! /bin/sh
# ------------------------------------------------------------------------------
# Copyright (c) 2014 Dan Stroot
# All rights reserved.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# ------------------------------------------------------------------------------
# NAME:           osx_defaults.sh
# PURPOSE:        sets all the things
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------
# References & Resources:
#  - https://github.com/MatthewMueller/dots
#  - https://github.com/thoughtbot/laptop
#  — https://mths.be/osx
#  - https://github.com/kevinSuttle/osxdefaults/blob/master/REFERENCE.md
#  - https://gist.github.com/brandonb927/3195465
#  - https://github.com/joeyhoer/starter ** SAME APPROACH **
# ------------------------------------------------------------------------------
# NOTE: How to track changes to create your own commands:
# ------------------------------------------------------------------------------
# $ defaults read > a
# ---- Change a setting, then: ----
# $ defaults read > b
# $ diff a b
#
# Doing this creates files called a and b, then displays the difference between
# them. With this knowledge you can then open up the file b in Sublime Text 2,
# search for the bit that changed and try and work out the command to change it.
# ------------------------------------------------------------------------------
progname=$0
ver="1.0"

# Define colors
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#  Reset text attributes to normal
alias Reset="tput sgr0"

# Color-echo function
#   Argument $1 = message
#   Argument $2 = Color

cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

# identify yourself
cecho "Running: $progname, version $ver." $red

# Set continue to false by default
CONTINUE=false

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#     REVIEW THE SCRIPTS IN THE /DEFAULTS     #" $red
cecho "#    FOLDER AND EDIT TO SUIT *YOUR* NEEDS!    #" $red
cecho "###############################################" $red
echo ""

echo ""
cecho "Have you reviewed the scripts you're about to run and " $red
cecho "understand they will make changes to your computer? (y/n)" $red
read -r response
case $response in
  [yY])
  CONTINUE=true
esac

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Always better to verify first!" $red
  exit
fi

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# where we keep our defaults
FILES=${HOME}/.osx/defaults/*

for f in $FILES
do
  echo ""
  cecho "===================================================" $white
  cecho " Processing $(basename $f) configuration" $blue
  cecho "===================================================" $white
  echo ""
  sh $f
done

echo ""
cecho "===================================================" $white
cecho " Restart affected applications" $blue
cecho "===================================================" $white
echo ""

applications=(
  "Activity Monitor"
  "Address Book"
  "Calendar"
  "Contacts"
  "cfprefsd"
  "Dock"
  "Finder"
  "Mail"
  "Messages"
  "Safari"
  "SizeUp"
  "SystemUIServer"
  "Terminal"
  "Transmission"
  "Twitter"
  "iCal"
)

for i in "${applications[@]}"; do
  killall "${i}" > /dev/null 2>&1
done

cecho "All Done!" $green
cecho "Note: some of these changes require a logout/restart to take effect." $red

exit 0
