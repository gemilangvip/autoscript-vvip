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
BZh91AY&SY��, ���L0~���?��.����`    P����=<�vQ�CMIOSm#Q�L�`4z�#A�`F�i�R�2LL&& !�ɀM� 	T���DɄ    &@�S�=T=M�Di���B=��ОP��M6�(���S�3L���f#S�?E4��F���C�4�hA*!���m�O�@׭�e�������h)*	�2�����O�6f�E�@^]D[�#"Aw��/��}41� �B�="#��Ͳ�~�;��P�5��T�Z�^A�9�B�����
���D! ���kad'�u+1T��?�?�o�<1�GB{K���\k
�}�@F ��Ң��H�e@0�� #��z�L��!��U��a�*��ξ�St�p�$s��D��,N�T���_qh��YM�����P�����B/���zǱ��AM��ç���@ 4B`��x����ж|�}��<��Y-i#\.-tn~e�C�c�6��h��?t�P���kKϥD�V�� �)H�嚡JR�*$��n��{�!�X��<h��Pd M!
!���r��1���� ����X�栄����K{=���lH���o��u�ж�y��B���q���^����2�ٲXm�_w�	�#A2N4c3�N��`�661����x�:�E��@¿j�I.4{q��V�E$�eg��%i����bM�Bb	7g��D2��`1,@� ��|̬�)��C�d-䊭�S�H���<Q�N!Κ �O��#�]o'�8�:+`�q<f�V��3�����`�h�m z�ȷ2�,�B�y�����e$Q�C8(f�Gq���H�@�&�	��"`h'�7}1�\10�@!�IB1�r�7A������ԏ>?m��M%��u�HD�BZ�S��T�=�R��Ǡ%,Q=��5_\`5�&Șk�*�6C���9#>7	~`/.�.������20�,��h��m�p��Lބdk� ��p@���_���#�ƣ8� 0M(�z�����իO�Y������"t�!��C�# �9�,�W<������>�H�
=�ŀ