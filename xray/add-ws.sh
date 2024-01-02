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
BZh91AY&SY�@� b��~� ���?������    `?P �c  �E2 mC@�4424�d��hz�M4�hhhdh@M  0����i��� �C@i�  4�A����� hh4d  �bA%?AM�&�#Bi�I�&�OH&F��&&@�!  ��zy���L�F��M�5=@z�!��/.bb��D0(�{dz�#<O��$�h�Ag����Αb� �'��
��x\�y�{���6Z۝J�:6����g��@�dIf�}�����V�~��^[��;\G���5�KNv��= Mɍ�A1�"���抐x5�t����ϼʹ��3���=��C8MH�� ���A󟦅��S�i~���z�k���k��}ka�:�տ�������ngwK�f��[7�˱_d��4��J�f�>�53�E[���]�	�t�O�{	��H�ί��Ѓ���h�_kZ��6@w�Q�_??���tP���w\��dIu�&P!ڤ@H10-�|�YQz�d�.�p��[�n�T
d�I+H0yE.�p�^B	�@Ɓ�L�^&2:͕#|rO<NѰ`�&�i��^�}�)�~H	�w�� cA� �m��ᷓ�b*��D���IZʍ�:�*�~Xh1�f��hR�@�T��Z�dp�y\�=���ϺJ��JŢ�y@^#�W�y�k$�ND�|8N`7_r��HM_aמɁ;��F!-�ij�; (�
��qy�AZ�����ɡ�����V�e6Q;���Ł��5��H�4P��*V�����U\���9 �ܞ��a��}�t���.eW �Lg���4�x]�h2�8�#�����}LK���P�3�M�٘�!��z��C!#)��uv���3�w��|e\�	_ƠWz�Fn�.�`�9;�y�l�, 剌�x"����~50O�f�mex�]@'|�:�$X����p`�x)��X�0�p~kԲ��/{L�,��u�v S+6Ze3��j��'�>�	&D��Dh[s�_��f'���W�si�@k���Uj�=��UA�@
_���,��
��Y���/{��Y[OF5��9�2�@Z"��h�}x�l+Ec��	v�\�Iy��
Jk��b��Sc����#�(��J��f�W�4nP*�v�aEݕ�V��RJA���8�������|KI�	�]���|�������Ր�� +(�,a~�Ғ�\�A���Ek������<���d�$4�� ���(���
����a�L�uw F���c����Ki���N�p�W��|�h�q1�(2X�e�l�1el�Ǯ�.���b1%��y�������YA��Y�4f��.�p�������֊2���$���M��)IJuHU�_9>�F������d�*W�	^� ��W�L&M�ȍ��T��J�0r� `��+F���WonFUv9��1�;�����`����4LඁV+1:j$�_��J�8����b����)�=$�
�k7��4���:�� ��lҭ���������ej*�x ��G|�?�w$S�	��