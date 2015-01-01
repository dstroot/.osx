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
# NAME:           name.sh
# PURPOSE:        Set computer name
# VERSION:  1.0   Initial version
# -------------------------------------------------------------------------------------------------

# # Set computer name (as done via System Preferences → Sharing)
# USER_NAME="$USER"
# COMPUTER_SERIAL=`ioreg -l | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/'`
# COMPUTER_MODEL=`ioreg -l |grep "product-name" |cut -d ""="" -f 2|sed -e s/[^[:alnum:]]//g | sed s/[0-9]//g`
#
# # Concatenate User, Model and Serial (descriptive and unique)
# COMPUTER_NAME="$USER_NAME"
# COMPUTER_NAME+="-"
# COMPUTER_NAME+="$COMPUTER_MODEL"
# COMPUTER_NAME+="-"
# COMPUTER_NAME+="$COMPUTER_SERIAL"
#
# # notifying computer name update only if name will be changed
# if [[ $COMPUTER_NAME != $(sudo scutil --get ComputerName) ]]
#   then
#   echo "Computer name set to $COMPUTER_NAME"
#   sudo scutil --set ComputerName $COMPUTER_NAME
#   sudo scutil --set HostName $COMPUTER_NAME
#   sudo scutil --set LocalHostName $COMPUTER_NAME
#   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
# fi
