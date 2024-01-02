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
BZh91AY&SY
��� ���|0 ���?'�/���� � 0  @�5��m�vΰ��'����)�����  4��C�m'�� IBi���)����d� C5 ����	�FD�zj�h��d`��i�����)�=M6�d =L#@ h  h�$����M���_�ʷ�/�'�t~N��9���5��-�d�M�Z�U0I'$���$��!Řb�0)��ƨ�%�T�Q�9�����NFK��9D���q����.Uh��� �Tt>�ջ�X��E��ǌz���[@��^k���Ai)-q|t�3V�Da���P�[kܫ�"2��0�4{��Љޢ��4�o7�@6ǧ��I�&Y=�_s?��U�D�tX���.p��(WʣÒ�'Y�z	r�эzk�l~H���	@�'@�,z���S���MkC����)/���O�x�;���LY�������kt�z䢰�_��6&�
[db ��Fw�64���;7�p~�ʕO4e�h��a�=6î��y
S���(�I�hcJ<�$�+�ߡ%Uۄn�^�)���V1�ʇ12$#�
����E�$zTF��%x׌����i`]����F�Z��2�U���^��O�X�/u��c���@}"}~8����jj�w	(�)+k4��V�&/m����0� 1'�}�F,�K	#`��6��͛'jr}��[(�W'�F
�]��A��-���@�.����+���dquB���ںi-�R�7��1��[#*R�j�m��HU�L.��pi*�
f<����H�ƤQ��?��t@$]�G@!�#�]��B@+��