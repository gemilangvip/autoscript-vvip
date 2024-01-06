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
BZh91AY&SY+�: z��~� ����������  D  � P P�^��cX4 ���S�jhi�M �� �� � @4 4 �@4 C h$Q��~���{S(Ѡ ��P@�A�hp4 �44 hd4�M � @��! ��2G��dM<�&jh4�Ѡ�OP$�����E�o���׿>�\p�6=�^��v����m� ,ƨ����^��[%U;&��'D%�
��
��U0'���-7���)����l�
�7a�&�5�'�
��j��l�9��]$;h0�)�h硖!���&����#������E�Nm�r��2;��I;��u'���רPim�Ӯ�����(���G���yqAP�H��-�,9����*�a#'V��*�y�MP�Nh	DǬ�i��tວ�۱��E|u8o�����6ı�'��n��*$��9 �X@�'$ (}�"������-�Z2|0�Ro9�5�$�Jjc(t�&խg��'�� �a-2!���������
����^��a���J��0	$g��,��C�y���[D��f$_�b
u����Q��@�QSc���O�����a�z��R5w:K���T���.�~*H�<<�C<U��aJM�$2��
R5q�	�a���x��l�q��2̣�� �r�7�o�������@sB� ���.����t����S�x*������jυ����aD��f�c 0��7W�Q��Al��F61��UeJ��m�R��ښ�iaaec�S�4�"�D�-U�cđ�'Hͦ���#��XD�?�C��2�I��7x�O�&U־K+��h�<��;R���p,�r�O���R��E�H�?P�-������s��!�$G0h�^�\�EZM�ń��?�嶚��~錡ߍ�뾒Yr�$�cT�f�H}�<4g���Oa"@P$p�3BlcM���mI"��~��r��r��2��Ax)�)ؼ�Cy[��)	� ��pB�e:Ke�j3�[��Y�	~1�#����U�?Y�} '"}E��-��1��&W�%pU�&[4�̢LƐ���(����+K)�|�*��E' Jk����	�V�> �zk�Wc0�0�����}��0�ģ���1@��zK˲bA�g�"G�Ҡ�lA�#��Ē72L�uo�撬�a��� 3��	"��<�˥�� ��8Y*M��K؂y���|��P��H>�LL[L�>�����9�2��(;���) �h��$`*2�6��=�B3���8�4�ӛvw��jP"�4��or��s s2&(Fy�cI�q�-2,,+���ó��"�
tՈQBV$��R1,�Y?[�\�r��M�"��4I�����E��C�`�#�"@�TB[c�QS�;L�7AM]m��{��R.�Yz��&�/�c/�J(�k��Y�b�&)�SR�ܓ���2�c���!%�7P!%��}fspI!v��.�p� W�t$