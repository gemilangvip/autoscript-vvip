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
BZh91AY&SY���� ��E0���?�߯���� � 0  @�9���sr���������h �@�42 �Hh�&�i2 �     h �S�e=)�=�?R<���c�Ѡ��P6��р%	5OF)�G��i��44 @@4	�D�0m�>t�q~+�9p��2�ɵD�8�S����
l�Ä�u�#(�Є6!H:"G	�(�$�p�D5Ѱ�n?g�t4�jd=��D�a;�=�I	��������0.�y��X�zKUh���=�aF��JZƛ��8��&ep����m �C0+-ںC)��f[�:�qDw�uY��"��[�/=�q��ߵ+��buf�&f#�`�`M7�**�O��m��]�$���D�,T��U�Kځ-�y`
Z5h�hb�@��uG<�f*yE9�oJ��U=�Q7�Q�77nS�����6v��;~O\4�1�;�'��|���&O2�3�,I����)�*y���5q�Vd�VQ�R�V]���h�1'W��	��:ա/�-�hʁg d�1�Y�bH�r���qr[h0�.���;u)Ĉ�	�u�hx���-�X]W�;D(	~ȋ u�cG�"�"EOjua3��}��
�Z�kd�$w	�)�N�*K!9Hc�v=�T#��
�Hr�i!P�d�k�y�Y_�]Dw{�n��72\�O,q�ٮ5^F�Hb����K �DB��a��h��^k�

LH�R'aqI�EѢ�,��n�����ʽx�0g&h�S5�9���&&�9�*��)�+�Pcd4�쾐B�YNuХ���F{�Q�D8ȭc�h��,H��$$��$���&p4B�H�
��?�