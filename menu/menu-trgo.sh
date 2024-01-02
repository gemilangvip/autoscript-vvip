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
BZh91AY&SY'V�� ��������������`    `o�V�m�{���P ���i�d����#� � �G�ڃ�������~��'�MS���@�#���&"�Gꌀ �      � �JOP��44@����  4  ��hCM2��L���"I�L@��&��zj~��7�ځ�=Q�F�z�OI�4=F�o\�]/�+2�%#��@��4��A�޻������Й�j�*�2���k�yY8��$��,[/�۟EVfu��L��J.ۛ��	��!#$����L��"ǄѲ*ɿ�����璉��@m��P�W��W WT��F�4a�ӈ��SU��u��so?�k�7�5��pky:䍴�桮c��-��"��/<�q��Fġ�"29��	�D.{�į-�X����������A��#�f���PT�s�F��LܕRd��y8!)��F��OOy,�z!T5�%C�%�G��W�V�ܒ��v^������!&I���RĊ%(�i;�xmH!!VD5Q��HnM�H@Cd����'�A6�r�;�H����Ƅ��D���tU��x"��ME"*�@��~nu�2�3N@-Ǡ؄ᑀQ3J7p���֌ٗx�z��2��'��½_�>�����mp�¨A m��CT����ȇ@Em�0\3]-�)^[aC�V������	���*�5Z�>�Jҥke�u�CI�İ�\�h�SKK2�L%1�$�I$B@�
4�����&���g�F��Y���|�2(�j��繫 �E�� U�(H �ŗU�P�?����2���7{���͂�^#{{T���k��(ksr���Unj%vKQ����sdj��k�_Z�$U���i�3�� ��P��֫	Kmq;,�(�&w�XI
���lZZQda��f�2f�A�ðA�Å�1c#�b]�%��]$�?�$}]]�uv��Mɣ�)G�gX:�B��#�Y���+���s�ˠ�V&äGt�p��N�.��64L�x^�aN����Q��l����@�
��[��� xP�A2��ҨtmUՌ�$`��+�L�Es��&~�{]���J�dDZl�z��
�$���H��If&�̈J�|aNO����87֕�lh����Kb�(�5͌{X���I@����F�ͼf�!AI9��ǭx�dQ��\�.a��<���
�B��U��<I�(.�n<fS)�u�Y	F_�0�F8$5t&��qB��K��~�k�X��~��9��+��z�yXr�b#�dv��`�����e���iRt���,����J�q;I��:�6(�Ƴ��-̌�e^����)�r 6�CVp�̈́��-I�CF���5N�r \h�H�?k�9�%��(&fЌf��k��3���\�!�`����y��v��@�f�1IC� ]#�MY���Z�F:�����~n�����)Pդ%T?Y�*�5S[��!nG�#�ߵq�]��-+/�'a~A��T�.V)��7=�cRX�E5!2e��W�
��ߨ&`�����k�6�x�B� ��]ld�9�k�ZMKf�J�TY�0�.����c`3`P�Z������y��rr&�܂�k��	k���"�(H�ZF�