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
BZh91AY&SY=��\ ���~�����������`D@  � P `����㺰�;���ZX D�&S�l�i�'��M'�yM�h4�����Ѵ�P� d�=OSi!�y�h�4�2h ɑ��   �hh  i�h�@  �@ H�hSD��'�2h4@f��4��4 h� �hh  i�h�@  �@ I "i� %1��l�F�Sȁ�&��� | L� �e�r�В����W5����`z����_q���V�}>�S^j�m�#��SiĚ|�;N8�\��?�w��#
��m89k��L�N�e_�����	�	R�~�-��/������6��-��|��xs����a�6��巯��:N�дh��8�X���8��\��#��������BIXh�n��#R�WѲ��9a�f��|��D�>��Ls<�$���A����t��hz��|�R"N8@�5�ހ�<�3@���s�U�-4I�	�O[�9�Ț��RNX������e�Vrst�7��g10���/'=4�)B�7r2��٧��mϡ�ĺ�c�0��l��!��\�7*g2*�҅Tr���#G��M�$ !����u��1��!V�K��<4�8�x(����$�E�5��`a,If/�"��m�SR�[��ܢL{:�@��-?Ln�M�Y�2 P��^Hq;h�	��xv7�����LwX�h�v��r����W�3������1YR _�y�f0Z@P2��Ϊ�.r�	م��g~�Q_�C�P"n�I�gƌ~���d����<0�HA"O�g*�MN�@~��0�*�B����@$�M������kJʇ1cD6�m��t�W�z��}g�h=��M�(��oX�0)#kXօ hb���؟O 5��y��d�`�n<3�L�&��T���h�J��:u�5gGS�g��ArEMq;��V�(EG2"!r����#c��C�1�UzX�ٟd�a)T�(�؊�
X�!B!�p�Ԗ:���>|:��E�~����@�n$f������/6�Ǩ�a>�~����,d����b+K:��� �2�֒�@���EF��h:��=qWxEgy ��K�#~� ������� �C X�?��V"rW��W�a���}Hut)j�i'��nA[���38�,JA�%C{X㶙[@4PX�ϊ)	�#�ݷ=x-R��h��$=��]f���x��)�����R-��~VK2C���[�(�p���wN7J�M��m�:�}�g�<�s�e�\��#���=iP	5�L�a���e��L.mWo
̷g�ո�<E�oğҚ���:9��0�{�g<��޵��`� '	eH���T7Y��� e5dǐ&c:	>�z1\!�ݍ��z�t*���+&U��x��$�jZ�f��������7N=pg%q��*R�V����ֆ0:���7{���������o��Jr��̝Gi���zye��J�(����v l��K	"I��m��u_�F˝�	'�� �9�Q���n��j~ө^�iqtq#(�+<�'^�Xt�^�
C�b�%�8��� r�9֡�h�a �c�BT�H�h�.��NNc1Z�X1خ�/lץ���x5�|�W��x�Bh����sV�,��U	h��U�j�-" �H	3YL���\�D������AH��`rbF�S����U:����h?{�袹��z�w�;\_j8H�j���*�2�c�3��GYA�������0]H+K(Ig� �`�v�����F�1a�H���!	�_��d}��,�*�y�]��B@�b5p