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
BZh91AY&SYT^�� ��w� �����������    P��W�{�=�P��D&�̑�����Cj4��hh�@m&j =CL�(�h��M)�(h3I��h�@d�=@ ��("h�?SԞ�����z@h�=F�h ��  +�F���          �0&���M��)�����d h �� ��J�T��cM
�4{dCՊzN�?��D�V�i� j4���}�,�R�$˒��f��#1�N$M���w����aϼ�tb����a-;�c7���cm��T�\�@��5J����[.�Ό�XA݄B�ZP>jds���ۄ��RV뙒?�})�����­W�)��"��>�<,%G
�m��I-��QQ�ď&\��ݴ���DX�Ybk�K�F<�� ��	��) ��Ѐ� �@D��F��Zzf��fr�KY��0&���<pa���'A�S�_5�s5R�$(�<26���t[������}ʶ\ N1�S����޼mS�n���i0���{�� 4f�u�QL�$�ŦH���)H�`
߰�ĆI� ����w�����nB� �R��!�JA�s�j�X�V�-�̤��4��@��N�����[���<�	Hi,�|�ǻ�z��pLC���(��-�܍�-�r=+A�
��;���u�R`3Q!���?	�K� �p�uq�+(��� � 8�v�� �W"&bU�4�'��<k�t�"ڊ�@�*�kjみ\��0p�h*R���?�T�čJ�q�"��cdg�ބ�F�sFR��uu#9EKo.IܔM�!�$���H� �-mm0T�i�U�q��M�R���]��6TkdV~i-�1a��I�{\���̳��ō�1�"i~����͋G����LK;�H���$�̇�6D����K�a-)����R5��JY-M��&����yDZ|т$��@��@~w#�A��=f���10�VC(�r�����dIj�t��`p�PR3�M��]�.�JŅ��_��kF�H�#˱�<Fkia�#	��#J�����%�h�b��{�	����y�%:��q�-�+!�1�������KQ8U$T~
��E5�ʊ��Sɹ@�u,��`Lx)E�:��j�.�enL�ڜ����LB�7(��-R��&�h9���8����&9�����px���<Ç����Ei��n�~�"��1�3��� ��o		!#�]��BAQ{[�