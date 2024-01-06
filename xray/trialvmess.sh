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
BZh91AY&SY�Q�i �_�~������|����  D  � P P���aTJ4(d(d��� ѐ 4 S�444�	( �A24���i����  4 i��� q��M2h `�44 �  L�hq��M2h `�44 �  L�h$P@bjm2i�6��G�<FOTdP� 44�D� �/�<�b�*_�����]�V�r Df��0����"�AAY�HA���b m~�G����f=�ʏ��i���4���c����Ve*2��*I���y�]�z�\[�6�����<��a�!p��y�
�n�Y���o	S��+�鉅�L���.�P{am��6�q:ڈa���c���7=۹ ek1``�擬�"Ѐ/�� �b0�Ez�$s]I���X1��hc����5�S	ޙ8�)��P���2AD4	�T�<$є�ǂ�H�m0i��:�� (������a��ϣ>��G7+�
&��W�b1 2��P07��rí��r��iDf����蒝��(��q�S�[4�$�HT�f�ꉁ�����6�s����&�1(������
�*��9�E�*Ï�KK @uF�LG#�Y-�H�p0�Q6Z������Z��hk��Iw��/���Ч�W�}'�����Or�"�pם��*[@�����:_po ;� ����Q��"\!�7����e����3u�.�+�I��E�"Αj���j?mŨ��Ɓ����?m.�8s�+n�Q�q,s���z��8܏`t,��KE�{aŊ�j���RH���8�P;ʈԭYǃ Tҁ^ʖf*!A���|�Xz�3&�m��)�k��hk9UX�N�-��s
JX����fK��[<	T�f�ƚ�LF��ɐ>��FuSТ����3�+$Xd��(�h�P��/	d2��%�U
j�d6Nru�m-�~�MRǀ���g��"���.�KC�Q��!�s��$��զ6�%�Y�H�^0,:6�m����PQD�ZH.�H�\e*�r!-�v�����t�D����c��*�-�J�J�{Ӝ�^�|'�����S�2�[0�dd�j��H	�H��M͙�q���ÊS����LEr�h;��$���"%�iQ.HT[B.�� ��ʅ���h�����vTU���wa���"��3�m�sɟ�݀�p��{��K(X�<��ˇ$�B{hc����������<S9=0�����Z�D��b�0�K�ڕ*
�+ee�� �` �a<l�:Ą#� �w$S�	�V�