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
BZh91AY&SY�һ e��]~�o���ߪ����  D  � P PF�l�"٧��&�M=S��i������� =!�����z���� %H��*zOM4i454��4�@  h4�F�i��'��F�!�FA�4h h�    4�A����� hh4d  �bA�@           �5D/��ݰ��v�J��i%��a6*�2|�&�����>-:㿙�}��Jֽ��zCTB��uq��D`D�}��*��**R��?E�K�s��`�A���~�Rn-�����-c,|υ#Zb�o]!�KO���XD�z�Y�D@�j�2���H �I$ H�C6���"'�W"�;P�5����h�i��=��'�~z~�>�D�xr�F�ٱ��^�x�x9O�L��+=�*�N"@DB�e��� h��q�+���>ܑP��/1�H�RTk�cN� ����>�z2�E9�uDֵ풪�lV��+K)JqJ=q*p��8��q��8�Y�C͛��n5&�����\�����Fի����G�%�\��%�Љ�ND9~��<�K�j@��^ܨ
j� ӎ�<��$>�y���(Gb��El5���Q�;D��֨��=�N���$�a?�����;��FQ s��c�X��v٪ �F�"��7��Ҫd5]����R���[�d��R���J������I�T92�4T�r`B�}͇X2)R}�`�
�F�gmjiq�Ev!I��+�$m�����ā�� �|ٶdt��j̐I,�t���X���S	l�(�"�3�m�!�1H�r�:�B�&�_.sk)>���b��ԍ�1�����d&���'\�mf�K;�h�C���!+����6N��Y���>FE�a_w��VX�|I�ƮQ.MD�l���W	'��'��^�c}���3X����E7/�,y�D@�V�*[���� @� ����D�ܑN$$4���