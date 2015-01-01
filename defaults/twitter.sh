#! /bin/sh
# -------------------------------------------------------------------------------------------------
# Copyright (c) 2014 Dan Stroot
# All rights reserved.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# -------------------------------------------------------------------------------------------------
# NAME:           twitter.sh
# PURPOSE:        Setup Twitter
# VERSION:  1.0   Initial version
# -------------------------------------------------------------------------------------------------

# echo "Disable smart quotes as it’s annoying for code tweets"
# defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

echo "Show the app window when clicking the menu bar icon"
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# echo "Enable the hidden ‘Develop’ menu"
# defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

echo "Open links in the background"
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

echo "Allow closing the ‘new tweet’ window by pressing Esc"
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# echo "Show full names rather than Twitter handles"
# defaults write com.twitter.twitter-mac ShowFullNames -bool true

echo "Hide the app in the background if it’s not the front-most window"
defaults write com.twitter.twitter-mac HideInBackground -bool true
