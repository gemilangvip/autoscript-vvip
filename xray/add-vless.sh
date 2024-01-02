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
BZh91AY&SYc�F ,�}p ��?�������PF@   P9^�UW�)MiFJ�)��3I� d �44C@4  ������@         ���4�Q=O�1�ѐ � dɠ4d�� � �� 44� 4�� H#A� �2�����ɤ�=O=C�=@jz���*jS�L$�wfl{�o��V��>��z���;�<�E)�$��/���G�cz�ġv�R�O6�RN�fI�L��-F���e����&����@bA'>I!���8�p	�>��j�f�����f�s�xX8��H�;��Ʃ�8�ZN;E��81])��XBP*�6����1�܄�U�r�
��8pѡǹ���L��4j{LcTny������fժ8D��<]3gz%��KM�6���i4C!1�A@�#�x�x\<�RE����V��6��嚥�����S%�q��#���\�X�G��>Y�ָ�H���,����T2ǒ�ns2�8eI�b8	�:�������i����PԹc[���I�|��n��!%\�r��滛D�-@6&4��;M~� $3� �7H�˺��w���լgVg��`�QCH�)�,�2��Sr�nqThG�q=Í-`j�@�ʹ�T��Tv�PV��:������
���א�R��W�I&D��Wi�]��Q�(�.2kY�5P�q7��i,�@�3�J�r�?!f�I�u .�{Ʃ�J�yN�x[b1��|�^ė��v8�� t?Aü�A0 W�q���_PvH9��[ar@Z�ɞ�=*����ڱ_A?)\�8`΀�ӣ�������\	���-W��Hؚ�dL���,�9�T4����C���QM9UD6�_y�+j�"%C�7ͭ=
 l���X$v���C�6�b�fEM�k���0Kp��~���Ƭ�ǮK��2��aʡ^���3^�h���
Y�X561l͟}��=��8�ǍjU��4��s�i�! ��M>Fd�� �'�J���ڃfv�F������+�(�
�`x�o_� 3)�x�����rXK0�r~���H7n���i,�����}�,�m:}����ߦP�f �_��������6�ucY��˸�XR��$�J5�@D_���Zc����9XK�Ȅ�'
���C�S,bE�`�0,,7p����QzkA��,MG1Ua�|�/q}F�����a�\Ձ#+��,/X6�@ف��w:9q"�:�iI,U4���h1�M|ZJG��� y�:�� j^c��seRh�����e�M�X�?�@.���d��	p�BC'�� �9�=@Ldv0 L��w$S�	 F9d`