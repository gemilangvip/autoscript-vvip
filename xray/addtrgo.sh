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
BZh91AY&SYv�� �M0 ����������  D   � Px�V����gZ֛�� �!OS��m�'�z2M6�mO��2i�� I$i��dȞ���OS�hz@4h �� bA53SD�~�L��� ���4m&�� � 8h �A�0@4���2 b����M=C����4 ���A�  J*%��̉�T0��ߚ[�l߾3gq6�U��ިI ��2�w#�	Z��~�ezպrbp�tg�>]M4���j�a����0	�p��Eqbq��A<�lcuv�l|!Z�DU^�Ydl��DNG�#Hdf�ǔ�6Z��涄��=:��y����W�zx܉�i���狑�[�+��!'�"M-u���M�F�B���-
͜b�Re�E}��jF��0t�7���	"A@�`��$�JF�M���D��7AƇ�  �m�F
Po.|vk�V�th�3�M�n�Q ���IC$�;����3��-�5�+�I��(T�\h���mA��d�	�Q�� �!�t�3|{ޓ�f�By�� Q̌U�]�捖��kX����p���g`��L�Be(��"�3�Ґ�k�9 ��̾|����P�q�3>u����2��~���jb!Oi �2E2%^�nsU�$].=�N��[�4����#�J���{�׶2¨�M2|g��j�}Ҹ��NR�nN4���FPO�Q4�4�R�D�S�t���BjJk���-�\`\���	���Q@qS-``�pW
�@(U!I�K�1�5���X�`�H@S�NO%��ur�J+�m=�W��%Ͽ:��D��9�ϵ%zm)�a� C0���dę?mݽqpHH� Hʋ��i��ڮċ[	"5�S��$aRsWhUC�0S�S�QH�2l��=�X`"�(�,\���@+�$�'Ǩ~b��Έ`�[T�-���%��ː��E�&��Mi) 0mQ�Лw��3�d�%���G /!sC+E��C2��� ��8�&�U��[������)�̒NHۼ����>p�\���Z��E�%FU/���]��U/К��TD�bA�=T1װ�e��e�n�`/5f�"�2I5z;�i��)l���HYC Hi�^�Mo�	^�9��@�Y�"i���U%��C�/�$���ՇHo�V��WI�b���YlZ�.M�lv��ج�Ԭ��c�F�n�l���Y��Hؓ��DBA���m�mҵ<ҙXN�����)sp�rE8P�v��