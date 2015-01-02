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
# NAME:           ssd.sh
# PURPOSE:        Setup SSD tweaks
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "Disable local Time Machine snapshots"
# sudo tmutil disablelocal
#
# echo "Disable hibernation (speeds up entering sleep mode)"
# sudo pmset -a hibernatemode 0
#
# echo "Remove the sleep image file to save disk space"
# sudo rm /Private/var/vm/sleepimage
#
# echo "Create a zero-byte file instead…"
# sudo touch /Private/var/vm/sleepimage
#
# echo "…and make sure it can’t be rewritten"
# sudo chflags uchg /Private/var/vm/sleepimage
#
# echo "Disable the sudden motion sensor as it’s not useful for SSDs"
# sudo pmset -a sms 0
