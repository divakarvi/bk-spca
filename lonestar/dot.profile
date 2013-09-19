#------------------------------------------------------
#  $Id: .profile,v 1.1 1996/10/22 22:54:24 milfeld Exp $
#  $Source: /common/src/etc/start-up/RCS/.profile,v $
#------------------------------------------------------
#  .profile - basic commands for Bourne shell initialization.
#   This is a copy of /usr/local/etc/start-up/.profile 
#  
#   **Please don't make changes to this script.
#   **Create and add commands to  ~/.profile_user. 
#
  .  /usr/local/etc/profile
#
# $Log: .profile,v $
# Revision 1.1  1996/10/22  22:54:24  milfeld
# Initial revision
#

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
#IDEV BEGIN (This line used to detect idev setup-- do not remove.) 
   if [ -r   $HOME/.idev_bash ] ; then 
      source $HOME/.idev_bash 
   fi 
#IDEV END   (This line used to detect idev setup-- do not remove.) 
