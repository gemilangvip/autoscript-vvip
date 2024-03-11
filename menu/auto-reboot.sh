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
BZh91AY&SY|��D �_�\0~�����.����` D   � P Pz��n�� �D�2�1m� ��4��`4�z�@�H&M&jP�=CL� �b=CFF�$HF�~�S�6�&� �2��� � A�CM@�h`�2h�� �AS#M��L��i�'�ze2z�������!��DJ ��$�  �"�B���Cbk�\	hq�$+�%�I� a�m��Vˆ�S���������r� �b��L�u��Ƙ�A��*Lx7�x�0��!�|�(o�ա.�C5��:FsDHW���eG߆���M��tz� ���<y�d�[�$I�XO]0ݻҗ��PA���F5����#� 4ND�F�ඡ�'-���u�|j�{?,kˆ��p�����V�Ɠl�Ƶ��H4tM��F�c$C����pM5�fZ[B��d��%j��pvM�C��3�x���qt��CY�',�����]��f-�������Y-v6G}J(��|A�LB^�����#Ph�jh�b�<z��w8i�':���8d�L�꛶R�&�T"uB�*��u��в(B yU`����2)�q�����	����8�L#pD!�u mBR~bo2ʼ@��%��
j�!���H|�ᰶ|��	{�],J�=�La_����=�*�����W�O ���d��IXox|{�l��ӏ�h0� �y�!�����%��F9����-����ؿa�zS���U��E6��d��J��U�G���o�"�i�b�M�K�#MK�16�9	j9'��t"��^��b!`�A�35$�l�9���A�OA�� �N�\%8Kaȗ`���+����{���`��*��[)٥~9��|Օ�>�y����۬}�� ^
7͐���F��y��s�rz�-a�(�Qe!w$-`��@M�k��Sƌ�Y	ϊ�&�jl����"����tŁHġsCq"d@a����,��萆��{�uLv��6V����F1,�S�	�~�2k�25z���d�y����As�	/Ja����j, 1#�5��F6f0k[�\�`��L���P8J$�_w��(�JX�tZ;�%��I`��dhR1�E��1A�,ֻl���\� 3����
��,A=Mx��ƞl��ss썼��܈�P��|�U� �� >j@���H3��.1:�Q` $��H�
��h�