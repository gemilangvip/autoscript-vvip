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
BZh91AY&SY'�}n  ��� 0���?��o����@   � PY�s.��ӧW	$��#F�i��M4mM�hdz���$�O@Sz*~T~�i��@ 4 h6�2SPJ=��!�@ �  hh �44���@@1# Q �i��� 4hѠ���z�^�2H�7q>�]��[�uZ������M
r�R���[@*4ݬ�ߺ	�����.0����)���3�I,W�'J'!)Z��R��R�x̥c��X�F\vE�;�i>E��s��a?��4TU"�x�'"�C�+����f(�A>��z+q%N\i]B�6��M~�ݟ����*ɑ��W\�DULt��`��|B�d�9�	�р§�
 u��`dn&2H�CKJ�L����c#�~�TPϫ+G\l3�e����B
D�t��)i��ޚ��+ �z��¥IdW�R�ǝ��ylD(
�#�/3�,ƣ���e0��M`-�kH��#�"T��3[��J͌�'�)�����ޜ���[�}�4�lm�uGpz�,R1d�d�t��Y��`B� ޖD�NA*��?6��c�:Z�}�O+�
�^ 6n,���C��I��94�Q:r���M^�h�z���1��e���d�]��̜ҁ1U��3R0��A)��LP�����^��x\@�	��9��-5����+?�8��
ͫ1{�Wˌ}G*Ӭ���յp�tS��N��}u�ܽ~v�)֬Q��LV`��(����%��A�3��;��,�b6e��E��F����VI~"N9��1C%7+�}r���Lѫ	#��+��_���F)�Audt	D�����l	&ʹ��gEh���t7A���͡Cy
�$R��R�,��<uh!̠��r
��;���]��B@����