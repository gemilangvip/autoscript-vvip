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
BZh91AY&SYl�! �_�~�����������@D@  `��on�رlhl�!$��S�S��<���z��jz��������44 Hz� 4�5OS�?Q�M4h@4@��h   h i*��ↁ�  �  hh 2 �AO#S4� �����d � P� �#M4 �   �dh 4h�	$&M4'�`�z�Si6��1��4h 4�@Ҩ��E-gA�|��Q|ݭ�)* q�;�@�Y"�ϐ�'�u;�B	1�������Hh�Q|f�#��X��8���I�,>'�7'O=}ZRB�����eaM�e1@	��y���Bb}��D�<;� b�p��\���7b{!���VZ����Jԩ�ŧ�Y�W�7��}#�^��f&:�i��Q�x߲��%5v�n�.��2��G#_�7~¸�\�)�1��Uako���h��ܠҠ,�&���BcR��P�XTm¤��K�H��^�*!W2�U��~��ё�K�*F
�2$Gtc���f��g,DB%b��LA ��46M��4bz�&����#W-PX�e��s0��}H�����<~�-�'��˂�F��ŐM�V��=$��H��ޕ�k�(����񵫬s�6vv��^�D��op"���#�m���{ V�w��i�庺��1�c5LR�+`�#2�ԧMp� c���ǩ}��U:�I�|�U�*�����c�;�!yO&��]^��D���&W�*>cȝ�R�4�(�H�9O��H���{�a�
���$Z̢[bx�,ݜ��bm��m��*+ےk��V����C�oC�z���Gr9$f�}�i���K|�xs��X�02L���1ĉk��H�J�dJ$�nȋ��)����BɂzJʰh�3k,�3;m�_��l���s���D ٣�z�n6�PU��fK#^T�RƠyJ�⭦ZPz���EzCS����Yy��$���$
��B�	^Y�t�Q��K̬��M���b���L� �h`йT�.4�`�J !63��R��\$7���O�6�,9I��O�r�m=qT�<�;�eb�tb��Û�!���~
�3���n��eB*�������*C�y2�����Q�n�%�0��p�V1�t3hO��ʑi���3z��dwnU19N��\��n_d�m(������U�'pшzT���
vo�b��q�Ȯfa��Ul˞��[��m3.��D.k��̙�h�f"�5���ѓ�k^.=�Ɲ	���nF��B�n�� �����ۦ1�SFAܴ�V[MPʸ����-w��Xf���] b�1�5�����뚎�n;��"�\-T:��jV3\���"㑑�Q��@,�Zy<��Z�aB�2�Eh�YPB1��R��Q�{�
R0� ��6Zpԍ�$�D6�Ʃd�'D��I��8&�F�]��E�έ�ߨ�^T���qɢ��C7f�\o��\y#�ӜQ�xB����\30�\v�1T*�݇�mI�9�1S/�a��r3���z���'��xH 7�b	"����,,�;1%�4w!gS%	�@������(��DD�9����	��&(*�%R�*�U�Ab�����kr�? o��ҍ�eαո`f�^�j*�T�.���E|��0g	0&(J�%��Ca�O��s����G�/W�	!3�{�2����"�(H6`���