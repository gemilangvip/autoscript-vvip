#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY{?�� �M� _������|����    @�ыJ	H��j�dF�4i��m5�$��ɐ��!SOɣBhz����4�ѐ � h�LC!���C@� d1 �#A4�S��<D�M4m@�A�5HA�Yt���P��[����� �J�|M:E����B�ҧ�S��ƨ�q��A�o�uϟF�A����������@֢�
��C�7���A�b��p%H�M��i�`1�ܮd��oӇ�#2�h�W���
��#8���?1�DU�SF;�����7T@$m(������,!Q��C�4IK���F5�T��$ʕ����N�dlk .z޺H����;?�:$�2�e{C�L
��!�E��qN�K�X(nd'2�L�wAs�.A�W�����s��#����JĂˑ<b�;�����ojD�*Y$Jq' �(�MC<ҦB��@Ksض�a��g�j=�P&�j��:�	�'� k���/�Ƴ�ǰCy�G�R�L���rn�O�J���zM/H��`���6� ~—����ТE��,�B�+[�'TV2c�Q�+i]�M[-}�{�p`ᕋ��}�8���40uJ9���TIa�C�mT@��ULj�Rk�!�wσ���d��y*�9�q����	=��OE��@N�ʖ��ǁ��og�����@���Xj=4ɲɱKojh�,v�b���
��M��M�������*��7F�)E[���`���I��C'��v�������`#�]��BA��s