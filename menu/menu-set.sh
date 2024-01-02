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
BZh91AY&SY�"� ��>}���?�߮����@D@  P׮9ٶN�ۭ�2JyM�46�R=M4='�i���M z�  �&�  �  hd  $DQ����6�&�F�&�@� ��M 8ɂhd222hhA��A�L�!�E!��h���=�  ѣ@�1CH (�b�ߓ(��tZ��imġ�z���_-:u8}�J�
�<3� S&�Dy$�&�PE���uX]QE;%ީ@�=a�ӂIv��%�"�K
9B�q��ym�	���K��$م�`�N2
Nm������Գ�s�Ho�p�z!��6lc��P���غ�=������}_��	uF��ݳq���m�NZ2{ѣ"x#���=����@�q��A��b!�)�M��:��"��9�^/ִ.v��5�� ��D�l�[�&��Od�TȒL��#IV�f��� @�i"�I3Z�)$�P�ִ�JL�L�32=�2�� X�o�h���	kL6�m������˰+,�)0��c�1��>x�)��{C	�#�1�V�
H��/q���װ�V�WRY��V�I�]�JDChM�-7��M].��P粥1r�,L�y� %<$��rJ����	r�,��a���yc�d��#t��r�7���F�F�ۇ��|0�%��7�gʳ��B�N#}�U,�C�Ù&K�x""|Q�Z�W�gYieo5U ����w� ���-��<l�f�D��pD��ۏ����73�4a�pw��ا;���A�^Q�S�Bհ�@H�Ia��tբU�(Y�i�21��ut�P
�{d�*�%�]K��o��0�׹τ5�#9Z�f�UސХ%�}��(k�,�j�n`	bE���>������髪� �Z�iP�mQ�,����bCUM!�n���c�\�̆г1;���Jsa����+�3oQ�A�dh�\�-l!�%8Q9Ī���V����E���ed8��,�AzX��
F�e�	��q�G?8$&$���\� !K�?���)��(�