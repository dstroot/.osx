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
# NAME:           terminal.sh
# PURPOSE:        Setup terminal
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# -------------------------------------------
# Notes:
# Keep terminal color files in ${HOME}/.dotfiles/init
# load them here:
# -------------------------------------------

# cecho "Use a modified version of the Solarized Dark theme by default in Terminal.app" $yellow
# TERM_PROFILE='Solarized Dark xterm-256color';
# CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
# if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
#   open "${HOME}/init/${TERM_PROFILE}.terminal";
#   sleep 1; echo ""
#   cecho "Wait a bit to make sure the theme is loaded" $yellow
#   defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
#   defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
# fi;
#
# cecho "Install the Solarized Dark theme for iTerm" $yellow
# open "${HOME}/init/Solarized Dark.itermcolors"
