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
# NAME:           safari.sh
# PURPOSE:        Setup Safari
# VERSION:  1.0   Initial version
# -------------------------------------------------------------------------------------------------

# cecho "Privacy: don’t send search queries to Apple" $yellow
# defaults write com.apple.Safari UniversalSearchEnabled -bool false
# defaults write com.apple.Safari SuppressSearchSuggestions -bool true
#
# cecho "Press Tab to highlight each item on a web page" $yellow
# defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
#
# cecho "Show the full URL in the address bar (note: this still hides the scheme)" $yellow
# defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
#
# cecho "Set Safari’s home page to `about:blank` for faster loading" $yellow
# defaults write com.apple.Safari HomePage -string "about:blank"
#
# cecho "Prevent Safari from opening ‘safe’ files automatically after downloading" $yellow
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
#
# cecho "Allow hitting the Backspace key to go to the previous page in history" $yellow
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
#
# cecho "Hide Safari’s bookmarks bar by default" $yellow
# defaults write com.apple.Safari ShowFavoritesBar -bool false
#
# cecho "Hide Safari’s sidebar in Top Sites" $yellow
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
#
# cecho "Disable Safari’s thumbnail cache for History and Top Sites" $yellow
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
#
# cecho "Enable Safari’s debug menu" $yellow
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
#
# cecho "Make Safari’s search banners default to Contains instead of Starts With" $yellow
# defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
#
# cecho "Remove useless icons from Safari’s bookmarks bar" $yellow
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"
#
# cecho "Enable the Develop menu and the Web Inspector in Safari" $yellow
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
#
# cecho "Add a context menu item for showing the Web Inspector in web views" $yellow
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
