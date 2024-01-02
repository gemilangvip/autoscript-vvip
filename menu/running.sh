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
BZh91AY&SYV�� ;��r�� ���������� � 0  `�>��^{w{Ȟ�{:i����ۣ�F��Ѣ��41E<�G��4�CC���44f�� �� �@�M&)�2�m$di�a1=M1��&di�!��  h  ���    F@ ME zD�P�4� �C���ڀh z�I	�~���OS�@�mMꁠ  � A� �%B44�$�zmSmFM=&����� h� 쑟/��ro�ф�����J��m<�����������D��(�,Fj�8�)���Y0.�V�R�o��6�%�S��5��ͳ��RfB���!HM����G������5rlӯ]fJ�v��C��h�b�� 8��wVdj�o=|�\ �Mro�H{�cIw]�f���qE��+eNZRjD���(tu�v�(�/� � $����#P{P�Z�8j.���(�R0% �|�q 
�n%B�L(�d �
hQ�j�����������`��ؙT�Wu��!e���Y�E�ʏn��\F�L&@��L���6���&�p}�ͻ���X��� ���!ޒ"K���VѺczX[|'���½���
�Q{ :�5�h��҈���A�=ۄ
"%e��|p֪���Brd�N2�h��/Q0c �]�ɡ�a�ǽ���q(׍F��ܜ��֩�,r��bю��9^G�9m�'Ge�];��t^�/G�پ+��nw	�p��PTb2 ;�5�l�ܣ����� :ő� ��X�"�-Q���WʣH�"	�v@��HIJ�T�B�%"&5Kb���l$��@��ʪ}yBN��I��:��J�H0UF�����7MS=|�����A�I������Ւ/'�E�x������Ǔ��z��� }�U(��ş�yK]���h		ńuZ�֙-5�Sz}�2i�|
��Au����r����#0rH��v2\���{�E�uP��i�@2���~W|]��7��qӫ9B0�R	DB[�+@�&u�t�B�E�]�>[�Y����zGnd�v����?@���!����3!�1c �44��p�76ΔS�39�}��WJGY����d���'�~<5��C�Ǝ~j��7��Hh�K���h��F�lx�6A��%;�z�e��3��� ����*0�(�-u}#�k鵈��n*�x1XH]A�.zI�U�]~j�뮙�y`��ȥA���2��: ,�0������{y6		ep�|������5���6��9\��[6�$��*��Ӊ�α�4I��V�Ù�=Uq��cJnb�m��U@ܓ��N���u��pR;b�R��Ҭ�B $4�i%E�t׃�� 4�.RݴJ��RVm_�L���ʮe&���,�1)��sga���-�qZ1���4KH�Sn"�0����U�����������+�[�*���u��ueb��Mb*caM�̢0�F�D��I��X-z_�R����a}�c8� s��Z<^�;��<M�4e�}�� n�):
��EU��HNC�P�G�l<0�`� �@���a�8�_N���P�!Ҋ��S߄��T,��H#������c�1��0=��<S^�T�sn����bg�1�����#��$2oٔR�_U�KD�ǝF�v3Zl�G�|��X�͇�q���Q4�b�9�����#����	�#�$)R5�N2+ôE�=�� *W����u�f�#�jV�er	�����6�{P,ϝF���-:mR�k�u�`>څ��џ!�pÈ0(qc��n@6��	�@�wi7,�a7Hu�M���ϡt$6&�>L�O�����GXtwޮduг>�y��v���X�^���sC�JQs�P	�{�j
ͤ˵�a@�@� ��S�p�65.ݓ�n�*s�����]�!߾�	g�}=��H7�]Hjv���B�w?��(1�aX{��X�䵿a�M�8��m��p����?r	=nb�L8�9p˞�eRcn���Q�T�1�*�y���|e����2��&�5�캪��v��
�����ԡYZR���.�3�O�ER�4�T�`(�=��N�~�.��-aa2���N� �V��4А6!�q���6��C���C��"���	�v�$��^���� �e�������M�n0`�]n�)�y��U��.��;��YJN�]R���ZS�Q� q���a�p;ƥI��}�N��gB ��zs�T+|)�ݽ�x��$_�� Q���DC�p��¹.&�.		��?�;{�� 2>P>��bѠ��w&���RgK$@��<�z$MN��Þ��b���"��2E���b� ݧԧi�y���١x;p��3I�	;kۛ����-�J�)4�p���Zq\R�6��QE�T)�In�.�QE���E��U[#Fx�RC��������6p�KVK���}8!�1$DLD�;n�Ӷܜ�Y����M<j�WU*��ߺ$���u�������0�c��~�A�%Snz&[n����Z_ȅ�OI`>����njn�D��̒��_0�.� 炵C��o�Z��$HC1���o��4Yш�Zͺ�`����]t�csC$�d��Q�F
�tN���㠇�W*�x?|��V[�D� O������]��������Z�ܑN$��r�