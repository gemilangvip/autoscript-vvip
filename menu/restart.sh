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
BZh91AY&SY�|5� !��|��~���?���` D   � P P��Z"(@�R�P� �@  2 4�  �F�h� 10@ 4�� 0&AƆ��L�4i��  @i� E$SbOTz�
?SHښP2i���!�Q�j �D�#&�&$d���)���ޔ�4ɠ�F��L�� �G�n��d�w3N$���]!H"=�*J���d�+ýh��a���2����7&�_�C(t�  Y!AS�fp�7MX����P<�T��DC#II�eD�Xa-"�u.)��^Rڭ
EgJ�vD�(�ݗ��JrU�����?m�����Sr���fè��{}��.��+�a�������(���+>_v%:
T}�<}S�����S]M�x��={�UR�a�2�X�h�b��L5�1���h�ME0
aR�!HS"�.JEY�t������sa� �=�!��������M��2���'�{��C@Q, !
*B�ɚ��P��[���R����?��tu;E�����M�8�Cb�|�6��������E/�T|�l<��^r�<4�X�}�8� ©x2� � ��eU��y�)�9o��OQ�UP5h��U�Ye�U#�� ~x*r�ih�������i$pf���F�}g`���vb)���kG�^Dj5|3�N���P9��L(h3�o*�����e`�~�v�+5eP�EV� #(��R@������@�M�<����6�Q_��B�u�R�b4�/"��H؂ �\�>��g<�-�8'�:=W�e�#z�s�	_f�|��h�J|d� ��}w����of�V,����*`�ErP�y�[��`��]�d+% %$P�C�͊\H ��?�]� ~Gq���8�ѓP�[�K�6���6D*@0���s��i5'� ���S�B ;�ǂ���W�W��"�e�t@���(�ݪ[��%�ZT��{���"�,�Ը%����gad�>@$m;8Շ���EaH@|����٪0-�ulap�C�k�r�������A"s 7�}"��8��k" $S�Χ<�^mŲ�> :g�H�W�� x����"�/�N��4��JIU	w�Sn��RԤc��+�0"8 $
�R�H;���»q#�$\�^G1p0L��{�悅�B��B���� ԭ�@JR��$`�S$��GL�8A�����N{��+��!�44�Ĥ�בy��(�JH�J��P?�""r�DNU�9�>h.81��* �@#�.�p�!��k>