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
BZh91AY&SY1*� _�r����~�^����� @g� � P P�����o<�$Ħ��O'�hi� ���h������ 2H���FPmA�@ 4  � ����G��2I� 1 4  F��(m@h�P�@      I*lT�&&M�4    h� �N
����/O���r@�s_\k �EtN�����0&lVV���i�m"�D��7^��u�h:��dә��8c5�lq�Iehe�󈠖���`hڢ!��[�#9����m��ξ���L�4�Q�ȎFJ��D}3�9��,g,k<�a)et��"��:��N��fz9��c� ��8�d+�59, I��F�V�
�����K�8A&�&k�vt�{.Le&ԯR�Y#��1�%J���+\D�����TPhXH��f�ŉ�������2e IԬ5eza��L�=M�T*�ZU[b�O�BqRgnQ}(#I#����S�O�*34���|�H��QxP��s!2��uf"�1�Zs:��q�-p!6��(ZEKbLVQk0i��� �Fy=��H!�^�(���X�'%�#�XD�lrpe�X�U�qI�$2Ԃ�B־OLq}��&D����@����t<��"�Yh�"B���+��P���:k|$Ql,��*fb�����!ƙAHFT��p��H�%"���&�U+�G ��eƲ�Ò\�O��I�q3�"b1	�#5�td< x�Hj_j�=�P��g:%ya����E�I؊�SL$^�-�A�)IY��%�Rk|��IV�3�#�/��*�����2
��(~�-��)o���ͣ�������1�À@�ʟ���@N�u��M��m��U_TD7u�D���]�鷼b�*�d`��kQ��RH�En�X�+����`�b�^R��W�.�p� bU�