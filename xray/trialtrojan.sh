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
BZh91AY&SY%�5 b��S������������    @���;+�a� S�OM �!��A�46P46��� J$�Mh�=OQ�=#��=FA��b�F��H�4�F���41  z�4   R�@H?J���  A�4SA��%9̈��[U�5"��d1 Y-���D�����O/L/0�0Yg�3!|R�Gl�_kRHF��Y��׾�1m��U�kX>�� ��`��s}CMI�p5y� ���s�n��h_�1��>��i/�8�|8#���K$�JT-Jʱ�H
�av��X�J6q�)"���z�%cx(1�%}!v�.�U����.��W\ˀI�p`�� ��ڼ�d8�HT�1@+�
>�ۃ��1�F������_�2�L��fL��̈W��΂8�����\�L<���B�� b�MҴ�
xㅅ&���l���[`�����?��P�ƨ�� ]-zh��2n��&p5V�-3���$���rRP��`<V�kI{e�8���2�aͰɇN��
�b�*R�pCY��-}��V�d')T�\1��I�? Țm��r�B����A�|�%3���,8ERg��qD`X�0g�7�y�&�K��t���Rہ�}�V4�&[`hZ`��E߄��%�C>�f����
���Fc�T�a���W���&b�����R��9���j�[=�P�ʚ���ȗ#X���p��&��8�[�IS*̐VG�/�(���K����+�Ą_�/��Hп�ܑN$	l�@�