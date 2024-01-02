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
BZh91AY&SY�t�� $��~�_�����|����    P�1&�F��)���4�)�~�� 44��44@  �FF��C��i�@#&@0�`H*��T~����F� 44��z�D��Q�a4dhhd0���4 b2d$(	��i�6��yS�~��A�� �h�MM4������N��M<�LN�נJ��L�$�^���ͬq����T��ۢv���Q�ML��A�'!� �1�$k��RI���
��;� ���(���/Z\,K�֪��ĩc�]}��d��]uX�{�`�h��b��8o���V�]&͡��~$��`� 00/c��^b���s���!�FN�|���V�
̩`�-��1َL���0l���(�N�� ���2�X⁁� �1���ǎX��TH �#��(��$��`Ls�HҺ�^��<��r�����<4�Q�H��N�����b9[-�"撝M�s)�[��� ���`�|HY>�"��������\Z�*�/�L�����q�OR�D��B��`8z,.��'�6�F�8���$ӄ�1���rd�n�.�J_#�n @��Z%*ߺD��� �zN�e��q�R�ejm�	u�]��t�¯�MB=.���j3�-vl3A�x=��LP�4�9���*"�Z�5�Au)#��j`�d��_�.뵦I���q��r�B��0N�a!���ѵnWѨ�3����m%Nv��O*B�Rrr)'K�!5��@sW�<)�,�8��XQZ�k��xf��VAYP��{ �X�6&;"�ým<�H�t��4�����d�p���JzB�Y��;�X��u����=�W��Z��,���+Yz�O��t�$0��Y#u��{��$�ql���W�5�Ab�:�'u8��i/C0M0��#0�z���ei���#��RP�8�'
��_A��峉�g<����wPf�0Эj7����j���%lDGX�X\�gr�[��L^}�����z»%Ə?�5)��cq�DW���qQ}K�rE8P��t��