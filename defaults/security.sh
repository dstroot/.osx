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
# NAME:           security.sh
# PURPOSE:        Manage Security Settings
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------
# Based on:
# https://github.com/drduh/OS-X-Security-and-Privacy-Guide
# https://benchmarks.cisecurity.org/tools2/osx/CIS_Apple_OSX_10.11_Benchmark_v1.0.0.pdf
# ------------------------------------------------------------------------------

# Enable firewall. Possible values:
#   0 = off
#   1 = on for specific sevices
#   2 = on for essential services
#sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Enable firewall logging
#sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -int 1

# Enable stealth mode
# Source: https://support.apple.com/kb/PH18642
#sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# Do not automatically allow signed software to receive incoming connections
#sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

# Log firewall events for 90 days
#sudo perl -p -i -e 's/rotate=seq compress file_max=5M all_max=50M/rotate=utc compress file_max=5M ttl=90/g' "/etc/asl.conf"
#sudo perl -p -i -e 's/appfirewall.log file_max=5M all_max=50M/appfirewall.log rotate=utc compress file_max=5M ttl=90/g' "/etc/asl.conf"

# Reload the firewall
# (uncomment if above is not commented out)
#launchctl unload /System/Library/LaunchAgents/com.apple.alf.useragent.plist
#sudo launchctl unload /System/Library/LaunchDaemons/com.apple.alf.agent.plist
#sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist
#launchctl load /System/Library/LaunchAgents/com.apple.alf.useragent.plist

# Disable IR remote control
#sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

# Turn Bluetooth off completely
#sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0
#sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist
#sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist

# Disable wifi captive portal
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Disable remote apple events
#sudo systemsetup -setremoteappleevents off

# Disable remote login
#sudo systemsetup -setremotelogin off

# Disable wake-on modem
#sudo systemsetup -setwakeonmodem off

# Disable wake-on LAN
#sudo systemsetup -setwakeonnetworkaccess off

# Disable file-sharing via AFP or SMB
#sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
#sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# Display login window as name and password
#sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool true

# Do not show password hints
#sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# Disable guest account login
#sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Automatically lock the login keychain for inactivity after 6 hours
#security set-keychain-settings -t 21600 -l ~/Library/Keychains/login.keychain

# Destroy FileVault key when going into standby mode, forcing a re-auth.
# Source: https://web.archive.org/web/20160114141929/http://training.apple.com/pdf/WP_FileVault2.pdf
#sudo pmset destroyfvkeyonstandby 1

# Disable Bonjour multicast advertisements
#sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool true

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"

# Disable diagnostic reports
#sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.SubmitDiagInfo.plist

# Log authentication events for 90 days
#sudo perl -p -i -e 's/rotate=seq file_max=5M all_max=20M/rotate=utc file_max=5M ttl=90/g' "/etc/asl/com.apple.authd"

# Log installation events for a year
#sudo perl -p -i -e 's/format=bsd/format=bsd mode=0640 rotate=utc compress file_max=5M ttl=365/g' "/etc/asl/com.apple.install"

# Increase the retention time for system.log and secure.log
#sudo perl -p -i -e 's/\/var\/log\/wtmp.*$/\/var\/log\/wtmp   \t\t\t640\ \ 31\    *\t\@hh24\ \J/g' "/etc/newsyslog.conf"

# Keep a log of kernel events for 30 days
#sudo perl -p -i -e 's|flags:lo,aa|flags:lo,aa,ad,fd,fm,-all,^-fa,^-fc,^-cl|g' /private/etc/security/audit_control
#sudo perl -p -i -e 's|filesz:2M|filesz:10M|g' /private/etc/security/audit_control
#sudo perl -p -i -e 's|expire-after:10M|expire-after: 30d |g' /private/etc/security/audit_control

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false



echo "Disabling Java"
defaults write com.apple.Safari \
 com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled \
 -bool false
defaults write com.apple.Safari \
 com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles \
 -bool false

echo "Always ask for password"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist 2>/dev/null

echo "Setup found information on Lock Screen"
if [ -n "$STRAP_GIT_NAME" ] && [ -n "$STRAP_GIT_EMAIL" ]; then
 sudo defaults write /Library/Preferences/com.apple.loginwindow \
   LoginwindowText \
   "Found this computer? Please contact $STRAP_GIT_NAME at $STRAP_GIT_EMAIL."
fi

echo "Check and enable full-disk encryption"
if fdesetup status | grep $Q -E "FileVault is (On|Off, and will be enabled after the next restart)."; then
 logk
elif [ -n "$STRAP_CI" ]; then
 echo
 logn "Skipping full-disk encryption for CI"
elif [ -n "$STRAP_INTERACTIVE" ]; then
 echo
 log "Enabling full-disk encryption on next reboot:"
 sudo fdesetup enable -user "$USER" \
   | tee ~/Desktop/"FileVault Recovery Key.txt"
 logk
else
 echo
 abort "Run 'sudo fdesetup enable -user \"$USER\"' to enable full-disk encryption."
fi
