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
BZh91AY&SY�U�� *��g0 ���?'ޯ���� � 0  Py�cN�����R)������ơ�����F@��!�	SR`�Lz���  �  �4hD�D�CB6�= ښ �4�� p4d4ѡ�����&� �1 ��H�#L�5Lhj�!�0� 4���lC`ۆ����iN|/�Z�!/�,jɮ��Q�D�Q��͝|R0i��B��C��W�u��,��~�Y�y����%��i�
!r���YmB�|@��Y�zݏ[�4R����ɼ�oԴ�~�H���,̓����n�"dcQ�$%�0[[�f��-�0�غ�e��24�_n����O%4Y%�[�����F��pЊ[܇��;3���6���3)E@ܺ-N��g≴�~t�|���w�<���8��+L!�3t���uh���E��������Bf�Kϒ�:��d�ʩJR%-YUSw!B)P��	��^�Zڼ�2���᚛�9���Ioہm��G����g�<%��^|�,o��n�P�ɘ��!1�j�������1�p��I�1����/�q|�=T��^��"`+$�P�(��$�]�B�/�����U���x,ѷ�Q�cW2���N|��hU+�.�1��o�Ŭ��+�����H����*G�P][u�:dFTlL�ۣ�CP.���f�-N"�]�}K.�7@�i
�Kw��3�2���u���� y(wـ�2�����Z�F&~͸���oe�/LcT�z�H%i{�
WS솊l�q��V�>S��\t�f%
���N>Ta�(=�f�h��qa,�'�%�IPxz�>�Q*�d�x-�+������pu��=dPEW�k�iSa�6n���)aA��D���;�YH�b(IS$M��$$�I$�� H0 ���"�(Hw��d 