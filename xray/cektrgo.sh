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
BZh91AY&SYr4n  z_� }���~��/���@W4[ 5M 4  ��ah     h�� q�&�a22bh�A�L $��M1��
lMODɦG�D6�m#��m��7$�P� �J&����F?EGQ�C(�s���sؠdK 9Pzjn��|��M#i"�������W!���[h��ZR��%�"y��?g�4I�I|���Ud_�
6�^I�� )1�yBM�]�DF\�f�	��&鏊3�`6���'I��7l�0�����p
^���y��`ti5�f!�C�ca�8�IZ�`G	$�f�n��w�88�K,_2x�da����p�h�E��0��a�c`�}Ԧ�gL�ğ ���W����>P5us�ʻ1z$f�����T���N���l��Q�śg�f�pz��礞�R�'�c�|�M
g���	���}"���L�J&�0��D��R�H�'"��.�1[����nջ��Ϗu�X�B�c��ig�PX�<�p��Y�Dc:p�tH�6��h����y�]�j#��N�,G�Q�(���>�eR��L'�j���0��Ĉ2�Q9*>H:%>"z˅)1�2t�Y���rE8P�r4n