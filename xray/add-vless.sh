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
BZh91AY&SY�8� ��~� ����������  D  � P P�y-ɀH4�24&����FM�@h&A�&�� �CA�L�C i�   2 	"l���M1=F��z�bh 6�F������@�� h44 4�42�  2 2  �B44&�&ML�4�=2����d���1�
$�!����d��{Xo�M���wf��~�6��s����{� 񃶀Q�v��A�>֯Dv�FP:�L ���ƴk����9U%�G�e �;WC 106d&� �����A��d�"���љ���8sj0 ��ǥ����ƛ�{����������-F%��	�*Y�����g8i���"|V�VQ�h�7�o�ٌ`�Y�|9[�Z$,Lˑ�m.C�2B�ټZM+Όi�����
���-�Co�f+Ο>��+{a���B �Y�g0��j�P&c���#�$I�AC���
���e�A�]ተ9�I�K0��Rb��)�w&!��jjͅI��pP0W�](f�>��ΞIǫ��Y�F��RU�9!_HL.���l��i	���q}[�
~9ɋrB��Zcr?���LAJIH�c����G�� ����vl��l ң�ê^����B�*��L�pH�P�!0�9�t ����װ�b�̲�$/P��, [sC�}�g��I�0੼n���A%�lrn��W:	��9���u�<>ֶ�]��V+Jw���J+����5�6��k7m$�YB����N�Fҫ���B���a�M6����x+Q�i�e��@X+PMD��^U	�W�D�ֹ��A0P�~��= �I�o n�uޘ�<�B��e;g���,%%��s����u)/r��(�<a��!3�vMg�p�+�r�O�ٸ���E�RB�0~al�
[9j�/-)	�5
P&*Rc�@����6QMήɌ!���b Æ����x�d2Bv�~]p��X[W��"�Q3&��J�;U�:]�9�G�U,!`Sh�Ō���n�褈��l��g!��H����4ςԐ�	]��	�����6F�Iڐ��\4��h��۫A��TB�yl�૆fZ���fP'c8A@W���f�$�Clv^$�� ¢��&���[5�˂2W���d�g]�����������^��G�1!���� �reѳpTH3 ����J�pXb�8YZ��F{�eH.Z�*�U%I!��×�e,��W���q9+�W�9?�y�*=����!^��a_d�a�I�ĩ��6�r!)D�u	�l�K�����Cb�	ZR���u���!�r�0q�e&c6M���{w�ޞAD�u���=f,�0��Jf
�E�
�4bB$5ƙ��VI�ٚ�L�b��)��P�PR0�6R�a���\�1V�M�E�D�"�_6@6�|:�ŀ.�-	� <�Tm�a�T�?�ĳs(JL����mT�ei����6�D|m�k=�PEb����MJƳ�����g�	 �x ?��K�ơ�$�� L @���"�(HU�l�