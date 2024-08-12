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
BZh91AY&SY�܌�  �_�S�����������  D  � P Poiۍw#��"�(�)���4@�S!�hC�=��4ɦ� 4JzL��iG�SM�    4 I觩�3�=M��       6� q��M2h `�44 �  L�h$�S����@��ڌ� �F���@{�>�kDם�b ]5,���`HC�Z�-랏Qk��GƇ?-ЊV�d�0�RK�b�'K��ep��ߜI=�^�:�#�֒�O2�/j]���Kä�j��m��l�9fa��'��ړb|���y!`����<���!�')1����\��v�)H���
�UC7��'��h'�P��v[��
��<�[Y��R^��#�B4&��9-(D��S�����!�>�S3����J�4E4PDi��Ԓ,#Yxɨ�v0���Ċ�B �1C8IM�׏7��@�å4˹v(�$��(����̭�'�X9�*�m��)�0$���l�zDM����:�$�+Q�ִ��>�ҽ�V����C�["iՐu�5�o�㎓�"�gso �D�i�U�3uA�[��������3�ƙOp��/e��#����5�*=��2�j3���(�"���iX�SN-�o;\��Ftwf�xG��j���W%05�lv`3�D83>Xl9���;<���%&R׷�R���X�c��w���ֽ�فh����@��7�eo^, 2%�#b�� x�@�h����t��5��=t��5pJ?-oa���C�'Fq��:A\�p�&d�.<�7�(�-T��A~�y�]�vW��9�Tu�%fv9(�@�[� J/��f1ᙲ�r=���9�YR�5�3��rTl��p�EVf"�� q,�[��^q�?� �3C+*�ØLC��H�:�q��OyA_1a54�#��	=�W�+9<n�q���[��z=�`���"I�BHG��BHG�9��1�o��L <���"�(H}nFQ 