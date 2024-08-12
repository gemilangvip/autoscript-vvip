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
BZh91AY&SYş�� ���~�����������`D@  � P `���Z��y��i�{�]!��f����=!�2��h������
'�A�~�SM��h4=C&�h�h   � ��L����A�  �P h�  DQ1S&�id�422dL@�  @�� �@  4Ѧ�2  4�0�Bd��i��L&"O�I��р&@�4�2i��hð����M�f�Z,�,��!6%̨~î�src��$t$�h���
�m�m���7������w�-8g�6	4���|�bt����B,!
��XA&G��A�N��%2�d���#��hl�K��%!��*�+%CW?�E��-�]��`8�y���I�V$��`���y�I�F�������"c%�:E��p�2l.|d�^�<�S�o2�U7JL�k�SǬ8�@f4�w�{�<�6�UաƤZ���f�5 ���������.�A5����VO��e���Q'Հ@ki�Ot�J�׋�j�U�qr�`;/��Q�7i��&�Wn}w�@��h��	 ��$�ln��nT���4�R���F���16�@�s0��~s����8�[��������;�ɈL�*��BI1��˃�+D�%Cвp�t���/�ɓ2RWӌE%���R�v�v����:H��d�T��z�<��#B^��	H�̣l�=Ӥ���T�N�:m�KU0�t�m1w nFf����x�k�㡜lG�4n�ն5��i����I�P��Ru�΢��&�D���J��4�ʘ@~�B0�K!fM�?]��"�a�^6��.� bĈm��m��-�k�ۯ��%���O^ܙ:Q�Db Q�\���o5� �����y�EIg�-�LMϦ`�2I��	Z���@�0���d�5��Cߔ)��a�r�o=�	���H�38����kd�B�'8TZp�<��Q2�p�Ɛy
QOI���<N,��s����6�p�$�7MhF${�z"�b5U���I.�v�h��qk$�F�y�?X���Î6�p�4-Z<m%����%�
&C����KB����+j.a
��4[JG��#)�:�� 9bD�U��W+�����{�,�fQwͲ��cr
ݢ�# �Lu4��% ��u�C��e[I��Q���<K�n_\�'3��_n����L%Ӕ��n��Jf&�DD�$��_��2C����&:��Յ	иrRdڹ�[��b����ǔe;-�s3�R��.z̠R��($v@e�h�,�	h�MR�aa:Cpx���D�&�����2��θԁ�HсR�A^��W|�]-hE�I�T�7�ɴ����C����}��([�Ǫ��-7�Pc�M�[ b����#�Iʽ�1�S�(�bͶ���p�Zd��Җ6��#!��}�`xW�8� 	��Ѣ|~���7!�*<9�!�A�r��y���z���A�-;�en%�#-�����:���j�Ղ�h�B�@.-�"������޷�������x�>�.���X̅�#�(��k�9f�(`[���������P��,���(T�o��[ECK*��nλ�p�'Ŀx�!? �ma������Y��R�: Y��w�.�q�?�.���ޮ|ڰj�)����d��घ����rb%��NQeT��(-W������e�� s����S�KR7��*�չ�)��
�]%}*f�Y�g����A�03�1��2)^XV0w�U��v�Ô��#�[���p$!3s��7ݚ#ݪ��D�P�����H�
��=�