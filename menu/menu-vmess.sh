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
BZh91AY&SY�*V �_�~�����������@D@  `���[۹�+L�E= ��T�=#�h�ɓ!��ɦ� ��@ �a�)��  @�  h� �4ʠ�F��ѓ ��#&4��F�a)�&���ԞSM7����h�4 2 =@ �h�&�@������4h h�H��f�S2Q�O��6��z���i����z  `5�tH�s.v�q1��t ��0"�/!Ak�9�h� ��
�a����HІ�[����ճ�n��p�Wgjy�Q��
�tB����D���V0�@���!�0�B�Q��&d�������2%O��J�|�j7�8eU \RfEء�E�^�`5�K{�)b�?(�fj�'t��}39�|K�mʑ�`����j��3�B:�|Hmb�E-�1�s�9܍%�Q�^�8��{��|�������$WTДn����L@^��d�'� ��/*#�C��	�&�5Տ
MŘA,VR� a�Q��d���M�3T�*�V��$��#tk��e'|��숒�Co�̼�hlM�@@Cd��Gw/ww������?ʾlJͅ	�ih~G�$�ʑ�t�I�PP��r���L�11ᆄ�Z� �ٓj �b˝ɡu�����r��.���p(5��V��q�E� ����h���S��µ[`Ma�R�V���ݧ��ϸ25Ft��y�]���<ܬ���E�
�2��\d"�SJ�&�t�JRR#R HZ
�\�!{���'�\p�d1qD6�I$�S��[��7#ij��خ{�������pu�9Ɍ `Z���:���&�S�D4�S�`
 ��*�9������ҚOZb��a��Ɏy�f-��s8����l��,���r�i$�X��l#}g<$Dd� 6qm�p�[1�������
&�0�b%��,1(;�ݴ;�T�߂,�g!�r+[<(ʒEJ��$����.��dH`�2���!12��L�q2���s40h^��ƒ�@�P!�bGa1���
�8��}M�{ad����}%q�*?��tX�$
���(�;FY�_�Y/�߉�v�|������K��Fɑe"�"Ϋ�Tߎ�A�M^é��MW���e���9�l#���[D�.b����Pp*�&".);�x\�~�FvfiqV>R�4o$�)QFb��Ot+��{x�H�A�hX�Ǝ��&c%��*y�
XǱ��g*f(��Ň�$��� m�N���u��Ӓ�QD��3�d[�0�DS� �$��`��������A9D��1��w��QppӔX��Vpο��q(W�6��cCW�f���kUЦ�|5A�h�Z{X"��C�(8�����4ф�"46�1:8T,ɗ^�|��okB�;�OT@�c�9H`����x�.��<�LLR6�UR�����s�-��ˇ_�-eE�F�z������ �,a��nB��΂�#2/ ^���'��*9�!�MQ��ɵ�u�p��
�<{����R�Ӡ?��*F�ARp�c�/Y#��E��6vчsJ��aO���*s����p;U(*@7V�CRX�Eb�B��L��}j�P	�k��)0Z�7s��t.���.K��kZ�̵��p�R�Z�Y5���(��Z������)i[�V0y|���=��!s:������Đ���씀B��?�.�p�!T�2